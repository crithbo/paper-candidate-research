# Candidate-grade deep reviews

## R01 — CUDA SM90 TMA: `STRUCTURAL_DROP__CURRENT_TMA_PIPELINE_UNION`

Exact object: one SM90 kernel with identical output, layout, and CUDA bounds semantics. NVIDIA's current programming guide already specifies multidimensional TMA/bulk tensor async copies, tensor-map construction, and producer-consumer synchronization. A different stage count/barrier placement or tile schedule is a current pipeline configuration; a different tensor map/layout changes the contract. The same-object oracle is output plus defined bounds behavior. Full cost includes tensor-map encoding, global-to-shared movement, barriers, shared-memory allocation, register pressure, and launch. A ≤72h killer would compile a fixed official kernel set against every legal current TMA pipeline and fail if the purported static action is expressible; no run is triggered because it is expressible.

## R02 — CUTLASS SM90 collective: `STRUCTURAL_DROP__CURRENT_COLLECTIVE_SCHEDULE_UNION`

The current `CollectiveMma` union deliberately composes tiled MMA/copy atoms, TMA/GMMA mainloops, stage count, cluster shape, and TMA warp-specialized, pingpong, or cooperative schedules. Those are exactly the proposed joint scheduling/data-movement/reuse axes. The same-object oracle is CUTLASS reference GEMM/convolution output under fixed dtype/layout. The denominator charges compile/JIT, tensor-map setup, shared memory, registers/occupancy, synchronization, grid scheduling, and epilogue. A finite killer is a fixed suite of CUTLASS reference kernels with current schedule variants; it fails on equivalent schedule encoding. No union-external static action exists.

## R03 — CUTLASS Blackwell SM100: `STRUCTURAL_DROP__TARGET_LOCAL_CURRENT_TMEM_UNION`

For a fixed SM100 target, current CUTLASS documents target-local TCGen05, TMEM accumulator access/double buffering, CLC scheduling, and Blackwell collective variants. This is not evidence for SM90 TMA, and the inverse is also false. Within SM100, the alleged reuse/scheduling action is already in the target-local union; changing target, instruction, dtype, or output accuracy fails same-object. Reference check plus exact dtype/layout is the oracle. Full cost includes code generation, TMEM/register/shared-memory footprint, synchronization, CLC scheduling and launch. A ≤72h killer would use matching SM100 tests and stop if the action maps to an existing collective; it does.

## R04 — Triton warp specialization: `STRUCTURAL_DROP__CURRENT_WARP_SPECIALIZATION_IR_UNION`

Triton already represents producer/consumer groups, buffer commits and lowering to warp specialization; its documented target conditions are Hopper-or-newer for the tutorial and Blackwell-only for automatic loop `warp_specialize` on simple matmul loops. These feature gates are part of the contract. A split differing only by roles, partitioning, stages, or synchronization is an existing IR/configuration choice; transferring it to an unsupported target changes object. The output oracle is the fixed Triton kernel. Full cost includes compilation/lowering, synchronization, shared memory and increased register/warp pressure. A finite killer is mapping the proposed groups/commit edges to existing `nvws` operations; no unmatched edge was frozen.

Conclusion: all four deep reviews close by direct official current-union absorption, not because hardware, implementation, outcome, or AI readiness is missing.
