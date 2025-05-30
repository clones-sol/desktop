//! Main entry point and Tauri integration for the desktop application.
//!
//! This crate wires together all core, tool, and utility modules, and sets up the Tauri runtime, plugins, and command handlers for the application.

use tauri::Manager;
#[cfg(any(target_os = "macos"))]
use window_vibrancy::*;
mod commands;
mod core;
mod tools;
mod utils;

use core::record::{set_rec_state, QuestState};
#[cfg(target_os = "macos")]
use utils::permissions::{has_ax_perms, has_record_perms, request_ax_perms, request_record_perms};

use crate::commands::general::{greet, list_apps, take_screenshot};
use crate::commands::record::{
    create_recording_zip, delete_recording, export_recording_zip, get_app_data_dir,
    get_current_quest, get_recording_file, get_recording_state, list_recordings,
    open_recording_folder, process_recording, start_recording, stop_recording, write_file,
    write_recording_file,
};
use crate::commands::recordings::export_recordings;
use crate::commands::settings::{
    get_onboarding_complete, get_upload_data_allowed, set_onboarding_complete,
    set_upload_data_allowed,
};
use crate::commands::tools::{check_tools, init_tools};

/// Runs the Tauri application, setting up plugins, state, and command handlers.
///
/// This function initializes the Tauri runtime, registers all plugins, manages state, and exposes command handlers for frontend invocation.
#[cfg_attr(mobile, tauri::mobile_entry_point)]
pub fn run() {
    let _app = tauri::Builder::default()
        .plugin(tauri_plugin_updater::Builder::new().build())
        .plugin(tauri_plugin_deep_link::init())
        .plugin(
            tauri_plugin_log::Builder::new()
                .level_for("tao::platform_impl::platform", log::LevelFilter::Error)
                .level_for("reqwest::blocking::wait", log::LevelFilter::Error)
                .target(tauri_plugin_log::Target::new(
                    tauri_plugin_log::TargetKind::Stdout,
                ))
                .target(tauri_plugin_log::Target::new(
                    tauri_plugin_log::TargetKind::LogDir {
                        file_name: Some("logs".to_string()),
                    },
                ))
                .build(),
        )
        .plugin(tauri_plugin_process::init())
        .plugin(tauri_plugin_clipboard_manager::init())
        .plugin(tauri_plugin_os::init())
        .plugin(tauri_plugin_shell::init())
        .plugin(tauri_plugin_dialog::init())
        .manage(QuestState::default())
        .plugin(tauri_plugin_opener::init())
        .invoke_handler(tauri::generate_handler![
            greet,
            start_recording,
            stop_recording,
            take_screenshot,
            list_apps,
            #[cfg(target_os = "macos")]
            has_record_perms,
            #[cfg(target_os = "macos")]
            request_record_perms,
            #[cfg(target_os = "macos")]
            has_ax_perms,
            #[cfg(target_os = "macos")]
            request_ax_perms,
            list_recordings,
            get_recording_file,
            get_onboarding_complete,
            set_onboarding_complete,
            init_tools,
            check_tools,
            get_app_data_dir,
            write_file,
            write_recording_file,
            open_recording_folder,
            process_recording,
            create_recording_zip,
            export_recording_zip,
            get_upload_data_allowed,
            set_upload_data_allowed,
            export_recordings,
            delete_recording,
            get_recording_state,
            get_current_quest,
        ])
        .setup(|app| {
            #[cfg(any(windows, target_os = "linux"))]
            {
                use tauri_plugin_deep_link::DeepLinkExt;
                app.deep_link().register_all()?;
            };

            let window = app.get_webview_window("main").unwrap();

            #[cfg(target_os = "macos")]
            apply_vibrancy(&window, NSVisualEffectMaterial::HudWindow, None, None)
                .expect("Unsupported platform! 'apply_vibrancy' is only supported on macOS");

            // Emit initial recording status
            set_rec_state(&app.handle(), "off".to_string(), None)?;

            // Set up window close handler after all other operations
            let window_handle = window.clone();
            window.on_window_event(move |event| {
                if let tauri::WindowEvent::Destroyed = event {
                    window_handle.app_handle().exit(0);
                }
            });

            Ok(())
        })
        .run(tauri::generate_context!())
        .expect("error while running tauri application");
}
// remember to call `.manage(MyState::default())`
