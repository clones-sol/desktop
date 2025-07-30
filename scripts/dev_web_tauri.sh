#!/bin/bash

set -euo pipefail

echo "🚀 Starting Flutter Web + Tauri Development"

ROOT_DIR=$(pwd)
LOCK_FILE="$ROOT_DIR/.dev_lock"
LOG_FILE="$ROOT_DIR/flutter.log"

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

# 1. Start Flutter and pipe output to a file
echo "📱 Starting Flutter Web development server..."
flutter run -d web-server --web-port 3000 --web-hostname 127.0.0.1 > "$LOG_FILE" 2>&1 &
FLUTTER_PID=$!

# 2. Wait for the "lib/main.dart is being served at" message
echo "⏳ Waiting for Flutter to serve lib/main.dart..."
until grep -q "lib/main.dart is being served at" "$LOG_FILE"; do
    echo "⌛ Still waiting for Flutter output..."
    sleep 4
done

echo "✅ Flutter is ready!"

# Optional buffer for safety
sleep 2

# 3. Start Tauri
echo "🦀 Starting Tauri development..."
cd "$ROOT_DIR/src-tauri"
cargo tauri dev --config tauri.conf.json &
TAURI_PID=$!

echo "✅ Development servers started!"
echo "🌐 Flutter Web: http://localhost:3000"
echo "🖥️  Tauri App: Starting..."
echo "🛑 Press Ctrl+C to stop all servers"

# 4. Tail logs for visibility (optional) - only one instance
tail -f "$LOG_FILE" &
TAIL_PID=$!

wait
