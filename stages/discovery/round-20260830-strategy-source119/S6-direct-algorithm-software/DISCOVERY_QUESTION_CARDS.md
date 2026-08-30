# Source119 S6 — Canonical Question Cards

All current-source identities are `current main/master viewed 2026-08-30` unless a source exposes a more specific revision. `NO_MATCH` is never treated as novelty or absence.

## RQ01 — DeepGEMM masked grouped-GEMM compact work queue
- Exact identity/carrier: `deepseek-ai/DeepGEMM`, `csrc/apis/gemm.hpp`; `IMPLEMENTATION_CARRIER_ONLY`.
- Same-object contract: masked/contiguous grouped FP8/FP4 GEMM, identical output/dtype and complete tile work.
- Endpoint/counterfactual: target-native scheduling data structure; choose compact/reordered work queue rather than existing grouped layout dispatch.
- Current locus: APIs expose `grouped_layout`, `masked_m`, `expected_m` and architecture-specific grouped dispatch, but retrieved locus does not close tile-ownership implementation.
- Non-generic discriminator: not source-supported within the bound.
- Minimum falsifier: current implementation already maps masked group rows/tiles with equivalent compact queue, or residual is launch/configuration tuning.
- Full cost: queue build, metadata transforms/copies, launches, synchronization, workspace.
- Disposition: `LOCATOR_ONLY`; `RAW_REQUIRED=INCOMPLETE`; no current-absence claim.

## RQ02 — FlashInfer incremental planner state
- Exact identity/carrier: `flashinfer-ai/flashinfer`, `flashinfer/decode.py`, `BatchDecodeWithPagedKVCacheWrapper`; `IMPLEMENTATION_CARRIER_ONLY`.
- Same-object contract: identical paged-KV decode semantics and backend eligibility.
- Endpoint/counterfactual: update native plan state for bounded page/request changes versus complete replan.
- Current locus: wrapper and paged-KV planner surface verified; retrieved excerpt does not establish persistent-field mutation/reuse semantics.
- Non-generic discriminator: unclosed.
- Minimum falsifier: current wrapper already reuses/updates the same plan state, or no stable native state exists.
- Full cost: CPU planning, metadata transfer, workspace, CUDA-graph compatibility, memory.
- Disposition: `SOURCE_CLOSURE_QUEUE__OPEN_BOUNDED`; no remaining calls in this assignment.

## RQ03 — FlexAttention BlockMask delta maintenance
- Exact identity/carrier: PyTorch main `torch/nn/attention/flex_attention.py`; `IMPLEMENTATION_CARRIER_ONLY`.
- Exact object: `BlockMask` ordered block indices/counts, transpose-derived Q-side metadata, and exact `mask_mod` semantics.
- Endpoint/counterfactual: update affected sparse-index rows for a bounded prefix/window edit rather than recreate the whole BlockMask.
- Current locus and contrary evidence: `BlockMask.__getitem__`, `_adjust`, `_adjust_num_blocks_and_indices`, `_dense_to_ordered`, `_transpose_ordered`, and `from_kv_blocks` already provide slicing/length adjustment and reconstruction. Length-only/pure slicing residual is directly subtracted.
- Preliminary residual: an arbitrary bounded sliding-window/prefix-boundary edit requiring coordinated KV/Q ordered-index delta maintenance; not proven absent and not yet a claim.
- Non-generic discriminator: exact dual ordered-index invariants plus `mask_mod`/full-block semantics; falsified if current helpers compose to the same update or if generic sparse-index maintenance is sufficient.
- Minimum falsifier: a current native composition that updates the affected rows/transpose exactly, or no canonical evolving-mask carrier.
- Initial full cost: update detection, sparse index mutation/sort, transpose maintenance, compilation/device transfer, memory, and kernel compatibility.
- Bounded debt: canonical evolving-mask workload; current helper composition audit; strongest recent implementation/paper; small equivalence checker.
- Disposition: `EVIDENCE_QUALIFIED_RAW`; `Eligible for C0: YES`.

