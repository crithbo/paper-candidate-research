# UNIQUE_OPPORTUNITY_FAMILIES — Wave261

## U01 — LoongArch PC-relative base/offset, RA and linker-relaxation joint construction

**Exact object.** A fixed LA64 LLVM MachineIR trace, liveness, target features, ABI/calling convention, code/relocation model, unwind outcome, symbols and input/output/exception semantics. It includes a PC-relative data/address reference admitted by the LoongArch ELF ABI. Changing relocation semantics, ABI, code model, linker, or using manual post-processing changes the object.

**Candidate action sketch.** For each PC-relative reference, choose one of the already legal materialization/relocation forms; decide whether its base remains live across later pressure/call points; choose register/coalesce/spill actions; preserve linker-relaxation legality. This is a *screening sketch*, not an admitted algorithm.

**Strongest union.** LLVM `cfcdf93...`: ISel; default `MergeBaseOffset` and its `-loongarch-enable-merge-offset` counterflag; generic greedy/PBQP RA, coalescing, spilling and PEI; target pseudo expansion; pre-emit branch relaxation; MC/object emission. GCC's explicit-reloc/relax flag family and binutils-gdb `a80fede...` relaxation path are external same-object subtractors. Current GCC commit was not acquired because the official git endpoint returned 429.

**Natural finite route.** Public LLVM LoongArch codegen tests and GCC tests with PC-relative references; LLVM verifier plus assembler/object/objdump, relocation and unwind oracle. Full cost: compile/link CPU and RSS, text/object/relocation bytes, base temporaries, spills/copies/frame, and instruction/static-uop terms. No route was run.
