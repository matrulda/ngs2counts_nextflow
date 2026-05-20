#!/bin/bash

set -o errexit

export RUNFOLDER="$1"
export NGS2COUNTS_EXECUTABLE="$2"
export LIBRARY_MAPPING="${3:-}"
export NGS2COUNTS_VERSION_FILE="ngs2counts_version.txt"
export NGS2COUNTS_LOG="ngs2counts_log.txt"

"$NGS2COUNTS_EXECUTABLE" -V > "$RUNFOLDER/$NGS2COUNTS_VERSION_FILE"

args=( "$RUNFOLDER" )

if [[ -n "$LIBRARY_MAPPING" ]]; then
    args+=( "--library-mapping" "$LIBRARY_MAPPING" )
fi

"$NGS2COUNTS_EXECUTABLE" "${args[@]}" | tee "$RUNFOLDER/$NGS2COUNTS_LOG"
