# Source118 S4 profiler/telemetry attribution pre-RQ closure ledger

## Bounded public carriers

- Perfetto TrackEvent: `https://perfetto.dev/docs/instrumentation/track-events`.
- Perfetto TracePacket schema: `https://perfetto.dev/docs/reference/trace-packet-proto`.
- PyTorch profiler configuration: `https://docs.pytorch.org/tutorials/recipes/recipes/profiler_recipe.html`.
- Nsight Systems documentation: `https://docs.nvidia.com/nsight-systems/UserGuide/index.html`.
- ROCprofiler-SDK documentation: `https://rocm.docs.amd.com/projects/rocprofiler-sdk/en/latest/`.

## Mandatory packet and dispositions

Admission requires exact profiler version/event schema; instrumentation source and default/non-default flags; canonical workload/public trace; fixed optimization decision endpoint; observer effect/full cost; fair current attribution comparator; and finite falsifier.

| RQ | carrier available | missing packet fields | disposition |
|---|---|---|---|
| S4-118-RQ01 | Perfetto schema | source/flags, trace, endpoint, comparator, observer/full cost, falsifier | PRE_RQ_NONADMISSION |
| S4-118-RQ02 | PyTorch profiler config | version/source/flags, trace, endpoint, comparator, observer/full cost, falsifier | PRE_RQ_NONADMISSION |
| S4-118-RQ03 | Nsight documentation | version/source/flags, trace, endpoint, comparator, observer/full cost, falsifier | PRE_RQ_NONADMISSION |
| S4-118-RQ04 | ROCprofiler documentation | source/flags, trace, endpoint, comparator, observer/full cost, falsifier | PRE_RQ_NONADMISSION |
| S4-118-RQ05 | generic schema surfaces | complete same-object packet and true fault, if debug | PRE_RQ_NONADMISSION |

Telemetry is treated only as carrier. No row is a selected locator, raw admission, profiler-accuracy claim, scientific DROP, or STOP. No source was downloaded, built, or executed.

