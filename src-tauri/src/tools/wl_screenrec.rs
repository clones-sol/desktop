//! wl-screenrec integration for Wayland screen recording on Linux.
//!
//! This module provides a recorder struct for capturing video using wl-screenrec.

use std::io::Write;
use std::path::PathBuf;
use std::process::{Child, Command, Stdio};
use std::thread;
use std::time::Duration;

pub struct WlScreenrecRecorder {
    width: u32,
    height: u32,
    output_path: PathBuf,
    process: Option<Child>,
}

impl WlScreenrecRecorder {
    /// Creates a new `WlScreenrecRecorder`.
    pub fn new(width: u32, height: u32, output_path: PathBuf) -> Self {
        Self {
            width,
            height,
            output_path,
            process: None,
        }
    }

    /// Starts the recording process using wl-screenrec.
    pub fn start(&mut self) -> Result<(), String> {
        // Build the wl-screenrec command
        let mut args: Vec<String> = Vec::new();

        // Set output file
        args.push("-f".to_string());
        args.push(self.output_path.to_str().unwrap().to_string());

        // Set geometry (region) if width/height are specified
        // Note: wl-screenrec expects geometry as "x,y WxH", e.g., "0,0 1920x1080"
        args.push("-g".to_string());
        args.push(format!("0,0 {}x{}", self.width, self.height));

        // Optionally: add --audio if you want to record audio as well
        // args.push("--audio".to_string());

        let mut command = Command::new("wl-screenrec");
        command
            .args(&args)
            .stdin(Stdio::null())
            .stdout(Stdio::piped())
            .stderr(Stdio::piped());

        let mut process = command
            .spawn()
            .map_err(|e| format!("Failed to start wl-screenrec: {}", e))?;

        // Optionally, handle stdout/stderr in background threads for logging
        if let Some(stdout) = process.stdout.take() {
            let stdout_reader = std::io::BufReader::new(stdout);
            thread::spawn(move || {
                use std::io::BufRead;
                for line in stdout_reader.lines() {
                    if let Ok(line) = line {
                        log::info!("[wl-screenrec] stdout: {}", line);
                    }
                }
            });
        }
        if let Some(stderr) = process.stderr.take() {
            let stderr_reader = std::io::BufReader::new(stderr);
            thread::spawn(move || {
                use std::io::BufRead;
                for line in stderr_reader.lines() {
                    if let Ok(line) = line {
                        log::info!("[wl-screenrec] stderr: {}", line);
                    }
                }
            });
        }

        // Check if process died immediately
        match process.try_wait() {
            Ok(Some(status)) => {
                let error_msg = format!(
                    "wl-screenrec process exited immediately with status: {}",
                    status
                );
                return Err(error_msg);
            }
            Ok(None) => {
                // Process is running
                self.process = Some(process);
                Ok(())
            }
            Err(e) => Err(format!(
                "Failed to check wl-screenrec process status: {}",
                e
            )),
        }
    }

    /// Stops the recording process gracefully.
    pub fn stop(&mut self) -> Result<(), String> {
        if let Some(mut process) = self.process.take() {
            // Send SIGINT to stop recording gracefully
            #[cfg(unix)]
            {
                use nix::sys::signal::{self, Signal};
                use nix::unistd::Pid;
                if let Some(pid) = process.id().checked_into() {
                    let _ = signal::kill(Pid::from_raw(pid as i32), Signal::SIGINT);
                }
            }
            // Wait for process to exit
            let timeout = Duration::from_secs(5);
            let start_time = std::time::Instant::now();
            loop {
                match process.try_wait() {
                    Ok(Some(_status)) => break,
                    Ok(None) => {
                        if start_time.elapsed() >= timeout {
                            let _ = process.kill();
                            break;
                        }
                        thread::sleep(Duration::from_millis(100));
                    }
                    Err(_) => {
                        let _ = process.kill();
                        break;
                    }
                }
            }
            // Check if output file exists and has size
            if !self.output_path.exists() {
                return Err("wl-screenrec failed to create output file".to_string());
            }
            let file_size = std::fs::metadata(&self.output_path)
                .map_err(|e| format!("Failed to get output file metadata: {}", e))?
                .len();
            if file_size == 0 {
                return Err("wl-screenrec created empty output file".to_string());
            }
        }
        Ok(())
    }
}
