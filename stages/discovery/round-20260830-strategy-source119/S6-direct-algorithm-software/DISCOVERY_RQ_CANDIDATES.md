# Source119 S6 — Frozen Primary RQ Candidates

- Freeze timestamp: `2026-08-30T02:20:00+08:00`
- Frozen before first external source call: `YES`
- Optional alternative RQs: none; each entry has one primary RQ.
- Outcome-aware reformulation/backfill: forbidden.

## S119-S6-RQ01
- Seed: `S119-S6-SEED-01`
- Primary RQ: For current DeepGEMM masked grouped GEMM with identical output semantics, can a target-native compact work-queue representation reduce scheduling/launch overhead across skewed group shapes beyond existing grouped-GEMM scheduling and configuration tuning?
- Immutable contract: same GEMM outputs/dtypes; no dropped tiles; include queue construction, metadata, launches, synchronization, and workspace.
- Contribution hypothesis: `METHOD_ALGORITHM / N2`.
- Minimum falsifier: current official scheduler already implements equivalent queue compaction/reordering, or the residual is only parameter tuning.
- Precommitted roles: `ANCHOR` official repo/source; `CURRENT` current scheduler; `CONTRARY` CUTLASS/current grouped GEMM; `ESCAPE` persistent work-queue terminology.

## S119-S6-RQ02
- Seed: `S119-S6-SEED-02`
- Primary RQ: For current FlashInfer batched ragged/paged attention with identical attention semantics, can bounded request/page-table changes update native planner state incrementally with lower full cost than rebuilding the plan?
- Immutable contract: identical attention outputs and backend eligibility; include update/replan CPU time, metadata copies, workspace, graph compatibility, and memory.
- Contribution hypothesis: `COMPILER_TOOL / N2`.
- Minimum falsifier: current plan APIs already support equivalent incremental updates/caching, or no persistent native state exists.
- Precommitted roles: official planner docs/source; contrary current plan cache/graph lifecycle; escape dynamic graph/data-structure maintenance.

## S119-S6-RQ03
- Seed: `S119-S6-SEED-03`
- Primary RQ: For current PyTorch FlexAttention with an exact BlockMask changed by a bounded prefix or sliding-window edit, can a target-native delta update preserve identical mask semantics at lower full cost than recreating the BlockMask?
- Immutable contract: exact allowed-attention relation; include compilation, metadata, device transfers, memory, and downstream kernel compatibility.
- Contribution hypothesis: `COMPILER_TOOL / N2`.
- Minimum falsifier: current BlockMask objects already expose equivalent delta/reuse, or updates require changing the mask contract.
- Precommitted roles: official API/source; contrary current creation/reuse mechanisms; escape incremental sparse-index maintenance.

## S119-S6-RQ04
- Seed: `S119-S6-SEED-04`
- Primary RQ: For current FlashAttention paged-KV decode with identical attention and reduction semantics, can page-run topology determine a non-tuning tile-to-split ownership algorithm that improves skewed-batch full cost?
- Immutable contract: same outputs/tolerance and page table; count planning, metadata, workspace, and reduction.
- Contribution hypothesis: `METHOD_ALGORITHM / N2`.
- Minimum falsifier: current split-KV scheduling already uses equivalent topology, or proposed action reduces to `num_splits` tuning.
- Precommitted roles: official source/release; contrary native split-KV scheduler; escape irregular segmented-reduction scheduling.

## S119-S6-RQ05
- Seed: `S119-S6-SEED-05`
- Primary RQ: For current CUTLASS grouped persistent GEMM with unchanged GEMM semantics, can group-shape skew drive a new persistent tile-reassignment data structure with lower full cost than the strongest native scheduler?
- Immutable contract: no work pruning or changed precision; count host planning, queue state, synchronization, workspace, and launches.
- Contribution hypothesis: `METHOD_ALGORITHM / N2`.
- Minimum falsifier: current CUTLASS scheduler already expresses skew-aware reassignment or residual is a scheduling knob.
- Precommitted roles: official CUTLASS source/docs; contrary native grouped scheduler; escape work stealing/persistent queue.

## S119-S6-RQ06
- Seed: `S119-S6-SEED-06`
- Primary RQ: For current llama.cpp graph construction under bounded microbatch or KV-position changes, can exact unaffected graph partitions be reused through a native delta data structure at lower full cost than full graph reconstruction?
- Immutable contract: same model graph/results and backend decisions; include dependency validation, rebuild time, memory, and invalidation.
- Contribution hypothesis: `COMPILER_TOOL / N2`.
- Minimum falsifier: current graph cache/reuse already implements equivalent partial rebuild, or partition validity cannot be checked finitely.
- Precommitted roles: official graph source; contrary current cache/split mechanisms; escape incremental compilation/build systems.

## S119-S6-RQ07
- Seed: `S119-S6-SEED-07`
- Primary RQ: For current TensorRT-LLM overlap scheduling with fixed execution semantics, can a minimal dependency-frontier data structure be maintained across bounded batch changes to reduce scheduler full cost beyond toggles or stream tuning?
- Immutable contract: same operation dependencies/results; include frontier maintenance, events, streams, synchronization, and memory.
- Contribution hypothesis: `SYSTEM_ARCHITECTURE / N2`.
- Minimum falsifier: native overlap scheduler already maintains an equivalent frontier, or the residual is generic DAG scheduling without a target-specific action.
- Precommitted roles: official source/docs; contrary native overlap scheduler; escape incremental DAG scheduling.

## S119-S6-RQ08
- Seed: `S119-S6-SEED-08`
- Primary RQ: For current torchao low-bit linear operators with bit-exact semantics, can compatible packing transforms be composed as cached target-native views to avoid duplicate materializations at lower full cost?
- Immutable contract: bit-exact unpacked weights/output contract; include transform time, cache memory, invalidation, and kernel compatibility.
- Contribution hypothesis: `COMPILER_TOOL / N2`.
- Minimum falsifier: current layout/packing abstractions already express equivalent composition, or the residual is generic memoization.
- Precommitted roles: official source/docs; contrary current packed-layout cache; escape exact layout-view composition.

## FINER-lite scheduling

All eight are `CONDITIONAL` on exact current-source closure, `HIGH` novelty-threat priority, ethical/scope `PASS`, and relevant only if the atomic action survives current union and changes a concrete native decision. No compensatory score is used.
