//! Simple file-based logger for recording events and ffmpeg output in JSONL format.
//!
//! This module provides a `Logger` struct for writing structured logs to a file, typically used for input events and ffmpeg process output.

use std::fs::{File, OpenOptions};
use std::io::Write;
use std::path::PathBuf;

pub struct Logger {
    file: File,
}

impl Logger {
    /// Creates a new `Logger` instance that writes to `input_log.jsonl` in the given session directory.
    ///
    /// # Arguments
    /// * `session_dir` - The directory where the log file will be created.
    ///
    /// # Returns
    /// * `Ok(Logger)` if the file was created successfully.
    /// * `Err` if the file could not be created.
    pub fn new(session_dir: PathBuf) -> Result<Self, String> {
        let log_path = session_dir.join("input_log.jsonl");

        let file = OpenOptions::new()
            .create(true)
            .append(true)
            .open(&log_path)
            .map_err(|e| format!("Failed to create log file: {}", e))?;

        Ok(Logger { file })
    }

    /// Logs a structured event as a JSON value to the log file.
    ///
    /// # Arguments
    /// * `event` - The event to log, as a serde_json::Value.
    ///
    /// # Returns
    /// * `Ok(())` if the event was logged successfully.
    /// * `Err` if serialization or writing failed.
    pub fn log_event(&mut self, event: serde_json::Value) -> Result<(), String> {
        let json = serde_json::to_string(&event)
            .map_err(|e| format!("Failed to serialize event: {}", e))?;

        writeln!(self.file, "{}", json)
            .map_err(|e| format!("Failed to write to log file: {}", e))?;
        self.file
            .flush()
            .map_err(|e| format!("Failed to flush log file: {}", e))?;

        Ok(())
    }

    /// Logs ffmpeg process output (stdout or stderr) as a structured event.
    ///
    /// # Arguments
    /// * `output` - The output string from ffmpeg.
    /// * `is_stderr` - Whether the output is from stderr (true) or stdout (false).
    ///
    /// # Returns
    /// * `Ok(())` if the event was logged successfully.
    /// * `Err` if serialization or writing failed.
    // #[cfg(not(target_os = "macos"))]
    pub fn log_ffmpeg(&mut self, output: &str, is_stderr: bool) -> Result<(), String> {
        let event = serde_json::json!({
            "event": if is_stderr { "ffmpeg_stderr" } else { "ffmpeg_stdout" },
            "data": {
                "output": output
            },
            "time": chrono::Local::now().timestamp_millis()
        });

        self.log_event(event)
    }
}
