# Current Rust CGU action and frontier audit

## Exact object required by the gate

`(current crate source, lockfile, features, target, Cargo profile, rustc pin,
current MonoItem usage graph) -> named CodegenUnit set`.

The predecessor window is an input annotation only.  It cannot substitute a
different crate/version as the partitioned object, nor contribute successor
change labels, measured future build time, PGO data, or any cache outcome.

## Current native union

| Native layer | Complete action/fair-comparator requirement |
|---|---|
| Collection and graph checks | `collect_and_partition_mono_items`, mono collection, target-specific checks and all current roots. |
| Placement | Instantiation mode; characteristic DefId; incremental stable/non-generic vs volatile/generic choice; CGU name builder/cache; linkage, visibility and export decisions. |
| Inlining | Current root-to-reachable-inlined closure, local-copy insertion and multiplicity treatment. |
| Post-placement | Size estimates, deterministic sorting, CGU-cap merge guided by overlap, internalization and distinct-symbol checks. |
| Configuration | Compatible `-C codegen-units`, incremental, LTO, optimization and Cargo profile/config/environment branches with identical current object and information. |
| Output contract | Current crate semantics, linkage, symbol requirements, ABI, native codegen/link/test and deterministic CGU ordering. |

Generic graph partitioning, ILP and cache scheduling can be ceilings or
subtractor analyses, but cannot be presented as a Rust-specific candidate.

## Required candidate state after unblocking

For a bounded current interface `B`, an admissible state must retain at least
`(D, I, L, V, X, N, K, H, Q)`: current DefPath/instantiation identity `D`;
root/inlined multiplicity and closure boundary `I`; linkage `L` and visibility
`V`; export/distinct-symbol status `X`; deterministic name/merge provenance
`N`; CGU count/size/overlap capacity `K`; **predecessor-only** cohort label
`H`; and current invalidation relation `Q`.  A state that drops `I,L,V,X,N,Q`
is not sufficient for every future native action.  A state consisting only of
weighted graph edges, bin capacities and a cache bit is generic and triggers
the registered failure sentinel.

No state equivalence, recurrence, complexity bound or action-divergence witness
is certified here: all require the missing current graph.  Supplying a generic
symbolic recurrence now would falsely imply an exact Rust-native action map.

## Static resumed-gate test

For each supplied current graph, enumerate every legal current configuration
branch and construct two whole current-graph partitions.  A candidate result is
admissible only if both plans preserve item coverage, native root/inlined
closure, linkage/visibility, deterministic names, native merge outcome,
internalization, distinct symbols, ABI and semantics.  Remove all points
expressed by the complete current union.  Then test whether the remaining
frontier admits an exact bounded, FPT or certified approximation algorithm over
the Rust-specific state above.  This is a finite static closure; execution and
performance claims remain later Stage A matters.
