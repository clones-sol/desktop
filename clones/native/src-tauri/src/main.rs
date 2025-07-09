//! Binary entry point for the desktop application.
//!
//! Loads environment variables and launches the main Tauri application logic.

// Prevents additional console window on Windows in release, DO NOT REMOVE!!
#![cfg_attr(not(debug_assertions), windows_subsystem = "windows")]

/// Loads environment variables and starts the Tauri application.
fn main() {
    // Load .env then .env.local (always), then .env.production if we are in production.
    dotenvy::from_filename(".env").ok();
    dotenvy::from_filename_override(".env.local").ok();
    let env = std::env::var("ENV").unwrap_or_else(|_| "development".to_string());
    if env == "production" {
        dotenvy::from_filename_override(".env.production").ok();
    }
    gym_desktop_lib::run()
}
