# Discovery log — Source09

- Assignment: DISCOVERY-S2-20260814-ADAPTIVE-SOURCE09
- Canonical method: V8_7_POTENTIAL_READINESS_SEPARATED; V9/claim-pack: OFF.
- Date: 2026-08-14. Scope excludes active HWASan, DWARF, StackClash, GlobalISel and MLIR identities.

## Six raw opportunity families

| ID | Family | Fixed object / residual action | Initial finding |
|---|---|---|---|
| R01 | RISC-V Zcmp callee-save/push-pop joint construction | Fixed RV32/RV64 ABI, MachineIR, executable behavior and unwind; choose callee-save allocation together with legal cm.push/cm.pop register-list and stack-adjust realization | D1; two native legal plans are nameable and current PushPop optimizer is post-RA. |
| R02 | AArch64 MOPS memop lowering/register pressure | Fixed memcpy/memmove/memset target | DROP: documented current aarch64-use-mops lowering is a native selector; no non-selector joint action frozen. |
| R03 | RISC-V Zacas atomic lowering/ABI state | Fixed atomic semantics and ABI | DROP: current Zacas ABI-fix and late atomic expansion are direct native union facets; no separate construction identified. |
| R04 | RISC-V gp relaxation/address materialization | Fixed static executable and symbol model | NOT_ADMITTED: current mrelax/LLD relaxation is configuration/linker selection; residual was generic placement. |
| R05 | CFI type metadata/basic-block sections | Fixed LTO C++ executable and CFI behavior | DROP: repeats generic layout remainder established in Source08. |
| R06 | CHERI capability bound/codegen | Fixed capability ABI program | EXCLUDED_REPEATED: historical CHERI family already screened. |

## Depth

- D01/R01 retained: target-specific Zcmp opcode restricts legal register-list/stack-adjust states, while LLVM source places PushPop optimization after allocation. It is a conditional clean brief with finite union and two-plan witness closure.
- D02/R02 dropped: current MOPS action is explicitly a lowering switch; no whole algorithm remains.

No implementation, benchmark, resource outcome, or AI-readiness conclusion was used as a scientific filter.
