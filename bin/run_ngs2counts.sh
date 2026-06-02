#!/bin/bash

set -o errexit

export RUNFOLDER="$1"
export NGS2COUNTS_EXECUTABLE="$2"
export NGS2COUNTS_EXTRA_ARGS="${3:-}"
export NGS2COUNTS_VERSION_FILE="ngs2counts_version.txt"
export NGS2COUNTS_LOG="ngs2counts_log.txt"

"$NGS2COUNTS_EXECUTABLE" -V > "$RUNFOLDER/$NGS2COUNTS_VERSION_FILE"

args=( "$RUNFOLDER" )

if [[ -n "$NGS2COUNTS_EXTRA_ARGS" ]]; then
    args+=( $NGS2COUNTS_EXTRA_ARGS )
fi

"$NGS2COUNTS_EXECUTABLE" "${args[@]}" | tee "$RUNFOLDER/$NGS2COUNTS_LOG"
