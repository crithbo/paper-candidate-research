#!/usr/bin/env bash
set -euo pipefail

# Static launch plan only. The default path must not create directories or use HOME
# or any global model/cache location. It cannot start in this Discovery assignment.
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ASSIGNMENT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
RESOURCE_ROOT="${RESOURCE_ROOT:-$ASSIGNMENT_ROOT/resources}"
MODEL_DIR="${MODEL_DIR:-$RESOURCE_ROOT/model}"
PARSER_PATH="${PARSER_PATH:-$RESOURCE_ROOT/model/qwen3coder_tool_parser.py}"
CACHE_ROOT="$RESOURCE_ROOT/cache"
TMP_ROOT="$RESOURCE_ROOT/tmp"

if [[ "$RESOURCE_ROOT" != "$ASSIGNMENT_ROOT/resources" || "$MODEL_DIR" != "$RESOURCE_ROOT/model" || "$PARSER_PATH" != "$RESOURCE_ROOT/model/qwen3coder_tool_parser.py" ]]; then
  echo "All model, parser, cache, and temporary paths must remain assignment-local" >&2
  exit 2
fi

CMD=(
  vllm serve "$MODEL_DIR"
  --revision dcaee4d4dfc5ee71ad501f01f530e5652438fde0
  --served-model-name Qwen/Qwen3-Coder-30B-A3B-Instruct-FP8
  --download-dir "$CACHE_ROOT/huggingface"
  --tensor-parallel-size 1
  --max-model-len 32768
  --max-num-seqs 8
  --max-num-batched-tokens 8192
  --gpu-memory-utilization 0.90
  --kv-cache-dtype auto
  --enable-prefix-caching
  --enable-chunked-prefill
  --seed 20260821
  --enable-auto-tool-choice
  --tool-call-parser qwen3_coder
  --tool-parser-plugin "$PARSER_PATH"
  --host 127.0.0.1
  --port 8000
)

if [[ "${RUN_STAGE_A:-0}" != "1" ]]; then
  printf 'Dry run only; no directories are created and vLLM is not started.\n'
  printf 'Frozen command:'; printf ' %q' "${CMD[@]}"; printf '\n'
  exit 0
fi

if [[ -z "${STAGE_A_AUTHORIZATION_ID:-}" || ! -f "$MODEL_DIR/model-00001-of-00004.safetensors" || ! -f "$PARSER_PATH" ]]; then
  echo "Refusing launch: requires Stage-A authorization and already-verified local model/parser assets" >&2
  exit 2
fi

mkdir -p "$CACHE_ROOT/huggingface" "$TMP_ROOT" "$RESOURCE_ROOT/logs"
export HF_HOME="$CACHE_ROOT/huggingface"
export TRANSFORMERS_CACHE="$CACHE_ROOT/transformers"
export XDG_CACHE_HOME="$CACHE_ROOT/xdg"
export TMPDIR="$TMP_ROOT"
export TEMP="$TMP_ROOT"
export TMP="$TMP_ROOT"
exec "${CMD[@]}"
