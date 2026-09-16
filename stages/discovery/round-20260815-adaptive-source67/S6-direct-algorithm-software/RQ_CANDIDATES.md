# RQ candidate — S67-01

- Exact public anchor: Rust Compiler Development Guide, “Incremental compilation”, current page retrieved 2026-08-15.
- Stable contract: a fixed Rust crate/workspace edit trace, query inputs/outputs, diagnostics and compiled artifacts under the same incremental semantics.
- Hypothesis only: `COMPILER_TOOL` / N2 algorithm improving the dependency-validation construction.

## Primary RQ

Does a Rust-specific whole constructor remain for dependency validation/reuse after the current red-green `try-mark-green` construction and generic self-adjusting computation/change propagation are fairly subtracted?

- Primary route: current Rust guide plus its stated `compiler/rustc_middle/src/dep_graph/graph.rs` implementation locus.
- Contrary route: self-adjusting computation/change-propagation literature.
- Earliest falsifier: all candidate actions are generic dependency-graph traversal, memoization or scheduling rather than a Rust-semantic decision variable.
- Closure: `ORDINARY_CLOSURE`; selective depth not nominated/run.
- Result: `EXCLUDED_BEFORE_RAW__GENERIC_INCREMENTAL_COMPUTATION_KERNEL`.
