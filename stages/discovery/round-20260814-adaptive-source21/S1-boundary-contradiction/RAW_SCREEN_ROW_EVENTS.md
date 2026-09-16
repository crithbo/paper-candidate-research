# Raw screen row events

| ID | Family | Affirmative native primitive / cliff | C0 | D1 / disposition |
|---|---|---|---|---|
| R01 | `RISCV_ZICOND__BRANCHLESS_CONDITIONAL_LOWERING__FIXED_PROGRAM_RESULT` | Zicond supplies native integer conditional operations under a fixed program result. | C0-1: current GCC declares `zicond` and upstream patch set includes dedicated support/tests. | `DROP__CURRENT_TARGET_LOWERING_UNION_OR_GENERIC_IF_CONVERSION` |
| R02 | `CUDA_MBARrier_PHASE_TOKEN__ASYNC_COPY_COMPLETION__FIXED_PHASE_SEMANTICS` | Barrier arrival tokens, countdown/reset and phase-completion are explicit CUDA state primitives. | C0-2: current CUDA documents token/phase legality and explicit async-copy transaction tracking. | `EXCLUDED__HISTORICAL_TMA_ASYNC_BARRIER_CONTAINED_IDENTITY` |
| R03 | `SPIRV_RELAXED_PRECISION__CROSS_STAGE_VALUE__FIXED_OUTPUT_PRECISION` | SPIR-V carries explicit relaxed-precision decorations at a producer/consumer boundary. | Not needed. | `DROP__CHANGED_ERROR_OR_PRECISION_GUARANTEE` |
| R04 | `WASM_STACK_SWITCHING__MLIR_HIGH_LEVEL_LOWERING__FIXED_WASM_EXECUTION` | WAMI’s recent MLIR work uses Wasm stack switching as a high-level lowering case. | Not needed. | `EXCLUDED__SOURCE03_ASYNC_ABI_CONTAINED_IDENTITY` |

Fresh raw count is 2 (R01/R03); two other locators were excluded before fresh admission. Neither fresh row reaches D1.
