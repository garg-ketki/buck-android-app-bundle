#!/bin/bash

set -euo pipefail

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../../../" >/dev/null && pwd)"

echo "Generating the app bundle with gradle"
# $PROJECT_ROOT/gradlew app:bundleDebug

java -jar $PROJECT_ROOT/tooling/app-bundle/bundletool.jar \
  build-bundle \
  --modules="$PROJECT_ROOT/base.zip" \
  --output="$PROJECT_ROOT/app/build/outputs/bundle/debug/app.aab"
