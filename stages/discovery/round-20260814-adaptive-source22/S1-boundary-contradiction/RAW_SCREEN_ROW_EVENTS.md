# Raw screen row events

| ID | Signature | Current native primitive / source fact | C0/D1 status | Disposition |
|---|---|---|---|---|
| R01 | `RISCV_ZALASR__ACQUIRE_RELEASE_ATOMIC_MAPPING__FIXED_C11_ORDERING` | GCC currently exposes `zalasr` as the RISC-V load-acquire/store-release extension; the object is language atomics under a declared target. | No C0: only target feature/mapping is frozen; no independent target-specific whole repair action, natural carrier and subtractor closure jointly exist. | `NOT_ADMITTED_UNFROZEN__TARGET_MAPPING_ONLY` |
| R02 | `OPENCL_DEVICE_ENQUEUE__CHILD_COMMAND_COMPLETION__FIXED_OPENCL_EXECUTION` | Current OpenCL C defines device enqueue only with prerequisite feature macros; the device-side command path is explicit. | No C0: candidate is command scheduling/selection, and a non-generic same-object action skeleton is not closed. | `NOT_ADMITTED_UNFROZEN__GENERIC_SCHEDULING_RISK` |
| X01 | `CUDA_MBARrier_PHASE_TOKEN__ASYNC_COPY_COMPLETION__FIXED_PHASE_SEMANTICS` | Current native primitive is known. | Excluded before raw: contained by Source21’s TMA/asynchronous-barrier identity. | `EXCLUDED__SOURCE21_CONTAINED_IDENTITY` |
| X02 | `WASM_STACK_SWITCHING__MLIR_HIGH_LEVEL_LOWERING__FIXED_WASM_EXECUTION` | Recent locator is known. | Excluded before raw: contained by Source03’s async ABI/stack-switch screening. | `EXCLUDED__SOURCE03_CONTAINED_IDENTITY` |

Reconciliation: locator=4; excluded-before-raw=2; fresh-raw=2; C0=0; D1=0; deep=0; brief=0. Since no C0 was about to enter D1, the survival-trace trigger was not met.
