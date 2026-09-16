# Raw screen row events

| ID | Exact public carrier (version/date) | Same-object problem / contribution type | C0 | Disposition |
|---|---|---|---|---|
| R01 | RISC-V Architectural Certification Tests (`riscv/riscv-arch-test`, current supported snapshot checked 2026-08-14) | Fixed Zama16b misaligned-atomic ISA behavior on self-checking ELF tests; `SYSTEM_ARCHITECTURE` | C0-1: ISA/config/Sail oracle and finite ELF witness exist, but the candidate action is only ordinary atomic lowering/form choice. | `NOT_ADMITTED_UNFROZEN__NO_TARGET_SPECIFIC_CROSS_LAYER_ACTION` |
| R02 | Embench IoT `embench-1.0` stable tag (public; carrier metadata checked 2026-08-14) | Fixed embedded-C program result and RISC-V Zilsd load/store-pair target; `COMPILER_TOOL` | C0-2: natural programs, semantics and assembly oracle exist, but any action is existing instruction selection/RA/cost tuning. | `DROP__CURRENT_COMPILER_UNION_OR_GENERIC_FORM_SELECTION` |
| R03 | ONNX Model Zoo public repository snapshot checked 2026-08-14 | Serialized model plus supplied test tensors; `SYSTEM_ARCHITECTURE` | No C0: Model Zoo LFS assets were retired July 2025, so an exact current carrier route is not frozen from this repository alone. | `NOT_ADMITTED_UNFROZEN__CARRIER_ROUTE_NOT_CLOSED` |
| R04 | Hailo Model Zoo public repository snapshot checked 2026-08-14 | ONNX/TF model and precompiled HEF artifact behavior; `SYSTEM_ARCHITECTURE` | No C0: viable intervention is runtime/deployment plan selection and has controller risk. | `NOT_ADMITTED_UNFROZEN__CONTROLLER_SELECTOR_RISK` |

Reconciliation: 4 locators = 4 fresh raw; 2 type-specific C0; 0 D1; 0 deep; 0 survival traces; 0 briefs. No excluded row is counted as raw or C0.
