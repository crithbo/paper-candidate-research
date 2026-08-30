# Question card — QC-S67-01

## Contract

- Exact identity: rustc current incremental compilation, query DAG and `try-mark-green`; official current source locus `compiler/rustc_middle/src/dep_graph/graph.rs`.
- Carrier kind: `IMPLEMENTATION_CARRIER_ONLY`; a natural workspace/edit trace was not acquired or executed.
- Same-object endpoint: identical query outputs, diagnostics and compiler artifacts under fixed edit/option semantics.
- Initial full-cost: incremental compilation CPU/wall, peak RSS, dependency-graph/cache I-O bytes and artifact/diagnostic equivalence.

## Raw-required audit

| Field | Result |
|---|---|
| anchor/current source locus | CLOSED |
| same-object contract and endpoint | CLOSED |
| full-cost boundary and finite falsifier | CLOSED |
| non-generic target-specific discriminator | FAILED |
| direct generic-kernel check | FOUND |

The current official guide describes the red-green algorithm, the saved query DAG, deterministic query assumption, `try-mark-green`, and the exact current source location. It explicitly characterizes the mechanism as a dependency graph plus re-evaluation/change detection. Self-adjusting computation likewise uses dynamic dependence graphs and change propagation. No source-supported Rust-only semantic decision variable remained: changing graph walk order, cache loading, a priority policy, or memoization representation would be a generic incremental-computation/data-structure contribution or routine engineering, not the required target-specific whole constructor.

- `RQ audit: RQ_COMPLETE`; `RAW_REQUIRED audit: INCOMPLETE` at non-generic discriminator.
- `Disposition: EXCLUDED_BEFORE_RAW__STRUCTURAL_DROP__GENERIC_INCREMENTAL_COMPUTATION_KERNEL`.
- This does not declare all rustc incremental work absorbed and does not rely on missing implementation, results, resources, or AI readiness.

Reopen only with a new exact rustc semantic endpoint and an external primary-source delta showing an immutable compiler constraint outside dependency-DAG change propagation. A cache policy, traversal reordering, or generic query graph cannot reopen it.
