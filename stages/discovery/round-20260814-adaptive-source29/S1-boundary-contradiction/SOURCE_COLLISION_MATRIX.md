# Source / Collision Matrix

| Family | Same-object contract | Current-source and contrary result | Direct collision result | Canonical disposition |
|---|---|---|---|---|
| `RISCV_ZFINX__FIXED_ABI__INTERPROCEDURAL_VALUE_PLACEMENT` | The proposed F-ABI program must retain ABI and visible semantics. | Official Zfinx v1.0 states that F and Zfinx software are incompatible and that Zfinx uses integer registers. LLVM currently supports Zfinx. | The ISA-level contradiction is prior to a paper-level residual search: the claimed fixed-ABI object cannot be held. | `EXCLUDED_BEFORE_RAW__CHANGED_OBJECT_OR_GENERIC_KERNEL` |
| `WASM_MEMORY64__FIXED_HOST_ABI__CROSS_BOUNDARY_REPRESENTATION` | A fixed Wasmtime host ABI, module/component semantics, and boundary representation. | The official memory64 core draft does not define the intended host ABI. No bounded current-source closure pinned the corresponding Wasmtime source/configuration union. | No direct-collision claim made; paper search is deferred until the exact engine object exists. | `LOCATOR_ONLY__PUBLIC_EVIDENCE_UNCLOSED` |

Source28 exact families were checked as a cooldown control. Neither `RISCV_BF16__FIXED_NUMERIC_CONTRACT__CROSS_FUNCTION_CONVERSION_PLACEMENT` nor `SPIRV_PHYSICAL_STORAGE_BUFFER__POINTER_LAYOUT_METADATA__VALIDATION_ABI`, nor the contract-listed AMX/UPMEM/NVDLA identities, appears in this batch.
