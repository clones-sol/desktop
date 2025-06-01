//! Tauri commands for recording management: start, stop, list, and file operations.
//!
//! This module provides commands for managing recording sessions, files, and metadata from the frontend.

use crate::core::record::{self, Quest, QuestState, RecordingMeta};
use tauri::{AppHandle, State};

/// Starts a new recording session.
///
/// # Arguments
/// * `app` - The Tauri `AppHandle`.
/// * `quest_state` - The current quest state.
/// * `quest` - Optional quest information.
///
/// # Returns
/// * `Ok(())` if recording started successfully.
/// * `Err` if starting failed.
#[tauri::command]
pub async fn start_recording(
    app: AppHandle,
    quest_state: State<'_, QuestState>,
    quest: Option<Quest>,
) -> Result<(), String> {
    record::start_recording(app, quest_state, quest).await
}

/// Stops the current recording session.
///
/// # Arguments
/// * `app` - The Tauri `AppHandle`.
/// * `quest_state` - The current quest state.
/// * `reason` - Optional reason for stopping.
///
/// # Returns
/// * `Ok(String)` with stop info if successful.
/// * `Err` if stopping failed.
#[tauri::command]
pub async fn stop_recording(
    app: AppHandle,
    quest_state: State<'_, QuestState>,
    reason: Option<String>,
) -> Result<String, String> {
    record::stop_recording(app, quest_state, reason).await
}

/// Gets the current recording state as a string.
///
/// # Returns
/// * `Ok(String)` with the state.
/// * `Err` if retrieval failed.
#[tauri::command]
pub async fn get_recording_state() -> Result<String, String> {
    record::get_recording_state().await
}

/// Lists all recordings' metadata.
///
/// # Arguments
/// * `app` - The Tauri `AppHandle`.
///
/// # Returns
/// * `Ok(Vec<RecordingMeta>)` if successful.
/// * `Err` if listing failed.
#[tauri::command]
pub async fn list_recordings(app: AppHandle) -> Result<Vec<RecordingMeta>, String> {
    record::list_recordings(app).await
}

/// Gets a file from a recording, optionally as base64 or as a path.
///
/// # Arguments
/// * `app` - The Tauri `AppHandle`.
/// * `recording_id` - The recording ID.
/// * `filename` - The file name.
/// * `as_base64` - Whether to return as base64.
/// * `as_path` - Whether to return as a file path.
///
/// # Returns
/// * `Ok(String)` with file data or path.
/// * `Err` if retrieval failed.
#[tauri::command]
pub async fn get_recording_file(
    app: AppHandle,
    recording_id: String,
    filename: String,
    as_base64: Option<bool>,
    as_path: Option<bool>,
) -> Result<String, String> {
    validate_id(&recording_id)?;
    validate_filename(&filename)?;
    record::get_recording_file(app, recording_id, filename, as_base64, as_path).await
}

/// Processes a recording (post-processing step).
///
/// # Arguments
/// * `app` - The Tauri `AppHandle`.
/// * `recording_id` - The recording ID.
///
/// # Returns
/// * `Ok(())` if processing succeeded.
/// * `Err` if processing failed.
#[tauri::command]
pub async fn process_recording(app: AppHandle, recording_id: String) -> Result<(), String> {
    validate_id(&recording_id)?;
    record::process_recording(app, recording_id).await
}

/// Writes content to a file at the given path.
///
/// # Arguments
/// * `app` - The Tauri `AppHandle`.
/// * `path` - The file path.
/// * `content` - The content to write.
///
/// # Returns
/// * `Ok(())` if writing succeeded.
/// * `Err` if writing failed.
#[tauri::command]
pub async fn write_file(app: AppHandle, path: String, content: String) -> Result<(), String> {
    validate_path(&path)?;
    validate_content(&content)?;
    record::write_file(app, path, content).await
}

/// Writes content to a file in a recording's directory.
///
/// # Arguments
/// * `app` - The Tauri `AppHandle`.
/// * `recording_id` - The recording ID.
/// * `filename` - The file name.
/// * `content` - The content to write.
///
/// # Returns
/// * `Ok(())` if writing succeeded.
/// * `Err` if writing failed.
#[tauri::command]
pub async fn write_recording_file(
    app: AppHandle,
    recording_id: String,
    filename: String,
    content: String,
) -> Result<(), String> {
    validate_id(&recording_id)?;
    validate_filename(&filename)?;
    validate_content(&content)?;
    record::write_recording_file(app, recording_id, filename, content).await
}

