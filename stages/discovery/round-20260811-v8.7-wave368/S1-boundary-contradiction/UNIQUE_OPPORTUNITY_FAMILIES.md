# Unique opportunity families

| Family | Official current recovery contract | Potential-first determination |
|---|---|---|
| PCIe AER | Error detection, quiesce, optional MMIO enable/reset, driver recovery result, then resume or permanent failure. | The output is selected by participating driver callbacks; a joint callback plan is a controller, so it has no N2 shape. |
| NVMe reset | Fault injection can force controller-reset/reinitialization outcomes. | Finite source/oracle closure is possible, but no non-controller same-object action or guarantee was named. |
| DRM scheduler | Stop scheduler, reset GPU, resubmit jobs, restart scheduler. | Existing recovery state machine already owns the action; resubmission scheduling is absorbed. |
| SCSI/devlink/CXL/reset-controller/PA-RISC | Native fault/reset surfaces exist. | At least one of same-object native action, target-specific guarantee, or finite current-union closure is missing. |

No family justified a `FINITE_FIDELITY_GAP` proposal: such a proposal needs a named contribution shape, not merely a future source-reading task.
