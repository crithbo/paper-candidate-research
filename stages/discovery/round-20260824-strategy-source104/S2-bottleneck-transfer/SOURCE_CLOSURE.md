# Source104 S2 source closure

No resource-producing action occurred; public browser retrieval only.

| RQ | Current first-party / primary evidence | Closure result |
|---|---|---|
| S2-104-RQ01 | vLLM `SpeculativeConfig` exposes `enable_adaptive_verification`, per-request verification budget; current config and KV manager define speculative lookahead reservation. | `EARLY_FATAL__CURRENT_NATIVE_DIRECT_COVERAGE` |
| S2-104-RQ02 | TensorRT-LLM public speculative docs expose draft-length/configuration controls and note a versioned no-dynamic-disable limitation. | `EXCLUDED_BEFORE_RAW__GENERIC_THRESHOLD_RESIDUAL` |
| S2-104-RQ03 | FlashInfer public paged-KV decode wrapper owns `plan()`/`run()`, cross-layer auxiliary-data reuse, CUDA-graph buffers and native backend selection. | `EARLY_FATAL__CURRENT_NATIVE_PAGED_KV_LIFECYCLE_AND_BACKEND_SELECTION` |

The TensorRT-LLM limitation is not itself a contribution: the frozen action would merely add a generic threshold without a new information contract, mechanism-specific prediction, fixed public workload or finite falsifier. No same-object RQ was altered after result inspection.

Sources: vLLM current API/configuration docs; TensorRT-LLM current speculative-decoding documentation; FlashInfer current public decode API/source. No Rule Audit output, group repository material, private content, download, build or experiment was used.
