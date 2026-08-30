# Raw screen row events

| ID | Fresh recovery/boundary family | Result |
|---|---|---|
| R01 | Linux PCIe AER hierarchy recovery | `STRUCTURAL_DROP`: the published action space is driver callback coordination (`CAN_RECOVER`/`NEED_RESET`/etc.), i.e. controller logic under a platform-owned recovery state machine. |
| R02 | Linux NVMe controller-reset reinitialization | `NOT_ADMITTED_UNFROZEN`: fault-injection/reinit oracle exists, but a same-object non-controller N2 and full current queue/reset union were not frozen. |
| R03 | DRM GPU scheduler reset/resubmit | `STRUCTURAL_DROP`: stop/reset/resubmit/start is current scheduler recovery; residual queue choice is scheduling/control. |
| R04 | SCSI error-handling callbacks | `STRUCTURAL_DROP`: low-level driver callback sequence is a recovery controller; no target-specific whole construction isolated. |
| R05 | Linux devlink health reporter recovery | `STRUCTURAL_DROP`: recovery is explicitly reporter configuration and callback policy. |
| R06 | CXL poisoned-memory handling | `NOT_ADMITTED_UNFROZEN`: natural error state exists but complete kernel/firmware union and CPU-only same-object oracle were not closed. |
| R07 | Linux reset-controller consumer state | `NOT_ADMITTED_UNFROZEN`: reset API is not a replay/checker-backed recovery object under fixed observable semantics. |
| R08 | PA-RISC HPMC recovery | `NOT_ADMITTED_UNFROZEN`: official architecture route is available, but current emulator/kernel union and a target-specific algorithm shape are not frozen. |

QUIC and prior/history objects were excluded. No raw row was promoted merely because a failure callback or reset transition exists.
