# Candidate-grade structural review

## AArch64 SVE/SME joint stateful code generation

Fixed object: the same LLVM IR, target triple, ABI and SVE/SME feature set compiled to behaviorally equivalent AArch64 code accepted by stock assembler/linker. N2 shape: a target-specific bounded-state DP/certified Pareto frontier jointly chooses SME streaming/ZA lifetime, predicate/vector-register placement, and spills/reloads. State contains live ZA slices, streaming-mode boundaries and predicate pressure, so it is not generic register allocation.

Fair union is current LLVM AArch64 lowering, selection, RA, scavenging/spilling and post-RA scheduling at equal features/optimization. Current source and direct-collision status is `SEARCH_BOUNDED_OPEN`; it is a finite Stage0 closure, not a novelty claim. Natural route: LLVM test-suite and public SVE/SME MIR/IR; stock semantic tests plus assembler/linker oracle. Full cost: compile CPU/wall/RSS/temp, object bytes, static spills/instructions and feature-transition cost; runtime only after a public route is pinned.

Fidelity/72-hour killer: pin an LLVM commit and flags; construct two legal MIR witnesses with ZA/predicate pressure; enumerate baseline union; implement a finite local-state prototype; fail if no legal action divergence, baseline expresses the full frontier, or compile/static costs erase every Pareto point. `structural_paper_potential=TIER_B_Q2_VIABLE`; `current_evidence_readiness=FINITE_FIDELITY_GAP`.
