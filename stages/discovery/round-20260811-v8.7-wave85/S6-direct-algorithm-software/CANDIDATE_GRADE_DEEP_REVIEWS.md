# Candidate-grade deep reviews

## D01 — libstdc++ `std::sort`

- **Exact object / guarantee:** sort one fixed comparator range into a permutation ordered by that comparator; the native semantic contract is the C++ sorting requirement.
- **Frozen current union and native cost:** current deployable union consists of libstdc++'s comparison-sort construction, partition/pivot work, small-range handling, and depth-limit fallback. Count comparison calls, moves/swaps, auxiliary storage, and elapsed CPU time; exclude I/O equally for every comparator.
- **Minimal action-divergence witness:** changing pivot selection, partition schedule, or the threshold on a six-to-ten element input remains an instance of the frozen comparison-sort action family. No union-external complete whole-action N2 was identified.
- **Natural route / 72-hour killer:** duplicate-key records from a public table; verify sortedness and permutation, then reject any proposal whose complete construction cannot beat the union on the full comparison/move/storage denominator under identical comparator information.
- **Disposition:** `STRUCTURAL_ABSORPTION` — only tuning/local construction variants were found. No brief.

## D02 — libstdc++ `std::stable_sort`

- **Exact object / guarantee:** stably sort one fixed comparator range: equal-key elements retain input order.
- **Frozen current union and native cost:** adaptive buffered merge, in-place merge fallback, run/merge scheduling and small-range handling available to the native implementation. Full cost includes comparisons, moves, temporary storage, allocation behavior, and CPU time.
- **Minimal action-divergence witness:** two adjacent equal-key runs demonstrate stability, but alternative split points, merge order, or buffer threshold are already legal choices in the merge-construction union; no distinct complete action was frozen.
- **Natural route / 72-hour killer:** public transaction/event records keyed by timestamp/category; native stable-order and permutation check plus full cost. Fail if the alleged action is expressible as another merge schedule or loses stability.
- **Disposition:** `STRUCTURAL_ABSORPTION` — no nontrivial union-external N2.

## D03 — Eigen `SparseLU`

- **Exact object / guarantee:** factor and solve a fixed sparse linear system through Eigen's `SparseLU` path, retaining its documented numerical and permutation semantics.
- **Frozen current union and native cost:** ordering/preordering, symbolic analysis, pivoting/factor construction, solve and workspace are all part of the denominator. Cost must include analysis time, factor time, fill/memory, solve time, residual, and failure handling.
- **Minimal action-divergence witness:** no same-object witness was responsibly frozen. A proposal for a different ordering/fill heuristic cannot yet be separated from the current ordering/pivot/action union without fixing the exact accepted numerical guarantee and current source-level action catalog.
- **Natural route / 72-hour killer:** SuiteSparse matrices with residual and factorization-status checks. The first gate is documentary/source closure of the action catalog; fail admission if the candidate is merely a selectable ordering or changes numeric guarantees.
- **Disposition:** `NOT_ADMITTED_UNFROZEN` — finite route exists, but no action-divergence certificate is presently available. No brief.

## D04 — CGAL 2D Delaunay triangulation

- **Exact object / guarantee:** construct a Delaunay triangulation for the identical point set under CGAL's predicate/kernel semantics.
- **Frozen current union and native cost:** insertion location, conflict-region update, edge flips, and robust predicate/kernel choices form the native construction union. Full cost includes construction CPU time, predicate calls, memory, and validity/triangulation checks.
- **Minimal action-divergence witness:** different insertion orders or flip schedules on five non-cocircular points remain expressible by the incremental construction union; no new whole-action constructor was isolated.
- **Natural route / 72-hour killer:** public geospatial point sets, with CGAL validity and Delaunay checks. Fail if the proposed action reduces to insertion ordering, a predicate configuration, or cannot preserve the same kernel/guarantee.
- **Disposition:** `STRUCTURAL_ABSORPTION` — no qualifying N2 residual.

## Result

All four full reviews reached either direct action-space absorption or an explicit unfrozen witness boundary. This is not evidence against unimplemented algorithms; it is a zero-admission result under the frozen same-object/action-gap gate.
