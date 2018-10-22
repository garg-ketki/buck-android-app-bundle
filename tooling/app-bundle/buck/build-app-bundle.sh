#!/bin/bash

set -euo pipefail

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../../../" >/dev/null && pwd)"

echo "Generating the app bundle"
$PROJECT_ROOT/buckw build //app:bundle_debug
