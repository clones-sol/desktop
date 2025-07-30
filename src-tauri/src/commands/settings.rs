//! Tauri commands for managing user settings (upload consent, onboarding).
//!
//! This module provides commands to get and set user preferences stored in the settings file.

use crate::utils::settings::Settings;
use tauri::AppHandle;

#[tauri::command]
pub fn get_upload_data_allowed(app: AppHandle) -> bool {
    Settings::load(&app).upload_confirmed
}

/// Gets whether the onboarding process is complete.
///
/// # Arguments
/// * `app` - The Tauri `AppHandle` for accessing settings.
///
/// # Returns
/// * `true` if onboarding is complete, `false` otherwise.
#[tauri::command]
pub fn get_onboarding_complete(app: AppHandle) -> bool {
    Settings::load(&app).onboarding_complete
}

/// Sets whether the user has allowed data upload.
///
/// # Arguments
/// * `app` - The Tauri `AppHandle` for accessing settings.
/// * `confirmed` - Whether upload is allowed.
///
/// # Returns
/// * `Ok(())` if the setting was saved.
/// * `Err` if saving failed.
#[tauri::command]
pub fn set_upload_data_allowed(app: AppHandle, confirmed: bool) -> Result<(), String> {
    let mut settings = Settings::load(&app);
    settings.upload_confirmed = confirmed;
    settings.save(&app)
}

/// Sets whether the onboarding process is complete.
///
/// # Arguments
/// * `app` - The Tauri `AppHandle` for accessing settings.
/// * `confirmed` - Whether onboarding is complete.
///
/// # Returns
/// * `Ok(())` if the setting was saved.
/// * `Err` if saving failed.
#[tauri::command]
pub fn set_onboarding_complete(app: AppHandle, confirmed: bool) -> Result<(), String> {
    let mut settings = Settings::load(&app);
    settings.onboarding_complete = confirmed;
    settings.save(&app)
}
