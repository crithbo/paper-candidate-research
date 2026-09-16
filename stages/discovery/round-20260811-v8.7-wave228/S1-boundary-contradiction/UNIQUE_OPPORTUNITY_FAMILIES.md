# UNIQUE_OPPORTUNITY_FAMILIES

| ID | exact same-object contract | frozen LLVM compositional union | natural carrier/oracle | full-cost |
|---|---|---|---|---|
| U01 | Same APX MachineIR, liveness, target/subfeatures, SysV or Win64 ABI, unwind legality, values and exceptions. | X86 APX feature gating and instruction descriptions; register classes/allocatable register set; greedy/PBQP allocation, coalescing and spill decisions; callee-save/frame/PEI; post-RA pseudo expansion/scheduling; MC encoding/assembly. | LLVM test-suite integer-pressure programs; later StageA: compiler verifier, assembler acceptance, objdump encoding, unwind metadata and deterministic output. | compile CPU/RSS, text/object bytes, prefix bytes, spill/reload and save/restore counts, static throughput estimate, then hardware cycles/memory if available.

Excluded actions: a changed ABI, external rewriter, custom assembler, `-m` flag selection alone, a register-cost tweak alone, or generic ILP without a distinct compiler action.
