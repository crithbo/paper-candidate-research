# Raw-screen row events — Source49 S6

| Event | Candidate | Event disposition | Reason |
|---|---|---|---|
| E01 | LLVM RVC compressed register/form/copy/spill construction | `EXCLUDED_BEFORE_RAW__FROZEN_DIRECT_CURRENT_COLLISION` | Wave246/Source246 exact identity and CC'23 direct same-object collision. |
| E02 | AArch64 load/store pairing/renaming | `EXCLUDED_BEFORE_RAW__EXACT_COOLING_IDENTITY` | Source26 exact identity; no external evidence delta. |
| E03 | x86 separate shrink-wrap | `EXCLUDED_BEFORE_RAW__EXACT_COOLING_IDENTITY` | Source42 exact identity; no external evidence delta. |
| E04 | MachineOutliner, AArch64 CCMP, RVV-VXRM, GCC ICF, RISC-V redundant-copy surfaces | `EXCLUDED_BEFORE_RAW__IDENTITY_OR_TERMINAL_CONTAINMENT` | Each has a frozen exact or terminal record listed in the preflight. |

No new raw exists, so `RAW_TO_STAGE0_OWNERSHIP_BRIDGE_V1` has no disposition instance to assign.  No row was discarded because of implementation, result, resource, or AI readiness.
