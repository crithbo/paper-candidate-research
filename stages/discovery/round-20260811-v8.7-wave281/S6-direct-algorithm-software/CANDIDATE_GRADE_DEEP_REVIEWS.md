# Candidate-grade deep review

## D1 — libsolv ID/layout: `NOT_ADMITTED_UNFROZEN`

**Same-object contract.** Input is the same repository metadata and dependency relation graph. Output remains a standard libsolv repository accepted by its stock loader and yielding identical solver/query answers for frozen calls.

**Action and witness.** A legal representation witness is possible when a complete construction regenerates every Solvable, Repo, string and reldep reference after a different insertion or ID-reuse history. It does not itself supply a target-specific objective or guarantee; generic renumbering is excluded.

**Strongest current union.** The union to pin jointly includes repository ingestion/writer paths, Pool interning/allocation, reuse behavior, `.solv` serialization/load choices, and solver/query flags. The official source establishes the native dictionary/SAT project, but this review did not establish the complete current source-level union.

**Collision and residual.** A fair subtractor must include direct dependency-solver representation and index-layout work, not generic ID assignment. Primary direct-collision closure is incomplete. No union-external or composition-external target-specific exact/FPT/Pareto/approximation result is asserted.

**Full cost / finite killer.** Within 72 hours: pin a release and commit; produce two standard-reader-accepted `.solv` repositories for one versioned distribution snapshot; verify equal frozen solve/query answers; reject if only generic renumbering differs or if the pinned union expresses the whole constructor. Ledger: writer CPU/RSS/temp, bytes, load CPU/RSS/latency, solve CPU/RSS/latency, query equality.

**Decision.** `NOT_ADMITTED_UNFROZEN`, not DROP. Incomplete source and collision closure is not current absence; missing implementation, result, resource or AI readiness is not a negative inference.
