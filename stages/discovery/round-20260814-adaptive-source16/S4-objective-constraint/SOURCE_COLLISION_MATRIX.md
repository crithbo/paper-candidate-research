# Source16 semantic-residual / collision matrix

| Family | Opportunity anchor and same-object semantics | Current native union and strongest subtractor | Carrier/oracle + residual decision |
|---|---|---|---|
| VTune XPU-offload attribution | Same application, inputs, CPU/GPU/NPU topology and observable output; only the measurement inference is at issue. | `gpu-offload`/`xpu-offload` task, usage/idle, occupancy and adapter-view union.  Strongest subtractor must be an independent application-level attribution oracle, not another VTune view. | Official tutorials/samples are not a versioned natural multi-device application panel. `NOT_ADMITTED_UNFROZEN`. |
| PyTorch trace-window ranking | Same Python/model/input/device output and training/inference step. | Current activity, schedule, export, shape/stack/memory option union; a schedule selector is absorbed.  Strongest subtractor must be lower-intrusion ground truth under the same run semantics. | No non-overlapping natural panel and comparator contract were pinned. `NOT_ADMITTED_UNFROZEN`. |
| Nsight Graphics replayed-frame utilization | The reported object is a capture replay, not the original live process. | Replay, trace, multipass, warmup, clocks, collection buffers/bandwidth and interception. | No natural frame panel or live/replay validity oracle. `NOT_ADMITTED_UNFROZEN`. |
| OpenVINO Benchmark Tool | Fixed model/device execution, but only runner output is proposed. | Performance hints, counters, reports and other runner flags. | No independent estimand beyond configuration/reporting. `STRUCTURAL_DROP`. |
| TensorFlow Profiler | Historical M1 family. | — | `EXCLUDED_HISTORICAL_REPEAT`. |
| ROCprofiler HIP concurrency | Source15 contract-saturated family. | — | `EXCLUDED_CONTRACT_CARRY_FORWARD_SATURATED`. |

## Current-upstream reality check

The two deep rows were checked against current first-party documentation, including their documented default/configuration paths.  VTune’s GPU Offload UI selects a most-recent GPU by default when no device is selected, while an explicit all-device selection is current union behavior.  PyTorch’s default profiler schedule records continuously; non-default wait/warmup/active/repeat schedules are also first-party supported.  Therefore neither an adapter choice nor a trace-window choice is treated as a new action.  The missing elements are a natural carrier and independently specified validity subtractor, so absence is not claimed and no direct-absorption conclusion is invented.

## Finite closure boundary

For either unfrozen item, a future bounded closure must first pin: (1) release/revision and public natural carrier; (2) estimator and independent same-run validity comparator; (3) confound controls and all collection/analysis costs; and (4) a held-out workload/device falsifier.  It must stop if the result is only a dashboard, schedule/configuration selection, metric restatement, or unchanged conclusion/ranking.  No experiment was run here.
