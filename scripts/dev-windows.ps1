# Windows-specific development script for Tauri
# This script uses a temporary build directory to avoid file lock issues on Windows

param(
    [switch]$Clean,
    [switch]$Build
)

# Set error action preference
$ErrorActionPreference = "Stop"

# Define paths
$ProjectRoot = Split-Path -Parent $PSScriptRoot
$TauriDir = Join-Path $ProjectRoot "src-tauri"
$TempBuildDir = Join-Path $env:TEMP "clones-desktop-build"

Write-Host "🚀 Clones Desktop - Windows Development Script" -ForegroundColor Green
Write-Host "Project Root: $ProjectRoot" -ForegroundColor Cyan
Write-Host "Tauri Directory: $TauriDir" -ForegroundColor Cyan
Write-Host "Temporary Build Directory: $TempBuildDir" -ForegroundColor Cyan

# Function to clean up temporary directory
function Clean-TempBuildDir {
    if (Test-Path $TempBuildDir) {
        Write-Host "🧹 Cleaning temporary build directory..." -ForegroundColor Yellow
        Remove-Item -Path $TempBuildDir -Recurse -Force -ErrorAction SilentlyContinue
        Start-Sleep -Seconds 2
    }
}

# Function to setup temporary build directory
function Setup-TempBuildDir {
    if (-not (Test-Path $TempBuildDir)) {
        Write-Host "📁 Creating temporary build directory..." -ForegroundColor Yellow
        New-Item -ItemType Directory -Path $TempBuildDir -Force | Out-Null
    }
    
    # Copy necessary files to temp directory
    Write-Host "📋 Copying project files to temporary directory..." -ForegroundColor Yellow
    Copy-Item -Path (Join-Path $TauriDir "Cargo.toml") -Destination $TempBuildDir -Force
    Copy-Item -Path (Join-Path $TauriDir "Cargo.lock") -Destination $TempBuildDir -Force
    Copy-Item -Path (Join-Path $TauriDir "tauri.conf.json") -Destination $TempBuildDir -Force
    Copy-Item -Path (Join-Path $TauriDir "build.rs") -Destination $TempBuildDir -Force
    
    # Copy src directory
    $SrcDir = Join-Path $TauriDir "src"
    $TempSrcDir = Join-Path $TempBuildDir "src"
    if (Test-Path $SrcDir) {
        Copy-Item -Path $SrcDir -Destination $TempBuildDir -Recurse -Force
    }
    
    # Copy other necessary directories
    $DirsToCopy = @("icons", "capabilities")
    foreach ($Dir in $DirsToCopy) {
        $SourceDir = Join-Path $TauriDir $Dir
        if (Test-Path $SourceDir) {
            Copy-Item -Path $SourceDir -Destination $TempBuildDir -Recurse -Force
        }
    }
}

# Function to run Tauri dev
function Start-TauriDev {
    Write-Host "🔧 Starting Tauri development server..." -ForegroundColor Green
    
    # Change to temp directory
    Push-Location $TempBuildDir
    
    try {
        # Set environment variable to use temp target directory
        $env:CARGO_TARGET_DIR = Join-Path $env:TEMP "clones-desktop-target"
        
        # Create target directory if it doesn't exist
        if (-not (Test-Path $env:CARGO_TARGET_DIR)) {
            New-Item -ItemType Directory -Path $env:CARGO_TARGET_DIR -Force | Out-Null
        }
        
        Write-Host "🎯 Using target directory: $env:CARGO_TARGET_DIR" -ForegroundColor Cyan
        
        # Run cargo tauri dev
        cargo tauri dev
        
    } catch {
        Write-Host "❌ Error running Tauri development server: $($_.Exception.Message)" -ForegroundColor Red
        throw
    } finally {
        # Return to original directory
        Pop-Location
    }
}

# Function to build the project
function Build-Project {
    Write-Host "🔨 Building project..." -ForegroundColor Green
    
    # Change to temp directory
    Push-Location $TempBuildDir
    
    try {
        # Set environment variable to use temp target directory
        $env:CARGO_TARGET_DIR = Join-Path $env:TEMP "clones-desktop-target"
        
        # Create target directory if it doesn't exist
        if (-not (Test-Path $env:CARGO_TARGET_DIR)) {
            New-Item -ItemType Directory -Path $env:CARGO_TARGET_DIR -Force | Out-Null
        }
        
        Write-Host "🎯 Using target directory: $env:CARGO_TARGET_DIR" -ForegroundColor Cyan
        
        # Run cargo tauri build
        cargo tauri build
        
    } catch {
        Write-Host "❌ Error building project: $($_.Exception.Message)" -ForegroundColor Red
        throw
    } finally {
        # Return to original directory
        Pop-Location
    }
}

# Main execution
try {
    if ($Clean) {
        Write-Host "🧹 Clean mode enabled" -ForegroundColor Yellow
        Clean-TempBuildDir
        exit 0
    }
    
    # Always clean and setup fresh temp directory for dev
    Clean-TempBuildDir
    Setup-TempBuildDir
    
    if ($Build) {
        Build-Project
    } else {
        Start-TauriDev
    }
    
} catch {
    Write-Host "❌ Script failed: $($_.Exception.Message)" -ForegroundColor Red
    exit 1
} finally {
    Write-Host "🏁 Script completed" -ForegroundColor Green
} 