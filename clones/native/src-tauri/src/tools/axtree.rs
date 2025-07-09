//! AxTree tool integration for running and polling the dump-tree binary.
//!
//! This module manages the download, initialization, and polling of the dump-tree binary for accessibility tree extraction.

use crate::tools::helpers::lock_with_timeout;
use log::info;
use serde_json::{json, Value};
use std::io::{BufRead, BufReader};
use std::path::PathBuf;
use std::process::{Command, Stdio};
use std::sync::{Arc, Mutex, OnceLock};
use std::thread;
use std::time::Duration;

pub static DUMP_TREE_PATH: OnceLock<PathBuf> = OnceLock::new();
static POLLING_ACTIVE: OnceLock<Arc<Mutex<bool>>> = OnceLock::new();

const POLLING_SLEEP_SECS: u64 = 2;

#[cfg(target_os = "windows")]
fn get_dump_tree_url() -> String {
    std::env::var("DUMP_TREE_URL_WIN").unwrap_or_else(|_| "https://github.com/clones-sol/ax-tree-parsers/releases/latest/download/dump-tree-windows.exe".to_string())
}

#[cfg(target_os = "linux")]
fn get_dump_tree_url() -> String {
    std::env::var("DUMP_TREE_URL_LINUX").unwrap_or_else(|_| "https://github.com/clones-sol/ax-tree-parsers/releases/latest/download/dump-tree-linux-x86_64".to_string())
}

#[cfg(target_os = "macos")]
fn get_dump_tree_url() -> String {
    std::env::var("DUMP_TREE_URL_MACOS").unwrap_or_else(|_| "https://github.com/clones-sol/ax-tree-parsers/releases/latest/download/dump-tree-macos-arm64".to_string())
}

const GITHUB_API_URL: &str =
    "https://api.github.com/repos/clones-sol/ax-tree-parsers/releases/latest";

fn get_temp_dir() -> PathBuf {
    let mut temp = std::env::temp_dir();
    temp.push("clones-desktop");
    temp
}

/// Initializes the dump-tree binary by downloading the latest release if needed.
///
/// # Returns
/// * `Ok(())` if initialization succeeded.
/// * `Err` if the binary could not be downloaded or set up.
pub fn init_dump_tree() -> Result<(), String> {
    if DUMP_TREE_PATH.get().is_some() {
        log::info!("[AxTree] Already initialized");
        return Ok(());
    }

    log::info!("[AxTree] Initializing dump-tree");

    // Initialize polling state
    POLLING_ACTIVE.get_or_init(|| Arc::new(Mutex::new(false)));

    // Extract repo owner and name from the GitHub API URL
    let url_parts: Vec<&str> = GITHUB_API_URL.split('/').collect();
    let repo_owner = url_parts[4];
    let repo_name = url_parts[5];
    let temp_dir = get_temp_dir();
    let asset_url = get_dump_tree_url();
    let asset_split: Vec<&str> = asset_url.split('/').collect();
    let asset_filename = asset_split[asset_url.split('/').count() - 1];
    let asset_path = temp_dir.join(asset_filename);
    let metadata_path = temp_dir.join(format!("{}.metadata.json", asset_filename));

    // Try to load local metadata
    let local_metadata = crate::utils::github_release::load_metadata(&metadata_path)?;
    // Fetch latest metadata from GitHub
    let latest_metadata =
        crate::utils::github_release::fetch_latest_release_metadata(repo_owner, repo_name)?;

    let needs_download = match &local_metadata {
        Some(meta) => {
            if meta.version != latest_metadata.version {
                log::info!(
                    "[AxTree] Local version {} is outdated (latest: {}), will update",
                    meta.version,
                    latest_metadata.version
                );
                true
            } else {
                log::info!("[AxTree] Local version {} is up to date", meta.version);
                false
            }
        }
        None => {
            log::info!("[AxTree] No local dump-tree binary or metadata, will download");
            true
        }
    };

    if needs_download || !asset_path.exists() {
        // Use the github_release module to get the latest release
        let dump_tree_path = crate::utils::github_release::get_latest_release(
            repo_owner, repo_name, &asset_url, &temp_dir,
            true, // Make executable on Linux/macOS
        )?;
        log::info!(
            "[AxTree] Downloaded and using dump-tree at {}",
            dump_tree_path.display()
        );
        DUMP_TREE_PATH.set(dump_tree_path).unwrap();
    } else {
        log::info!(
            "[AxTree] Using cached dump-tree at {}",
            asset_path.display()
        );
        DUMP_TREE_PATH.set(asset_path).unwrap();
    }
    Ok(())
}

