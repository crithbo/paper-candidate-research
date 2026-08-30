# Current Action and Frontier Audit

## Frozen current union

| Layer | Pinned source/test | Current native action | Revision disposition |
|---|---|---|---|
| VXRM abstract state | `RISCVInsertWriteVXRM.cpp::VXRMInfo` | `Static(0..3)`, `Unknown`, transient uninitialized; predecessor intersection | Fully absorbed component. |
| Local placement | `computeAvailable`, `computeAnticipated`, `emitWriteVXRM` | Forward availability, backward anticipation, earliest write emission | Fully absorbed component. |
| Pipeline-flush tuning | `RISCVFeatures.td::TuneVXRMPipelineFlush`; `vxrm-insert-out-of-loop.ll` | Allows speculative anticipated intersection/movement for flush-sensitive uarch | Must be in strongest union; not candidate N2. |
| Native write | `WriteVXRMImm`; `vxrm.mir` | `csrwi vxrm, imm`, implicit-def/use of physical `$vxrm` | Frozen action. |
| Fixed-point users | `vsmul.ll`, `vnclip.ll`, `vssra/vssrl`, `vaadd/vasub` in `vxrm-insert.ll` | MI has immediate rounding-mode operand plus implicit `$vxrm` use | Frozen legality table. |
| Call/opaque action | `computeVXRMChanges` and `emitWriteVXRM` | call, inline asm or modifier resets state to `Unknown` | Real residual boundary, not ABI-preservation proof. |
| VL/VTYPE | `RISCVInsertVSETVLI` and current RVV pipeline | Separate `vl/vtype` state/actions | Must remain fixed/equal in witness. |
| ABI | RISC-V psABI and RVV intrinsic spec | `vxrm/vxsat` not preserved; entry unspecified | Only private fixed-internal facts are admissible. |

## Native action catalogue for the witness

Allowed actions are the current MachineInstr/MC actions only: `WriteVXRMImm(1)`, RNE `PseudoVAADD*`/native `vaadd`, `PseudoVSETVLI`/native `vsetvli`, direct internal call/return, current register copies, spill/reload, stack/frame and CFI actions. The candidate adds no ISA instruction and no custom ABI; it only proposes replacing the call's unconditional `Unknown` transfer with a verified private callee summary.

Disallowed actions are explicit VXRM/VXSAT read/write intrinsics in the program, inline asm, indirect/external/recursive call summaries, per-caller clone, inlining/removing the call, custom calling convention, changed VLEN/numerics/unwind or code-object identity.

## Two-plan arithmetic

| Cost coordinate | Plan L | Plan S | Static delta |
|---|---:|---:|---:|
| `WriteVXRMImm` / `csrwi vxrm,1` | 3 | 1 | −2 |
| VXRM-write code bytes (`+v`, no `+c`) | 12 | 4 | −8 |
| RVV numeric instructions | 3 | 3 | 0 |
| direct call/return | 1/2 returns | identical | 0 |
| VSETVLI, RA, spill/frame/CFI | pinned current actions | identical by contract | 0 |
| compile CPU/RSS + summary memory | current pass | unknown positive/zero delta | not statically Pareto-certified |
| runtime/uop/flush cost | three writes | one write | target-dependent hypothesis only |

The assembly count is mechanically grounded by `vxrm-insert.ll::test3` (call causes the post-call `csrwi`) plus `vxrm.mir` and fixed-point tests (each function requiring a mode gets `WriteVXRMImm`). No run was performed in this revision.

## Frontier certificate attack

### Candidate finite representation

Every fixed native segment is a relation/matrix over five states, with an additive or Pareto cost label. At each program point, equivalent partial traces with the same current state can be merged **only after all other native actions are frozen**. This quotient preserves future VXRM legality and VXRM-write cost.

### Exact recurrence

For segment matrices `A` and `B`, exact sequential composition is

`(A ⊗ B)[i,k] = ParetoMin_j(A[i,j] + B[j,k])`.

CFG alternatives union the corresponding entries; a fixed internal direct call substitutes its callee matrix; arbitrary calls use the all-input-to-`Unknown` matrix. This computes the exact scalar optimum or complete finite Pareto frontier subject to a chosen cap.

### Fatal classification

This is the canonical weighted finite-state transducer/min-plus dataflow recurrence. It has no RVV-specific structural operation beyond table values. `HasVXRMPipelineFlush`, CSR byte cost, and RNE/RNU/RDN/ROD only alter weights and labels. A cap merely turns exact frontier enumeration into certified truncation; it does not create a target-specific guarantee.

Adding unfrozen LLVM future actions requires ordinary Cartesian product with VSETVLI/RA/scheduling/frame/layout state. A bounded projection is not proven bisimilar; the exact projection is identity-like and destroys the claimed FPT shape. Therefore the required future-native-action/full-cost preserving non-generic quotient does not exist in this packet.

## Current-union externality vs publishability

Plan S is external to the pinned current call-unknown pass on this frozen carrier. That fact is necessary but insufficient: an unimplemented action gap plus a generic solver does not satisfy N2. The strongest scientific negative evidence is the formal recurrence reduction, not lack of implementation or result.

## Audit result

- Same-object two native plans: `PASS_STATIC`
- Current-union external action point: `PASS_ACTION_LEDGER_ONLY`
- Complete full-cost Pareto point: `FAIL__COMPILE_AND_COMPOSITION_COST_UNCERTIFIED`
- Future-action/legality/full-cost preserving quotient: `FAIL__GENERIC_OR_IDENTITY_DICHOTOMY`
- RVV/LLVM-specific exact/FPT/certified recurrence: `FAIL__GENERIC_MIN_PLUS_INTERPROCEDURAL_DATAFLOW`
- Sole gate: `NOT_CLOSED`
