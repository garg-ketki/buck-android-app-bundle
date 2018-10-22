#!/bin/bash

set -euo pipefail

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../../../" >/dev/null && pwd)"

rm -rf $PROJECT_ROOT/app/build/outputs/apks/debug/
mkdir -p $PROJECT_ROOT/app/build/outputs/apks/debug/

echo "Generating apks"
java -jar $PROJECT_ROOT/tooling/app-bundle/bundletool.jar \
  build-apks \
  --ks=$PROJECT_ROOT/app/debug.keystore \
  --ks-pass=pass:android \
  --ks-key-alias=androiddebugkey \
  --key-pass=pass:android \
  --bundle=$PROJECT_ROOT/app/build/outputs/bundle/debug/app.aab \
  --output=$PROJECT_ROOT/app/build/outputs/apks/debug/app.apks
