# Discovery Divergence Seed Pool
+
## Pool metadata
+
- Assignment / lane: DISCOVERY-S6-20260823-SEGMENTED-SCALE-W4A16-PROMOTION-CLOSURE / S6.
- Frozen profile: vLLM 568afb3a, AMD gfx1151, dense W4A16 M=16, GPTQ-sequential G=32.
- Generation completed before new evidence lookup: YES.
- Network-security exclusion check: PASS.
+
## Seed record S6-SEGMENTED-SCALE-M16-01
+
- Engine: CONSTRAINT_MANIPULATION plus COMPOSE_DECOMPOSE_SIMPLIFY.
- Perspective: COMPILER_OR_BACKEND_ENGINEER.
- Exact anchor: public vLLM commit 568afb3a13806beb53bb2e6bd518269357b237c0 and its M=16 RDNA hybrid/W4A16 sources.
- Idea: the production one-group-per-K-tile invariant is correct, but it forces BLOCK_K=32 when the group is 32. A legal compiler schedule could make group index a constexpr segment dimension, stage q group-scale vectors, and bind each 32-K subsegment to its own scale before one larger logical K tile completes.
- Cautious conclusion: a target-specific compiler/code-generation schedule with a semantics-preservation invariant and static resource frontier; not first block scaling, cross-vendor generality, or automatic scale-byte reduction.
- Counterfactual: if no static frontier survives register/occupancy accounting, the current clamp remains the fair baseline.
- Generic/current-union risk: high; configuration-only or generic block-scaling reformulation is inadmissible.
- Preliminary disposition: KEEP_FOR_CONVERGENCE.
+
## Convergence
+
| Selected seed | Why retained | Intended boundary | RQ candidate |
|---|---|---|---|
| S6-SEGMENTED-SCALE-M16-01 | Exact target, source loci, same-function invariant and current one-group clamp are fixed. | Dense M=16 W4A16 on gfx1151 only. | RQ-S6-SEGMENTED-SCALE-M16-01 |
+
No other seed was created: this is a promotion closure, not a breadth quota.
