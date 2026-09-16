# UNIQUE_OPPORTUNITY_FAMILIES

| ID | exact contract | strongest current composition | natural route / oracle | full cost |
|---|---|---|---|---|
| U01 | Same RVV MachineIR, vector liveness, VLEN and ISA target; same vtype semantics, ABI, masks, output and exceptions. | LLVM vector-first RA; LMUL register classes and `VRNoV0`; RA hints/spills; `RISCVInsertVSETVLI` after vector RA; later scalar RA, pseudo expansion and MC. Current/2024 partial-spill work is a direct local-spill subtractor. GCC dynamic LMUL selection and existing RVV compiler papers are external method subtractors. | Public LLVM test-suite RVV intrinsic/vectorized loops and RISC-V ratified high-pressure examples; later compiler verifier, RVV assembler/disassembly, vtype/ABI check, deterministic execution on CPU/simulator. | compile CPU/RSS; text bytes; `vset*` count; vector spill/reload bytes and count; mask moves; stack/scalable-frame use; static uops; runtime/cycles/memory when available.

No code-generation action outside legal current RVV forms is proposed.
