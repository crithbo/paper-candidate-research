# LLVM GC root representation — Q1/Q2 calibration

- Stage: `STAGE0`
- Quality tier if the single gate closes: `TIER_B_Q2_VIABLE`
- Status: `PARITY_CONDITIONAL`

| Role | Verified anchor | Relevance |
|---|---|---|
| Contribution/domain anchor | LLVM *Garbage Collection Safepoints* design documentation | Defines relocating statepoints, root update and explicit alloca-root form. |
| Implementation/evaluation anchor | LLVM *StackMaps* documentation | Defines live-value location records and runtime reader contract. |
| Boundary anchor | LLVM *Garbage Collection* documentation | Marks custom lowering/collector treatment as an implementation-contract boundary. |
| Negative anchor | Current RewriteStatepointsForGC behavior | Explicit alloca handling is not provided by the utility pass; it is a finite fidelity risk, not absence evidence. |

| Dimension | Candidate after closure | Present gap | Disposition |
|---|---|---|---|
| Problem | relocating-GC safepoint codegen under fixed reader | one collector not pinned | revision |
| N2 | bounded joint representation/frame/register frontier | exact recurrence unprovided | revision |
| Baseline | complete LLVM/collector/RA/frame/stackmap union | action map unprovided | revision |
| Evidence | same-collector two-plan legality then natural statepoint corpus | no accepted witness | revision |
| Full cost | compiler + frame/spill/code/stackmap/runtime reader ledger | not yet bound | Stage A |
| Reproducibility | pinned sources, IR, collector and reader | full source/blob pins pending | revision |

The matrix calibrates paper shape, not novelty.  It does not treat missing
implementation or results as a negative result.
