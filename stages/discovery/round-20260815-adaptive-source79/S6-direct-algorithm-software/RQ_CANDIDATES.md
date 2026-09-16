# RQ candidates

## RQ-S79-01

- Exact anchor: current official Git diff/diffcore documentation and upstream source project, checked 2026-08-15.
- Stable object: fixed pre/post trees, file contents/modes and diff options; same rename/copy pairs, similarity labels and diff output semantics.
- Primary RQ: “Is there a Git diffcore-specific whole rename/copy correspondence constructor with a non-generic exact/FPT/Pareto guarantee outside the current exhaustive detection union?”
- Out of scope: changed threshold/limit only, external matching solver, changed tree/content, changed diff output or experiment execution.
- Source roles: Git docs/source = ANCHOR/CURRENT; documented diffcore-rename and generic content-similarity bipartite correspondence = CONTRARY. `NONE` selective nomination.
- FINER-lite: feasible CLEAR; relevance CONDITIONAL; novelty threat HIGH; scope PASS. `RQ_READY_FOR_ORDINARY_CLOSURE`.
