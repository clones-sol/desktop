#!/bin/bash
# This script exports all variables from .env and runs Flutter with them in the environment.

set -e

ENV_FILE=".env"
if [ ! -f "$ENV_FILE" ]; then
  echo "No .env file found in $(pwd)"
  exit 1
fi

# Export all variables from .env (ignore comments and empty lines)
export $(grep -v '^#' "$ENV_FILE" | grep -v '^\s*$' | xargs)

# Run Flutter with all .env variables in the environment
flutter run -d macos
