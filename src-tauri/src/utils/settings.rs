//! Utilities for loading and saving user settings to a JSON file in the app data directory.
//!
//! This module provides a `Settings` struct and methods to persist and recover user preferences, such as onboarding and upload confirmation state.

use crate::tools::sanitize_and_check_path;
use log::{error, info};
use serde::{Deserialize, Serialize};
use std::{
    fs::{self, File},
    io::{BufReader, BufWriter, Write},
    path::PathBuf,
};
use tauri::{AppHandle, Manager};

/// User settings stored in a JSON file.
///
/// Fields include onboarding and upload confirmation state.
#[derive(Debug, Serialize, Deserialize, Default)]
pub struct Settings {
    pub upload_confirmed: bool,
    pub onboarding_complete: bool,
}

impl Settings {
    /// Loads settings from the app's data directory, or returns defaults if not found or on error.
    ///
    /// # Arguments
    /// * `app` - The Tauri `AppHandle` used to locate the settings file.
    ///
    /// # Returns
    /// * `Settings` loaded from file, or default values if not found or on error.
    pub fn load(app: &AppHandle) -> Self {
        let path = get_settings_path(app);

        if path.exists() {
            match File::open(&path) {
                Ok(file) => {
                    let reader = BufReader::new(file);
                    match serde_json::from_reader(reader) {
                        Ok(settings) => {
                            info!("[Settings] Loaded settings from {}", path.display());
                            settings
                        }
                        Err(e) => {
                            error!("[Settings] Error parsing settings JSON: {}", e);

                            // Try to parse the file again with more lenient options
                            // This will handle missing fields by using default values
                            if let Ok(file) = File::open(&path) {
                                let reader = BufReader::new(file);
                                let json_value: Result<serde_json::Value, _> =
                                    serde_json::from_reader(reader);

                                if let Ok(json) = json_value {
                                    if let Ok(partial_settings) =
                                        serde_json::from_value::<Settings>(json.clone())
                                    {
                                        info!("[Settings] Successfully recovered settings with defaults for missing fields");
                                        return partial_settings;
                                    }

                                    // If the above fails, try to manually extract the fields that are present
                                    let mut settings = Settings::default();

                                    if let Some(upload_confirmed) = json.get("upload_confirmed") {
                                        if let Some(value) = upload_confirmed.as_bool() {
                                            settings.upload_confirmed = value;
                                        }
                                    }

                                    if let Some(onboarding_complete) =
                                        json.get("onboarding_complete")
                                    {
                                        if let Some(value) = onboarding_complete.as_bool() {
                                            settings.onboarding_complete = value;
                                        }
                                    }

                                    info!("[Settings] Manually recovered partial settings");
                                    return settings;
                                }
                            }

                            // If all recovery attempts fail, use defaults
                            Settings::default()
                        }
                    }
                }
                Err(e) => {
                    error!("[Settings] Could not open settings file: {}", e);
                    Settings::default()
                }
            }
        } else {
            info!("[Settings] No settings file found, using defaults");
            Settings::default()
        }
    }

    /// Saves the current settings to the app's data directory as JSON.
    ///
    /// # Arguments
    /// * `app` - The Tauri `AppHandle` used to locate the settings file.
    ///
    /// # Returns
    /// * `Ok(())` if the settings were saved successfully.
    /// * `Err` if writing failed.
    pub fn save(&self, app: &AppHandle) -> Result<(), String> {
        let base = app
            .path()
            .app_local_data_dir()
            .map_err(|_| "Failed to get app data directory")?;
        let path =
            crate::tools::sanitize_and_check_path(&base, std::path::Path::new("settings.json"))?;

        // Ensure parent directory exists
        if let Some(parent) = path.parent() {
            fs::create_dir_all(parent)
                .map_err(|e| format!("Failed to create settings directory: {}", e))?;
        }

        let file =
            File::create(&path).map_err(|e| format!("Failed to create settings file: {}", e))?;
        let metadata = file
            .metadata()
            .map_err(|e| format!("Failed to get file metadata: {}", e))?;
        if metadata.permissions().readonly() {
            return Err("Settings file is not writable".to_string());
        }

        let mut writer = BufWriter::new(file);
        serde_json::to_writer_pretty(&mut writer, &self)
            .map_err(|e| format!("Failed to write settings JSON: {}", e))?;

        writer
            .flush()
            .map_err(|e| format!("Failed to flush settings file: {}", e))?;

        info!("[Settings] Saved settings to settings.json");
        Ok(())
    }
}

fn get_settings_path(app: &AppHandle) -> PathBuf {
    app.path()
        .app_local_data_dir()
        .expect("Failed to get app data directory")
        .join("settings.json")
}
