# Unique opportunity family

## F1 — BOLT multiscale layout/relaxation joint N2

**Fixed contract.** Same input binary, profile, ISA, ABI, exported symbols, relocations, exception/unwind semantics, and stock loader-visible behavior. The rewritten binary must be valid and functionally equivalent; changing profile/object, applying an external postprocessor, or using a generic ILP is excluded.

**Complete joint action hypothesis.** Select basic-block chains, function order, hot/cold partition, alignment/padding, and target-legal branch relaxation/island placement; regenerate all dependent addresses, relocations, debug/unwind artifacts, and rewrite output. A genuine N2 could use only these known actions, but must state a new joint approximation/complexity or multi-objective guarantee under rewrite, size, startup, i-cache, and branch costs.

**Static action-divergence witness.** For two hot functions each containing a conditional branch with a cold successor, one legal output may place both hot chains contiguously and split cold blocks; another may interleave their function layouts while retaining valid branches/relocations. The outputs preserve ABI and program behavior but alter layout, fall-through, padding, and potentially branch-distance choices. This proves feasible multiscale choice, not a residual certificate.

**Reason no brief.** BOLT already composes block reordering, function reordering, splitting and profile use, while LLVM owns branch-relaxation/trampoline machinery. BOLT’s official README names a combined invocation using those options. The direct literature includes BOLT, ext-tsp, and Codestitcher. This review did not close the current commit-level pass order, all default/nondefault options, target-specific relaxation/island behavior, or a guarantee that is not absorbed by existing composition. Therefore no grounded proposal is justified.

**Natural/fidelity route.** Public LLVM Test-Suite or other public ELF binaries with their matching public profiles can supply a limited carrier. The preclaim gate would use stock loader and ELF/unwind validation plus fixed functional tests; it would not alter the profile or binary contract.
