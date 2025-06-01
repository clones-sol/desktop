//! Utilities for downloading and managing GitHub release binaries with version tracking.
//!
//! This module provides functions to fetch, download, and manage binaries from GitHub releases, including metadata handling and update checks.

use chrono::DateTime;
use serde_json::{json, Value};
use std::fs;

#[cfg(any(target_os = "linux", target_os = "macos"))]
use std::os::unix::fs::PermissionsExt;
use std::path::{Path, PathBuf};

use crate::tools::sanitize_and_check_path;
use crate::utils::downloader::download_file;

/// Metadata for a binary file downloaded from GitHub.
///
/// Contains the version and build timestamp of the binary.
pub struct BinaryMetadata {
    pub version: String,
    pub build_timestamp: u64,
}

impl BinaryMetadata {
    /// Creates a new `BinaryMetadata` instance.
    pub fn new(version: String, build_timestamp: u64) -> Self {
        Self {
            version,
            build_timestamp,
        }
    }

    /// Converts the metadata to a JSON value.
    pub fn to_json(&self) -> Value {
        json!({
            "version": self.version,
            "build_timestamp": self.build_timestamp,
        })
    }

    /// Parses metadata from a JSON value.
    pub fn from_json(json: &Value) -> Option<Self> {
        if let (Some(version), Some(build_timestamp)) = (
            json.get("version").and_then(Value::as_str),
            json.get("build_timestamp").and_then(Value::as_u64),
        ) {
            Some(Self::new(version.to_string(), build_timestamp))
        } else {
            None
        }
    }
}

/// Save metadata to a file
fn save_metadata(path: &Path, metadata: &BinaryMetadata) -> Result<(), String> {
    let base = path.parent().ok_or("Invalid metadata path")?;
    let safe_path = sanitize_and_check_path(base, path)?;
    let json = metadata.to_json();
    let content = serde_json::to_string_pretty(&json)
        .map_err(|e| format!("Failed to serialize metadata: {}", e))?;

    let file = fs::File::create(&safe_path)
        .map_err(|e| format!("Failed to write metadata file: {}", e))?;
    let metadata = file
        .metadata()
        .map_err(|e| format!("Failed to get file metadata: {}", e))?;
    if metadata.permissions().readonly() {
        return Err("Metadata file is not writable".to_string());
    }
    std::io::Write::write_all(&mut &file, content.as_bytes())
        .map_err(|e| format!("Failed to write metadata file: {}", e))?;

    log::info!("[GitHub Release] Saved metadata");
    Ok(())
}

/// Load metadata from a file
pub fn load_metadata(path: &Path) -> Result<Option<BinaryMetadata>, String> {
    if !path.exists() {
        log::warn!(
            "[GitHub Release] Metadata file does not exist: {}",
            path.display()
        );
        return Ok(None);
    }

    log::info!("[GitHub Release] Loading metadata from: {}", path.display());
    let content =
        fs::read_to_string(path).map_err(|e| format!("Failed to read metadata file: {}", e))?;

    let json: Value = match serde_json::from_str(&content) {
        Ok(j) => j,
        Err(e) => {
            log::error!("[GitHub Release] Failed to parse metadata JSON: {}", e);
            return Err(format!("Failed to parse metadata: {}", e));
        }
    };

    let meta = BinaryMetadata::from_json(&json);
    if meta.is_none() {
        log::error!(
            "[GitHub Release] Metadata JSON missing required fields: {}",
            content
        );
    } else {
        log::info!(
            "[GitHub Release] Loaded metadata: version={:?}",
            meta.as_ref().map(|m| &m.version)
        );
    }
    Ok(meta)
}

/// Fetch latest release metadata from GitHub API
pub fn fetch_latest_release_metadata(
    repo_owner: &str,
    repo_name: &str,
) -> Result<BinaryMetadata, String> {
    log::info!(
        "[GitHub Release] Fetching latest release metadata for {}/{}",
        repo_owner,
        repo_name
    );

    let github_api_url = format!(
        "https://api.github.com/repos/{}/{}/releases/latest",
        repo_owner, repo_name
    );

    let client = reqwest::blocking::Client::builder()
        .user_agent("viralmind-desktop")
        .build()
        .map_err(|e| format!("Failed to create HTTP client: {}", e))?;

    let response = client
        .get(&github_api_url)
        .header("Accept", "application/vnd.github.v3+json")
        .send()
        .map_err(|e| format!("Failed to fetch release info: {}", e))?;

    let json: Value = response
        .json()
        .map_err(|e| format!("Failed to parse GitHub API response: {}", e))?;

    let version = json
        .get("tag_name")
        .and_then(Value::as_str)
        .ok_or_else(|| {
            log::error!("[GitHub Release] No tag_name in release JSON: {}", json);
            "No tag name in release".to_string()
        })?
        .to_string();

    // Use published_at timestamp from GitHub API
    let published_at = json
        .get("published_at")
        .and_then(Value::as_str)
        .ok_or_else(|| "No published_at in release".to_string())?;

    // Convert ISO 8601 date string to Unix timestamp
    let timestamp = {
        let dt = DateTime::parse_from_rfc3339(published_at)
            .map_err(|e| format!("Failed to parse published_at date: {}", e))?;

        dt.timestamp() as u64
    };

    log::info!(
        "[GitHub Release] Latest release: version={}, published_at={} ({})",
        version,
        published_at,
        timestamp
    );

    Ok(BinaryMetadata::new(version, timestamp))
}

