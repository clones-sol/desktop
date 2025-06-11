//! Core logic for input capture, event recording, and archive extraction.
//!
//! This module re-exports the main submodules:
//! - [`input`]: Input event listening and logging utilities
//! - [`record`]: Event and data recording logic
//! - [`archive`]: Archive extraction utilities for binaries

// Re-export all core modules
pub mod archive;
pub mod input;
pub mod record;
