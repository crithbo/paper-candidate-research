#!/usr/bin/env bash
set -euo pipefail

# This file is a static Stage-A-only bootstrap plan. Its default dry run performs
# no mkdir, download, copy, checksum, container, model, or agent action.
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ASSIGNMENT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
RESOURCE_ROOT="${RESOURCE_ROOT:-$ASSIGNMENT_ROOT/resources}"
MODEL_DIR="$RESOURCE_ROOT/model"
DATA_DIR="$RESOURCE_ROOT/dataset"
PARSER_PATH="$RESOURCE_ROOT/model/qwen3coder_tool_parser.py"

if [[ "$RESOURCE_ROOT" != "$ASSIGNMENT_ROOT/resources" ]]; then
  echo "RESOURCE_ROOT must be the assignment-local resources directory" >&2
  exit 2
fi

if [[ "${RUN_STAGE_A:-0}" != "1" ]]; then
  cat <<EOF
Dry run only; no filesystem mutation is permitted.
Planned resource root: $RESOURCE_ROOT
Frozen model: Qwen/Qwen3-Coder-30B-A3B-Instruct-FP8@dcaee4d4dfc5ee71ad501f01f530e5652438fde0
Frozen dataset: princeton-nlp/SWE-bench_Verified@c104f840cc67f8b6eec6f759ebc8b2693d585d4a
EOF
  exit 0
fi

if [[ -z "${STAGE_A_AUTHORIZATION_ID:-}" ]]; then
  echo "Refusing asset acquisition without a topic-specific Stage A authorization" >&2
  exit 2
fi

# These mutations are unreachable in this Discovery assignment. They remain here
# only as a future, local-only Stage-A route after an explicit assignment freezes
# URLs, byte limits, credentials/provenance, and resource inventory updates.
mkdir -p "$MODEL_DIR" "$DATA_DIR" "$RESOURCE_ROOT/cache" "$RESOURCE_ROOT/tmp" "$RESOURCE_ROOT/logs"
export HF_HOME="$RESOURCE_ROOT/cache/huggingface"
export TRANSFORMERS_CACHE="$RESOURCE_ROOT/cache/transformers"
export TMPDIR="$RESOURCE_ROOT/tmp"
export TEMP="$RESOURCE_ROOT/tmp"
export TMP="$RESOURCE_ROOT/tmp"
printf 'Stage-A authorization accepted; a separately frozen acquisition assignment is required before download.\n'
printf 'Expected parser destination: %s\n' "$PARSER_PATH"
