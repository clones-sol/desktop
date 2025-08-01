@echo off
REM Windows development script wrapper for Clones Desktop
REM This script calls the PowerShell script to avoid file lock issues

echo 🚀 Starting Clones Desktop Development (Windows)...

REM Check if PowerShell is available
powershell -Command "Get-Host" >nul 2>&1
if errorlevel 1 (
    echo ❌ PowerShell is not available. Please install PowerShell.
    pause
    exit /b 1
)

REM Run the PowerShell script with the same arguments
powershell -ExecutionPolicy Bypass -File "%~dp0dev-windows.ps1" %*

REM Pause to see any error messages
if errorlevel 1 (
    echo ❌ Script failed with error code %errorlevel%
    pause
) 