# Candidate-grade deep review — D01

## Current source contract and direct subtractors

LLVM’s RVV documentation fixes four vector register classes: `VR`, `VRM2`, `VRM4`, and `VRM8`, with aligned group starts; masks use `VR`, and some operands require `VRNoV0`. LLVM performs vector RA before `RISCVInsertVSETVLI`; the latter deliberately runs afterwards and may emit additional vector pseudos for spilling/rematerialization. This phase separation is a current strongest-composition fact, not an absence claim.

The 2024 LLVM partial-spill RFC is a direct subtractor: it replaces a whole-register spill/reload with typed unit-stride forms when only a partial vector is needed, but explicitly acknowledges that the typed form may force a `vset*` and does not support some inline-assembly cases. GCC public material records dynamic LMUL selection from register-pressure estimation. Neither establishes a same-MachineIR bounded-trace algorithm jointly choosing aligned LMUL-group placements, mask-window reservation, spill representation and future vtype setup cost.

## Static action-divergence witness

Let W be an acyclic MachineIR trace with a live `VRM8` value `G`, a short-lived fractional-EMUL value `T`, and a masked vector operation requiring `v0` before `T`’s next use. The legal alternatives are:

1. retain `G` in an aligned `VRM8` block, reserve `v0` for the mask window, whole-register spill/reload `T` (`vs1r/vl1r`) and avoid a new vtype setup;
2. retain the same `G` and mask semantics but use typed partial spill/reload for `T`, adding a compatible `vset*` when required; or
3. choose a different legal aligned group/spill target before the mask window.

LLVM’s vector RA cannot account for the subsequently inserted `vset*` during its allocation decision; the local partial-spill transform decides only after that group/mask allocation. A joint objective can prefer (1) or (2) under different `(spill-bytes, vset-count, mask-move)` budgets. The alternatives have identical source-level semantics, VLEN, ABI, and vtype legality. This is a scheduling/representation divergence, not a changed action set.

## Proposed N2 — RVV Group-Mask Spill Pareto DP (RVV-GMSP)

**Input.** An acyclic RVV MachineIR trace with fixed liveness, legal LMUL/SEW/segment forms, fixed VLEN/target, mask windows, existing vtype requirements and a bounded cost vector `(bytes, vset, spill, mask-move, frame)`.

**State.** At instruction `i`, the DP state is `(O, M, V, S, q)`: `O` is a 32-bit vector-register occupancy bitmap constrained to aligned LMUL group intervals; `M` records `v0` reservation/availability over live mask windows; `V` is the compatible current `vtype` class required by the last selected form; `S` records live spilled values and their whole-register versus typed representation; `q` is the bounded Pareto cost. Symmetry reduction canonicalizes equivalent unoccupied aligned groups.

**Transitions.** Enumerate only LLVM/RVV-legal current actions: allocate a `VR/VRM2/VRM4/VRM8` group, use a permitted non-`v0` group, emit/reuse a compatible `vset*`, choose whole-register or typed spill/reload, and satisfy existing segment/ABI/frame constraints. Illegal overlap, v0 masking, or vtype transitions are rejected. Equal structural states retain only nondominated `q` values.

**Guarantee.** For a trace with maximum `w` live vector groups and finite vtype classes `H`, RVV-GMSP returns every nondominated legal realization for the stated local action table. Its time is fixed-parameter in `w` and `H`, bounded by `O(n · 2^32_restricted(w) · H · F · Q)`; after occupied-group and alignment symmetry reduction the explored occupancy set is only feasible placements of the at-most-`w` live groups, not arbitrary instruction schedules. Memory is the retained frontier. The exact implementation bound is to be checked at StageA.

**No-gain boundary.** If there is no mask window, all values are `VR`, no partial vector is spilled, and no alternative vtype transition exists, GMSP emits the same form class as the current composition. Loops/cyclic CFG joins, inline assembly, changed LMUL/VLEN semantics, and interprocedural allocation are outside the initial claim.

This is not a generic ILP or a scalar pressure threshold: it is a finite RVV state machine over aligned LMUL intervals, `v0` exclusivity, and typed-versus-whole spill semantics coupled to future `vset*` legality.

## Fairness and finite StageA killer

The strongest baseline is the complete current LLVM RVV pipeline, including vector-first RA, current spill lowering and `RISCVInsertVSETVLI`; not an isolated allocator. GCC dynamic-LMUL and existing RVV algorithms are external subtractors. Full cost includes compiler CPU/RSS, code bytes, vset count, vector memory traffic, mask moves, scalable frame, static uops and later runtime.

Within 72 hours: (1) select 10–20 public LLVM test-suite/RVV-spec high-pressure traces; (2) pin LLVM source and validate the legal action table using compiler/assembler/disassembly and vtype/ABI oracle; (3) prototype trace-level GMSP only; (4) stop if any selected action fails legality or if every Pareto point equals current LLVM on `(bytes,vset,spills,mask moves)`; (5) stop if a direct source/paper collision supplies the identical GMSP state and guarantee. Hardware/simulator access changes only the evidence ceiling.

## Verdict

`PROPOSE_STAGE0` — `TIER_B_Q2_VIABLE` conditional on the finite closure. `current_evidence_readiness: READY_TO_CLOSE_IN_STAGEA`. No implementation or positive result is claimed.
