use std::fs;
use std::path::Path;
use std::env;

fn main() {
    // Set custom target directory only on Windows to avoid file locking issues
    #[cfg(target_os = "windows")]
    {
        let target_dir = "C:/temp/cargo-target";
        if !Path::new(target_dir).exists() {
            fs::create_dir_all(target_dir).expect("Failed to create target directory");
        }
        env::set_var("CARGO_TARGET_DIR", target_dir);
    }
    
    // Run Tauri build
    tauri_build::build()
}
