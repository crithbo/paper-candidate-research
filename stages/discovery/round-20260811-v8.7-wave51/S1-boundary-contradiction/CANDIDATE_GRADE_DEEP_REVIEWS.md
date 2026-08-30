# Candidate-grade deep reviews

`DISCOVERY_QUALITY_MODE=OFF`; these are production-v8.7 deep reviews, not R7 collision-first decisions.

## DUCKDB-ROBUST-JOIN — `DROP__DIRECT_FATAL`

- Atomic proposed action: construct a robust predicate-transfer plan for a fixed acyclic join query while retaining identical SQL results.
- Current source/reality: DuckDB documents cost-based join order, explicit `join_order,build_side_probe_side` controls, and `ANALYZE`; its official 2025 RPT artifact supplies `LargestRoot`, `SafeSubjoin`, and RPT on DuckDB, including the identical robustness objective.
- Decisive subtractor: RPT is a direct same-object/same-guarantee construction; POLAR is a separate current DuckDB adaptive join-order baseline. The claimed mechanism is therefore already named and implemented in the target object.
- Finite killer: one acyclic three-relation query, fixed statistics and RPT-disabled/enabled plans; identical result plus replay of the documented RPT path kills a supposedly new action.

## BINARYEN-RELOOPER — `DROP__CURRENT_UNION_ABSORPTION`

- Atomic proposed action: re-partition a fixed CFG into legal structured Wasm regions to reduce emitted shape/bytes without changing validation or execution semantics.
- Current source/reality: Binaryen’s current upstream documents deterministic `wasm-opt`, Relooper, and `ReReloop`, which explicitly returns structured control flow to CFG and back in pursuit of more optimal shapes. The source and test/spec-test route are public; no absence is claimed.
- Six dimensions: same CFG information; same structured-output/validator guarantee; emitted bytes and transform CPU are charged; any merely different pass ordering is absorbed by the pass union. A new global optimizer would need a non-generic state/guarantee not present here.
- Finite killer: a reducible CFG with two valid structured encodings; if Relooper/ReReloop emits the candidate encoding or the candidate alters binary validation/execution, drop.

## RUST-TRAIT-GOALS — `DROP__SEMANTIC_CONTRACT_NOT_STABLE_FOR_NEW_ACTION`

- Atomic proposed action: choose a different proof/search frontier for fixed trait goals while preserving rustc diagnostics and acceptance.
- Current source/reality: the current compiler exposes evolving current/next solver implementations and associated feature-gated behavior; the official compiler tests are the canonical diagnostics oracle. That is contrary evidence to a frozen single solver/guarantee boundary.
- Six dimensions: a proof search shares goal information, but solver selection is not a stable output-independent action; changes may alter ambiguity/coherence/diagnostics. The needed guarantee either collapses to a generic proof-search schedule or changes the native language/compiler contract.
- Finite killer: two ambiguous trait goals under current and next solver; reject a candidate if it changes any accept/reject/diagnostic category, or if it reduces to scheduling identical solver steps.

None of these drops is based on lack of implementation, natural data, result, resource, or AI readiness.
