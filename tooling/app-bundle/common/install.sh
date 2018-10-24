#!/bin/bash

set -euo pipefail

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../../../" >/dev/null && pwd)"

function install_apks {
    local readonly APKS_PATH=$1

    echo "Installing the apk"
    java -jar $PROJECT_ROOT/tooling/app-bundle/bundletool.jar \
      install-apks \
      --apks=$APKS_PATH
}

export -f install_apks