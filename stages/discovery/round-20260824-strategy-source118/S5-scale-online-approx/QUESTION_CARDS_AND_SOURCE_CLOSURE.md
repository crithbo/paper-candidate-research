# Source118 S5 profiler / telemetry / attribution closure

Static public-source closure only.  No profiler, telemetry exporter, trace, workload, server, or backend was downloaded or run.  Telemetry remains a carrier, not a causal attribution or optimization conclusion.

## RQ01 — vLLM online metrics attribution

- **Current schema/source locus:** [vLLM V1 metrics API](https://docs.vllm.ai/en/stable/api/vllm/v1/metrics/) identifies the current metrics package and its Prometheus, stats, reader and analytic performance components.  This is a code/API surface, not a frozen production metric schema or a canonical workload trace.
- **Missing exact observation contract:** no vLLM version/commit, metric family/label set, scrape interval, metrics-export configuration, request-arrival/session/prefix workload, clock window, or underlying event correlation was frozen.  Therefore a metric delta cannot be assigned to admission, scheduling, cache or execution behavior.
- **Current comparator and full cost:** a fair comparator needs the same server/model/config/workload with metrics configuration off/on or an equally informative current telemetry path; it must include collection/scrape/serialization/storage overhead, host CPU/memory, request latency/throughput and any sampling loss.  None is specified.
- **Finite falsifier:** a frozen trace/workload with a prespecified optimization decision and independent event-level reference that reverses or nulls the telemetry attribution would falsify the premise.  No such pair is available in this assignment.
- **Disposition:** `PRE_RQ_NONADMISSION__VLLM_VERSION_METRIC_SCHEMA_WORKLOAD_COMPARATOR_OBSERVER_COST_AND_DECISION_ENDPOINT_UNFROZEN`.

## RQ02 — PyTorch Profiler / Kineto sampling attribution

- **Current schema/source and flags:** [current PyTorch Profiler documentation](https://docs.pytorch.org/docs/main/profiler) defines activity selection, wait/warmup/active schedules, `record_shapes`, `profile_memory`, `with_stack`, `execution_trace_observer`, post-processing timeout and dynamic collection.  It explicitly warns that shape/stack tracing adds overhead and may hold tensor references/cause copies.  [Current Kineto implementation documentation](https://github.com/pytorch/kineto/blob/main/libkineto/README.md) describes warmup/collection states, activity backends and trace-output path.
- **Contrary/current result:** the sampling schedule and enabled activities are part of the measurement treatment.  The current sources therefore contradict a generic claim that a trace's host/device attribution is observer-independent.
- **Missing canonical carrier and endpoint:** no exact PyTorch/Kineto version, device/runtime, activity set, warmup/active schedule, sampling period, canonical workload/public trace, fixed optimization decision, strong current comparator, or exact event schema/oracle is frozen.  No true profiler fault is observed.
- **Full cost / finite falsifier:** observer setup, warmup, collection callbacks, CUPTI/driver activity, buffering, trace processing/export, host/device memory, lost/perturbed work and latency/throughput must share a denominator.  A predefined no-profiler or independent-hardware-trace comparison overturning the attribution would be decisive; no such data are acquired here.
- **Disposition:** `PRE_RQ_NONADMISSION__PROFILER_VERSION_EVENT_SCHEMA_FLAGS_WORKLOAD_COMPARATOR_AND_DECISION_ENDPOINT_UNFROZEN`.

## RQ03 — OpenTelemetry GenAI online-span attribution

- **Schema locator:** the public [OpenTelemetry GenAI semantic-conventions location](https://opentelemetry.io/docs/specs/semconv/gen-ai/gen-ai-spans/) currently redirects/moves; no immutable schema version, semantic-convention revision, instrumentation library version, span attributes, sampling policy or canonical trace was frozen by the selected source route.
- **Same-request attribution failure:** without an exact request/span propagation contract and a trace clock/correlation model, queue, generation and network spans cannot be assigned to the same request semantics.  A generic GenAI tracing dashboard is excluded by the Source118 denylist.
- **Comparator, observer effect and full cost:** any admissible endpoint would need the same online workload, tracing-off/current-tracing comparator, sampler/exporter/batching/backpressure configuration, CPU/memory/network/storage costs, dropped-span rate, timing perturbation and a fixed admission/queue/latency decision.  These fields are unset.
- **Finite falsifier:** an immutable public trace plus a named independent request-level oracle showing incompatible causal order or decision reversal would be decisive.  No such trace is selected or downloaded.
- **Disposition:** `PRE_RQ_NONADMISSION__OTEL_SCHEMA_VERSION_INSTRUMENTATION_TRACE_COMPARATOR_OBSERVER_COST_AND_DECISION_ENDPOINT_UNFROZEN`.

## Denylist and result

- Source117's format/spec-only identities are distinct from profiler telemetry but establish the same rule: a carrier without a current same-object residual and fixed endpoint is not raw.  The three RQs fail independently for their missing attribution contract.
- A9 was not read.  This result does not claim that profiling is inaccurate, that any trace lacks value, or that no observer-effect research opportunity exists.

`offline_seed=4; provisional_RQ=3; valid_selected_RQ=0; pre_RQ_nonadmission=3; raw=0; deep=0; clean_brief=0`.

`COMPLETE_ZERO_PROPOSALS__PROFILER_ATTRIBUTION_CONTRACT_UNFROZEN`.
