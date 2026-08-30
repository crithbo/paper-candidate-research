# RQ candidates — Source58 S2

All primary questions were frozen before the targeted source results below. No alternative RQ was needed because each selected seed had one fixed object and guarantee envelope.

| ID | Primary same-object question | Type / route | Minimum falsifier | Pre-evidence status |
|---|---|---|---|---|
| RQ-S58-01 | For a fixed profiled ELF executable, can a target-specific whole code-layout plus unwind-metadata constructor improve layout/full-cost while preserving stock unwinding, beyond BOLT's native composition? | `COMPILER_TOOL`, possible N2 | Current BOLT already jointly updates the associated metadata for its layout actions. | ORDINARY_CLOSURE |
| RQ-S58-02 | For a fixed OpenMP target program and value semantics, can a target-specific mapping-plus-transfer constructor improve full cost beyond current `libomptarget` semantics, without becoming a map/config selector? | `SYSTEM_ARCHITECTURE`, possible N2 | The only differentiator is a map-clause or runtime-flag choice. | ORDINARY_CLOSURE |
| RQ-S58-03 | For a fixed Level Zero module/device target, can module link/load construction be jointly optimized by a target-specific algorithm while retaining stock module semantics? | `COMPILER_TOOL`, possible N2 | The current action cannot be fixed to one project/version because API loader and vendor driver co-own construction. | ORDINARY_CLOSURE |

All three are `RQ_READY_FOR_ORDINARY_CLOSURE`, not evidence-qualified raw and not paper claims.
