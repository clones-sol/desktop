@echo off
REM Windows wrapper for dev_web_tauri.ps1
REM This script calls the PowerShell script which handles both Flutter Web and Tauri development

echo 🚀 Starting Flutter Web + Tauri Development (Windows)...

REM Check if we're in the right directory
if not exist "scripts\dev_web_tauri.ps1" (
    echo ❌ Script not found. Please run this from the desktop directory.
    pause
    exit /b 1
)

REM Run the PowerShell script with the same arguments
echo 🖥️  Using PowerShell script with Windows temp directories
powershell -ExecutionPolicy Bypass -File "%~dp0dev_web_tauri.ps1" %*

REM Pause to see any error messages
if errorlevel 1 (
    echo ❌ Script failed with error code %errorlevel%
    pause
) 