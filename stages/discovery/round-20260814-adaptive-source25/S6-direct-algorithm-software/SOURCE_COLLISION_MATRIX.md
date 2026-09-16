# Source and collision matrix

| Card | Primary natural/canonical origin | Current first-party union | Strongest contrary/subtractor | Disposition |
|---|---|---|---|---|
| QC-01 RVV VSETVLI | [OpenBLAS 0.3.33](https://www.openmathlib.org/OpenBLAS/) | [LLVM RISCVInsertVSETVLI](https://www.llvm.org/docs/doxygen/RISCVInsertVSETVLI_8cpp_source.html): dataflow + PRE + mutation + coalescing | Same current pass | Current direct absorption |
| QC-02 SME scope | [LLVM SME semantics](https://www.llvm.org/docs/AArch64SME.html) | ABI/attribute/lowering restrictions | Same ABI semantics | Locator-only; same-object not frozen |
| QC-03 mixed precision | SuiteSparse carrier sketch | no source closure | generic solver/precision methods | Locator-only |
| QC-04 AArch64 ld/st | carrier incomplete | [current pass](https://llvm.org/doxygen/AArch64LoadStoreOptimizer_8cpp.html) | same local optimizer | Locator-only |
| QC-05 trace overlap | carrier incomplete | no source closure | generic scheduling | Locator-only |

Search is bounded; there is no absence or priority claim.
