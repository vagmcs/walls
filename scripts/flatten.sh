#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
COLLECTION_DIR="$ROOT_DIR/collection"

mkdir -p "$COLLECTION_DIR"

for dir in "$ROOT_DIR"/*/; do
  dir_name="$(basename "$dir")"
  [[ "$dir_name" == "scripts" || "$dir_name" == "collection" ]] && continue

  echo "Copying $dir_name ..."
  find "$dir" -type f -exec cp -n {} "$COLLECTION_DIR" \;
done

echo "Done. Files copied to $COLLECTION_DIR"
