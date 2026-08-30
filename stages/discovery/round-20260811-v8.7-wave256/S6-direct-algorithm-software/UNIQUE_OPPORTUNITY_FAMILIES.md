# Unique opportunity families

## Candidate-grade A — METIS multilevel balanced partition constructor

**Conditional object:** fixed public graph, fixed `k`, vertex weights, balance
bound and cut objective; a partition checker is the native oracle. Legal action
is the complete coarsen–initial-partition–uncoarsen/refine construction, not a
single coarsening parameter. A minimal witness is one graph for which two legal
coarsening matchings induce different balanced partitions. Natural route: a
version-pinned SuiteSparse/graph collection graph plus its exact weighting
policy. Full cost would charge preprocessing, construction CPU/RSS/temp,
partition verification, cut/balance and downstream access cost.

A possible N2 must give a target-specific exact/FPT/approximate or Pareto
guarantee beyond current METIS composition and current competing partitioners;
generic matching or a solver replacement fails. The current source/flag union
and the primary direct-collision matrix are not closed, so this remains
`NOT_ADMITTED_UNFROZEN`.

## Candidate-grade B — PostgreSQL hash-index split/build construction

**Conditional object:** one fixed table, tuple values, hash opclass and native
query/update semantics, checked by stock query results and `amcheck`. A witness
would hold records and bucket mapping fixed while choosing two legal split/order
histories that regenerate native metadata and give the same answers. Full cost
must include build/update/WAL/index bytes, query CPU/RSS/I/O and validation.

An admissible N2 would be a native, target-specific bounded-recourse or
approximate split/build construction with a guarantee beyond current build plus
incremental split composition. Current source paths, defaults and extensible
hashing collisions are not closed; therefore it is `NOT_ADMITTED_UNFROZEN`.

## Candidate-grade C — Brotli meta-block/context-map whole encoder

**Conditional object:** fixed byte stream and standard decoder equality. A
two-output witness can differ in legal meta-block boundaries/context-map choices
while decoding to identical bytes. Natural carrier could be a frozen public web
asset corpus; full cost includes encoding CPU/RSS/temp, bytes, decoding CPU/RSS
and verification. Only a finite-state, target-specific exact/FPT/Pareto planner
with a stated coding-cost guarantee beyond the current encoder composition could
qualify. Current source/config union and compression collisions are not closed:
`NOT_ADMITTED_UNFROZEN`.
