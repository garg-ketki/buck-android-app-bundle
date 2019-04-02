#!/bin/bash

set -euo pipefail

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../../../" >/dev/null && pwd)"

function remove {
	local readonly PATH=$1
	rm $PATH &> /dev/null || true
}

function bundle {
	java -jar $PROJECT_ROOT/tooling/app-bundle/bundletool/bundletool.jar "$@"
}

function generate_apks {
	local readonly BUNDLE_PATH=$1
	               APKS_PATH=$2
	               KS=${3:-"$PROJECT_ROOT/app/debug.keystore"}
	               KS_PASS=${4:-"android"}
	               KS_ALIAS=${5:-"androiddebugkey"}
	               KEY_PASS=${6:-"android"}

	remove $APKS_PATH

	echo "Generating apks"
	bundle \
	    build-apks \
	    --ks=$KS \
	    --ks-pass=pass:$KS_PASS \
	    --ks-key-alias=$KS_ALIAS \
	    --key-pass=pass:$KEY_PASS \
	    --bundle=$BUNDLE_PATH \
	    --output=$APKS_PATH
}

function get_device_spec {
	local readonly OUTPUT=$1

	remove $OUTPUT
	bundle \
		get-device-spec \
		--output $OUTPUT
}

function extract_apks {
	local readonly APKS_PATH=$1
				   DEVICE_SPEC=$2
				   OUTPUT_DIR=$3

	bundle \
		extract-apks \
		--apks="$APKS_PATH" \
		--device-spec="$DEVICE_SPEC" \
		--output-dir="$OUTPUT_DIR"
}

function install_apks {
	local readonly APKS_PATH=$1

	echo "Installing the apk"
	bundle \
	    install-apks \
	    --apks="$APKS_PATH"
}

export -f generate_apks
export -f get_device_spec
export -f extract_apks
export -f install_apks
