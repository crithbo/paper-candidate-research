# SENTRY Confirmation — S6-EGRAPH-LIVEEXTRACT

## Result

**CONFIRM.**  PRIMARY's `SAME_EGRAPH_PEAK_LIVE_BOUNDARY_AND_NONDOMINATED_CORPUS_WITNESS` is a valid `REVISE_ONCE` gate.  Stage A remains unauthorized.

## Independent check

The object is a pure acyclic e-graph, with fixed rewrite closure, roots, backend costs/output sizes, and explicit materialize/recompute/topological scheduling decisions.  Peak live temporary storage is charged, while e-graph construction RAM and post-register-allocation pressure are explicitly out of scope.  That boundary prevents an invalid claim to solve generic compiler liveness.

FastOpt is the strongest exact sparse-extraction comparator, Julia EqSat is a strong code-reuse/ILP comparator, and e-boost is a shared-DAG cost comparator.  None of the checked sources establishes a jointly optimal, fixed-boundary peak-live schedule for the candidate's extraction object.  Conversely, conventional sequential extract-then-schedule and schedule-then-extract controls must be retained, and a joint MILP is only a small-instance ceiling.

The revision gate uses one witness condition: after fixing semantic and allocation cost conventions, identify a public egg/Cranelift corpus case that is non-dominated against both sequential orders at the same peak-live boundary.  Its empty result is a clean falsifier.  This does not rely on an arbitrary union of incomparable techniques.

## Gate disposition

- PRIMARY `REVISE_ONCE`: **confirmed**, unchanged.
- Direct-fatal collision found: **no**; the listed works are exact or methodological subtractors that the gate fairly contains.
- Natural headroom: unproven; a non-dominated public witness is required before any continuation.
- Q1 / AI route: plausible only if the joint extraction/scheduling contribution is non-empty; an AI proposal model alone is insufficient.
- Ownership/resources: egg and Cranelift are open same-object resources.  CPU/open artifacts can close this gate; no accelerator resource is required.

## Required status implication

`REVISE_ONCE` remains unexecuted (1/1 available).  This confirmation does not create a revision, Stage A, or status change.
