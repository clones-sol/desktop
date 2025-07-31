# PowerShell script for Tauri Desktop Development Only
# This script runs only the Tauri desktop app for testing wallet functionality

param(
    [switch]$Clean,
    [switch]$Build
)

# Set error action preference
$ErrorActionPreference = "Stop"

# Define paths
$ProjectRoot = Get-Location
$LockFile = Join-Path $ProjectRoot ".dev_lock"
$TauriDir = Join-Path $ProjectRoot "src-tauri"
$FlutterJob = $null
$WebServerJob = $null

# Windows-specific temp directory setup
$TempBuildDir = Join-Path $env:TEMP "clones-desktop-build"
$TempTargetDir = Join-Path $env:TEMP "clones-desktop-target"

Write-Host "Starting Tauri Desktop Development (PowerShell)" -ForegroundColor Green
Write-Host "Project Root: $ProjectRoot" -ForegroundColor Cyan
Write-Host "Tauri Directory: $TauriDir" -ForegroundColor Cyan
Write-Host "Temporary Build Directory: $TempBuildDir" -ForegroundColor Cyan
Write-Host "Temporary Target Directory: $TempTargetDir" -ForegroundColor Cyan

# Function to clean up temporary directory
function Clean-TempBuildDir {
    if (Test-Path $TempBuildDir) {
        Write-Host "Cleaning temporary build directory..." -ForegroundColor Yellow
        Remove-Item -Path $TempBuildDir -Recurse -Force -ErrorAction SilentlyContinue
        Start-Sleep -Seconds 2
    }
}