/// Get the latest release of a binary from GitHub.
///
/// # Arguments
/// * `repo_owner` - The owner of the GitHub repository.
/// * `repo_name` - The name of the GitHub repository.
/// * `asset_url` - The URL of the asset to download.
/// * `target_dir` - The directory to store the downloaded file.
/// * `make_executable` - Whether to make the file executable (for Linux/macOS).
///
/// # Returns
/// * `Ok(PathBuf)` with the path to the downloaded file.
/// * `Err` if an error occurred.
pub fn get_latest_release(
    repo_owner: &str,
    repo_name: &str,
    asset_url: &str,
    target_dir: &Path,
    make_executable: bool,
) -> Result<PathBuf, String> {
    log::info!(
        "[GitHub Release] Getting latest release for {}/{} (asset_url: {})",
        repo_owner,
        repo_name,
        asset_url
    );

    // Create target directory if it doesn't exist
    fs::create_dir_all(target_dir).map_err(|e| {
        log::info!(
            "[GitHub Release] Error: Failed to create target directory: {}",
            e
        );
        format!("Failed to create target directory: {}", e)
    })?;

    // Get the filename from the URL for proper version tracking
    let asset_split: Vec<&str> = asset_url.split('/').collect();
    let asset_filename = asset_split[asset_url.split('/').count() - 1];

    let asset_path = target_dir.join(asset_filename);
    let metadata_path = target_dir.join(format!("{}.metadata.json", asset_filename));

    log::info!("[GitHub Release] Asset path: {}", asset_path.display());
    log::info!(
        "[GitHub Release] Metadata path: {}",
        metadata_path.display()
    );

    // Fetch latest release metadata from GitHub
    let latest_metadata = match fetch_latest_release_metadata(repo_owner, repo_name) {
        Ok(m) => m,
        Err(e) => {
            log::error!(
                "[GitHub Release] Failed to fetch latest release metadata: {}",
                e
            );
            return Err(e);
        }
    };
    log::info!(
        "[GitHub Release] Latest GitHub version: {}",
        latest_metadata.version
    );

    // Check if we need to download the binary
    let should_download = if !asset_path.exists() {
        log::warn!(
            "[GitHub Release] Asset does not exist: {}",
            asset_path.display()
        );
        true
    } else {
        // Load existing metadata
        let current_metadata = match load_metadata(&metadata_path) {
            Ok(m) => m,
            Err(e) => {
                log::error!("[GitHub Release] Failed to load metadata: {}", e);
                return Err(e);
            }
        };

        match current_metadata {
            Some(ref metadata) => {
                log::info!(
                    "[GitHub Release] Current cached version: {} (timestamp: {})",
                    metadata.version,
                    metadata.build_timestamp
                );
                // Compare build timestamps
                if metadata.build_timestamp < latest_metadata.build_timestamp {
                    log::info!(
                        "[GitHub Release] New version available: current={} ({}), latest={} ({})",
                        metadata.version,
                        metadata.build_timestamp,
                        latest_metadata.version,
                        latest_metadata.build_timestamp
                    );
                    true
                } else {
                    log::info!("[GitHub Release] Asset is up to date");
                    false
                }
            }
            None => {
                log::warn!("[GitHub Release] No metadata found, will download latest version");
                true
            }
        }
    };

    if should_download {
        log::info!(
            "[GitHub Release] Downloading new version: {}",
            asset_filename
        );
        download_file(asset_url, &asset_path)?;

        // Set executable permissions if needed
        #[cfg(any(target_os = "linux", target_os = "macos"))]
        if make_executable {
            log::info!(
                "[GitHub Release] Setting executable permissions for {}",
                asset_path.display()
            );
            fs::set_permissions(&asset_path, fs::Permissions::from_mode(0o755))
                .map_err(|e| format!("Failed to set executable permissions: {}", e))?;
        }

        // Save the metadata
        save_metadata(&metadata_path, &latest_metadata)?;
    } else {
        // Asset exists, but on macOS/Linux, check if file is actually present and executable
        if !asset_path.exists() {
            log::error!(
                "[GitHub Release] Asset path does not exist even though cache says it should: {}",
                asset_path.display()
            );
            return Err(format!(
                "Asset path does not exist: {}",
                asset_path.display()
            ));
        }
    }

    log::info!("[GitHub Release] Using asset at {}", asset_path.display());
    Ok(asset_path)
}
