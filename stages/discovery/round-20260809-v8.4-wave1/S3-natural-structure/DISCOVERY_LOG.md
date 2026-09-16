# DISCOVERY-S3-20260809-V8.4-WAVE1

- Lane: `DISCOVERY-S3-NATURAL-STRUCTURE`
- Assignment: `DISCOVERY-S3-20260809-V8.4-WAVE1`
- Date: `2026-08-09` (Asia/Shanghai)
- Allowed method: production discovery method `v2/v8.1`; O3 is `CALIBRATED`
- Explicitly excluded method: TLS-blocked two-axis `v8.2r2`
- Result: `COMPLETE_ZERO_PROPOSALS`

## Scope and method boundary

This wave searched for reproducible structure in a natural workload together with an exploitable N1/N2/N3 mechanism.  It did not treat the O3 backtest as novelty or headroom evidence, did not reuse any terminal candidate, and did not execute an experiment.  A candidate could be proposed only if it retained at least `TIER_B_Q2_VIABLE` after same-object and full-cost checks.

The accepted O3 backtest is [O3 v2 handoff](../../_method-backtests/O3_NATURAL_STRUCTURE/v2/handoff.yaml): three positives were reasonably recovered and the negative control abstained.  It calibrates only the discovery method.

## Search protocol

Sources were limited to paper originals/preprints, official project pages, official documentation, and official author or publisher records.  Searches were refreshed through 2026-08-09.

```text
"Adaptive Algebraic Reuse of Reordering" Cholesky dynamic sparsity
dynamic sparse Cholesky symbolic reuse natural workload temporal coherence
"sparse attention" "cross-layer" index reuse 2025 2026
"IndexCache" "cross-layer index reuse"
"Block-structured matrix reordering" SDDMM tensor cores
SDDMM natural sparse pattern reordering Tensor Core 2025 2026
```

Inclusion required: (a) a named natural carrier or collected workload, (b) an explicit structure-to-action causal path, and (c) a finite same-function baseline set.  Exclusion included an existing same-object action/guarantee, an unseparated decision variable, or an unavailable/unverifiable primary artifact.  A later-than-cutoff hit was not used as evidence.

## Three-pass outcome

1. **Genealogy/seed-distance.** Three concrete structure/action pairs were found.  In each case, the closest work already names the same naturally stable structure and acts on it with the same essential decision variable.
2. **Current competing mechanisms.** The collisions are not a generic use of cache/reordering: they directly cover local reordering reuse, cross-layer sparse routing reuse, or bi-directional sparse-matrix reordering with hybrid execution.
3. **Artifact/natural input/AI readiness.** Artifacts are sufficiently public for follow-up, so no item was rejected for resources or AI readiness.  The rejection is scientific: no residual research kernel remains before an experiment.

## Result

No new candidate reaches `TIER_B_Q2_VIABLE`; therefore no `TOPIC_BRIEF` and no `PROPOSE_STAGE0` were created.  The audit matrix and finite killers are in [SOURCE_COLLISION_MATRIX.md](SOURCE_COLLISION_MATRIX.md).

