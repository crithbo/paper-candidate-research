# Discovery Question Cards — Source25

All cards were created only after the offline seed pool was frozen. `LOCATOR_ONLY` is not a scientific rejection: it means required identity, comparison, carrier, or finite falsifier fields could not be closed within the source-only budget.

## QC25-01 — MLPerf Automotive v0.5 conditional tail-latency validity

- Source seed / lenses: `S01`; `JANUSIAN_TENSION`, `NATURAL_OR_CANONICAL_EVIDENCE`.
- Exact public identity: MLCommons MLPerf Automotive v0.5 results, fixed benchmark/model/dataset/scenario tuple, public page accessed 2026-08-14: [official suite page](https://mlcommons.org/benchmarks/mlperf-automotive/).
- Carrier kind: `CANONICAL_BENCHMARK_ONLY`; network-security exclusion: `PASS`.
- Same-object estimand: validity of a fixed v0.5 automotive result ordering for the suite's own single-stream or constant-stream task, quality target, and 99.9th-percentile latency semantics—not vehicle deployment or any security property.
- Problem / proposed insight: the official suite reports a 99.9th-percentile latency metric for both scenarios and distinct quality targets. A measurement contribution might characterize whether a resource-constrained tail-latency decision is identifiable from the published result panel without changing benchmark semantics.
- Contribution type / route: `MEASUREMENT_CHARACTERIZATION`; provisional `N3` only, not claimed.
- Claim endpoint and counterfactual: a bounded conclusion about ranking stability under a fully specified official full-cost denominator; if false, no ordering or deployment conclusion is asserted.
- Current official union and reality check: the official current page specifies scenarios, query counts, latency metric, quality targets and interactive results/change-log links; it does **not** on that page establish a complete, machine-readable joint energy/RSS/thermal result field for every submission. Default/non-default configuration and the result-table export schema were not closed from bounded page sources; this is recorded as missing, not current absence.
- Strongest subtractor / contrary evidence: the suite itself is the strongest same-object comparator and already varies scenario, model, dataset, quality and reported latency. Any proposed analysis must reproduce its official semantics and compare to its native published ordering; a score reweighting is excluded.
- Full-cost boundary: benchmark setup, system configuration disclosure, measured latency, quality validation, energy/RSS only if an official field is available, and post-publication invalidation status. No unreported component is imputed.
- Minimum falsifier / finite closure: acquire only versioned official result export and rules within a future authorized bounded assignment; construct a pre-registered two-system ordering whose conclusion does not change under the disclosed denominator. A complete field audit or a stable ordering against the hold-out would falsify a claimed hidden-Pareto effect.
- Missing evidence not scientific failure: authoritative v0.5 rules/export snapshot, complete per-submission power/RSS fields, and an independent hold-out comparator.
- Required-field audit: `INCOMPLETE`; identity relation: `FRESH` in this S4 search (no exact prior hit found by bounded local dedup); disposition: `LOCATOR_ONLY`; eligible for C0: `NO`.

## QC25-02 — MLPerf Inference v5.1 power-coverage and ranking-stability panel

- Source seed / lenses: `S04`; `ABSTRACTION_LADDER`, `PROBLEM_FIRST`.
- Exact public identity: MLCommons MLPerf Inference v5.1 Datacenter/Edge results release, dated 2025-09-09: [official release](https://mlcommons.org/2025/09/mlperf-inference-v5-1-results/).
- Carrier kind: `CANONICAL_BENCHMARK_ONLY`; network-security exclusion: `PASS`.
- Same-object estimand: whether a v5.1 official system ordering on a fixed benchmark/scenario/quality target remains identified when the suite's published power submissions are explicitly required—not a claim about performance in arbitrary applications.
- Problem / proposed insight: the release states that two power submissions accompany performance results and that the suite added interactive constraints and new models. A measurement paper could only claim a suite-specific coverage/ranking consequence if a versioned complete result panel and a defined counterfactual availability rule are obtainable.
- Contribution type / route: `BENCHMARK_DATASET` or `MEASUREMENT_CHARACTERIZATION`; provisional `N3`, not claimed.
- Current official union and reality check: official release confirms v5.1 models, scenarios and power-submission existence; official release points to native Datacenter/Edge result pages. It does not itself expose the complete result export, measurement defaults/non-defaults, or the availability/invalidity status for all candidate systems. No absence claim is made.
- Strongest subtractor / contrary evidence: native v5.1 result tables plus their published headline performance and power records; scalar rescoring, dashboarding, or choosing systems post hoc are not residual actions.
- Full-cost boundary: official run configuration, quality validation, performance, native power measurement where published, and result eligibility; no estimated electricity, network, or hardware costs.
- Minimum falsifier / finite closure: future source-only closure must pin official rules and a versioned results export, split systems before estimator selection, and test a stated ranking-stability estimator against an held-out scenario/model. If fields are incomplete or the hold-out conclusion is stable, the proposed correction fails.
- Missing evidence not scientific failure: the full official v5.1 panel/schema and a feasible independent comparator. 
- Required-field audit: `INCOMPLETE`; identity relation: `FRESH` in this bounded local search; disposition: `LOCATOR_ONLY`; eligible for C0: `NO`.

## QC25-03 — MLPerf result-revision sensitivity for fixed official releases

- Source seed / lenses: `S02`; `INVERSION`, `NATURAL_OR_CANONICAL_EVIDENCE`.
- Exact public identity: MLCommons [Results Change Log](https://mlcommons.org/results-change-log/), accessed 2026-08-14, restricted to a named MLPerf Inference release and its originally published result panel.
- Carrier kind: `CANONICAL_BENCHMARK_ONLY`; network-security exclusion: `PASS`.
- Same-object estimand: a release-specific performance/coverage conclusion before versus after officially recorded result changes, retaining the suite's original task, quality and eligibility semantics.
- Problem / proposed insight: the log records invalidations and reasons such as preview submissions not being made available. A replication-negative or measurement characterization may exist only if those interventions and their original records can be linked reproducibly to a frozen panel and a decision consequence.
- Contribution type / route: `REPLICATION_NEGATIVE` or `MEASUREMENT_CHARACTERIZATION`; provisional `N3`, not claimed.
- Current official union and reality check: the official log records dates, IDs, and reasons and explicitly says it contains changes after publication. It is not a complete pre-change results dataset, nor does it provide an already-validated causal estimand or all configuration metadata; no claim of an unimplemented feature or gap follows.
- Strongest subtractor / contrary evidence: the official change log itself and the native release result pages. A paper that merely restates invalidations is excluded.
- Full-cost boundary: release version, result eligibility, published runtime/power fields if present, curation/reproduction effort, and any disclosed validation cost. Unavailable values remain unobserved.
- Minimum falsifier / finite closure: pin one release's original and corrected official snapshots, pre-register a decision functional and a nontrivial effect threshold, then hold out a second release. A null effect or inability to reconstruct the original panel falsifies the proposed claim.
- Missing evidence not scientific failure: preserved official original snapshots, a complete schema, and a hold-out release.
- Required-field audit: `INCOMPLETE`; identity relation: `FRESH` for this exact release-sensitive estimand but potentially related to past generic MLPerf measurement lines; disposition: `LOCATOR_ONLY`; eligible for C0: `NO`.

## Sources and boundary

All external sources were first-party MLCommons pages, read only. Search responses were below the assignment response/storage limits; no artifact, result bundle, code, or dataset was downloaded. No build, benchmark, E2 smoke, or experiment was run.
