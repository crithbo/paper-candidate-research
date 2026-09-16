# Source and collision audit

Audit date: 2026-08-14.  Static review only; no DCGM/MLPerf command, source build, download or benchmark was run.

| Source | Primary finding | Decision impact |
|---|---|---|
| [DCGM profiling guide](https://docs.nvidia.com/datacenter/dcgm/latest/learn/modules/profiling.html) | Profiling fields are interval averages; default sampling is 1 Hz; incompatible counters can multiplex; high-frequency multiplexing can return zeroes; the runtime catalogue is GPU-specific. | Confirms exact measurement risk and absorbs raw field/group selection. Requires runtime catalogue pin and forbids attribution overclaim. |
| [DCGM profiling API](https://docs.nvidia.com/datacenter/dcgm/latest/dcgm-api/dcgm-api-profiling.html) | Older grouping has concurrency restrictions; Hopper/newer GPM groups can be collected concurrently. | Forces non-GPM pin or an explicit no-gain conclusion; blocks generalization across architectures. |
| [DCGM introspection](https://docs.nvidia.com/datacenter/dcgm/latest/learn/modules/introspection.html) | Reports whole-host-engine CPU/RSS only and observations rather than budgets. | Requires host cost but prevents false per-client attribution. |
| [MLPerf Inference](https://docs.mlcommons.org/inference/index_gh/) | Current release documents distinct model/dataset/category contracts. | “MLPerf” alone is under-specified; revision must select one released object. |
| [MLPerf power](https://docs.mlcommons.org/inference/power/) | Power path uses analyzer/PTDaemon and a testing-range procedure. | Requires wall-energy/power-path accounting, not GPU-only energy proxy. |
| [CounterPoint](https://arxiv.org/abs/2601.01265) | Tests user-specified microarchitectural models against noisy/multiplexed counter data; Haswell MMU case study. | Strong methodological subtractor; no direct same-object collision established in this bounded audit. |

## Collision conclusion

`SEARCH_BOUNDED_OPEN`: no inspected source implements the exact DCGM compatible-group versus automatic-multiplex paired MLPerf conclusion-stability contract with identical quality/request stream, wall-energy/tail, host-cost ledger, and held-out falsifier.  This is not an absence assertion beyond the cited boundary.  If the next audit finds CounterPoint (or another primary source) applying that same contract, the candidate stops as absorbed.

