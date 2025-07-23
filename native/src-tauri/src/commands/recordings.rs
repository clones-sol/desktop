//! Tauri command for exporting all recordings as a zip archive.
//!
//! This module provides a command to zip the entire recordings directory and save it to a user-selected location.

use crate::{tools::sanitize_and_check_path, utils::settings::get_custom_app_local_data_dir};
use std::{
    io::{Cursor, Read, Write},
    path::Path,
};
use tauri_plugin_dialog::DialogExt;
use walkdir::WalkDir;
use zip::{write::FileOptions, ZipWriter};

/// Exports all recordings by zipping the recordings directory and saving it to a user-selected folder.
///
/// # Arguments
/// * `app` - The Tauri `AppHandle` for accessing app data directories and dialogs.
///
/// # Returns
/// * `Ok(String)` with the path to the saved zip file, or an empty string if cancelled.
/// * `Err` if zipping or saving failed.
#[tauri::command]
pub async fn export_recordings(app: tauri::AppHandle) -> Result<String, String> {
    let recordings_dir = get_custom_app_local_data_dir(&app)
        .map_err(|e| format!("Failed to get app data directory: {}", e))?
        .join("recordings");

    // Create a buffer to store the zip file
    let buf = Cursor::new(Vec::new());
    let mut zip = ZipWriter::new(buf);
    let options = FileOptions::default().compression_method(zip::CompressionMethod::Stored);

    const MAX_ZIP_SIZE_BYTES: u64 = 2 * 1024 * 1024 * 1024; // 2 GB
    let mut total_zip_size: u64 = 0;

    // Add recordings folder contents to zip using walkdir
    if recordings_dir.exists() {
        log::info!("Zipping files in {:?}", recordings_dir.to_string_lossy());
        for entry in WalkDir::new(&recordings_dir)
            .into_iter()
            .filter_map(|e| e.ok())
        {
            let path = entry.path();
            let relative_path = path
                .strip_prefix(&recordings_dir)
                .map_err(|e| format!("Failed to strip prefix: {}", e))?;
            let relative_path_str = relative_path.to_string_lossy();
            if path.is_file() {
                let file_size = std::fs::metadata(&path)
                    .map_err(|e| format!("Failed to get file metadata: {}", e))?
                    .len();
                if total_zip_size + file_size > MAX_ZIP_SIZE_BYTES {
                    return Err(format!(
                        "Exported zip would exceed the maximum allowed size of {} bytes ({} MB). Aborting.",
                        MAX_ZIP_SIZE_BYTES,
                        MAX_ZIP_SIZE_BYTES / (1024 * 1024)
                    ));
                }
                zip.start_file(relative_path_str.as_ref(), options)
                    .map_err(|e| format!("Failed to add file to zip: {}", e))?;
                // Stream file in chunks
                let mut file = std::fs::File::open(&path)
                    .map_err(|e| format!("Failed to open file: {}", e))?;
                let mut buffer = [0u8; 8 * 1024 * 1024]; // 8 MB
                loop {
                    let n = file
                        .read(&mut buffer)
                        .map_err(|e| format!("Failed to read file: {}", e))?;
                    if n == 0 {
                        break;
                    }
                    zip.write_all(&buffer[..n])
                        .map_err(|e| format!("Failed to write file to zip: {}", e))?;
                }
                total_zip_size += file_size;
            } else if path.is_dir() && !relative_path_str.is_empty() {
                let dir_path = format!("{}/", relative_path_str);
                zip.add_directory(dir_path, options)
                    .map_err(|e| format!("Failed to add directory to zip: {}", e))?;
            }
        }
    }

    let buf = zip
        .finish()
        .map_err(|e| format!("Failed to finalize zip: {}", e))?
        .into_inner();

    let selected_dir = app.dialog().file().blocking_pick_folder();

    // If user cancels the dialog, selected_dir will be None
    if let Some(dir_path) = selected_dir {
        let dir_path_str = dir_path.to_string();
        validate_dir_path(&dir_path_str)?;
        // Create the full path for history.zip
        let base = Path::new(&dir_path_str);
        let safe_path = sanitize_and_check_path(base, Path::new("history.zip"))?;

        // Write the buffer to the file
        let file = std::fs::File::create(&safe_path)
            .map_err(|e| format!("Failed to create zip file: {}", e))?;
        let metadata = file
            .metadata()
            .map_err(|e| format!("Failed to get file metadata: {}", e))?;
        if metadata.permissions().readonly() {
            return Err("Zip file is not writable".to_string());
        }
        std::io::Write::write_all(&mut &file, &buf)
            .map_err(|e| format!("Failed to write zip file: {}", e))?;

        Ok(safe_path.to_string_lossy().into_owned())
    } else {
        Ok("".to_string())
    }
}

fn validate_dir_path(path: &str) -> Result<(), String> {
    if path.trim().is_empty() {
        return Err("Directory path cannot be empty".to_string());
    }
    if path.len() > 4096 {
        return Err("Directory path is too long".to_string());
    }
    if path.contains("..") || path.contains("\\") {
        return Err("Invalid directory path (path traversal detected)".to_string());
    }
    Ok(())
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_validate_dir_path_empty() {
        let result = validate_dir_path("");
        assert!(result.is_err());
        assert_eq!(result.unwrap_err(), "Directory path cannot be empty");
    }

    #[test]
    fn test_validate_dir_path_too_long() {
        let long_path = "a".repeat(4097);
        let result = validate_dir_path(&long_path);
        assert!(result.is_err());
        assert_eq!(result.unwrap_err(), "Directory path is too long");
    }

    #[test]
    fn test_validate_dir_path_path_traversal() {
        let result = validate_dir_path("/tmp/../etc");
        assert!(result.is_err());
        assert_eq!(
            result.unwrap_err(),
            "Invalid directory path (path traversal detected)"
        );

        let result = validate_dir_path("C:\\evil");
        assert!(result.is_err());
        assert_eq!(
            result.unwrap_err(),
            "Invalid directory path (path traversal detected)"
        );
    }

    #[test]
    fn test_validate_dir_path_valid() {
        let result = validate_dir_path("/tmp/recordings");
        assert!(result.is_ok());
    }
}
