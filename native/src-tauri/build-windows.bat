@echo off
REM Set the target directory to temp to avoid file locking issues
set TEMP_DIR=%TEMP%
set TARGET_DIR=%TEMP_DIR%\cargo-target

REM Create the directory if it doesn't exist
if not exist "%TARGET_DIR%" mkdir "%TARGET_DIR%"

REM Set the environment variable
set CARGO_TARGET_DIR=%TARGET_DIR%

echo Using target directory: %TARGET_DIR%

REM Run cargo with the custom target directory
cargo run