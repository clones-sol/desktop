#!/bin/bash

# Script de build pour Flutter Web + Tauri
set -euo pipefail

echo "🚀 Building Flutter Web + Tauri Application"

# Store current directory
ROOT_DIR=$(pwd)

# 1. Build Flutter Web (release mode)
echo "📱 Building Flutter Web..."
flutter build web --release

# 2. Prepare build folder for Tauri
echo "📁 Preparing build directory for Tauri..."
mkdir -p build/web
rm -rf build/web/*

# 3. Copy Flutter build output to Tauri-expected location
cp -r build/web/* "$ROOT_DIR/src-tauri/../build/web"

# 4. Build Tauri app
echo "🦀 Building Tauri application..."
cd "$ROOT_DIR/src-tauri"
cargo tauri build

echo "✅ Build completed successfully!"
echo "📦 Application built in: src-tauri/target/release/bundle/"
