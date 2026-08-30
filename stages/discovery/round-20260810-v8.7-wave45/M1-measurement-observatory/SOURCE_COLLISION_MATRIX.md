# Source collision matrix — Wave45 Measurement N3

| Object | Official source | Oracle | Current action union | Decision |
|---|---|---|---|---|
| PyTorch Kineto | https://github.com/pytorch/kineto | Recorded operator trace | PyTorch compile/runtime controls | Selector/no natural full-cost carrier — DROP |
| TensorFlow Profiler | https://www.tensorflow.org/guide/profiler | Supplied profile analysis | TF/XLA compilation and pipeline controls | Measurement/configuration only — DROP |
| Kubernetes metrics API | https://kubernetes.io/docs/tasks/debug/debug-cluster/resource-metrics-pipeline/ | Metric query | Native autoscaling/control loop | Controller residual — DROP |
| Spark event logs | https://spark.apache.org/docs/latest/monitoring.html | Event-log aggregation | Scheduler/AQE/cache/partition union | Dashboard/selector residual — DROP |
| Linux perf | https://www.kernel.org/doc/html/latest/admin-guide/perf-security.html | Fixed-profile decoding | Sampling/reporting, not application action | Diagnostic wrapper — DROP |
| JAX profiling | https://docs.jax.dev/en/latest/profiling.html | Captured trace | JIT/sharding/execution configuration union | No natural carrier/action divergence — DROP |

All six are outside the Wave34 and Wave38 M1 census and were screened against the plan/registry active and terminal exclusions before admission.  No implementation-absence claim is made.
