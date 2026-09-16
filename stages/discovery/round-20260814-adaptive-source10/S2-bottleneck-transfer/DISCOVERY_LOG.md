# Discovery log — Source10

- Assignment: DISCOVERY-S2-20260814-ADAPTIVE-SOURCE10.
- Method: V8_7_POTENTIAL_READINESS_SEPARATED; V9/claim-pack OFF.
- Date: 2026-08-14. Active-candidate and Source01–09 identities were excluded before admission.

## Raw families

| ID | Family | Fixed object / joint action | Disposition |
|---|---|---|---|
| R01 | LLVM gc.statepoint root/frame/register construction | Fixed statepoint-example GC function, target/ABI, collector-facing stackmap and observable program; choose register relocation versus documented explicit alloca root representation, slot placement and live-range realization | D1 retained; documentation supplies both root representations, but stock collector acceptance needs finite closure. |
| R02 | Windows EH funclet save/restore construction | Fixed SEH behavior/ABI | NOT_ADMITTED: exact native two-plan safety/unwind contract not frozen; no absence claim. |
| R03 | LLVM patchpoint/deopt stackmap layout | Fixed patchpoint runtime map | DROP: metadata packing/postprocess rather than a complete target-specific object constructor. |
| R04 | RISC-V Zilsd paired-memory pre-RA construction | Fixed ABI codegen | DROP: current pre-allocation optimizer and generic RA leave no specific whole action. |
| R05 | AArch64 MOPS copy lowering | Fixed memop semantics | DROP: existing selector/default action, not joint algorithm. |
| R06 | RISC-V Zicond conditional lowering/RA | Fixed executable/ABI | DROP: instruction selection choice; no non-selector target-specific construction. |

## Deep reviews

- D01/R01: conditional clean brief. Statepoint documentation distinguishes explicit alloca root records from ordinary relocated roots and says the generator must supply spill/fill. The proposed bounded algorithm couples that representation to frame/register realization while holding runtime stackmap interpretation fixed.
- D02/R02: no admission. A finite native two-plan witness was not yet nameable without guessing Windows EH semantics.

## Source/collision discipline

Official LLVM Statepoints, GarbageCollection and StackMaps documentation plus current RewriteStatepointsForGC and StackMaps source references were reviewed. Bounded primary/current-source search found no direct target-specific same-runtime FPT/Pareto constructor. SEARCH_BOUNDED_OPEN is not a novelty conclusion. No missing implementation or result was used as negative evidence.
