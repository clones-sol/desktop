/// This function uses compile-time detection to determine the platform based on the target operating system.
///
/// # Returns
/// * `String` representing the platform: "macos", "windows", "linux", or "unknown"
pub fn get_platform() -> String {
    if cfg!(target_os = "macos") {
        "macos".to_string()
    } else if cfg!(target_os = "windows") {
        "windows".to_string()
    } else if cfg!(target_os = "linux") {
        "linux".to_string()
    } else {
        "unknown".to_string()
    }
}
