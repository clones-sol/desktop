use std::env;
use std::fs;

fn main() {
    // Path to the template and output config
    let template_path = "tauri.conf.json.template";
    let output_path = "tauri.conf.json";

    // Read the template file
    let template =
        fs::read_to_string(template_path).expect("Failed to read tauri.conf.json.template");

    // Get the APP_IDENTIFIER_SUFFIX from the environment, default to empty string
    let suffix = env::var("APP_IDENTIFIER_SUFFIX").unwrap_or_else(|_| "".to_string());

    // Replace the placeholder in the template
    let config = template.replace("${APP_IDENTIFIER_SUFFIX}", &suffix);

    // Only write if the content has changed to avoid infinite rebuild loops
    let need_write = match fs::read_to_string(output_path) {
        Ok(existing) => existing != config,
        Err(_) => true,
    };
    if need_write {
        fs::write(output_path, config).expect("Failed to write tauri.conf.json");
    }

    // Continue with the normal Tauri build
    tauri_build::build();
}
