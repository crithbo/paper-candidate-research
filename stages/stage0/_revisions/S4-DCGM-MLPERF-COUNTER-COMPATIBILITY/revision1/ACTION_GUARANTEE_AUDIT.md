# Current action and guarantee audit

## Current union mapping

| Current capability / work | Fair role | Does it absorb the revised claim? |
|---|---|---|
| DCGM profiling group catalogue, automatic multiplexing, `dmon`, 1 Hz default / configurable interval | Complete deployment baseline | Absorbs field listing, field selection and ordinary monitoring; not the frozen paired conclusion-stability protocol. |
| DCGM GPM on Hopper/newer | No-gain boundary | Yes for a GPM object because concurrent collection removes the required resource conflict. Excluded by the frozen T4 object. |
| DCGM introspection | Shared host-cost source | Absorbs host-engine CPU/RSS telemetry; does not assign it per watch. |
| MLPerf Inference/Power | Carrier and same-object protocol | Absorbs workload, quality, performance and physical wall-power process; not the DCGM counter-validity comparison. |
| CounterPoint (ASPLOS 2026 extended) | Strong methodological subtractor | Absorbs generic counter-noise/multiplexing-confidence narrative. Its stated Haswell MMU model case does not establish the exact DCGM+MLPerf contract. |

## Complete action grammar

`F` is fixed.  A has exactly one legal action: observe all `F` through stock DCGM automatic multiplexing at 100 ms.  B has exactly two observation actions, `G1` and `G2`, each used once per replicate; their order may be randomized but no fields may be added/dropped and no feedback changes a later action.  The group catalogue is a native action constraint, not an optimization input.  If the runtime output differs from the frozen grammar, the failure sentinel applies.

The only candidate guarantee is protocol-level: a conclusion label is compared under identical workload/quality/request and charged full-cost conditions.  It does **not** guarantee performance, energy reduction, causal bottleneck discovery, or counter truth outside the named device/version/workload boundary.

## Primary sources

- [NVIDIA DCGM Profiling](https://docs.nvidia.com/datacenter/dcgm/latest/learn/modules/profiling.html): interval-average semantics, T4 compatible-group example, automatic multiplexing and high-frequency zero behavior.
- [NVIDIA DCGM Profiling API](https://docs.nvidia.com/datacenter/dcgm/latest/dcgm-api/dcgm-api-profiling.html): older-GPU concurrency constraints versus GPM concurrent collection.
- [NVIDIA DCGM Introspection](https://docs.nvidia.com/datacenter/dcgm/latest/learn/modules/introspection.html): host-engine CPU/RSS scope.
- [NVIDIA DCGM supported platforms](https://docs.nvidia.com/datacenter/dcgm/latest/user-guide/getting-started.html): T4 class support and R450+ driver requirement.
- [MLPerf Inference](https://docs.mlcommons.org/inference/index_gh/) and [Power](https://docs.mlcommons.org/inference/power/): versioned workload and physical power process.
- [CounterPoint](https://arxiv.org/abs/2601.01265): the bounded strongest methodological subtractor.