/// Starts polling the dump-tree binary in a background thread, capturing and logging its output.
///
/// # Arguments
/// * `_` - The Tauri `AppHandle` (unused, but required for handler signature).
///
/// # Returns
/// * `Ok(())` if polling started successfully.
/// * `Err` if the binary is not initialized or polling could not start.
pub fn start_dump_tree_polling(_: tauri::AppHandle) -> Result<(), String> {
    let dump_tree = DUMP_TREE_PATH
        .get()
        .ok_or_else(|| "dump-tree not initialized".to_string())?
        .clone();

    let polling_active = POLLING_ACTIVE
        .get()
        .ok_or_else(|| "Polling state not initialized".to_string())?;
    let lock = lock_with_timeout(polling_active, std::time::Duration::from_secs(2));
    if let Some(mut active) = lock {
        *active = true;
    } else {
        log::error!("[AxTree] Could not acquire polling_active lock");
    }

    info!("[AxTree] Starting dump-tree polling");

    thread::spawn(move || {
        info!("[AxTree] Polling thread started");
        let mut thread_exit_clean = false;
        while let Some(active) = lock_with_timeout(
            POLLING_ACTIVE.get().unwrap(),
            std::time::Duration::from_secs(2),
        ) {
            if !*active {
                thread_exit_clean = true;
                break;
            }
            info!("[AxTree] Starting new dump-tree process");

            // Run dump-tree and capture output
            let mut command = Command::new(&dump_tree);
            #[cfg(windows)]
            {
                use std::os::windows::process::CommandExt;
                command.creation_flags(0x08000000); // CREATE_NO_WINDOW constant
            }
            let proc = command
                .arg("-e")
                .stdout(Stdio::piped())
                .stderr(Stdio::piped())
                .spawn();

            match proc {
                Ok(mut child) => {
                    // Create separate threads for handling stdout and stderr
                    let stdout_thread = if let Some(stdout) = child.stdout.take() {
                        let stdout_handle = thread::spawn(move || {
                            let reader = BufReader::new(stdout);
                            for line in reader.lines() {
                                if let Ok(line) = line {
                                    // info!("[AxTree] STDOUT line: {}", line);
                                    // Try to parse as JSON
                                    if let Ok(mut json) = serde_json::from_str::<Value>(&line) {
                                        // Modify the event field
                                        if let Some(obj) = json.as_object_mut() {
                                            obj.insert("event".to_string(), json!("axtree"));
                                            // Log the modified event
                                            let _ = crate::core::record::log_input(json!(obj));
                                        }
                                    }
                                }
                            }
                        });
                        Some(stdout_handle)
                    } else {
                        None
                    };

                    let stderr_thread = if let Some(stderr) = child.stderr.take() {
                        let stderr_handle = thread::spawn(move || {
                            let reader = BufReader::new(stderr);
                            for line in reader.lines() {
                                if let Ok(line) = line {
                                    info!("[AxTree] STDERR line: {}", line);
                                }
                            }
                        });
                        Some(stderr_handle)
                    } else {
                        None
                    };

                    // Wait for process to finish
                    match child.wait() {
                        Ok(status) => info!("[AxTree] Process {}", status),
                        Err(e) => info!("[AxTree] Error waiting for process: {}", e),
                    }

                    // Wait for output processing to complete
                    if let Some(handle) = stdout_thread {
                        if let Err(e) = handle.join() {
                            info!("[AxTree] Error joining stdout thread: {:?}", e);
                        }
                    }

                    if let Some(handle) = stderr_thread {
                        if let Err(e) = handle.join() {
                            info!("[AxTree] Error joining stderr thread: {:?}", e);
                        }
                    }
                }
                Err(e) => {
                    info!("[AxTree] Error running dump-tree: {}", e);
                }
            }

            // Only sleep if we're still supposed to be polling
            if *POLLING_ACTIVE.get().unwrap().lock().unwrap() {
                info!(
                    "[AxTree] Sleeping for {} seconds before next poll",
                    POLLING_SLEEP_SECS
                );
                thread::sleep(Duration::from_secs(POLLING_SLEEP_SECS));
            }
        }
        if !thread_exit_clean {
            log::warn!(
                "[AxTree] Polling thread did not exit cleanly (active flag not set to false)"
            );
        } else {
            info!("[AxTree] Polling thread exited cleanly");
        }
        info!("[AxTree] Stopped dump-tree polling");
    });

    Ok(())
}

/// Stops the dump-tree polling thread.
///
/// # Returns
/// * `Ok(())` if polling was stopped.
/// * `Err` if polling state was not initialized.
pub fn stop_dump_tree_polling() -> Result<(), String> {
    info!("[AxTree] Stopping dump-tree polling");

    if let Some(polling_active) = POLLING_ACTIVE.get() {
        let lock = lock_with_timeout(polling_active, std::time::Duration::from_secs(2));
        if let Some(mut active) = lock {
            *active = false;
        } else {
            log::error!("[AxTree] Could not acquire polling_active lock to stop polling");
        }
    }
    Ok(())
}
