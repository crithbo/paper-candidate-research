# Comparator matrix — S4-DCGM-MLPERF-COUNTER-COMPATIBILITY

| Comparator | Object/claim | What it absorbs | What remains only if the revision gate closes |
|---|---|---|---|
| NVIDIA DCGM current profiling | Device interval metrics, compatible-group discovery, automatic multiplexing | Field access, group enumeration, streaming, multiplexer configuration | Paired conclusion-stability estimand under same MLPerf quality/request/full-cost contract |
| MLPerf Inference + Power | Benchmark workload/quality/scenario and full-system power process | Natural carrier, quality checks, official performance/power path | Measurement-validity characterization across DCGM plans |
| CounterPoint (ASPLOS 2026 extended) | Counter-noise confidence regions for microarchitectural-model consistency | Generic “multiplexing is noisy” narrative and ungrounded confidence analysis | DCGM architecture-specific group contract tied to MLPerf wall-energy/tail and held-out conclusion change |
| Nsight / developer profiling | Application-level attribution tooling | Any claim that DCGM itself attributes a counter to a kernel/instruction | None; the candidate explicitly excludes attribution claims |

## Paper-shape calibration

| Reference | Evidence form | Calibration implication |
|---|---|---|
| [CounterPoint](https://arxiv.org/abs/2601.01265) | ASPLOS-accepted measurement methodology with explicit noisy-counter model | Q2 requires a concrete inference question and a falsifiable counter-noise protocol, not a dashboard |
| [MLPerf Inference benchmark](https://docs.mlcommons.org/inference/index_gh/) | Community benchmark contract with versioned natural workloads | The carrier can be credible only with an exact release/model/scenario/SUT pin |
| [NVIDIA DCGM profiling documentation](https://docs.nvidia.com/datacenter/dcgm/latest/learn/modules/profiling.html) | Official deployment semantics | A paper cannot rebrand native group listing/multiplexing as its algorithmic contribution |

Conclusion: conditional Tier B, not Q1-calibrated.  The revision needs a conclusion-changing held-out design; otherwise it remains ordinary monitoring methodology.

