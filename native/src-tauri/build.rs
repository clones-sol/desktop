use std::fs;
use std::path::Path;

fn main() {
    // Only create custom target directory on Windows to avoid file locking issues
    #[cfg(target_os = "windows")]
    {
        let target_dir = "C:/temp/cargo-target";
        if !Path::new(target_dir).exists() {
            fs::create_dir_all(target_dir).expect("Failed to create target directory");
        }
    }
    
    // Run Tauri build
    tauri_build::build()
}
