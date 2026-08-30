# State and Action Audit — Exceptional R3G

## Source-grounded native facts carried from frozen review material

| Fact | Scope | Audit use |
|---|---|---|
| LLVM defines `ACTIVE`, `ACTIVE_ZT0_SAVED`, `LOCAL_SAVED`, `LOCAL_COMMITTED`, `ENTRY`, `OFF` | `MachineSMEABI` | finite native action vocabulary; `LOCAL_COMMITTED` is not repurposed as a ZA-save alternative |
| `RequiresZASavePseudo` requires `LOCAL_SAVED` before its marked call | `MachineSMEABI` | call arm cannot be treated as arbitrary scheduling space |
| `ACTIVE -> LOCAL_SAVED` sets up lazy save/TPIDR2; recovery needs corresponding ABI-legal transition | LLVM/AAPCS64 | explicitly charges state and ownership changes |
| AAPCS64 dormant ZA has TPIDR2/save-buffer and normal-return/asynchronous obligations | AAPCS64 | a join cannot hide path-dependent dormant state |
| current pass assigns edge-bundle state and falls back to `ACTIVE` on mismatch | `MachineSMEABI` | strongest current composition must be compared on whole CFG action plans |
| SM change can alter legal vector state/instruction set | LLVM SME guide | typed Z/P values require legal whole-spill/reload treatment at a fixed SM boundary |

## Action catalog used for audit

1. fixed N/S/SC boundary transitions and conditional native forms;
2. `ACTIVE <-> LOCAL_SAVED` lazy-save/restore actions where supported;
3. native TPIDR2 block setup, save-buffer lifetime, ABI support calls, clear/restore/abandon actions;
4. typed Z/P virtual-role allocation plus legal scalable whole-spill/reload and fixed frame actions;
5. current `MachineSMEABI` edge-bundle selection and state-change insertion;
6. normal RA/scavenger/frame/post-RA/MC actions under unchanged fixed interface.

No action in this catalog licenses changed attributes, changed ZA ownership, non-native save protocol, altered target feature, or a value carried through a VL-changing SM boundary without an appropriate legal spill/reload.

## Gate result

`NO_COMPLETE_JOIN_CLOSED_UNION_EXTERNAL_TWO_ACTION_WITNESS`.

The candidate has individual native actions but no complete action B that both: (a) preserves the same join/exit state as action A, and (b) lies outside the full CFG-aware current composition with a non-dominated charged cost vector. This is the sole scientific disposition for the exceptional static gate.

