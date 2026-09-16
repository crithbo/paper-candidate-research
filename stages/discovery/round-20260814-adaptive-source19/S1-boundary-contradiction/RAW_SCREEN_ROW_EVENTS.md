# Raw screen row events

| ID | Fresh family signature | Problem anchor and current fact | Pre-outcome D1 | Disposition |
|---|---|---|---|---|
| R01 | `CUDA_MEMSYNC_DOMAIN__CUMULATIVITY_FENCE_INTERFERENCE__FIXED_CUDA_MEMORY_MODEL` | Hopper domains make device-scope ordering domain-local and require system scope across domains; default/remote launch attributes and mapping are explicitly exposed. | No; apparent residual is application launch-domain selection, disallowed as configuration/controller. | `DROP__CONFIGURATION_SELECTOR_ONLY` |
| R02 | `OPENCL_SVM_SCOPE__HOST_DEVICE_VISIBILITY__FIXED_OPENCL_ATOMIC_SEMANTICS` | OpenCL specifies device/all-SVM scope capabilities and queue synchronization behavior for SVM atomic visibility. | No; alternative is a scope/memory-mode choice, not a target-specific whole action. | `NOT_ADMITTED_UNFROZEN__MODE_SELECTOR_ONLY` |
| R03 | `RISCV_ZTSO__ATOMIC_MAPPING__FIXED_C11_ORDERING_CONTRACT` | Ztso changes legal atomic lowering under a fixed C/C++ ordering contract; GCC exposes it in `-march`. | No; this is a previously established ISA mapping and target feature selection; no independent N2 witness. | `DROP__CURRENT_TARGET_MAPPING_UNION_ABSORBS` |
| R04 | `AARCH64_FPMR_FP8__CALL_BOUNDARY_STATE_WRITE__FIXED_FP8_RESULT_AND_ABI` | FP8 instructions use caller-saved FPMR; repeated same-mode kernel calls create a concrete state-write versus conditional-preservation tension. | Yes; same FP8 values/ABI with unconditional versus conditional FPMR write is a native legal two-action witness. | `DEEP_DIVE_REQUIRED` |
| R05 | `WASM_EXCEPTION_TAG__ENGINE_RUNTIME_UNWIND__FIXED_MODULE_EXCEPTION_SEMANTICS` | Wasm exception tags have a current validation/execution/binary contract. | No; no target-specific non-controller whole action survives beyond engine lowering/runtime implementation. | `NOT_ADMITTED_UNFROZEN__NO_NON_GENERIC_N2_ACTION` |
| R06 | `SPARC_REGISTER_WINDOW__CALL_RESTORE_STATE__FIXED_SVR4_FUNCTION_SEMANTICS` | Register-window save/restore is an ABI-state boundary in non-mainstream ISA code generation. | No; bounded source set lacks a frozen current compiler/runtime union and finite same-object construction route. | `NOT_ADMITTED_UNFROZEN__CURRENT_UNION_NOT_CLOSED` |

No raw row is a Source17/18 identity or a network-security object.
