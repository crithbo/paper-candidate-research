# RQ candidate — S65-01

- Assignment/lane: `DISCOVERY-S6-20260815-ADAPTIVE-SOURCE65-R40-ORDINARY-BREADTH-V1` / S6
- Seed: `S65-01` in `DIVERGENCE_SEED_POOL.md`
- Exact public anchor: Rust Compiler Development Guide, “Pattern and exhaustiveness checking”, current page retrieved 2026-08-15.
- Stable object/guarantee envelope: fixed Rust typed patterns, constructors, valid-place semantics, edition/features and the same exhaustiveness/redundancy diagnostics.
- Contribution hypothesis: `THEORY_FORMAL` / `N2`; not evidence of a contribution.

## Primary RQ

For a fixed Rust typed pattern matrix, is there a Rust-specific construction that produces exactly the current exhaustiveness/redundancy outcome with a non-generic formal complexity or certificate guarantee beyond the existing constructor-splitting usefulness analysis?

- Counterfactual: a compiler maintainer could replace only the decision construction while preserving diagnostic semantics and account for analysis CPU/RSS and witness construction.
- Primary route: the Rust development guide plus `rustc_pattern_analysis/src/usefulness.rs` and `constructor.rs` at the current `main` branch.
- Contrary route: Maranget, *Warnings for Pattern Matching* (JFP 2007), which directly specifies a reusable matrix algorithm for useless/non-exhaustive clauses.
- Closure mode: `ORDINARY_CLOSURE`; no selective or strong-model packet was nominated or run.
- Earliest falsifier: if the current implementation and the contrary formal kernel already supply the complete same-object decision problem, no target-specific non-generic discriminator survives.
- Disposition after evidence: `EXCLUDED_BEFORE_RAW__GENERIC_KERNEL_DIRECT_SUBTRACT`.
