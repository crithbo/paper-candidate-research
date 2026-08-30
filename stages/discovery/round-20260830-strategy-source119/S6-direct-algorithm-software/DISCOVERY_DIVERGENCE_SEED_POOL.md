# Discovery Divergence Seed Pool — Source119 S6

## Pool metadata

- Assignment / lane: `DISCOVERY-S6-20260830-SOURCE119-DIRECT-ALGORITHM-SOFTWARE` / `DISCOVERY_S6`
- Frozen profile: `O7 direct target-specific compiler/runtime/kernel algorithms beyond configuration tuning`
- Seed ceiling: `<=12`; actual: `10`
- RQ candidate ceiling: `<=8`; selected: `8`
- Network-security exclusion check: `PASS`
- Generation completed before evidence lookup: `YES`
- Freeze timestamp: `2026-08-30T02:20:00+08:00`
- Evidence disclaimer: all entries are non-evidence hunches; no novelty, current-absence, Q2, or feasibility claim is made.

## Seed records

### S119-S6-SEED-01 — DeepGEMM masked grouped-GEMM work queue
- Engine / perspective: `PROBLEM_REFRAMING` / `KERNEL_ENGINEER`
- Anchor candidate: `deepseek-ai/DeepGEMM` current official repository.
- Idea: treat dynamic masked grouped GEMM as a work-queue construction problem whose item order and tile ownership preserve exact output semantics. Test whether a target-native queue compaction/reordering action survives beyond existing grouped-GEMM scheduling and configuration tuning.
- Counterfactual decision: choose a queue topology/order, not a launch parameter.
- Generic/current-union risk: high; current scheduler may already express the action.
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`.

### S119-S6-SEED-02 — FlashInfer incremental planner state
- Engine / perspective: `COMPOSE_DECOMPOSE_SIMPLIFY` / `RUNTIME_MAINTAINER`
- Anchor candidate: `flashinfer-ai/flashinfer` current BatchDecode/BatchPrefill planner APIs.
- Idea: avoid rebuilding an entire ragged/paged-attention plan when only a bounded subset of request/page metadata changes. The putative action is delta maintenance of native plan state under identical attention semantics.
- Counterfactual decision: update versus rebuild a plan object.
- Generic/current-union risk: high; plan caching or graph reuse may already absorb it.
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`.

### S119-S6-SEED-03 — PyTorch FlexAttention BlockMask delta maintenance
- Engine / perspective: `NATURAL_STRUCTURE` / `COMPILER_OR_BACKEND_ENGINEER`
- Anchor candidate: PyTorch FlexAttention `BlockMask` current official API/source.
- Idea: for a mask changed by a bounded prefix/window edit, incrementally update the block-sparse representation while preserving exact mask semantics. The action must be an exact target-native data-structure update, not predicate recompilation tuning.
- Counterfactual decision: delta-update versus full BlockMask recreation.
- Generic/current-union risk: current APIs may expose only creation or already implement equivalent reuse.
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`.

### S119-S6-SEED-04 — FlashAttention paged-KV split ownership
- Engine / perspective: `CONSTRAINT_MANIPULATION` / `KERNEL_ENGINEER`
- Anchor candidate: `Dao-AILab/flash-attention` current paged-KV / split-KV decode path.
- Idea: make split ownership depend on current page-table/run topology while preserving exact attention and deterministic reduction semantics. The action must differ from choosing `num_splits` or ordinary occupancy tuning.
- Counterfactual decision: topology-aware tile-to-split ownership.
- Generic/current-union risk: very high; current split-KV scheduler may already express it.
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`.

### S119-S6-SEED-05 — CUTLASS grouped-GEMM persistent tile reassignment
- Engine / perspective: `ADJACENT_POSSIBLE_OR_BOUNDARY` / `KERNEL_ENGINEER`
- Anchor candidate: NVIDIA CUTLASS current grouped/persistent GEMM scheduler.
- Idea: use group-shape skew to reassign persistent tiles without changing GEMM semantics or pruning work. The residual must be a new scheduler data structure, not configuration search.
- Counterfactual decision: tile ownership and queue advancement.
- Generic/current-union risk: extreme because earlier CUTLASS current-union routes were absorbed.
- Preliminary disposition: `KEEP_FOR_CONVERGENCE_WITH_HISTORY_RISK`.

