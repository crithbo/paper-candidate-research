# Candidate-grade deep reviews

All conclusions below are static Discovery conclusions. No candidate program, dataset, or benchmark was run.

## D1 — Z3 incremental simplification / proof-model conversion

- **Exact object and oracle.** Fixed SMT assertion sequence and query answers, with Z3 proof/model conversion and solver result semantics preserved. The stock oracle is the current Z3 solver/API.
- **Current union.** The official source/release material exposes tactic composition, simplifiers, theory solvers, proof/model conversion, incremental contexts, parameters and tactic combinators. Default and non-default paths have not been exhaustively source-pinned down to every proof-producing tactic.
- **Minimal divergence candidate.** Two legal tactic/proof-conversion schedules can preserve the answer while constructively retaining different shared simplification histories. This is only a proposed witness schema; its native legality across all proof/model paths is not closed.
- **Possible N2.** A target-specific bounded-recourse simplification-history data structure with an amortized proof/model-conversion bound; it is not a generic tactic selector.
- **Natural carrier / full cost / 72h killer.** SMT-LIB incremental benchmark traces; solver answer plus proof/model validation; preprocess, solve, conversion/check CPU, RSS, output bytes and latency. Killer: a small official regression trace where current and proposed histories cannot both be replayed under identical proof/model semantics.
- **Decision.** `NOT_ADMITTED_UNFROZEN`: source union and direct same-object proof-simplification collision were not fully closed. This is not an absence claim or STOP.

## D2 — SuiteSparse:GraphBLAS sparse matrix product construction

- **Exact object and oracle.** Fixed sparse inputs, semiring, mask, descriptor and output matrix; GraphBLAS result equality is the stock oracle.
- **Current union.** Official SuiteSparse material documents GraphBLAS, factory/JIT kernels, OpenMP configuration and sparse algorithms. The complete symbolic-phase, representation-conversion, JIT and descriptor union needed for a fair subtractor was not frozen from current source.
- **Minimal divergence candidate.** For the same matrices/semiring, a legal product can choose different symbolic frontier and internal sparse representation paths while yielding the same matrix. Whether this is outside the executable union is unclosed.
- **Possible N2.** An exact/FPT symbolic-product constructor parameterized by bounded row/column frontier diversity, with a work-memory Pareto guarantee.
- **Natural carrier / full cost / 72h killer.** SuiteSparse Matrix Collection route; result equality; analysis, JIT/compile, multiplication, conversion, CPU/RSS/temp and output-memory cost. Killer: a finite matrix pair whose representation frontier proves a proposed construction non-compositional against the current source union.
- **Decision.** `NOT_ADMITTED_UNFROZEN`: a generic sparse-product or representation-choice theorem would not be a target-specific residual without collision and union closure.

## D3 — CGAL Delaunay conflict-cavity construction

- **Exact object and oracle.** Fixed point multiset, triangulation convention and predicates; CGAL validity predicates and the Delaunay relation are the oracle.
- **Current union.** The official CGAL repository provides triangulation packages and test infrastructure, but this pass did not pin the exact current insertion, hierarchy, perturbation and concurrency action union.
- **Minimal divergence candidate.** Two insertion/cavity-rebuild histories may form different legal internal triangulation construction traces for a common final Delaunay complex. The candidate requires preserving degeneracy policy; that condition is unclosed.
- **Possible N2.** A clustered-input exact construction with a parameterized bound on cavity churn, not a generic point-order heuristic.
- **Natural carrier / full cost / 72h killer.** Public point-cloud/mesh inputs; CGAL validity/orientation oracle; construction, predicates, peak memory, output and query cost. Killer: a finite degenerate/near-clustered instance testing whether the claimed bound holds under the same predicate policy.
- **Decision.** `NOT_ADMITTED_UNFROZEN`: direct Delaunay insertion/order literature is extensive and was not closed to the required current same-object subtraction.

## D4 — GEOS robust overlay/noding construction

- **Exact object and oracle.** Fixed planar geometries and overlay relation, with stock topology predicates and output geometry semantics.
- **Current union.** GEOS has a native topology engine, but the current noding, precision, snap-rounding, labeling and overlay path union plus all configuration entry points was not fully source-pinned in this pass.
- **Minimal divergence candidate.** Two legal edge-label/noding construction traces can return an equivalent overlay geometry. The proposed witness must still prove equality under GEOS precision semantics.
- **Possible N2.** A certified near-coincidence decomposition that bounds label propagation or noding growth for a named geometric parameter.
- **Natural carrier / full cost / 72h killer.** Public boundary/road GIS datasets; topology/equality oracle; construction, validation, CPU/RSS/temp, output size and query cost. Killer: a finite near-coincident geometry pair that either validates the stated growth condition or refutes it.
- **Decision.** `NOT_ADMITTED_UNFROZEN`: no current-union closure, no direct-collision closure, and no frozen target-specific theorem.

## Result

`COMPLETE_ZERO_PROPOSALS`. None meets the evidence package needed for a grounded brief. The four outcomes are intentionally **not** structural DROPs: finite closure might be possible in a later, separately frozen assignment.

