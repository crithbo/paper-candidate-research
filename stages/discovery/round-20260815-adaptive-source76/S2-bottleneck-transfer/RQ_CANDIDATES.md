# Source76 primary RQs

## RQ-01 — Clang PCH serialized AST construction

- Anchor frozen before evidence: Clang current PCH Internals/User Manual, accessed 2026-08-15.
- Exact object: one fixed C/C++ header graph, target/options and translation units; same object/diagnostics and emitted object semantics.
- Primary RQ: Can a semantic-preserving, whole-PCH AST/index constructor improve construction-plus-reuse cost beyond current PCH/PCM serialization and reader mechanisms without becoming generic packing or a build wrapper?
- Boundary: no header/source rewrite, changed AST semantics, custom reader, or `-include-pch` selector.
- Counterfactual: the same `-include-pch` client would observe a different construction guarantee, not simply a different cache location.
- Primary route: current Clang PCH internals, then Users Manual. Fallback only for transport failure: official Clang ASTReader source.
- Ordinary closure result: `EXCLUDED_BEFORE_RAW__GENERIC_SERIALIZATION_OR_EXISTING_NATIVE_PCH_CHAIN_COMPOSITION`.

## RQ-02 — GHC interface / recompilation construction

- Anchor frozen before evidence: GHC 9.14.1 User’s Guide, accessed 2026-08-15.
- Exact object: fixed Haskell module DAG, source and compilation flags; stock `.hi`/`.o` semantics and recompilation decision.
- Primary RQ: Is there a static same-DAG interface construction and validation algorithm with a guarantee beyond fingerprint/recompilation controls, rather than a scheduler or rebuild policy?
- Boundary: no changed module/import semantics, build ordering wrapper, or weakened recompilation correctness.
- Counterfactual: the result would change a native artifact construction, not select `-fforce-recomp` or ignore-change flags.
- Primary route: current GHC separate-compilation/recompilation documentation. Fallback only for transport failure: GHC current compiler source.
- Ordinary closure result: `EXCLUDED_BEFORE_RAW__RECOMPILATION_DECISION_POLICY_SHELL`.

## RQ-03 — Go unified export-data graph and lazy index

- Anchor frozen before evidence: current Go compiler README and `cmd/go` cache documentation/source, accessed 2026-08-15.
- Exact object: fixed Go package DAG, toolchain and executable semantics; stock compile/import contract.
- Primary RQ: Can a producer-side unified-export graph/index constructor improve same-package compile/import full cost under a target-specific complexity/quality guarantee not replayable by the current reader/writer composition?
- Boundary: no changed exported API/IR semantics, consumer replacement, `GOCACHE` policy, or external build cache.
- Counterfactual: a construction result would retain the stock importer while changing a proven non-generic producer decision.
- Primary route: Go compiler README, then current official source for unified reader/writer. Fallback only for transport failure: Go repository official source browser.
- Ordinary closure result: `LOCATOR_ONLY__NON_GENERIC_TARGET_SPECIFIC_CONSTRUCTOR_NOT_FROZEN`.

No selective/pre-RQ nomination: selective depth is OFF and each primary route was directly reachable.
