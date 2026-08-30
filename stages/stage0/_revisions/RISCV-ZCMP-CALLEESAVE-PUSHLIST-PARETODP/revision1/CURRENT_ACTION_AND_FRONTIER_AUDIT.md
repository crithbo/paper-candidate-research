# Current Action and Frontier Audit — Zcmp Revision 1

## Immutable source boundary

- LLVM GitHub current-main commit-list head observed 2026-08-14: `ba5bccf` (immutable abbreviated upstream commit locator; full commit/blob retention is a Stage A fidelity prerequisite).
- Contract: RV32IMAC+Zcmp, ILP32, fixed no-FP/no-dynamic-frame/no-shadow-stack/no-save-restore-libcall function class.
- Sources: current `RISCVFrameLowering.cpp`, `RISCVPushPopOptimizer.cpp`, `RISCVTargetMachine.cpp`, and ratified Zcmp specification.

## Native action catalog

| Action | Included current path | Boundary |
|---|---|---|
| CSR color / spill / reload | GPR RA plus frame allocation | candidate may choose only stock native realization |
| fixed CSR prefix | FrameLowering fixed CSR map + `getNumPushPopRegs` | no arbitrary saved-set or `s10` exception bypass |
| pushability / list / adjustment | `RISCVMachineFunctionInfo::isPushable`, Zcmp table, `CM_PUSH` | preserve list-dependent stack adjustment |
| CFI and frame layout | `determineFrameLayout`, frame setup/destroy, CFI builder | ABI/unwind is part of state, not afterthought |
| POPRET | late PushPop on existing POP adjacent to `PseudoRET` | cannot serve as a pre-RA decision action |
| pseudo expansion | after PushPop in target pipeline | must be matched by each plan |
| libcall branch | FrameLowering save/restore branch | excluded from fixed witness, included in strongest union |

## Witness action map

| Component | Plan P | Plan S | Current-union relation |
|---|---|---|---|
| pre-RA coloring | `%x→s0`, `%y→s1` | `%x→s0`, `%y→spill` | current RA supplies actions but no bounded exact frontier guarantee |
| fixed Zcmp prefix | `{ra,s0-s1}` | `{ra,s0}` | both obey fixed list grammar |
| stack adjustment | 16 | 32 | both list-dependent legal native forms |
| frame/CFI | three CSR recoveries | two CSR recoveries + ordinary spill | all current FrameLowering obligations included |
| exit lowering | existing pop eligible for POPRET | same | late optimizer is absorbed |

## Why the state is not generic RA

The certificate must track the fixed ordered Zcmp prefix and the grammar-induced adjustment/CFI relation. A generic coloring state cannot decide whether a chosen set is encodable as one Zcmp rlist, whether its adjustment admits residual native spill slots, whether the `s10` exception is hit, or whether future FrameLowering/PushPop/pseudo expansion preserve unwind and the declared cost. Conversely, arbitrary non-critical register identity is discarded only after its complete current-native continuation is frozen, so the state does not claim general allocation optimality.

## No-gain map

- Any candidate path reproduced by the complete current configuration union is removed.
- Any plan needing non-prefix list, changed ABI, artificial CFI, post-emission patch, different source semantics or excluded control is rejected.
- Any proof that reduces state to generic register coloring/stack packing triggers `BELOW_Q2_STOP__GENERIC_REGISTER_ALLOCATION_FRAME_PACKING_OR_CURRENT_ZCMP_UNION_ABSORPTION`.
- Any missing full commit/blob at the first Stage A claim-bearing run blocks that run; it does not alter this static Stage0 certificate.
