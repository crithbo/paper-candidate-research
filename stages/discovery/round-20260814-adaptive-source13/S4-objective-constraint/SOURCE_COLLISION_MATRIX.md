# Source13 Source / Collision Matrix

## R1 — DCGM / MLPerf counter-compatibility characterization

| Facet | Proposed measurement claim | Current strongest comparator / collision | Residual and bound |
|---|---|---|---|
| Exact object | Same released MLPerf Inference workload, scenario, quality contract and GPU/driver; no change to model output or SUT semantics | DCGM's native `dcgmi profile` / profiling API on the identical run; MLPerf LoadGen/accuracy and wall-power pathway | Same object retained. |
| Measurement action | Pre-enumerate the GPU-native compatible metric groups; use randomized repeated *identical* workload windows for incompatible groups; preserve paired power/throughput/tail outcomes; quantify whether group choice changes bottleneck/ranking conclusion | DCGM already discovers groups and may automatically multiplex them; existing monitoring streams fields | The residual is not field selection or a live controller: it is an offline, repeatable estimand/protocol whose object is validity of utilization explanations under native incompatibility. |
| Information / fairness | Only native `dcgmProfGetSupportedMetricGroups`/`dcgmi profile --list` capability and MLPerf public logs; no secret counter mapping or kernel instrumentation | Current DCGM can enumerate group support; MLPerf holds quality/scenario fixed | Same information; the method cannot claim access to unavailable counters. |
| Guarantee | Conditional characterization: either a preregistered compatibility-stratified conclusion is stable on held-out workload/GPU strata, or the study reports the boundary/no-change result | CounterPoint is a recent broad counter-measurement methodological subtractor | Direct subtractor narrowed: no source found in the bounded search that supplies this exact DCGM-native + MLPerf full-cost protocol. Stage 0 must independently audit it. |
| Full cost | SUT wall energy, throughput/tail response, power-server measurement, DCGM collection overhead, host-engine CPU/RSS, number/duration of repeated windows, preprocessing/analysis cost | MLPerf Power is full-system wall power; DCGM Introspection measures host-engine rather than client-attributed overhead | The proposal explicitly rejects GPU-only watts or zero-cost monitoring. |
| Natural carrier / falsifier | Versioned MLPerf Inference release; public closed-division models/scenarios, public submission metadata/logs and reference implementation route | MLPerf benchmark/protocol is the current strong carrier | Killer: on a preregistered held-out model-scenario/GPU stratum, compatible-group protocol and native multiplexed stream yield the same ranking/classification within stated interval; then no N3 usefulness claim. |

Current-upstream reality check: NVIDIA's current docs require querying supported metric groups on the selected GPU and state that Ampere-and-older groups may conflict while Hopper-and-newer GPM does not have the same concurrency restriction.  The documentation also states that automatic multiplexing can yield zeroes at higher frequency.  This is affirmative documentation of a limitation, not an absence claim.  Relevant defaults/nondefaults include the default 1 Hz sample rate, configurable delay, `dcgmi profile --list`, `dcgmi dmon` field selection, and automatic multiplexing.  Native group enumeration is the deployment baseline; a selector over it is not the claimed contribution.

## Other families

| Family | Current union / collision | Disposition |
|---|---|---|
| MLPerf power aggregation | Official MLPerf fixes full-system power/energy and quality/scenario; repackaging the ratio is a metric restatement. | `STRUCTURAL_DROP` |
| MLPerf Tiny energy dataset | Current benchmark already supplies tasks, datasets, quality and optional energy.  No new validity gap or carrier was frozen. | `NOT_ADMITTED_UNFROZEN` |
| DCGM exporter dashboard | Existing streamed fields/exporter; no characterization estimator or conclusion-changing consequence. | `STRUCTURAL_DROP` |
| Android Macrobenchmark | Source12 identity. | `EXCLUDED` |
| LLVM LNT | Source10 identity. | `EXCLUDED` |
