#!/usr/bin/env bash
set -euo pipefail

if [[ $# -lt 1 ]]; then
  cat
  exit 0
fi

buffer_path="$1"

# Write current buffer content to disk so Slidev can parse multi-slide frontmatter.
cat >"$buffer_path"

project_root="$(cd "$(dirname "$0")/.." && pwd)"

cd "$project_root"
pnpm slidev format "$buffer_path" >/dev/null
cat "$buffer_path"
