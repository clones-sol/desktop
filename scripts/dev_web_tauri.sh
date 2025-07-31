#!/bin/bash

set -euo pipefail

echo "🚀 Starting Flutter Web + Tauri Development"

ROOT_DIR=$(pwd)
LOCK_FILE="$ROOT_DIR/.dev_lock"
LOG_FILE="$ROOT_DIR/flutter.log"

# Detect operating system
detect_os() {
    # Check for Windows environment variables first
    if [ -n "${OS:-}" ] && [ "$OS" = "Windows_NT" ]; then
        echo "windows"
        return
    fi
    
    # Check for Windows-specific environment variables
    if [ -n "${WINDIR:-}" ] || [ -n "${SystemRoot:-}" ]; then
        echo "windows"
        return
    fi
    
    # Check uname output
    case "$(uname -s)" in
        *NT*|MINGW*|MSYS*|CYGWIN*)
            echo "windows"
            ;;
        Darwin)
            echo "macos"
            ;;
        Linux)
            # Additional check for WSL or Git Bash on Windows
            if [ -f /proc/version ] && grep -q Microsoft /proc/version; then
                echo "windows"
            else
                echo "linux"
            fi
            ;;
        *)
            echo "unknown"
            ;;
    esac
}

OS=$(detect_os)
echo "🖥️  Detected OS: $OS"

# Windows-specific temp directory setup
setup_windows_temp() {
    echo "🪟 Windows detected - using temporary build directory to avoid file locks"
    
    # Use system temp directory
    if [ -n "${TEMP:-}" ]; then
        TEMP_BUILD_DIR="$TEMP/clones-desktop-build"
        TEMP_TARGET_DIR="$TEMP/clones-desktop-target"
    elif [ -n "${TMP:-}" ]; then
        TEMP_BUILD_DIR="$TMP/clones-desktop-build"
        TEMP_TARGET_DIR="$TMP/clones-desktop-target"
    else
        TEMP_BUILD_DIR="/tmp/clones-desktop-build"
        TEMP_TARGET_DIR="/tmp/clones-desktop-target"
    fi
    
    echo "📁 Temporary build directory: $TEMP_BUILD_DIR"
    echo "🎯 Temporary target directory: $TEMP_TARGET_DIR"
    
    # Clean up existing temp directory
    if [ -d "$TEMP_BUILD_DIR" ]; then
        echo "🧹 Cleaning existing temp build directory..."
        rm -rf "$TEMP_BUILD_DIR"
    fi
    
    # Create temp directories
    mkdir -p "$TEMP_BUILD_DIR"
    mkdir -p "$TEMP_TARGET_DIR"
    
    # Copy necessary files to temp directory
    echo "📋 Copying project files to temporary directory..."
    cp "$ROOT_DIR/src-tauri/Cargo.toml" "$TEMP_BUILD_DIR/"
    cp "$ROOT_DIR/src-tauri/Cargo.lock" "$TEMP_BUILD_DIR/"
    cp "$ROOT_DIR/src-tauri/tauri.conf.json" "$TEMP_BUILD_DIR/"
    cp "$ROOT_DIR/src-tauri/build.rs" "$TEMP_BUILD_DIR/"
    
    # Copy src directory
    if [ -d "$ROOT_DIR/src-tauri/src" ]; then
        cp -r "$ROOT_DIR/src-tauri/src" "$TEMP_BUILD_DIR/"
    fi
    
    # Copy other necessary directories
    for dir in icons capabilities; do
        if [ -d "$ROOT_DIR/src-tauri/$dir" ]; then
            cp -r "$ROOT_DIR/src-tauri/$dir" "$TEMP_BUILD_DIR/"
        fi
    done
    
    # Set environment variable for Cargo target directory
    export CARGO_TARGET_DIR="$TEMP_TARGET_DIR"
    echo "🎯 Set CARGO_TARGET_DIR to: $CARGO_TARGET_DIR"
}

cleanup() {
    echo "🧹 Cleaning up..."
    if [ -n "${FLUTTER_PID:-}" ] && kill -0 $FLUTTER_PID 2>/dev/null; then
        kill $FLUTTER_PID
    fi
    if [ -n "${TAURI_PID:-}" ] && kill -0 $TAURI_PID 2>/dev/null; then
        kill $TAURI_PID
    fi
    if [ -n "${TAIL_PID:-}" ] && kill -0 $TAIL_PID 2>/dev/null; then
        kill $TAIL_PID
    fi
    # Kill any existing flutter processes
    pkill -f "flutter run" 2>/dev/null || true
    pkill -f "tail -f.*flutter.log" 2>/dev/null || true
    # Remove lock file
    rm -f "$LOCK_FILE"
    
    # Clean up Windows temp directory if it exists
    if [ "$OS" = "windows" ] && [ -n "${TEMP_BUILD_DIR:-}" ] && [ -d "$TEMP_BUILD_DIR" ]; then
        echo "🧹 Cleaning up Windows temp directory..."
        rm -rf "$TEMP_BUILD_DIR"
    fi
}
trap cleanup EXIT INT TERM

# Check if already running
if [ -f "$LOCK_FILE" ]; then
    echo "❌ Development server already running. Please stop it first."
    echo "   Lock file found: $LOCK_FILE"
    exit 1
fi

# Create lock file
echo $$ > "$LOCK_FILE"

# Clean up any existing processes first
echo "🧹 Cleaning up existing processes..."
pkill -f "flutter run" 2>/dev/null || true
pkill -f "tail -f.*flutter.log" 2>/dev/null || true
pkill -f "dartaotruntime.*flutter_web_sdk" 2>/dev/null || true

