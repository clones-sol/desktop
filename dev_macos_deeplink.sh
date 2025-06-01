#!/bin/bash


APP_NAME="Viralmind Desktop"
SDK_PATH="/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX15.5.sdk"

echo ">>> Setting SDKROOT to: $SDK_PATH"
echo ">>> Step 1: Building the Tauri application in debug mode..."
SDKROOT="$SDK_PATH" cargo tauri build --debug
BUILD_EXIT_CODE=$?

APP_BUNDLE_SOURCE_PATH="src-tauri/target/debug/bundle/macos/${APP_NAME}.app"

if [ -d "$APP_BUNDLE_SOURCE_PATH" ]; then
    echo "Debug build completed successfully (or .app bundle found despite DMG errors)."
else
    echo "Error: Debug build failed and the .app bundle is not found."
    echo "Build exit code: $BUILD_EXIT_CODE"
    exit 1
fi

APP_BUNDLE_DEST_PATH="/Applications/${APP_NAME}.app"

echo ">>> Step 2: Copying the application to the /Applications folder..."
if [ -d "$APP_BUNDLE_SOURCE_PATH" ]; then
    echo "Application bundle found at: $APP_BUNDLE_SOURCE_PATH"

    echo "Removing the old version of the application in /Applications (if it exists)..."
    if [ -d "$APP_BUNDLE_DEST_PATH" ]; then
        rm -rf "$APP_BUNDLE_DEST_PATH"
        echo "Old version removed."
    else
        echo "No old version found in /Applications."
    fi

    echo "Copying the new application bundle to /Applications..."
    cp -R "$APP_BUNDLE_SOURCE_PATH" "/Applications/"
    echo "The application bundle has been copied to $APP_BUNDLE_DEST_PATH"
    echo "This copy allows macOS to register the URL scheme for development."
else
    echo "Error: Application bundle not found at $APP_BUNDLE_SOURCE_PATH after build."
    echo "Check the application name (APP_NAME) and the output path of the build."
    exit 1
fi

echo ">>> Step 3: Starting the Tauri development server..."
if SDKROOT="$SDK_PATH" bun tauri dev; then
    echo "Development server stopped."
else
    echo "Error: Failed to start 'bun tauri dev'."
    exit 1
fi

echo "Script completed."