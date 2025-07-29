//! Utilities for URL handling and external URL operations.
//!
//! This module provides functions for opening external URLs and URL-related operations.

use serde::Deserialize;
use tauri::AppHandle;
use tauri_plugin_opener::OpenerExt;

/// Payload for opening an external URL
#[derive(Deserialize)]
pub struct OpenUrlPayload {
    pub url: String,
}

/// Opens an external URL using the system's default browser
///
/// # Arguments
/// * `app_handle` - The Tauri app handle
/// * `payload` - The URL payload containing the URL to open
///
/// # Returns
/// * `Ok(())` if the URL was opened successfully
/// * `Err` if an error occurred
pub fn open_external_url(app_handle: &AppHandle, payload: &OpenUrlPayload) -> Result<(), String> {
    match app_handle.opener().open_url(&payload.url, None::<&str>) {
        Ok(_) => Ok(()),
        Err(e) => Err(format!("Failed to open URL '{}': {}", payload.url, e)),
    }
}