# Remove existing log file to start fresh
rm -f "$LOG_FILE"

# Wait a moment for processes to fully terminate
sleep 2

# Check if Flutter is available
echo "🔍 Checking Flutter availability..."
if [ "$OS" = "windows" ]; then
    # On Windows, try to use the Windows Flutter installation
    if [ -f "/c/flutter/bin/flutter.exe" ]; then
        FLUTTER_CMD="/c/flutter/bin/flutter.exe"
    elif [ -f "/mnt/c/flutter/bin/flutter.exe" ]; then
        FLUTTER_CMD="/mnt/c/flutter/bin/flutter.exe"
    elif [ -f "/c/flutter/bin/flutter" ]; then
        FLUTTER_CMD="/c/flutter/bin/flutter"
    elif [ -f "/mnt/c/flutter/bin/flutter" ]; then
        FLUTTER_CMD="/mnt/c/flutter/bin/flutter"
    elif command -v flutter.exe &> /dev/null; then
        FLUTTER_CMD="flutter.exe"
    elif command -v flutter &> /dev/null; then
        FLUTTER_CMD="flutter"
    else
        echo "❌ Flutter is not installed or not in PATH"
        echo "   Please install Flutter from: https://flutter.dev/docs/get-started/install"
        exit 1
    fi
else
    # On macOS/Linux, use standard flutter command
    if command -v flutter &> /dev/null; then
        FLUTTER_CMD="flutter"
    else
        echo "❌ Flutter is not installed or not in PATH"
        echo "   Please install Flutter from: https://flutter.dev/docs/get-started/install"
        exit 1
    fi
fi

echo "📱 Using Flutter command: $FLUTTER_CMD"

# Check Flutter doctor
echo "🔍 Running Flutter doctor..."
$FLUTTER_CMD doctor --android-licenses --quiet || true

# Setup Windows temp directory if needed
if [ "$OS" = "windows" ]; then
    setup_windows_temp
fi

# 1. Start Flutter and pipe output to a file
echo "📱 Starting Flutter Web development server..."
echo "📁 Flutter will output to: $LOG_FILE"

# Check if web-server device is available and start it if needed
echo "🔍 Checking for web-server device..."
if ! $FLUTTER_CMD devices | grep -q "web-server"; then
    echo "⚠️  Web server device not found. Attempting to start it..."
    
    # Try to start the web-server device
    $FLUTTER_CMD config --enable-web
    $FLUTTER_CMD devices --machine | grep -q "web-server" || {
        echo "❌ Failed to start web-server device. Available devices:"
        $FLUTTER_CMD devices
        echo ""
        echo "💡 Try running: flutter config --enable-web"
        echo "💡 Then restart this script"
        exit 1
    }
fi

echo "✅ Web server device is available"

$FLUTTER_CMD run -d web-server --web-port 3000 --web-hostname 127.0.0.1 > "$LOG_FILE" 2>&1 &
FLUTTER_PID=$!

echo "📱 Flutter process started with PID: $FLUTTER_PID"

# 2. Wait for the "lib/main.dart is being served at" message
echo "⏳ Waiting for Flutter to serve lib/main.dart..."
echo "📄 Checking log file: $LOG_FILE"

# Add timeout to prevent infinite waiting
TIMEOUT=120
ELAPSED=0
while [ $ELAPSED -lt $TIMEOUT ]; do
    if [ -f "$LOG_FILE" ] && grep -q "lib/main.dart is being served at" "$LOG_FILE"; then
        echo "✅ Flutter is ready!"
        break
    fi
    
    # Check if Flutter process is still running
    if ! kill -0 $FLUTTER_PID 2>/dev/null; then
        echo "❌ Flutter process died unexpectedly"
        echo "📄 Last 20 lines of log file:"
        tail -20 "$LOG_FILE" 2>/dev/null || echo "Log file not found"
        exit 1
    fi
    
    echo "⌛ Still waiting for Flutter output... ($ELAPSED/$TIMEOUT seconds)"
    sleep 4
    ELAPSED=$((ELAPSED + 4))
done

if [ $ELAPSED -ge $TIMEOUT ]; then
    echo "❌ Timeout waiting for Flutter to start"
    echo "📄 Last 20 lines of log file:"
    tail -20 "$LOG_FILE" 2>/dev/null || echo "Log file not found"
    exit 1
fi

# Optional buffer for safety
sleep 2

# 3. Start Tauri
echo "⚙️ Starting Tauri development..."
if [ "$OS" = "windows" ]; then
    # Use temp directory for Windows
    cd "$TEMP_BUILD_DIR"
    echo "🪟 Running Tauri from temp directory: $TEMP_BUILD_DIR"
else
    # Use original directory for macOS/Linux
    cd "$ROOT_DIR/src-tauri"
fi

cargo tauri dev --config tauri.conf.json &
TAURI_PID=$!

echo "✅ Development servers started!"
echo "🌐 Flutter Web: http://localhost:3000"
echo "🖥️  Tauri App: Starting..."
if [ "$OS" = "windows" ]; then
    echo "🪟 Using temporary build directory: $TEMP_BUILD_DIR"
    echo "🎯 Using temporary target directory: $TEMP_TARGET_DIR"
fi
echo "🛑 Press Ctrl+C to stop all servers"

# 4. Tail logs for visibility (optional) - only one instance
tail -f "$LOG_FILE" &
TAIL_PID=$!

wait