/// Opens the folder containing a recording.
///
/// # Arguments
/// * `app` - The Tauri `AppHandle`.
/// * `recording_id` - The recording ID.
///
/// # Returns
/// * `Ok(())` if the folder was opened.
/// * `Err` if opening failed.
#[tauri::command]
pub async fn open_recording_folder(app: AppHandle, recording_id: String) -> Result<(), String> {
    validate_id(&recording_id)?;
    record::open_recording_folder(app, recording_id).await
}

/// Deletes a recording and its files.
///
/// # Arguments
/// * `app` - The Tauri `AppHandle`.
/// * `recording_id` - The recording ID.
///
/// # Returns
/// * `Ok(())` if deletion succeeded.
/// * `Err` if deletion failed.
#[tauri::command]
pub async fn delete_recording(app: AppHandle, recording_id: String) -> Result<(), String> {
    validate_id(&recording_id)?;
    record::delete_recording(app, recording_id).await
}

/// Creates a zip archive of a recording's files.
///
/// # Arguments
/// * `app` - The Tauri `AppHandle`.
/// * `recording_id` - The recording ID.
///
/// # Returns
/// * `Ok(Vec<u8>)` with the zip data.
/// * `Err` if zipping failed.
#[tauri::command]
pub async fn create_recording_zip(app: AppHandle, recording_id: String) -> Result<Vec<u8>, String> {
    validate_id(&recording_id)?;
    record::create_recording_zip(app, recording_id).await
}

/// Exports a recording's zip archive to a user-accessible location.
///
/// # Arguments
/// * `id` - The recording ID.
/// * `app` - The Tauri `AppHandle`.
///
/// # Returns
/// * `Ok(String)` with the export path.
/// * `Err` if export failed.
#[tauri::command]
pub async fn export_recording_zip(id: String, app: AppHandle) -> Result<String, String> {
    validate_id(&id)?;
    record::export_recording_zip(id, app).await
}

/// Gets the application data directory path.
///
/// # Arguments
/// * `app` - The Tauri `AppHandle`.
///
/// # Returns
/// * `Ok(String)` with the directory path.
/// * `Err` if retrieval failed.
#[tauri::command]
pub async fn get_app_data_dir(app: AppHandle) -> Result<String, String> {
    record::get_app_data_dir(app).await
}

/// Gets the current quest from the quest state.
///
/// # Arguments
/// * `quest_state` - The current quest state.
///
/// # Returns
/// * `Ok(Some(Quest))` if a quest is active.
/// * `Ok(None)` if no quest is active.
/// * `Err` if retrieval failed.
#[tauri::command]
pub async fn get_current_quest(
    quest_state: State<'_, QuestState>,
) -> Result<Option<Quest>, String> {
    record::get_current_quest(quest_state).await
}

fn validate_id(id: &str) -> Result<(), String> {
    if id.trim().is_empty() {
        return Err("Recording ID cannot be empty".to_string());
    }
    if id.contains("..") || id.contains('/') || id.contains('\\') {
        return Err("Invalid recording ID (path traversal detected)".to_string());
    }
    Ok(())
}

fn validate_filename(filename: &str) -> Result<(), String> {
    if filename.trim().is_empty() {
        return Err("Filename cannot be empty".to_string());
    }
    if filename.contains("..") || filename.contains('/') || filename.contains('\\') {
        return Err("Invalid filename (path traversal detected)".to_string());
    }
    Ok(())
}

fn validate_path(path: &str) -> Result<(), String> {
    if path.trim().is_empty() {
        return Err("Path cannot be empty".to_string());
    }
    if path.contains("..") {
        return Err("Invalid path (path traversal detected)".to_string());
    }
    Ok(())
}

fn validate_content(content: &str) -> Result<(), String> {
    if content.len() > 100 * 1024 * 1024 {
        // 100 MB max content size
        return Err("Content is too large".to_string());
    }
    Ok(())
}
