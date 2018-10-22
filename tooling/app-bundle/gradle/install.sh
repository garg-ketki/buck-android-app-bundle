#!/bin/bash

set -euo pipefail

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../../../" >/dev/null && pwd)"

echo "Installing the apk"
java -jar $PROJECT_ROOT/tooling/app-bundle/bundletool.jar \
  install-apks \
  --apks=$PROJECT_ROOT/app/build/outputs/apks/debug/app.apks
