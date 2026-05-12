#!/bin/bash

set -o errexit

export RUNFOLDER="$1"
export NGS2COUNTS_EXECUTABLE="$2"
export NGS2COUNTS_VERSION_FILE="ngs2counts_version.txt"
export OUTPATH="$RUNFOLDER/ngs2counts"

mkdir -p "$(dirname "${OUTPATH}")"

echo "$(basename "$NGS2COUNTS_EXECUTABLE")" > "$RUNFOLDER/$NGS2COUNTS_VERSION_FILE"
