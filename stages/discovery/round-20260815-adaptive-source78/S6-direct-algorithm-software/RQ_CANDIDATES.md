# RQ candidates

## RQ-S78-01

- Exact anchor: GNU Findutils current official manual 4.10, checked 2026-08-15.
- Stable object: fixed start points/tree snapshot, `find` expression, traversal/symlink and action semantics; same emitted actions, ordering contract and exit behaviour.
- Primary RQ: “Can GNU find receive a target-specific whole expression/traversal construction with a guarantee beyond its current side-effect-safe cost-based optimizer?”
- Excluded scope: changed expression/actions/traversal semantics, generic query optimizer, `-O` selector, and experiments.
- Source roles: official current manual = ANCHOR/CURRENT; documented full cost-based optimizer and generic side-effect-safe predicate ordering = CONTRARY. `NONE` selective nomination.
- FINER-lite: feasible CLEAR; relevance CONDITIONAL; novelty threat HIGH; scope PASS. `RQ_READY_FOR_ORDINARY_CLOSURE`.
