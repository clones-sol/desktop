#!/bin/bash

set -euo pipefail

echo "🚀 Starting Flutter Web + Tauri Development"

ROOT_DIR=$(pwd)

cleanup() {
    echo "🧹 Cleaning up..."
    if [ -n "${FLUTTER_PID:-}" ] && kill -0 $FLUTTER_PID 2>/dev/null; then
        kill $FLUTTER_PID
    fi
    if [ -n "${TAURI_PID:-}" ] && kill -0 $TAURI_PID 2>/dev/null; then
        kill $TAURI_PID
    fi
}
trap cleanup EXIT INT TERM

# 1. Start Flutter and pipe output to a file
echo "📱 Starting Flutter Web development server..."
flutter run -d web-server --web-port 3000 --web-hostname 127.0.0.1 > flutter.log 2>&1 &
FLUTTER_PID=$!

# 2. Wait for the "lib/main.dart is being served at" message
echo "⏳ Waiting for Flutter to serve lib/main.dart..."
until grep -q "lib/main.dart is being served at" flutter.log; do
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

# 4. Tail logs for visibility (optional)
tail -f "$ROOT_DIR/flutter.log" &

wait
