# Question Cards — Source27

## L27-01 / QC27-01 — OpenML version-pinned suite-run ranking validity

- Capsule and exact identity: `S4_OPENML_VERSIONED_BENCHMARK_SUITE`; one named public OpenML suite version, task IDs and run-result export under stock REST schema. `CANONICAL_BENCHMARK_ONLY`; no natural-deployment extrapolation.
- Contribution type / endpoint: `MEASUREMENT_CHARACTERIZATION`; a suite-specific estimand-availability and held-out conclusion-change result.
- Atomic estimand: ranking stability after excluding only documented incomplete or incompatible run records while retaining fixed task/split/metric semantics.
- Opportunity anchor: official documentation says suites are task sets with task IDs and that runs/other users' results can be retrieved through APIs; tasks fix data and train/test splits.
- Current union: official run documentation says runs link task, flow, parameters, predictions, metrics and locally computed runtimes; this is the strongest same-object native comparison surface.
- Contrary: official reference describes a suite as a study object carrying ID, task IDs and metadata; the benchmark documentation also says task and run sets can be created, edited, downloaded or deleted. This opposes any unpinned claim that an alias alone is an immutable version.
- Same-object / full-cost: fixed OpenML suite/task/run semantics only; disclosed result/runtimes and metadata validity, no imputed deployment or energy cost.
- Cheapest falsifier: a content-addressable official suite-and-run export plus a preregistered held-out task/version shows either the proposed availability rule has no effect or fails to reproduce its declared input set.
- Missing evidence not scientific failure: a frozen official machine-readable suite/run export and an independent primary same-object comparator. The assignment used only source pages and did not obtain such bytes.
- Required-field audit: `INCOMPLETE`; identity relation: `FRESH` relative to the Source25/26 cooldown surfaces; disposition: `LOCATOR_ONLY__PUBLIC_EVIDENCE_UNCLOSED`; C0: `NO`.

## L27-02 / QC27-02 — Renaissance tagged harness phase-conditioned ranking validity

- Capsule and exact identity: `S4_RENAISSANCE_VERSIONED_JVM_BENCHMARK_RESULTS`; latest non-prerelease tag, fixed harness/workload and public run artifact under stock JVM harness semantics.
- Contribution type / endpoint: `MEASUREMENT_CHARACTERIZATION`; a tagged-suite phase-conditioned ranking-validity conclusion, not a JVM controller or VM tuning method.
- Atomic estimand: a predeclared ranking functional conditional on the harness's disclosed warmup/measurement/full-cost phases.
- Opportunity anchor: the official suite documentation describes a harness for running benchmarks and collecting results.
- Current union: the required current release/tag and harness schema could not be pinned from the bounded official release route; therefore the native legal action/configuration union is unclosed.
- Contrary: the official repository's compatibility history supplies version dependence, which refutes treating an old suite description as a current-tag contract; it does not prove a current gap.
- Same-object / full-cost: would include only tagged workload, JVM/harness version, measurement window, warmup and published run artifacts. No cross-JVM deployment conclusion is allowed.
- Cheapest falsifier: one tagged public result artifact with phase metadata and a held-out workload; no phase effect or broken exact-tag route falsifies the intended characterization.
- Missing evidence not scientific failure: content-addressable current tag/harness schema and a public result artifact. Browser authentication failed on the official releases route, so no current-absence conclusion is drawn.
- Required-field audit: `INCOMPLETE`; identity relation: `FRESH` relative to Source25/26 surfaces; disposition: `LOCATOR_ONLY__PUBLIC_EVIDENCE_UNCLOSED`; C0: `NO`.
