# S2 adaptive-source02 — saturation-aware canonical discovery

Method is v8.7 canonical, V9 OFF. Telemetry separates the one carry-forward rescreen from five fresh screens; no proposal quota was applied.

## Action-promise / disposition table

| row | class | family | nonbinding joint-action promise | primary disposition |
|---|---|---|---|---|
| C01 | rescreen | MLIR n-D vector lowering / register-pressure | Choose nested/flatten/mixed representation, legal casts and unroll granularity jointly under a target register-unit bound, with an exact Pareto/DP guarantee on a bounded vector-expression tree. | `PROPOSE_STAGE0` — finite closure gap, not an implementation/result claim. |
| F01 | fresh | LLVM VPlan factor/UF / register usage | Jointly choose vector factor/unroll and register budget. | DROP: VPlan already models plans, costs and register usage; the stated action is inside the current union. |
| F02 | fresh | MLIR x86 AMX tile lowering / configuration | Joint tile shape/configuration and load/store placement. | NOT_ADMITTED_UNFROZEN: same-object action/stock union beyond existing tile ops was not frozen. |
| F03 | fresh | MLIR XeGPU shared-memory / GRF-layout lowering | Jointly choose legal block-map, shared-memory staging and GRF representation at the XeGPU-to-XeVM boundary. | NOT_ADMITTED_UNFROZEN: current XeGPU/XeVM lowering and a target-specific, non-generic guarantee were not closed in this bounded screen. |
| F04 | fresh | LLVM OpenMP map/async runtime | Joint compile map and runtime transfer ordering. | DROP: existing map/nowait/depend/plugin actions; remainder is controller. |
| F05 | fresh | MLIR SPIR-V cooperative-matrix lowering / subgroup footprint | Jointly choose legal cooperative-matrix tiling, subgroup representation and memory staging under a fixed SPIR-V interface. | NOT_ADMITTED_UNFROZEN: the complete current conversion/configuration union and a non-generic same-interface guarantee remain to be frozen. |

Counts: raw=6; rescreen=1; fresh=5; unique fresh=5; repeats=0; deep=3 (C01/F01/F02); clean briefs=1. No row was replaced for outcome.
