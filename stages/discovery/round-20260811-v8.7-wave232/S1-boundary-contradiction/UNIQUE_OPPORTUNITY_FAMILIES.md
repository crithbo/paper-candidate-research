# UNIQUE_OPPORTUNITY_FAMILIES

| ID | exact object / guarantee | strongest fair composition | natural carrier/oracle | full cost |
|---|---|---|---|---|
| U01 | A fixed LLVM `de8cb59` APX MachineFunction/hot trace with identical 32/64-bit values, flags/exception behavior, target subfeatures, ABI/frame/unwind legality and externally observable program behavior. | LLVM APX instruction selection’s NDD-first policy, RA coalescing/spill decisions, PEI/frame, post-RA compression/scheduling and MC emission; GCC APX compiler as external method subtractor; binutils assembler/objdump as legality oracle. | Public LLVM test-suite integer-pressure kernels and compiler regression tests; StageA compiler verifier, assembler/objdump bytes, unwind metadata, deterministic output and later llvm-mca/hardware route. | compile CPU/RSS; text/object/prefix bytes; moves, spills/reloads, callee-save/frame bytes; static uop/frontend estimate; later cycles and memory.

The contribution candidate is an algorithm over known actions, not an ISA extension, target flag, external postprocessor, or changed calling convention.