# Function to setup temporary build directory
function Setup-TempBuildDir {
    if (-not (Test-Path $TempBuildDir)) {
        Write-Host "Creating temporary build directory..." -ForegroundColor Yellow
        New-Item -ItemType Directory -Path $TempBuildDir -Force | Out-Null
    }
    
    # Copy necessary files to temp directory
    Write-Host "Copying project files to temporary directory..." -ForegroundColor Yellow
    Copy-Item -Path (Join-Path $TauriDir "Cargo.toml") -Destination $TempBuildDir -Force
    Copy-Item -Path (Join-Path $TauriDir "Cargo.lock") -Destination $TempBuildDir -Force
    Copy-Item -Path (Join-Path $TauriDir "tauri.conf.json") -Destination $TempBuildDir -Force
    Copy-Item -Path (Join-Path $TauriDir "build.rs") -Destination $TempBuildDir -Force
    
    # Copy src directory
    $SrcDir = Join-Path $TauriDir "src"
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

# Function to cleanup processes
function Cleanup-Processes {
    Write-Host "Cleaning up processes..." -ForegroundColor Yellow
    
    # Stop Flutter job if it exists
    if ($FlutterJob -and (Get-Job -Id $FlutterJob.Id -ErrorAction SilentlyContinue)) {
        Write-Host "Stopping Flutter job..." -ForegroundColor Yellow
        Stop-Job $FlutterJob -ErrorAction SilentlyContinue
        Remove-Job $FlutterJob -ErrorAction SilentlyContinue
    }
    
    # Stop web server job if it exists
    if ($WebServerJob -and (Get-Job -Id $WebServerJob.Id -ErrorAction SilentlyContinue)) {
        Write-Host "Stopping web server job..." -ForegroundColor Yellow
        Stop-Job $WebServerJob -ErrorAction SilentlyContinue
        Remove-Job $WebServerJob -ErrorAction SilentlyContinue
    }
    
    # Kill Tauri processes
    Get-Process -Name "clones_desktop" -ErrorAction SilentlyContinue | Stop-Process -Force -ErrorAction SilentlyContinue
    
    # Remove lock file
    if (Test-Path $LockFile) {
        Remove-Item $LockFile -Force -ErrorAction SilentlyContinue
    }
    
    # Clean up Windows temp directory
    Clean-TempBuildDir
}

# Setup cleanup on exit
trap {
    Cleanup-Processes
    exit 1
}

# Check if already running
if (Test-Path $LockFile) {
    Write-Host "Development server already running. Please stop it first." -ForegroundColor Red
    Write-Host "   Lock file found: $LockFile" -ForegroundColor Red
    exit 1
}

# Create lock file
$PID | Out-File -FilePath $LockFile -Encoding UTF8

# Clean up any existing processes first
Write-Host "Cleaning up existing processes..." -ForegroundColor Yellow
Cleanup-Processes

# Setup Windows temp directory
Clean-TempBuildDir
Setup-TempBuildDir

# Set environment variable for Cargo target directory
$env:CARGO_TARGET_DIR = $TempTargetDir
Write-Host "Set CARGO_TARGET_DIR to: $env:CARGO_TARGET_DIR" -ForegroundColor Cyan

# Check Flutter availability
Write-Host "Checking Flutter availability..." -ForegroundColor Yellow
$FlutterCmd = "flutter"
if (-not (Get-Command $FlutterCmd -ErrorAction SilentlyContinue)) {
    Write-Host "Flutter not found. Please install Flutter and add it to your PATH." -ForegroundColor Red
    exit 1
}

Write-Host "Flutter found: $(flutter --version | Select-String 'Flutter')" -ForegroundColor Green

# Start Flutter Web development server first
Write-Host "Starting Flutter Web development server..." -ForegroundColor Green
Write-Host "Flutter will output to: $(Join-Path $ProjectRoot "flutter.log")" -ForegroundColor Cyan

# Start Flutter in background (desktop mode)
$FlutterJob = Start-Job -ScriptBlock {
    param($ProjectRoot, $LogFile)
    Set-Location $ProjectRoot
    flutter run -d windows > $LogFile 2>&1
} -ArgumentList $ProjectRoot, (Join-Path $ProjectRoot "flutter.log")

# Also start a simple web server for Tauri to connect to
Write-Host "Starting simple web server for Tauri..." -ForegroundColor Green
$WebServerJob = Start-Job -ScriptBlock {
    param($ProjectRoot)
    Set-Location $ProjectRoot
    # Create a simple index.html for Tauri to serve
    $IndexHtml = @"
<!DOCTYPE html>
<html>
<head>
    <title>Flutter Desktop App</title>
    <style>
        body { 
            font-family: Arial, sans-serif; 
            text-align: center; 
            padding: 50px; 
            background: #1a1a1a; 
            color: white; 
        }
        .message { 
            font-size: 18px; 
            margin: 20px 0; 
        }
    </style>
</head>
<body>
    <h1>Flutter Desktop App Running</h1>
    <div class="message">The Flutter Windows desktop app is running separately.</div>
    <div class="message">Tauri backend services are available for the desktop app.</div>
</body>
</html>
"@
    $IndexHtml | Out-File -FilePath "web/index.html" -Encoding UTF8
    
    # Start a simple Python web server (or use any available web server)
    if (Get-Command "python" -ErrorAction SilentlyContinue) {
        python -m http.server 3000
    } elseif (Get-Command "python3" -ErrorAction SilentlyContinue) {
        python3 -m http.server 3000
    } else {
        # Fallback: use PowerShell to serve files
        $Listener = [System.Net.HttpListener]::new()
        $Listener.Prefixes.Add("http://localhost:3000/")
        $Listener.Start()
        
        while ($Listener.IsListening) {
            $Context = $Listener.GetContext()
            $Response = $Context.Response
            $Response.ContentType = "text/html"
            $Response.StatusCode = 200
            $Buffer = [System.Text.Encoding]::UTF8.GetBytes($IndexHtml)
            $Response.ContentLength64 = $Buffer.Length
            $Response.OutputStream.Write($Buffer, 0, $Buffer.Length)
            $Response.Close()
        }
    }
} -ArgumentList $ProjectRoot

Write-Host "Flutter process started with Job ID: $($FlutterJob.Id)" -ForegroundColor Green

# Wait for Flutter to be ready
Write-Host "Waiting for Flutter to start..." -ForegroundColor Yellow
$Timeout = 60
$Elapsed = 0
$FlutterReady = $false

while ($Elapsed -lt $Timeout -and -not $FlutterReady) {
    Start-Sleep -Seconds 3
    $Elapsed += 3
    
    if (Test-Path (Join-Path $ProjectRoot "flutter.log")) {
        $LastLines = Get-Content (Join-Path $ProjectRoot "flutter.log") -Tail 3
        Write-Host "Debug: Last 3 lines of Flutter log:" -ForegroundColor Gray
        $LastLines | ForEach-Object { Write-Host "  $_" -ForegroundColor Gray }
        
        # Check for success indicators
        $SuccessPatterns = @(
            "lib/main.dart is being served at",
            "Flutter run key commands",
            "An Observatory debugger and profiler",
            "The Dart VM service is listening on",
            "Hot reload performed",
            "Flutter is ready",
            "Debug service listening on"
        )
        
        foreach ($Pattern in $SuccessPatterns) {
            if ($LastLines -match $Pattern) {
                $FlutterReady = $true
                Write-Host "Flutter is ready! Found pattern: $Pattern" -ForegroundColor Green
                break
            }
        }
    }
    
    if (-not $FlutterReady) {
        Write-Host "Still waiting for Flutter to start... ($Elapsed/$Timeout seconds)" -ForegroundColor Yellow
    }
}

if (-not $FlutterReady) {
    # Check if Flutter job is still running
    $JobState = Get-Job -Id $FlutterJob.Id | Select-Object -ExpandProperty State
    if ($JobState -eq "Running") {
        Write-Host "Flutter is running but didn't show expected message. Assuming it's ready." -ForegroundColor Yellow
        $FlutterReady = $true
    } else {
        Write-Host "Timeout waiting for Flutter to start" -ForegroundColor Red
        Stop-Job $FlutterJob
        Remove-Job $FlutterJob
        exit 1
    }
}

# Start Tauri Desktop
Write-Host "Starting Tauri Desktop development..." -ForegroundColor Green
Write-Host "Running Tauri from temp directory: $TempBuildDir" -ForegroundColor Cyan

# Change to temp directory and start Tauri
Push-Location $TempBuildDir
try {
    Write-Host "Development server started!" -ForegroundColor Green
    Write-Host "Tauri Desktop App: Starting..." -ForegroundColor Cyan
    Write-Host "Using temporary build directory: $TempBuildDir" -ForegroundColor Cyan
    Write-Host "Using temporary target directory: $TempTargetDir" -ForegroundColor Cyan
    Write-Host "Press Ctrl+C to stop the server" -ForegroundColor Yellow
    
    # Run Tauri directly (not in background job for better interaction)
    cargo tauri dev --config tauri.conf.json
    
} catch {
    Write-Host "Error starting Tauri: $($_.Exception.Message)" -ForegroundColor Red
    throw
} finally {
    Pop-Location
}

# Cleanup on exit
Cleanup-Processes
Write-Host "Script completed" -ForegroundColor Green 