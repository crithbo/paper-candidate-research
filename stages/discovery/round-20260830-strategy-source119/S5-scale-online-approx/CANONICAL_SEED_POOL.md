# Source119 S5 Canonical Seed Pool

Generated before any Source119 source lookup. Seeds are non-evidence.

| ID | Exact anchor candidate | Primary RQ (fixed object/semantics) | Main risk |
|---|---|---|---|
| S5-119-01 | vLLM KV offloading connector/config | Can an online layer/block offload policy minimize TTFT under fixed exact KV semantics and full PCIe/CPU cost beyond static offload? | current union absorption |
| S5-119-02 | SGLang HiCache hierarchical KV | Can reuse-distance-conditioned L2 admission improve fixed prefix-cache semantics beyond native eviction/write policy? | generic caching |
| S5-119-03 | TensorRT-LLM KV cache quantization | Can online per-sequence KV precision allocation satisfy one fixed error contract while reducing capacity cost? | changed guarantee / existing selectors |
| S5-119-04 | llama.cpp KV-cache quantization | Can phase-aware K/V precision selection preserve a frozen logit-error contract under memory pressure? | current configurable modes |
| S5-119-05 | PyTorch torchao quantization | Can online shape-regime selection choose a semantics-bounded low-bit kernel without ordinary autotuning? | generic dispatch/autotuning |
| S5-119-06 | MLC-LLM paged KV cache | Can online page-size or compaction decisions reduce fragmentation while preserving cache semantics? | action absent/unobservable |
| S5-119-07 | ONNX Runtime GenAI KV/share-buffer | Can online prompt/decode buffer planning reduce peak memory with identical generation semantics? | native union already covers |
| S5-119-08 | ExecuTorch backend partition/delegation | Can online memory-pressure-aware fallback preserve exact operator semantics with bounded cold-start cost? | generic partition/controller |
| S5-119-09 | NVIDIA ModelOpt KV quantization | Can per-request online KV calibration meet a fixed accuracy contract with full calibration/runtime cost? | existing calibration policies |
| S5-119-10 | Hugging Face Transformers cache classes | Can online switching among dynamic/static/offloaded cache representations be non-generic under fixed generation semantics? | exposed mode selector |

All primary routes: current official documentation plus same-version/current first-party source. No outcome-aware replacement or backfill.
