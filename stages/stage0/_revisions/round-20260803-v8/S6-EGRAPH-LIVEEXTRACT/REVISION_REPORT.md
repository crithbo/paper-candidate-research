# S6-EGRAPH-LIVEEXTRACT — Stage 0 `REVISE_ONCE` hypothesis review

- **Revision recommendation:** `RECOMMEND_STAGE0_PASS_FOR_CLOSING_REVIEW`
- **Structural paper potential:** `TIER_A_Q1_POTENTIAL`
- **Current evidence readiness:** `DESIGN_READY__FIXED_CORPUS_BOUNDARY_AND_WITNESS_UNOBTAINED`
- **Revision budget:** consumed (`1/1`); no same-ID revision remains
- **Stage A/B authorization:** none; recommendation requires closing review

## Single atomic proposition

For a fixed pure acyclic public e-graph, roots, rewrite closure, operation/output-size cost and peak-live limit `B`, joint representative selection, materialization/recomputation and scheduling can yield a semantics-preserving point not dominated by either strong sequential order at the same allocation boundary.

**Structural falsifier:** a current source already solves this full joint object, or selection/materialization/scheduling cannot be jointly compared at a fixed semantic/allocation boundary. **Not a falsifier:** no current natural witness, implementation, solver run, hardware or downloaded e-graph.

## Structural paper potential

**Confirmed conditional potential.** FastOpt, Julia EqSat and e-boost subtract exact/shared-DAG extraction but do not, on the reviewed scope, establish the same peak-live/recompute/schedule object. The two sequential orders make the proposed N2 claim precise and falsifiable rather than a generic “use ILP” wrapper. Success on a public corpus with a full cost account would have Tier A Q1 paper shape.

## Current evidence readiness and claim ceiling

No fixed natural `G`, roots, closure, cost table, `B`, algorithm or non-dominance ledger has been produced. These are Stage A construction and validation obligations, not a structural defect. Current claim ceiling is conditional joint-object potential; it makes no claim of a Pareto point, exactness or measured saving.

## Fairness, collision and killer

- [FastOpt](https://doi.org/10.1145/3689801), [Julia EqSat](https://doi.org/10.1145/3795883) and e-boost remain finite mandatory subtractors; egg/Cranelift are same-object open resource routes.
- The runtime-first and memory-first optimal-fixed-DAG controls are mandatory; joint MILP is a small-instance ceiling only.
- **Minimal killer:** pin one Cranelift and one egg source, cost/allocation convention and `B`; run both sequential controls plus a joint small-instance oracle. Stop in Stage A if all joint points are dominated or any benefit changes semantics/boundary.

## Non-relaxable design audit

| Gate | Status |
|---|---|
| Same object | pure acyclic semantic and allocation scope explicitly frozen; corpus instance pending |
| Latest collision | finite current subtractors rechecked |
| Fair strong baseline | both sequential controls required |
| Natural input/evidence | public corpus route; witness pending |
| Full cost | extraction/scheduling/memory ledger specified |
| Reproducibility | open egg/Cranelift route exists; no local bundle required now |
| Claim honesty | no measured residual claimed |

## Closing handoff

Submit to closing review as `TIER_A_Q1_POTENTIAL`; this report does not create downstream work.
