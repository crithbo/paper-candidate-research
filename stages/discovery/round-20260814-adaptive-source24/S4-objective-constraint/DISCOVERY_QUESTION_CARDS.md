# Source24 Discovery Question Cards

These are locator cards, not Stage 0 briefs.  Neither complete card is promoted to fresh raw because its required independent subtractor/holdout contract remains open.

## Q24-01 — MLPerf Client v1.5 per-device ranking validity

- **Identity:** `MLPERF_CLIENT_V1_5__CLIENT_LLM_RESULT_PANEL__PER_DEVICE_RANKING_VALIDITY`; MLPerf Client v1.5, published 2025-11-17; carrier kind `CANONICAL_BENCHMARK_ONLY`; network-security exclusion `PASS`.
- **Lenses:** `NATURAL_OR_CANONICAL_EVIDENCE`, `TENSION_OR_PARETO`.
- **Problem:** The public Client benchmark reports client-LLM responsiveness/throughput across PC hardware, while GPU-focused configurations run available GPUs one at a time and report per-device results.  A purchaser-facing ranking can be materially sensitive to the benchmark’s unit of observation, but a rule-consistent validity comparison is not yet frozen.
- **Proposed insight:** A `BENCHMARK_DATASET`/`MEASUREMENT_CHARACTERIZATION` contribution might test whether the canonical per-device score remains stable under a predeclared same-quality, same-model result partition; it is distinguishable only if it changes a benchmark-validity conclusion rather than choosing a runtime option.
- **Contract:** exact object is one Client release/model/task/quality contract; endpoint is `benchmark validity or coverage`; counterfactual is a documented rank/conclusion change under a valid alternate observation split; initial full cost includes execution, warm-up, result/report collection, trace/storage and analysis; no deployment extrapolation is claimed.
- **Evidence/opposition:** official Client documentation is current measurement union and stock oracle; the strongest contrary explanation is that per-GPU reporting is already the intended benchmark unit.  A missing independent validity subtractor and a held-out hardware/model split remain.
- **Cheapest decisive test:** freeze release-specific result reports, a non-circular independent comparator and one held-out device/model stratum; stop if the claim is merely a device/configuration selector.
- **Required-field audit:** `INCOMPLETE`; **identity relation:** `FRESH`; **disposition:** `LOCATOR_ONLY__NOT_RAW_NOT_C0_NOT_SCIENTIFIC_STOP`; **eligible for C0:** `NO`.

## Q24-02 — MLPerf Endpoints v0.7 report-completeness/ranking stability

- **Identity:** `MLPERF_ENDPOINTS_V0_7__GENAI_ENDPOINT_RESULT_REPORTS__REPORT_COMPLETENESS_RANKING_STABILITY`; Endpoints v0.7, published 2026-07; carrier kind `CANONICAL_BENCHMARK_ONLY`; network-security exclusion `PASS`.
- **Lenses:** `NATURAL_OR_CANONICAL_EVIDENCE`, `BOUNDARY_OR_FAILURE`.
- **Problem:** The public endpoint panel links each point to a self-contained run report with concurrency, TTFT, TPOT, tokens/s and node hardware/software details.  A validity/coverage contribution could ask whether the public report fields support a stable procurement conclusion without collapsing latency and throughput, but that estimator has not been independently defined.
- **Proposed insight:** A `BENCHMARK_DATASET` contribution may exist only as a reproducible report-coverage/stability characterization, distinguishable through a predeclared conclusion function and holdout—not through dashboard filtering or score selection.
- **Contract:** exact object is Endpoints v0.7 public reports at their versioned release; endpoint is `benchmark validity or coverage`; full cost must include report acquisition/normalization, run-report fields and all declared analysis transformations; no natural-deployment claim.
- **Evidence/opposition:** Endpoints’ public reports are the stock oracle/current union; the strongest contrary explanation is that v0.7 is explicitly a foundation release and its own reports may already supply the relevant context.  Independent subtractor, locked conclusion threshold and held-out report/model/provider split are missing.
- **Cheapest decisive test:** pre-register one release-pinned report subset and one later/held-out subset with an independent validity comparator; stop on a filter-only explanation or no rank/conclusion change.
- **Required-field audit:** `INCOMPLETE`; **identity relation:** `FRESH`; **disposition:** `LOCATOR_ONLY__NOT_RAW_NOT_C0_NOT_SCIENTIFIC_STOP`; **eligible for C0:** `NO`.

## Q24-03 / Q24-04 — identity filters

- `MLPERF_STORAGE_V2_CHECKPOINT`: `EXCLUDED_BEFORE_RAW__SOURCE23_IDENTITY`; its nominal file population was already found synthetic under the previous carrier gate.
- `MLPERF_TRAINING_V6_CROSS_HARDWARE`: `EXCLUDED_BEFORE_RAW__SOURCE18_IDENTITY`.
