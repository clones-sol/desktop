//! Tauri commands for initializing and checking external tool binaries (FFmpeg, dump-tree, pipeline).
//!
//! This module provides commands to initialize required binaries in parallel and check their status.

use crate::tools::helpers::lock_with_timeout;
use crate::tools::{axtree, ffmpeg, pipeline};
use log::error;
use serde_json;
use std::sync::{Arc, Mutex};
use std::thread;
use tauri::Emitter;

/// Initializes all required tool binaries (FFmpeg, dump-tree, pipeline) in parallel threads.
///
/// # Arguments
/// * `app` - The Tauri `AppHandle` for emitting errors to the frontend.
///
/// # Returns
/// * `Ok(())` if all tools were initialized (errors are emitted as events).
#[tauri::command]
pub async fn init_tools(app: tauri::AppHandle) -> Result<(), String> {
    // Create a vector to store thread handles
    let mut handles = Vec::new();

    // Create shared error storage
    let errors = Arc::new(Mutex::new(Vec::new()));

    // Spawn thread for FFmpeg initialization
    {
        let errors = Arc::clone(&errors);
        let handle = thread::spawn(move || {
            if let Err(e) = ffmpeg::init_ffmpeg_and_ffprobe() {
                let lock = lock_with_timeout(&errors, std::time::Duration::from_secs(2));
                if let Some(mut errors) = lock {
                    errors.push(format!("Failed to initialize FFmpeg/FFprobe: {}", e));
                } else {
                    log::error!("[Init Tools] Could not acquire error lock for FFmpeg/FFprobe");
                }
            }
        });
        handles.push(handle);
    }

    // Spawn thread for dump-tree initialization
    {
        let errors = Arc::clone(&errors);
        let handle = thread::spawn(move || {
            if let Err(e) = axtree::init_dump_tree() {
                let lock = lock_with_timeout(&errors, std::time::Duration::from_secs(2));
                if let Some(mut errors) = lock {
                    errors.push(format!("Failed to initialize dump-tree: {}", e));
                } else {
                    log::error!("[Init Tools] Could not acquire error lock for dump-tree");
                }
            }
        });
        handles.push(handle);
    }

    // Spawn thread for pipeline initialization
    {
        let errors = Arc::clone(&errors);
        let handle = thread::spawn(move || {
            if let Err(e) = pipeline::init_pipeline() {
                let lock = lock_with_timeout(&errors, std::time::Duration::from_secs(2));
                if let Some(mut errors) = lock {
                    errors.push(format!("Failed to initialize pipeline: {}", e));
                } else {
                    log::error!("[Init Tools] Could not acquire error lock for pipeline");
                }
            }
        });
        handles.push(handle);
    }

    // Wait for all threads to complete
    for handle in handles {
        if let Err(e) = handle.join() {
            error!("Thread panicked: {:?}", e);
        }
    }

    // Check if there were any errors
    let errors = match lock_with_timeout(&errors, std::time::Duration::from_secs(2)) {
        Some(errors) => errors,
        None => {
            log::error!("[Init Tools] Could not acquire error lock for final check");
            return Ok(());
        }
    };
    if !errors.is_empty() {
        for err in errors.iter() {
            error!("{}", err);
        }
        let _ = app.emit(
            "init_tools_errors",
            serde_json::json!({
                "errors": errors.to_vec()
            }),
        );
    }

    Ok(())
}

/// Checks the initialization status of all required tool binaries.
///
/// # Returns
/// * `Ok(serde_json::Value)` with a map of tool names to their status (true/false).
#[tauri::command]
pub async fn check_tools() -> Result<serde_json::Value, String> {
    // Return the status of each tool
    Ok(serde_json::json!({
        "ffmpeg": ffmpeg::FFMPEG_PATH.get().is_some(),
        "ffprobe": ffmpeg::FFPROBE_PATH.get().is_some(),
        "dump_tree": axtree::DUMP_TREE_PATH.get().is_some(),
        "pipeline": pipeline::PIPELINE_PATH.get().is_some()
    }))
}
