# Public natural-trace N3 bottleneck migration — source and collision matrix

**Assignment:** `DISCOVERY-S2-20260811-V8.7-WAVE173-PUBLIC-NATURAL-TRACE-BOTTLENECK-MIGRATION-N3-BREADTH`  
**Cutoff:** 2026-08-11. Sources are official project documentation or standards-body specifications.

| Family | Official natural-trace anchor | Current strongest mechanism union / N3 collision | Decision |
|---|---|---|---|
| Spark | [monitoring](https://spark.apache.org/docs/latest/monitoring.html), [configuration](https://spark.apache.org/docs/3.5.7/configuration.html) | event logging, rolling, history replay and compaction; compaction is explicitly lossy | no same-object lossless exploitation mechanism; `NOT_ADMITTED_UNFROZEN` |
| Ceph | [perf counters](https://docs.ceph.com/en/reef/dev/logs/), [API](https://docs.ceph.com/en/latest/mgr/ceph_api/) | OSD/storage/network subsystems and configurable counters | no controlled public multi-version corpus/current explanation; `NOT_ADMITTED_UNFROZEN` |
| Redis | [latency monitoring](https://redis.io/docs/latest/operate/oss_and_stack/management/optimization/latency-monitor/), [SLOWLOG](https://redis.io/docs/latest/commands/slowlog/) | command loop, persistence and thresholded monitoring union; SLOWLOG excludes client I/O | partial trace cannot establish end-to-end transfer; `NOT_ADMITTED_UNFROZEN` |
| Istio/Envoy | [Istio telemetry](https://istio.io/latest/docs/reference/config/telemetry/), [logs](https://istio.io/latest/docs/tasks/observability/logs/) | proxy telemetry, sampling, access-log provider/filter union | sampling/policy confounds; no stable same-object law/action frozen; `NOT_ADMITTED_UNFROZEN` |
| Ray | [Ray timeline API](https://docs.ray.io/en/latest/ray-core/api/doc/ray.timeline.html) | scheduler, object store, task events and profiling union | profile requires enabling flags; no controlled natural effect/action frozen; `NOT_ADMITTED_UNFROZEN` |
| OpenTelemetry | [trace API](https://opentelemetry.io/docs/specs/otel/trace/api/), [metrics data model](https://opentelemetry.io/docs/specs/otel/metrics/data-model/) | instrumentation, SDK, collector, exporter and reaggregation union | generic schema, not an object-specific stable bottleneck law; `NOT_ADMITTED_UNFROZEN` |

## Controlled-repeat and full-cost boundary

Each row has a finite repeat route in the log, but none currently closes all three requirements together: multiple natural objects/time slices, controlled confounds, and a non-controller same-object exploitation mechanism. This is why no single correlation is promoted. The required denominator always includes the original workload plus tracing/logging/storage/export costs; no telemetry-only improvement can support a bottleneck-transfer claim.

`PROPOSE_STAGE0: []`. No row is rejected for missing implementation, positive outcome, resources, or AI readiness.