### S119-S6-SEED-06 — llama.cpp graph-partition reuse under microbatch change
- Engine / perspective: `COMPOSE_DECOMPOSE_SIMPLIFY` / `RUNTIME_MAINTAINER`
- Anchor candidate: `ggml-org/llama.cpp` current graph construction/splitting source.
- Idea: preserve reusable graph partitions across bounded microbatch or KV-position changes while rebuilding only affected partitions. The action is structural graph-delta reuse, not thread/batch tuning.
- Counterfactual decision: partial graph rebuild versus full graph reconstruction.
- Generic/current-union risk: high; prior llama.cpp CPU/offload sources were saturated, but this action/endpoint is distinct pending exact identity check.
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`.

### S119-S6-SEED-07 — TensorRT-LLM overlap scheduler dependency frontier
- Engine / perspective: `PROBLEM_REFRAMING` / `RUNTIME_MAINTAINER`
- Anchor candidate: NVIDIA TensorRT-LLM current overlap scheduler.
- Idea: maintain a minimal dependency frontier for reusable communication/compute overlap across changing request batches while preserving execution semantics. The action must change dependency maintenance complexity, not toggle overlap or tune streams.
- Counterfactual decision: incremental dependency-frontier update.
- Generic/current-union risk: high; Source109 covered TensorRT-LLM broadly.
- Preliminary disposition: `KEEP_FOR_CONVERGENCE_WITH_HISTORY_RISK`.

### S119-S6-SEED-08 — torchao packed-weight transform cache composition
- Engine / perspective: `ABSTRACTION_LADDER` / `KERNEL_ENGINEER`
- Anchor candidate: PyTorch torchao current low-bit packing/linear implementation.
- Idea: represent compatible packing transforms as composable cached views so multiple target kernels reuse exact packed storage without duplicate transformations. The action must preserve bit-exact values and count cache/transform memory.
- Counterfactual decision: materialize a new pack versus reuse/compose an exact transform view.
- Generic/current-union risk: high; may collapse to ordinary memoization or existing layout objects.
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`.

### S119-S6-SEED-09 — Triton W4A16 legality-aware search
- Engine / perspective: `ADJACENT_POSSIBLE_OR_BOUNDARY` / `COMPILER_OR_BACKEND_ENGINEER`
- Anchor candidate: Triton W4A16 lowering/search.
- Idea: couple legality constraints to search-state dominance for W4A16 kernels.
- Identity risk: exact/contained risk from active `QREFINE-TRITON-W4A16` and repeated Triton current-union work.
- Preliminary disposition: `ACTIVE_OR_STOP_IDENTITY__BACKLOG_NOT_SELECTED`.

### S119-S6-SEED-10 — TileLang/ThunderKittens kernel-corpus planner
- Engine / perspective: `BISOCIATION_STRUCTURAL_TRANSFER` / `KERNEL_ENGINEER`
- Anchor candidate: TileLang/ThunderKittens public kernel DSLs.
- Idea: use corpus structure to select target-native templates.
- Identity risk: Source111 explicitly covered these surfaces; action remains generic template selection.
- Preliminary disposition: `LITERAL_PREDECESSOR_FAMILY_RISK__BACKLOG_NOT_SELECTED`.

## Clustering and convergence

| Cluster | Seed IDs | Shared object/mechanism | Representative |
|---|---|---|---|
| Dynamic kernel work ownership | 01, 04, 05 | exact tile/work assignment under fixed math | 01 |
| Incremental runtime/compiler state | 02, 03, 06, 07 | delta maintenance under bounded input-state change | 03 |
| Low-bit representation reuse | 08, 09 | bit-exact transform/search structure | 08 |
| Repeated DSL/template surface | 10 | template selection | 10 |

| Selected seed | Coverage reason | RQ ID |
|---|---|---|
| 01 | MoE/grouped-GEMM work ownership | S119-S6-RQ01 |
| 02 | native attention plan delta maintenance | S119-S6-RQ02 |
| 03 | compiler-visible sparse mask data structure | S119-S6-RQ03 |
| 04 | paged-KV decode kernel ownership | S119-S6-RQ04 |
| 05 | strongest generic/current scheduler subtractor | S119-S6-RQ05 |
| 06 | graph construction delta reuse | S119-S6-RQ06 |
| 07 | runtime dependency-frontier data structure | S119-S6-RQ07 |
| 08 | bit-exact packed-layout reuse | S119-S6-RQ08 |

Seeds 09–10 remain non-evidence backlog and are not eligible for result-aware replacement.
