# S4 Source13 — Accelerator Full-Cost Measurement / Benchmark Screen

Assignment `DISCOVERY-S4-20260814-ADAPTIVE-SOURCE13`; canonical v8.7; claim-pack `OFF`; source-only review on 2026-08-14.  The assignment permits `MEASUREMENT_CHARACTERIZATION` and `BENCHMARK_DATASET` as independent paper types.  Network security, protocol/traffic security, vulnerabilities, defensive replay, and exploit-related families were excluded before screening.

| Raw screen ID | Family | Primary-source current anchor | Result |
|---|---|---|---|
| R1 | `DCGM_MLPERF_COUNTER_COMPATIBILITY_FULLCOST_CHARACTERIZATION` | Current DCGM documents architecture-dependent concurrent counter groups, automatic multiplexing, and possible zero values at high sampling frequency; MLPerf Inference fixes workload/scenario/quality contracts and documents system-level wall power. | `CANDIDATE_GRADE_DEEP_REVIEW` → `PROPOSE_STAGE0`; the residual is a compatibility-stratified, full-cost measurement contract, not a dashboard or a controller. |
| R2 | MLPerf Inference power-ranking aggregation | MLPerf already measures wall/system power or energy for its accompanying benchmark and validates accuracy/scenario. | `STRUCTURAL_DROP__METRIC_RESTATEMENT`: alternate power-per-query aggregation without a validity mechanism is not a paper. |
| R3 | MLPerf Tiny energy-versus-quality benchmark dataset | MLPerf Tiny already fixes tasks, quality thresholds, latency modes, optional energy, code and result metadata. | `NOT_ADMITTED_UNFROZEN`: no distinct versioned natural submission panel, estimand or outcome-changing validity gap was frozen. |
| R4 | DCGM utilization dashboard / exporter fields | Current DCGM provides streamed profile fields and exporter metrics; fields depend on GPU/driver/permissions/configuration. | `STRUCTURAL_DROP__DASHBOARD_OR_REPORTING_ONLY`. |
| R5 | Android Macrobenchmark compilation-state study | Prior Source12 identity. | `EXCLUDED_SOURCE12_IDENTITY`. |
| R6 | LLVM LNT compiler full-cost protocol | Prior Source10 identity. | `EXCLUDED_SOURCE10_IDENTITY`. |

Counts: `RAW_SCREEN_ROW_EVENT=6`; `UNIQUE_OPPORTUNITY_FAMILY=4` (R1–R4); `CANDIDATE_GRADE_DEEP_REVIEW=1`; `STAGE0_BRIEF=1`; `PROPOSE_STAGE0=1`.

R1 does not assert a measured ranking reversal.  Official current documentation provides a concrete measurement threat: compatible profiling groups vary by architecture, automatic multiplexing is used where groups conflict, and high-frequency multiplexing may produce zeros.  The proposed paper-shaped claim is conditional on a finite natural-corpus test showing that this threat changes a workload bottleneck/ranking conclusion under a fully specified, same-workload comparator.  Hardware/resource absence is recorded only as readiness, never as a scientific negative.

## Primary sources and bounded collision search

- NVIDIA, [DCGM Profiling](https://docs.nvidia.com/datacenter/dcgm/latest/learn/modules/profiling.html), current docs accessed 2026-08-14: metric definitions, per-GPU group discovery, multiplexing, sampling caveat and counter-resource conflict.
- NVIDIA, [DCGM Profiling API](https://docs.nvidia.com/datacenter/dcgm/latest/dcgm-api/dcgm-api-profiling.html), current docs accessed 2026-08-14: Ampere-and-older group concurrency constraints versus Hopper-and-newer GPM behavior.
- NVIDIA, [DCGM Introspection](https://docs.nvidia.com/datacenter/dcgm/latest/learn/modules/introspection.html), current docs accessed 2026-08-14: host-engine CPU/RSS accounting boundaries.
- MLCommons, [MLPerf Inference benchmark](https://docs.mlcommons.org/inference/index_gh/) and [power measurement](https://docs.mlcommons.org/inference/power/), current docs accessed 2026-08-14: versioned releases, scenario/quality contracts and power-producer pathway.
- M. et al., [CounterPoint](https://arxiv.org/abs/2601.01265), 2026 original preprint: latest bounded methodological subtractor on multiplexing-noisy hardware counters.  It is not treated as identical to DCGM's current native compatibility contract or the MLPerf full-cost measurement question.

Search boundary: official NVIDIA/MLCommons current documentation plus the named original paper.  `SEARCH_BOUNDED_OPEN` applies; no global novelty claim is made.
