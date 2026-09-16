# Source120 S6 — Frozen Exact-Public-Carrier Portfolio

- Assignment: `DISCOVERY-S6-20260830-SOURCE120-EXACT-CARRIER`
- Freeze timestamp: `2026-08-30T02:40:00+08:00`
- Frozen before first external source call: `YES`
- Mode: exact public carrier first; no RQ exists yet.
- Replacement/backfill after results: forbidden.
- Carrier ceiling: 8 selected locator candidates.

| ID | Frozen official carrier candidate | Why it is exact enough to locate first | Post-locate decision bundle (not yet an RQ) | Primary route | Contrary/current route |
|---|---|---|---|---|---|
| C01 | `vllm-project/vllm` current `tests/v1/core/test_kv_cache_manager.py` or renamed canonical equivalent | versioned merged test for KV block/cache-manager semantics | block allocation/free/reuse invariant and one decision endpoint | official GitHub test search/open | official current manager source |
| C02 | `sgl-project/sglang` current radix-cache unit test | merged fixture for prefix-tree matching/eviction semantics | exact trie mutation/action and fixed cache-hit/eviction endpoint | official GitHub test search/open | official current radix-cache source |
| C03 | `NVIDIA/TensorRT-LLM` current KV-cache-manager unit test | merged native runtime fixture | exact block-pool/refcount/eviction action and fixed correctness endpoint | official GitHub test search/open | official current manager source/docs |
| C04 | `facebookresearch/xformers` current memory-efficient-attention test | merged kernel/API fixture with backend and shape contracts | exact dispatch/split action and same-attention endpoint | official GitHub test search/open | official current dispatch source |
| C05 | `pytorch/pytorch` current Inductor scheduler test | merged compiler fixture for dependency/fusion/scheduling behavior | exact scheduler data structure/action and fixed generated-program endpoint | official GitHub test search/open | official current scheduler source |
| C06 | `ml-explore/mlx` current KV-cache test | merged Apple unified-memory runtime fixture | exact cache mutation/layout action and fixed model/output semantics | official GitHub test search/open | official current cache implementation |
| C07 | `mlc-ai/mlc-llm` current serving engine/scheduler test | merged TVM/MLC serving fixture | exact request/page scheduling action and fixed serving endpoint | official GitHub test search/open | official current engine source |
| C08 | `openvinotoolkit/openvino.genai` current continuous-batching/cache test | merged CPU/GPU serving fixture | exact scheduler/cache action and fixed output/latency-accounting endpoint | official GitHub test search/open | official current scheduler source |

## Pre-evidence constraints

- A missing/renamed test yields `LOCATOR_UNRESOLVED`, not a scientific negative.
- A fixture that only checks API plumbing cannot be promoted to raw.
- Current source expressing the same action causes direct subtraction/exclusion; no stronger RQ may be invented after that result.
- Linux/device dependence is a resource boundary, not a scientific drop.
