# Candidate-grade deep reviews

## R01 — CUDA SM90a pipeline lifetime: `STRUCTURAL_DROP__CURRENT_PIPELINE_LIFETIME_UNION`

The fixed object retains exact tensor output, layout, bounds behavior and SM90a ISA. CUDA's current producer-consumer asynchronous-copy model already provides staged shared-memory buffers, barrier-tracked completion and release/reuse timing. A changed stage count or barrier order is configuration; a different tensor map/layout changes semantics. Natural official kernels have an output/bounds oracle. Full cost includes compilation, tensor-map setup, copy traffic, barriers, shared allocation, register pressure and launch. A ≤72h killer would enumerate legal current stage/barrier variants for fixed kernels and fail on encoding equivalence; it is not run because the alleged lifetime action is already represented.

## R02 — CUTLASS SM90a double-buffering: `STRUCTURAL_DROP__CURRENT_SMEM_RMEM_LIFETIME_UNION`

CUTLASS documents software pipelining and double buffering of shared-memory tiles and register fragments precisely to trade latency hiding against occupancy/register budget. Its collective schedules express producer/consumer roles, TMA/GMMA and staged buffer lifetimes. The same-object oracle is exact reference GEMM/convolution output. Full cost charges compile/JIT, tensor-map setup, global/shared/register movement, synchronization, occupancy/spill effect, epilogue and launch. A finite killer would map a purported allocation interval to current stage/buffer objects on a fixed reference corpus; no unmatched interval is frozen.

## R03 — CUTLASS SM100a TMEM lifetime: `STRUCTURAL_DROP__CURRENT_TMEM_ALLOCATOR_PIPELINE_UNION`

SM100a is a separate target from SM90a. Its current source explicitly exposes TMEM as a distinct first-class locale, allocation column constraints, staged TMA-SMEM buffers, TMEM/RMEM copies and two-CTA deallocation barriers. The documented `TmemAllocator` owns allocation, retrieve, and deallocation coordination. A packing change within those rules is an existing configuration; violating column or barrier constraints is illegal; moving the construction to another ISA changes object. Output reference check is the oracle, and the full denominator includes compile, TMEM allocation/deallocation, shared/register use, barriers and launch. The ≤72h killer is legal allocator replay under fixed SM100a tests; it would fail immediately on expressibility.

## R04 — Triton resource partition: `STRUCTURAL_DROP__CURRENT_IR_LIFETIME_UNION`

Triton's `tl.range` exposes stage count and accumulator multi-buffer control, while its warp-specialization IR includes producer groups and commit edges. These primitives already encode lifetime partitioning and the required synchronization; role/stage changes are configuration, not a new complete constructor. Target gating (Hopper-or-newer or Blackwell-only, depending on feature) is part of same-object legality. Output oracle is the fixed kernel. Full cost includes compile/lowering, shared memory, register pressure, warp count, synchronization and launch. A finite killer maps all claimed live intervals and release edges to existing IR operations; none remains outside.

All four closures are current-union/legality conclusions. No resource limitation, unavailable hardware, implementation status, result, or AI readiness is used as a negative inference.
