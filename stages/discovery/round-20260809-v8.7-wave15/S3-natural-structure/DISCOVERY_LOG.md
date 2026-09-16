# DISCOVERY LOG — DISCOVERY-S3-20260809-V8.7-WAVE15

## Closure

- Frozen cutoff: `2026-08-09`.
- Method: accepted v2/v8.1; v8.6 fidelity-plan admission; v8.7 current-upstream-reality check; baseline-residual-first.
- Scope: GPU/accelerator/compiler natural structures, excluding Wave13 gfx1250/TDM/WMMA/pipeline/cross-backend routes and all active, blocked, or terminal objects.
- Result: `COMPLETE_ZERO_PROPOSALS`.
- No experiment, compilation, benchmark, or Stage0/A/B work was performed.

## Natural carriers screened

1. Upstream LLVM Machine IR: instruction dependence, resource use, register pressure, basic-block and loop structure.
2. MLIR Transform-dialect payload programs: structured linalg/affine/vector operations, legality-bearing handles, transform sequence and tuning parameters.
3. gem5 trace and GPU-model inputs: dependency/timing annotated elastic CPU traces and the maintained AMD GPU-model configuration/workload path.

## Converged routes

| Route | Natural regularity and hypothetical complete action | Same-object strongest union / reality check | Decision |
|---|---|---|---|
| LLVM machine instruction scheduling and register pressure | Dependence DAGs often have repeated resource/pressure shapes; a candidate would construct a schedule plus register-allocation-aware resource order. | Current `MachineScheduler` already consumes liveness, register-class, block-frequency, loop, dominator, alias, and target-machine information; it runs pre-register allocation. `llc` exposes `-mcpu`, `-mtune`, `-mattr`, and allocator choices; `llvm-mca` models physical-register limit, ROB, issue width, resource groups, dependencies, and scheduling. A new choice over that space is a target-specific scheduler/controller unless it changes the target object or guarantees. | `DROP__UNION_ABSORPTION_OR_PROHIBITED_SELECTOR` |
| MLIR legality-aware schedule/cost construction | Repeated structured loop/tile/operand layouts could invite a globally legal transform construction. | Current Transform dialect already offers typed payload handles, execution-time verification, alternatives, tune knobs, SMT parameter constraints, tiling/unrolling/splitting and conversion legality. The remaining formulation is an autotuner/controller over native transforms, explicitly prohibited. | `DROP__CURRENT_UNION_ABSORPTION` |
| gem5 trace-derived memory-hierarchy action | Elastic traces preserve dependency/timing patterns that might permit a construction for cache/interconnect scheduling. | Current TraceCPU is explicitly a trace-replay model for cache hierarchy/interconnect/DRAM exploration; current gem5 GPU releases already include page-table-walker cache, real MI300X firmware, MFMA timing, and reworked dispatch scheduling. With no new same-object algorithm and no guaranteed hardware-valid transfer, this becomes simulator calibration, a cache policy/controller, or a changed object. | `DROP__NO_SAME_OBJECT_COMPLETE_N2_N3_ACTION` |

## Why no brief

No route retains a complete named action outside the deployable same-information union.  An unimplemented idea was not discarded for lacking a result: all drops arise from either direct union absorption, a prohibited selector/controller formulation, or failure to preserve same-object/native semantics.  Therefore it would be dishonest to manufacture an action-gap certificate, full-cost denominator, fidelity closure plan, or finite natural Stage A killer.

## Primary evidence

- LLVM MachineScheduler current source: https://llvm.org/doxygen/MachineScheduler_8cpp_source.html.
- LLVM `llc` current command guide: https://www.llvm.org/docs/CommandGuide/llc.html.
- LLVM `llvm-mca` current command guide: https://llvm.org/docs/CommandGuide/llvm-mca.html.
- MLIR Transform Dialect: https://mlir.llvm.org/docs/Dialects/Transform/.
- MLIR dialect/interface documentation: https://mlir.llvm.org/docs/Dialects/ and https://mlir.llvm.org/docs/Interfaces/.
- gem5 official repository/releases/docs: https://github.com/gem5/gem5 , https://github.com/gem5/gem5/releases , https://www.gem5.org/documentation/general_docs/cpu_models/TraceCPU.
