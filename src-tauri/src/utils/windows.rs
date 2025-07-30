//! Utilities for window management operations.
//!
//! This module provides functions for resizing, positioning, and getting window information.

use display_info::DisplayInfo;
use serde::{Deserialize, Serialize};
use tauri::{AppHandle, LogicalPosition, LogicalSize, Manager};

/// Payload for resizing a window
#[derive(Deserialize)]
pub struct ResizeWindowPayload {
    pub width: u32,
    pub height: u32,
    pub alignment: Option<String>, // "topRight", "center", etc.
}

/// Payload for setting window alignment
#[derive(Deserialize)]
pub struct SetWindowAlignmentPayload {
    pub alignment: String,
}

/// Response structure for window size
#[derive(Serialize)]
pub struct WindowSize {
    pub width: u32,
    pub height: u32,
}

/// Response structure for display size
#[derive(Serialize)]
pub struct DisplaySize {
    pub width: u32,
    pub height: u32,
}

/// Resizes a window and optionally positions it based on alignment
///
/// # Arguments
/// * `app_handle` - The Tauri app handle
/// * `payload` - The resize payload containing width, height, and optional alignment
///
/// # Returns
/// * `Ok(())` if the operation succeeded
/// * `Err` if an error occurred
pub fn resize_window(app_handle: &AppHandle, payload: &ResizeWindowPayload) -> Result<(), String> {
    let window = app_handle
        .get_webview_window("main")
        .ok_or("Window 'main' not found")?;

    // Resize
    if let Err(e) = window.set_size(tauri::Size::Logical(LogicalSize {
        width: payload.width as f64,
        height: payload.height as f64,
    })) {
        return Err(format!("Resize failed: {}", e));
    }

    // Move based on alignment (simplified example for "topRight" on 1920x1080 screen)
    if let Some(align) = payload.alignment.as_deref() {
        if align == "topRight" {
            if let Ok(monitor) = window.current_monitor() {
                if let Some(monitor) = monitor {
                    let screen_size = monitor.size();
                    let x = (screen_size.width as f64) - (payload.width as f64);
                    let y = 0.0;
                    if let Err(e) = window
                        .set_position(tauri::Position::Logical(tauri::LogicalPosition::new(x, y)))
                    {
                        return Err(format!("Positioning failed: {}", e));
                    }
                }
            }
        }
    }

    Ok(())
}

/// Sets the position of a window based on alignment
///
/// # Arguments
/// * `app_handle` - The Tauri app handle
/// * `payload` - The alignment payload
///
/// # Returns
/// * `Ok(())` if the operation succeeded
/// * `Err` if an error occurred
pub fn set_window_position(
    app_handle: &AppHandle,
    payload: &SetWindowAlignmentPayload,
) -> Result<(), String> {
    let window = app_handle
        .get_webview_window("main")
        .ok_or("Window 'main' not found")?;

    let window_size = window
        .inner_size()
        .map_err(|e| format!("Failed to get window size: {}", e))?;

    let monitor = window
        .current_monitor()
        .map_err(|_| "Failed to get monitor info")?
        .ok_or("Failed to get monitor info")?;

    let scale_factor = monitor.scale_factor();
    let screen_size = monitor.size();

    let screen_width = screen_size.width as f64 / scale_factor;
    let screen_height = screen_size.height as f64 / scale_factor;
    let window_width = window_size.width as f64 / scale_factor;
    let window_height = window_size.height as f64 / scale_factor;

    let (x, y) = match payload.alignment.as_str() {
        "topLeft" => (0.0, 0.0),
        "topCenter" => ((screen_width - window_width) / 2.0, 0.0),
        "topRight" => (screen_width - window_width, 0.0),
        "center" => (
            (screen_width - window_width) / 2.0,
            (screen_height - window_height) / 2.0,
        ),
        "bottomLeft" => (0.0, screen_height - window_height),
        "bottomCenter" => (
            (screen_width - window_width) / 2.0,
            screen_height - window_height,
        ),
        "bottomRight" => (screen_width - window_width, screen_height - window_height),
        "leftCenter" => (0.0, (screen_height - window_height) / 2.0),
        "rightCenter" => (
            screen_width - window_width,
            (screen_height - window_height) / 2.0,
        ),
        _ => return Err(format!("Unknown alignment: {}", payload.alignment)),
    };

    window
        .set_position(tauri::Position::Logical(LogicalPosition::new(x, y)))
        .map_err(|e| format!("Failed to set window position: {}", e))?;

    Ok(())
}

/// Gets the current size of all displays
///
/// # Returns
/// * `Ok(Vec<DisplaySize>)` if the operation succeeded
/// * `Err` if an error occurred
pub fn get_all_displays_size() -> Result<Vec<DisplaySize>, String> {
    DisplayInfo::all()
        .map_err(|e| format!("Failed to get displays: {}", e))?
        .into_iter()
        .map(|d| {
            Ok(DisplaySize {
                width: d.width,
                height: d.height,
            })
        })
        .collect::<Result<Vec<DisplaySize>, String>>()
}

/// Gets the current size of a window
///
/// # Arguments
/// * `app_handle` - The Tauri app handle
///
/// # Returns
/// * `Ok(WindowSize)` if the operation succeeded
/// * `Err` if an error occurred
pub fn get_window_size(app_handle: &AppHandle) -> Result<WindowSize, String> {
    let window = app_handle
        .get_webview_window("main")
        .ok_or("Window 'main' not found")?;

    let size = window
        .inner_size()
        .map_err(|e| format!("Failed to get window size: {}", e))?;

    Ok(WindowSize {
        width: size.width,
        height: size.height,
    })
}

/// Sets the resizability of a window
///
/// # Arguments
/// * `app_handle` - The Tauri app handle
/// * `resizable` - Whether the window should be resizable
///
/// # Returns
/// * `Ok(())` if the operation succeeded
/// * `Err` if an error occurred
pub fn set_window_resizable(app_handle: &AppHandle, resizable: bool) -> Result<(), String> {
    let window = app_handle
        .get_webview_window("main")
        .ok_or("Window 'main' not found")?;

    window
        .set_resizable(resizable)
        .map_err(|e| format!("Failed to set window resizable: {}", e))?;

    Ok(())
}
