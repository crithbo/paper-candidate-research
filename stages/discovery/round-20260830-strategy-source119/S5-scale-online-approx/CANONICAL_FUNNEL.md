# Source119 S5 Canonical Funnel

## Search boundary

- Current cutoff: 2026-08-30.
- Sources: first-party current docs/source plus primary arXiv papers.
- No download, build, experiment, or result-aware backfill.
- Project registry exact-text preflight returned no match for the ten anchors; this is not novelty evidence.

## Funnel

| Family | Exact anchor | Current/contrary evidence | Disposition before raw | Reason |
|---|---|---|---|---|
| F01 | vLLM OffloadingConnector | https://github.com/vllm-project/vllm/blob/main/docs/features/kv_offloading_usage.md | `EXCLUDED_BEFORE_RAW__CURRENT_UNION` | Native union already exposes LRU, ARC, out-of-tree custom `CachePolicy`, lookup threshold, prompt-only offload, and per-request `max_offload_tokens`; the seed leaves no non-generic atomic action. |
| F02 | SGLang unified/HiCache components | https://github.com/sgl-project/sglang/blob/main/python/sglang/srt/mem_cache/unified_cache/components/README.md | `LOCATOR_ONLY` | Hierarchical component priorities and cascade behavior are current, but the seed did not freeze a new same-object admission action beyond generic caching. |
| F03 | TensorRT-LLM KV quantization | https://nvidia.github.io/TensorRT-LLM/performance/performance-tuning-guide/fp8-quantization.html | `EXCLUDED_BEFORE_RAW__STRONG_COLLISION` | Static FP8 is native; adaptive token-level bit allocation is already the main action of https://arxiv.org/abs/2604.04722. Per-request reformulation would be outcome-aware scope change. |
| F04 | llama.cpp KV type selection | https://github.com/ggml-org/llama.cpp/blob/master/tools/server/README.md | `EXCLUDED_BEFORE_RAW__CURRENT_SELECTOR` | Current CLI exposes independent K/V cache types and backend paths already perform phase/shape-conditioned dispatch; no distinct fixed-contract algorithm survived. |
| F05 | torchao quantized inference/FQN config | https://docs.pytorch.org/ao/stable/workflows/inference.html | `LOCATOR_ONLY` | Dynamic activation quantization and per-module config exist, but an LLM-specific online shape policy, decision endpoint, and non-autotuning discriminator were not jointly frozen. |
| F06 | MLC-LLM paged KV cache | intended official MLC docs/source | `LOCATOR_ONLY__ANCHOR_NOT_CLOSED` | Bounded official search did not close the exact current page-compaction action or a canonical carrier; no absence inference. |
| F07 | ONNX Runtime GenAI share buffer | https://onnxruntime.ai/docs/genai/howto/past-present-share-buffer.html | `EXCLUDED_BEFORE_RAW__CURRENT_UNION` | Past/present aliasing and max-length memory allocation are already explicit current controls; online switching is a generic boolean/config selector. |
| F08 | ExecuTorch partition/memory planning | https://docs.pytorch.org/executorch/stable/compiler-memory-planning.html | `LOCATOR_ONLY` | AOT greedy/custom/device-aware planning is current; the seed's online fallback changes execution stage and lacks a natural LLM carrier and fixed cold-start endpoint. |
| F09 | NVIDIA ModelOpt KV quantization | https://github.com/NVIDIA/Model-Optimizer/blob/main/examples/llm_ptq/README.md | `EXCLUDED_BEFORE_RAW__STRONG_COLLISION` | Current recipes already span cast and data-calibrated FP8/NVFP4 KV modes; adaptive precision is additionally occupied by arXiv:2604.04722. |
| F10 | Transformers cache classes | https://huggingface.co/docs/transformers/main/kv_cache | `EXCLUDED_BEFORE_RAW__CURRENT_SELECTOR` | Dynamic, static, offloaded, and quantized cache classes are an explicit mode table; switching them without a target-specific mechanism is a controller wrapper. |

## Candidate-grade deep reviews

### D1 — vLLM online offload admission

The strongest current-source falsifier is decisive: vLLM directly supports custom cache-policy injection and per-request selective offload. A reuse-distance policy can be implemented inside that documented action surface. Without a new algorithmic complexity/guarantee or a natural law, the proposal is configuration/policy implementation rather than a Q2-shaped N2 contribution.

### D2 — adaptive KV precision

The 2026 primary paper `Don't Waste Bits!` already defines token-importance features and online selection among 2/4/8/16-bit KV precision. That collides with the central action and endpoint of F03/F09. Framework porting or swapping the accuracy constraint would not create a clean residual.

### D3 — ExecuTorch online memory/fallback

ExecuTorch's official path is AOT: partitioning, symbolic upper-bound evaluation, greedy/custom arena planning, and device-specific pools. Turning this into runtime fallback would require a new exact runtime object and canonical workload; those were not closed within the frozen RQ, so the honest result is locator-only rather than a changed-object brief.

## Outcome

- Seeds: 10
- Selected primary RQs: 10
- Unique families: 10
- Candidate-grade deep reviews: 3
- Evidence-qualified raw: 0
- Clean Stage0 briefs: 0
- Source-closure queue: 0
- Shadow/maturation repair: OFF, not run

This is an evidentiary/scientific abstention, not a resource blocker or broad category STOP.
