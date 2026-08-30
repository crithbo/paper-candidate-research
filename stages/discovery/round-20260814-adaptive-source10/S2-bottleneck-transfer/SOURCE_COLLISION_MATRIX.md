# Source and collision matrix — Source10

| Family | Official/current snapshot | Strongest same-object union | Result |
|---|---|---|---|
| LLVM gc.statepoint root/frame/register | Statepoints and GarbageCollection docs; StackMaps format; current RewriteStatepointsForGC and StackMaps source references | gc.statepoint/relocate and RewriteStatepointsForGC + target RA/frame/prolog/epilog + StackMaps emission + stock statepoint-example runtime convention | Docs authorize explicit alloca root entries but say RewriteStatepointsForGC does not handle them and generator must make spill/fill correct. This supports a finite action hypothesis, not absence. |
| Windows EH funclet | LLVM EH/current codegen documents | current EH/frame union | two-plan native contract unfrozen |
| Patchpoint deopt maps | LLVM StackMaps | stackmap writer/parser union | metadata packing remainder |
| RISC-V Zilsd | current RISC-V target source | prealloc optimizer/RA union | direct/generic remainder |
| AArch64 MOPS | current AArch64 SelectionDAG source | UseMOPS + selector union | selector only |
| RISC-V Zicond | RISC-V user guide/current target | isel/RA union | selector only |

## Locators

- https://llvm.org/docs/Statepoints.html
- https://llvm.org/docs/GarbageCollection.html
- https://llvm.org/docs/StackMaps.html
- https://llvm.org/doxygen/structllvm_1_1RewriteStatepointsForGC.html
- https://llvm.org/docs/doxygen/RewriteStatepointsForGC_8cpp.html
- https://llvm.org/doxygen/classllvm_1_1StackMaps.html

No conclusion relies on an issue, old release note, or future-work wording.
