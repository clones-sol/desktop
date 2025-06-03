#!/bin/bash


SDK_PATH="/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX15.5.sdk"

echo ">>> Setting SDKROOT to: $SDK_PATH"
cd src-tauri && SDKROOT="$SDK_PATH" cargo test
TEST_EXIT_CODE=$?
cd ..
if [ $TEST_EXIT_CODE -ne 0 ]; then
    echo "Error: Unit tests failed."
    exit 1
fi

echo "Script completed."