## RQ04 — FlashAttention paged-KV split ownership
- Exact identity/carrier: official `Dao-AILab/flash-attention` repository; current source symbol for split ownership not obtained.
- Contract: exact paged-KV attention/reduction semantics.
- Endpoint: page-run-topology-aware tile-to-split ownership, distinct from `num_splits` tuning.
- Minimum falsifier: native split-KV scheduler already consumes equivalent topology or the action is only a split-count knob.
- Disposition: `SOURCE_CLOSURE_QUEUE__OPEN_BOUNDED`; exact action/source locus missing; no absence inference.

## RQ05 — CUTLASS skew-aware persistent tile reassignment
- Exact identity/carrier: NVIDIA CUTLASS `grouped_scheduler.md`; `IMPLEMENTATION_CARRIER_ONLY`.
- Positive current-union evidence: persistent problem visitor assigns tiles; `kDeviceOnly` and `kHostPrecompute` represent device/host schedules; problem sorting targets K-skew load balance and is reported as workload-dependent.
- Frozen action relation: same tile ownership, host/device precomputation, and skew/load-balance endpoint are already native current mechanisms. No distinct source-supported data structure survived.
- Disposition: `EXCLUDED_BEFORE_RAW__CURRENT_NATIVE_UNION_ABSORPTION`; this is not a topic/registry STOP.

## RQ06 — llama.cpp partial graph delta reuse
- Exact identity/carrier: `ggml-org/llama.cpp`, `src/llama-graph.h`; `IMPLEMENTATION_CARRIER_ONLY`.
- Positive current-union evidence: `llm_graph_params::allow_reuse`, per-input `can_reuse`, `llm_graph_result::can_reuse`, topology/ubatch/sequence/output checks, and input/memory-context update paths explicitly reuse an identical graph.
- Frozen action relation: bounded microbatch/KV-position reuse and input rebinding are already native. A beyond-topology-change partial rebuild was not independently specified and would be an outcome-aware stronger RQ.
- Disposition: `EXCLUDED_BEFORE_RAW__DIRECT_SUBTRACT_NO_FROZEN_RESIDUAL`; not a topic/registry STOP.

## RQ07 — TensorRT-LLM incremental dependency frontier
- Exact identity/carrier: official NVIDIA TensorRT-LLM repository root; exact overlap scheduler source not located within bound.
- Contract/endpoint: identical runtime DAG; incrementally maintain target-specific dependency frontier across bounded batch changes.
- Non-generic discriminator and current union: unclosed.
- Minimum falsifier: native overlap scheduler already maintains equivalent dependencies, or residual is generic DAG scheduling.
- Disposition: `LOCATOR_ONLY`; no absence or novelty inference.

## RQ08 — torchao composable packed-layout views
- Exact identity/carrier: official PyTorch/ao RFC #391 and current project source; `IMPLEMENTATION_CARRIER_ONLY`.
- Positive current-union evidence: `AffineQuantizedTensor` stores `layout_tensor`; layout classes expose `from_plain`/`get_plain`; registered layouts and dispatch conditions support different target-specific packings.
- Preliminary residual: compose two compatible bit-exact packing transforms without rematerializing, while sharing invalidation/accounting across kernels.
- Non-generic discriminator: would require a source-supported algebra of compatible layouts and exact view legality, not generic memoization; not yet present in evidence.
- Minimum falsifier: existing layout registry/constructor already provides equivalent composition, or every target packing requires materialization.
- Full cost: packing, cache memory, transform composition, invalidation, serialization, dispatch and kernel compatibility.
- Bounded debt: exact pair of compatible current layouts; bit-exact composition law; natural model/kernel pair; strongest current cache/layout baseline.
- Disposition: `EVIDENCE_QUALIFIED_RAW`; `Eligible for C0: YES`.

## Funnel counts

- Non-evidence seeds: 10
- Selected primary RQ candidates: 8
- Unique opportunity families: 8
- Excluded before raw: 2
- Locator/source-closure only: 4
- Evidence-qualified raw: 2
- Candidate-grade deep review: 2
- Clean Stage0 brief: 0
