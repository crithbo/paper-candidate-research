# D01 — PPC Prefix-Pressure Pareto DP

LLVM marks prefixed instructions explicitly and exposes both `isPrefixed` and instruction-size queries. The static witness is a fixed PC-relative load/address: prefixed form has an eight-byte class and avoids an address virtual register; non-prefixed materialization has a multi-instruction class and creates a live temporary whose pressure can cause copies/spills. Neither changes semantics or ABI.

**Algorithm.** For an acyclic hot trace, state `(i,L,A,q)` records live virtuals, address-temporary residency and a Pareto vector `(bytes,relocs,temporary-spills,uops)`. Each addressable operation transitions over only legal target forms: prefixed PC-relative, prefixed displacement, or non-prefixed materialize-and-use; then updates legal RA/coalescing/spill actions. Symmetric physical-register names are quotiented. It returns the nondominated frontier under a declared budget.

**Guarantee.** For max live pressure `w` and finite form set `F`, the DP is exact for the trace action table in `O(n·F·3^w·Q)` retained Pareto states. No-gain: no legal prefixed alternative, or no address-temporary pressure, returns current form class. Cyclic CFG, changed reloc semantics, ABI changes, generic ILP and post-link rewriting are excluded.

LLVM currently has prefixed form flags/size machinery and generic RA, but the inspected direct literature/current material does not state this target-specific form-plus-address-live-range Pareto algorithm or guarantee. It is not a scalar instruction-size tweak because it retains form, relocation and temporary-liveness state jointly.

72h killer: pin LLVM; validate 10–20 public PowerPC tests with assembler/objdump/relocation and unwind oracle; stop if every frontier point matches full current LLVM `(bytes,relocs,spills,uops)` or the form table is illegal. No experiment was run.

Verdict: `PROPOSE_STAGE0`, conditional `TIER_B_Q2_VIABLE`, `READY_TO_CLOSE_IN_STAGEA`.
