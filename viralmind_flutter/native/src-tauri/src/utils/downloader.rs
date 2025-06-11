//! Utilities for downloading files with retry and progress logging.
//!
//! This module provides a function to download files from a URL to a local path, with retry logic and progress reporting.

use crate::tools::sanitize_and_check_path;
use std::{
    fs,
    io::{Read, Write},
    path::Path,
    time::Duration,
};

/// Downloads a file from the given URL to the specified path, with retry logic and progress logging.
///
/// # Arguments
/// * `url` - The URL to download from.
/// * `path` - The local file path to write to.
///
/// # Returns
/// * `Ok(())` if the download succeeded.
/// * `Err` if all retries failed or an error occurred.
pub fn download_file(url: &str, path: &Path) -> Result<(), String> {
    log::info!(
        "[Downloader] Downloading file from {} to {}",
        url,
        path.display()
    );

    let filename = path.components().last().unwrap().as_os_str();
    let client = reqwest::blocking::Client::builder()
        .timeout(Duration::from_secs(90))
        .build()
        .unwrap();

    // Retry logic
    let max_retries = 2;
    let mut retry_count = 0;
    let mut last_error = String::new();
    let mut total_bytes = 0;

    while retry_count <= max_retries {
        if retry_count > 0 {
            log::info!(
                "[Downloader] Retry {} of {} for {}",
                retry_count,
                max_retries,
                filename.to_string_lossy()
            );
        }

        match download_with_progress(url, path, &client, &mut total_bytes) {
            Ok(_) => {
                // Download succeeded
                log::info!(
                    "[Downloader] Successfully downloaded {:?} to {} ({:.2} MB total)",
                    filename,
                    path.display(),
                    total_bytes as f64 / (1024.0 * 1024.0)
                );
                return Ok(());
            }
            Err(e) => {
                last_error = e.clone();

                // always retry if we haven't maxed out
                let should_retry = retry_count < max_retries;

                if should_retry && retry_count < max_retries {
                    retry_count += 1;
                    continue;
                } else {
                    // Calculate approximate percentage based on what we know
                    // This is a rough estimate since we don't know the total file size
                    let percentage = if total_bytes > 0 {
                        // If we have some bytes, estimate based on typical file sizes
                        // This is very approximate
                        let typical_size = 10 * 1024 * 1024; // Assume 10MB as typical size
                        (total_bytes as f64 / typical_size as f64 * 100.0).min(99.0)
                    } else {
                        0.0 // No bytes downloaded
                    };

                    log::error!(
                        "[Downloader] All retries failed for {} at percentage {}: {}",
                        filename.to_string_lossy(),
                        last_error,
                        percentage
                    );
                    return Err(last_error);
                }
            }
        }
    }

    // This should never be reached due to the loop logic, but Rust requires a return value
    Err(last_error)
}

// Helper function to perform the actual download with progress tracking
fn download_with_progress(
    url: &str,
    path: &Path,
    client: &reqwest::blocking::Client,
    total_bytes: &mut usize,
) -> Result<(), String> {
    let filename = path.components().last().unwrap().as_os_str();

    // Sanitize and check the path
    let base = std::env::temp_dir();
    let safe_path = sanitize_and_check_path(&base, path)?;

    let mut resp = client.get(url).send().map_err(|e| {
        log::info!(
            "[Downloader] Error: Failed to download {}: {}",
            filename.to_string_lossy(),
            e
        );
        format!("Failed to download {:?}: {}", filename, e)
    })?;

    // Create file for writing
    let mut file = fs::File::create(&safe_path).map_err(|e| {
        log::info!(
            "[Download] Error: Failed to create {}: {}",
            filename.to_string_lossy(),
            e
        );
        format!("Failed to create {}: {}", filename.to_string_lossy(), e)
    })?;
    let metadata = file
        .metadata()
        .map_err(|e| format!("Failed to get file metadata: {}", e))?;
    if metadata.permissions().readonly() {
        return Err("Downloaded file is not writable".to_string());
    }

    // Download in chunks and write to file
    let mut buffer = [0; 8192]; // 8KB buffer
    let mut last_logged_bytes = *total_bytes;

    loop {
        let bytes_read = resp.read(&mut buffer).map_err(|e| {
            log::info!("[Downloader] Error: Failed to read from response: {}", e);
            format!("Failed to read from response: {}", e)
        })?;

        if bytes_read == 0 {
            break; // End of response
        }

        file.write_all(&buffer[..bytes_read]).map_err(|e| {
            log::info!(
                "[Downloader] Error: Failed to write to {}: {}",
                filename.to_string_lossy(),
                e
            );
            format!("Failed to write to {:?}: {}", filename, e)
        })?;

        *total_bytes += bytes_read;

        // Log progress every 5mb
        if *total_bytes - last_logged_bytes >= 5 * 1024 * 1024 {
            log::info!(
                "[Downloader] Downloaded {:.2} MB of {}",
                *total_bytes as f64 / (1024.0 * 1024.0),
                filename.to_string_lossy()
            );
            last_logged_bytes = *total_bytes;
        }
    }

    Ok(())
}
