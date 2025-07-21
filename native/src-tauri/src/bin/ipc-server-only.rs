//! Binary entry point for the IPC server only.

// Prevents additional console window on Windows in release, DO NOT REMOVE!!
#![cfg_attr(not(debug_assertions), windows_subsystem = "windows")]

use clones_desktop_lib::{ipc_server, setup_builder};

fn main() {
    // Initialize the logger
    env_logger::init();

    // Load .env files for configuration
    dotenvy::from_filename(".env").ok();
    dotenvy::from_filename_override(".env.local").ok();
    if "production"
        == std::env::var("ENV").unwrap_or_else(|_| "development".to_string())
    {
        dotenvy::from_filename_override(".env.production").ok();
    }

    let app = setup_builder()
        .setup(|app| {
            let app_handle = app.handle().clone();
            // Start the IPC server in a separate thread
            tauri::async_runtime::spawn(async move {
                ipc_server::init(app_handle).await;
            });
            Ok(())
        })
        .build(tauri::generate_context!())
        .expect("error while building tauri application");

    // Run the app headlessly
    app.run(|_app_handle, event| {
        if let tauri::RunEvent::ExitRequested { api, .. } = event {
            api.prevent_exit();
        }
    });
} 