#!/bin/bash

set -euo pipefail

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../../../" >/dev/null && pwd)"

function generate_apks {
    local readonly BUNDLE_PATH=$1
                   APKS_PATH=$2
                   KS=${3:-"$PROJECT_ROOT/app/debug.keystore"}
                   KS_PASS=${4:-"android"}
                   KS_ALIAS=${5:-"androiddebugkey"}
                   KEY_PASS=${6:-"android"}

    echo "Generating apks"
    java -jar $PROJECT_ROOT/tooling/app-bundle/bundletool.jar \
      build-apks \
      --ks=$KS \
      --ks-pass=pass:$KS_PASS \
      --ks-key-alias=$KS_ALIAS \
      --key-pass=pass:$KEY_PASS \
      --bundle=$BUNDLE_PATH \
      --output=$APKS_PATH
}

export -f generate_apks