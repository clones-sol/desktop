use std::path::{Path, PathBuf};
use std::time::{Duration, Instant};

/// Utility to sanitize a path and ensure it is within the allowed base directory.
pub fn sanitize_and_check_path(base: &Path, target: &Path) -> Result<PathBuf, String> {
    log::info!(
        "[sanitize_and_check_path] base: {} | target: {}",
        base.display(),
        target.display()
    );
    let canonical_base = match base.canonicalize() {
        Ok(cb) => cb,
        Err(e) => {
            log::error!(
                "[sanitize_and_check_path] Failed to canonicalize base directory: {}",
                e
            );
            return Err("Failed to canonicalize base directory".to_string());
        }
    };
    let joined = canonical_base.join(target);
    let canonical_target = match joined.canonicalize() {
        Ok(ct) => {
            log::info!(
                "[sanitize_and_check_path] canonical_target exists: {}",
                ct.display()
            );
            ct
        }
        Err(e) => {
            // Si le fichier n'existe pas, on canonicalize le parent
            log::warn!(
                "[sanitize_and_check_path] canonicalize failed ({}), essaye sur le parent",
                e
            );
            if let Some(parent) = joined.parent() {
                match parent.canonicalize() {
                    Ok(canonical_parent) => {
                        if !canonical_parent.starts_with(&canonical_base) {
                            log::error!("[sanitize_and_check_path] Parent path is not allowed: {} not in {}", canonical_parent.display(), canonical_base.display());
                            return Err("Path is not allowed".to_string());
                        }
                        log::info!(
                            "[sanitize_and_check_path] Parent path accepted: {}",
                            canonical_parent.display()
                        );
                        // On retourne le chemin cible (non-canonicalisé, mais validé)
                        return Ok(joined);
                    }
                    Err(e2) => {
                        log::error!(
                            "[sanitize_and_check_path] Failed to canonicalize parent: {}",
                            e2
                        );
                        return Err("Invalid or unsafe file path (parent)".to_string());
                    }
                }
            } else {
                log::error!(
                    "[sanitize_and_check_path] No parent for target: {}",
                    joined.display()
                );
                return Err("Invalid or unsafe file path (no parent)".to_string());
            }
        }
    };
    if !canonical_target.starts_with(&canonical_base) {
        log::error!(
            "[sanitize_and_check_path] Path is not allowed: {} not in {}",
            canonical_target.display(),
            canonical_base.display()
        );
        return Err("Path is not allowed".to_string());
    }
    log::info!(
        "[sanitize_and_check_path] Path accepted: {}",
        canonical_target.display()
    );
    Ok(canonical_target)
}

/// Helper to acquire a Mutex with a timeout. Returns None if the lock cannot be acquired in the given duration.
pub fn lock_with_timeout<'a, T>(
    mutex: &'a std::sync::Mutex<T>,
    timeout: Duration,
) -> Option<std::sync::MutexGuard<'a, T>> {
    let start = Instant::now();
    loop {
        if let Ok(guard) = mutex.try_lock() {
            return Some(guard);
        }
        if start.elapsed() >= timeout {
            return None;
        }
        std::thread::sleep(Duration::from_millis(10));
    }
}
