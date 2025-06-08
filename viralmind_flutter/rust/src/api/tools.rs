use crate::tools::helpers::lock_with_timeout;
use crate::tools::{axtree, ffmpeg, pipeline};
use log::error;
use std::sync::{Arc, Mutex};
use std::thread;

pub struct ToolsStatus {
    pub ffmpeg: bool,
    pub ffprobe: bool,
    pub dump_tree: bool,
    pub pipeline: bool,
}

#[flutter_rust_bridge::frb(sync)]
pub fn check_tools_status() -> ToolsStatus {
    ToolsStatus {
        ffmpeg: ffmpeg::FFMPEG_PATH.get().is_some(),
        ffprobe: ffmpeg::FFPROBE_PATH.get().is_some(),
        dump_tree: axtree::DUMP_TREE_PATH.get().is_some(),
        pipeline: pipeline::PIPELINE_PATH.get().is_some(),
    }
}

pub fn init_tools() -> Vec<String> {
    let mut handles = Vec::new();
    let errors = Arc::new(Mutex::new(Vec::new()));

    {
        let errors = Arc::clone(&errors);
        let handle = thread::spawn(move || {
            if let Err(e) = ffmpeg::init_ffmpeg_and_ffprobe() {
                let lock = lock_with_timeout(&errors, std::time::Duration::from_secs(2));
                if let Some(mut errors) = lock {
                    errors.push(format!("Failed to initialize FFmpeg/FFprobe: {}", e));
                } else {
                    log::error!("[Init Tools] Could not acquire error lock for FFmpeg/FFprobe");
                }
            }
        });
        handles.push(handle);
    }

    {
        let errors = Arc::clone(&errors);
        let handle = thread::spawn(move || {
            if let Err(e) = axtree::init_dump_tree() {
                let lock = lock_with_timeout(&errors, std::time::Duration::from_secs(2));
                if let Some(mut errors) = lock {
                    errors.push(format!("Failed to initialize dump-tree: {}", e));
                } else {
                    log::error!("[Init Tools] Could not acquire error lock for dump-tree");
                }
            }
        });
        handles.push(handle);
    }

    {
        let errors = Arc::clone(&errors);
        let handle = thread::spawn(move || {
            if let Err(e) = pipeline::init_pipeline() {
                let lock = lock_with_timeout(&errors, std::time::Duration::from_secs(2));
                if let Some(mut errors) = lock {
                    errors.push(format!("Failed to initialize pipeline: {}", e));
                } else {
                    log::error!("[Init Tools] Could not acquire error lock for pipeline");
                }
            }
        });
        handles.push(handle);
    }

    for handle in handles {
        if let Err(e) = handle.join() {
            error!("Thread panicked: {:?}", e);
        }
    }

    let errors_guard = lock_with_timeout(&errors, std::time::Duration::from_secs(2));
    if let Some(errors) = errors_guard {
        if !errors.is_empty() {
            for err in errors.iter() {
                error!("{}", err);
            }
        }
        errors.clone()
    } else {
        log::error!("[Init Tools] Could not acquire error lock for final check");
        vec!["Could not acquire error lock for final check".to_string()]
    }
}
