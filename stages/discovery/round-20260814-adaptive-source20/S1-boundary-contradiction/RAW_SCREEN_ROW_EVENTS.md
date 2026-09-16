# Raw screen row events

| ID | Family signature | Recent anchor + current source subtraction | D1 | Disposition |
|---|---|---|---|---|
| R01 | `WASM_MLIR_STACK_SWITCHING__HIGH_LEVEL_LOWERING__FIXED_WASM_EXECUTION` | WAMI (2025) uses stack switching as a case study, but Source03 already screened the Wasm async/stack-switch ABI seam. | N/A | `EXCLUDED__SOURCE03_CONTAINED_IDENTITY` |
| R02 | `WASM_LAZY_VALIDATION__FIRST_INVOCATION_TRAP__FIXED_MODULE_VALIDITY` | Current Wasm 3.0 implementation-limitations specification permits delayed function validation but requires validation before execution. | No | `NOT_ADMITTED_UNFROZEN__NO_NON_GENERIC_WHOLE_ACTION` |
| R03 | `RISCV_ACCEL_MICROKERNEL_BACKEND__CUSTOM_EXTENSION_LOWERING__FIXED_KERNEL_RESULT` | A 2025 multi-level RISC-V microkernel-backend paper motivates ISA-specialized lowering; GCC/LLVM target unions are its direct current subtractors. | No | `NOT_ADMITTED_UNFROZEN__TARGET_SELECTION_OR_GENERIC_BACKEND_CONSTRUCTION` |
| R04 | `OPENMP_DYNAMIC_SHARED_MEMORY__TARGET_RUNTIME_ALLOCATION__FIXED_TARGET_REGION_SEMANTICS` | Current LLVM OpenMP docs define `dyn_groupprivate` and native dynamic-shared-memory extension paths. | No | `DROP__CURRENT_DEVICE_RUNTIME_UNION_AND_DIRECTIVE_SELECTOR` |
| R05 | `CUDA_MEMORY_SYNC_DOMAIN__CUMULATIVITY_BOUNDARY__FIXED_CUDA_MEMORY_MODEL` | Current NVIDIA documentation explicitly models domains/default mapping/system-scope cross-domain rule; Source19 already screened this identical family. | N/A | `EXCLUDED__SOURCE19_IDENTITY` |
| R06 | `AARCH64_FPMR_FP8__CALL_BOUNDARY_STATE_WRITE__FIXED_FP8_RESULT_AND_ABI` | Current Arm ABI plus current GCC redundant-write elimination was Source19’s D1 and direct collision. | N/A | `EXCLUDED__SOURCE19_IDENTITY` |

Only R02–R04 are fresh raw families. None reaches pre-outcome D1; unused capacity expires.
