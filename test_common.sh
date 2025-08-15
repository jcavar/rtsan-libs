#!/usr/bin/env bash

set -euo pipefail

if [ ! -f "$LIB" ]; then
  echo "Library does not exist: $LIB"
  exit 1
fi

SYMBOLS=$(nm -a "$LIB") || exit 1

if ! grep -q "rtsan_realtime_enter" <<< "$SYMBOLS"; then
  echo "Missing required symbol: rtsan_realtime_enter"
  exit 1
fi

echo "Common tests passed"
