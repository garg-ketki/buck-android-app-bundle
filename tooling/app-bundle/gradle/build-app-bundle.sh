#!/bin/bash

set -euo pipefail

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../../../" >/dev/null && pwd)"

echo "Generating the app bundle with gradle"
$PROJECT_ROOT/gradlew app:bundleDebug
