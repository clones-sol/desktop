// Prevents additional console window on Windows in release, DO NOT REMOVE!!
#![cfg_attr(not(debug_assertions), windows_subsystem = "windows")]

fn main() {
    // Load .env then .env.local (always), then .env.production if we are in production.
    dotenvy::from_filename(".env").ok();
    dotenvy::from_filename_override(".env.local").ok();
    let env = std::env::var("VITE_ENV").unwrap_or_else(|_| "development".to_string());
    if env == "production" {
        dotenvy::from_filename_override(".env.production").ok();
    }
    gym_desktop_lib::run()
}
