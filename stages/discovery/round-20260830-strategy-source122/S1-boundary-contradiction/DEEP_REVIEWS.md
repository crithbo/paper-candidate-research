# Source122 S1 Deep Review

## RQ02/03 — benchmark/tool anti-collapse review

### Native/current subtraction

ORT already exposes strict CPU-fallback failure, provider priority, recorded EP graph assignments, runtime profiling, compiled-model compatibility and variant selection. OODTE already performs ONNX optimizer differential testing, and ModelMeta is a strong generic model-level metamorphic-testing comparator. Therefore support lists, mutation generation, output comparison, assignment display and profiling dashboards are not contributions.

### Surviving conjunction

The residual requires all of:

1. result-independent ONNX rewrites with auditable semantic/lineage oracles;
2. exact ORT `OrtEpAssignedSubgraph` comparison and strict-fallback classification;
3. complete session-create/compile/cache/transfer/fallback/runtime/observer cost;
4. a held-out decision-validity endpoint: whether assignment-aware information changes or predicts EP/optimizer choice beyond output-only and node-count baselines.

If current work covers this conjunction, or if the decision endpoint vanishes after full cost, the candidate is direct-fatal. If the output oracle or node lineage requires changing semantics, the fidelity route is structurally unclosable.

### Hard gates

- Same object: `PASS` at Discovery contract level.
- Canonical evidence: `PASS_BENCHMARK_ONLY`; no natural deployment extrapolation.
- Current collision: `SEARCH_BOUNDED_OPEN`; OODTE/ModelMeta and current ORT paper/tool union require independent Stage 0 review.
- Strong baselines: native assignment-info + profiler, strict no-fallback, output-only OODTE-style differential, node/subgraph count, raw end-to-end timing.
- Full cost: complete from mutation generation through session compile and runtime, including invalid/unsupported cells.
- Reproducibility: exact commits, official models, rewrite manifest, lineage map, assignment JSON and trace pairs.
- Claim honesty: no instability, fault, reversal or performance result observed.

### Verdict

`PROPOSE_STAGE0 / TIER_B_Q2_VIABLE`. Q2 requires cross-model/EP held-out validity and reusable artifacts; a single bug, model, rewrite, provider or dashboard is below Q2. Q1 potential is not claimed.
