# Global identity preflight

Assignment: `DISCOVERY-S1-20260815-ADAPTIVE-SOURCE45-CANONICAL-BASELINE-AFTER-BRIDGE-V1`  
Completed: 2026-08-15. This is a five-field containment check, not a novelty claim.

| Seed / proposed object | Five-field signature (object; action/estimator; endpoint; guarantee; full cost) | Historical / active comparison | Relation | Disposition |
|---|---|---|---|---|
| RQ01 — x86 strict floating-point environment | fixed x86-64 strict-FP program; choose dynamic-MXCSR versus embedded-rounding forms across calls; bit/exceptions/fenv endpoint; C/LLVM strict FP; code+transition+runtime cost | no matching local identity found outside this assignment | `NO_MATCH__NOT_NOVELTY_EVIDENCE` | eligible for source check |
| RQ02 — PowerPC MMA accumulator lifetime | fixed PowerPC MMA MachineFunction/ABI; joint accumulator/spill/call construction; matrix-result endpoint; ABI semantics; compile+code+spill/runtime cost | active `PPC-MMA-JOINT-ACCUMULATOR-CONSTRUCTION` Stage 0 package, object `FIXED_POWERPC_MMA_MACHINEFUNCTION__ABI__MATRIX_RESULT` | `EXACT_ACTIVE_IDENTITY` | `EXCLUDED_BEFORE_RAW__ACTIVE_IDENTITY` |
| RQ03 — AArch64 SVE FFR across call | fixed SVE first-fault program/call; preserve fault-observation state; first-fault observation endpoint; AAPCS64; save/restore+code/runtime cost | no matching local identity found outside this assignment | `NO_MATCH__NOT_NOVELTY_EVIDENCE` | eligible for source check |
| S04 — deoptimization continuation control | LLVM stackmap/deopt reconstruction | Source16 LLVM stackmap/deopt family | `TERMINAL_CONTAINS` | excluded at seed level |
| S05 — Wasm component stack switching | engine/ABI async stack-switching | Source03 Wasm engine ABI family | `TERMINAL_CONTAINS` | excluded at seed level |
| S06 — RISC-V Zicond lowering | conditional-zero lowering/cost construction | Source21/32 Zicond families | `TERMINAL_CONTAINS` | excluded at seed level |

The mandated non-reopen set was also checked: Source43 Swift async/byref/AMDGPU and Source44 RVV VXRM do not match either RQ01 or RQ03 on exact object and action. They were not reopened.
