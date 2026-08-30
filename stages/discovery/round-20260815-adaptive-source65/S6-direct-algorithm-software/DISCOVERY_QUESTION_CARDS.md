# Question card — QC-S65-01

## Identity and contract

- Exact public identity: `rust-lang/rust` current `main`, `compiler/rustc_pattern_analysis/src/usefulness.rs` and `constructor.rs`; official Rust Compiler Development Guide page retrieved 2026-08-15.
- Carrier kind: `CANONICAL_FORMAL_ORACLE`.
- Same-object contract: fixed typed Rust pattern matrix, constructor universe, place-validity assumptions and compiler diagnostic semantics for non-exhaustiveness/redundancy.
- Candidate endpoint: an identical diagnostic/counterexample outcome with a target-specific non-generic formal complexity or certificate guarantee.
- Initial full-cost boundary: compiler analysis CPU/wall time, peak RSS, constructor splitting work, diagnostic/witness bytes, and incremental compilation effect. No performance claim was tested.
- Network-security check: `PASS`.

## Evidence-qualified raw audit

| Required field | Result |
|---|---|
| exact identity and versioned locus | CLOSED: current official guide and current `main` source paths |
| same-object problem/estimand | CLOSED |
| endpoint and counterfactual | CLOSED |
| current source locus | CLOSED: `rustc_pattern_analysis`, `usefulness` and constructor splitting |
| finite falsifier | CLOSED: compare candidate skeleton against current usefulness and Maranget matrix kernel |
| full-cost initial boundary | CLOSED |
| source-supported non-generic discriminator | FAILED: no target-specific discriminator survived the current/contrary pair |
| known direct-fatal check | FOUND: the proposed decision endpoint is the generic usefulness/exhaustiveness problem already addressed by the formal kernel |

## Current/contrary evidence and decision

The official guide states that usefulness is used for unreachable-code detection and exhaustiveness, runs before MIR construction, and is implemented by the `rustc_pattern_analysis` crate with its core algorithm in `usefulness`.  It also describes constructor grouping/splitting as the practical device for finite checking.  The current official source locations are the corresponding `usefulness.rs` and `constructor.rs` paths.

Maranget (2007) defines the same anomalies—useless clauses and non-exhaustive matches—and a simple algorithm, explicitly usable across strict and non-strict functional languages.  Therefore a purported new “joint target-aware matrix/certificate constructor” with the frozen endpoint has no source-supported non-generic Rust-only decision variable; a cache, traversal order, heuristic or implementation micro-organization would be routine engineering or an unproved generic improvement.

- Current union status: a complete default/non-default option catalogue was not required, because the direct semantic/formal subtractor already invalidates the proposed contribution shape.
- No absence claim is made.
- No missing implementation, result, resource, or AI readiness was used.
- `RQ audit: RQ_COMPLETE`; `RAW_REQUIRED audit: INCOMPLETE` only because the non-generic discriminator fails.
- `Disposition: EXCLUDED_BEFORE_RAW`; `Eligible for C0: NO`.
- Reason: `STRUCTURAL_DROP__GENERIC_FORMAL_KERNEL_DIRECT_SUBTRACT`, not STOP and not a statement about all Rust compiler opportunities.

## Reopen condition

Only a new exact object/endpoint plus an external primary-source delta demonstrating a Rust-specific semantic constraint not represented by the matrix/kernel could justify a later, separately frozen RQ.  A new traversal heuristic, cache policy, local optimization, or broader compiler family overlap is insufficient.
