# Source118 S3 RQ candidates and static closure

Each RQ was prechecked as `RELATED_ONLY` against the Source117 assignment-local denylist before its named public lookup. It has a distinct event schema/instrumentation/decision-attribution object; none is a forbidden spec-only, generic-interoperability, patch-novelty, or CRFEPOCH identity.

## S3-118-RQ01 — Perfetto/PyTorch nested-event trace-cut attribution

- Exact anchors: PyTorch `main` profiler API (Chrome JSON export and Kineto trace observer) and Perfetto stable `TrackEvent` schema; accessed 2026-08-24.
- Primary RQ: for one frozen public LLM operator/kernel/host trace exported under a declared profiler/schema version, does a nested event-shape class predict when a reduced trace cut preserves a fixed kernel-versus-host optimisation ranking?
- Stable contract: same trace clock, event schema, workload/request definition, ranking decision and capture configuration; no cross-profiler equivalence claim.
- Current-source/flag facts: PyTorch exposes `export_chrome_trace`, profiler scheduling and activities; Perfetto `TrackEvent` is stable/extensible and supports timing/flow fields. These sources make a vague “missing trace structure” premise invalid.
- Finite falsifier: one pair of same-class trace segments whose reduced and full traces produce different declared ranking, or a current baseline that already supplies the same decision-preserving trace cut under equal observer cost.
- Result: `PRE_RQ_NONADMISSION`. No named public LLM trace with the required capture configuration, fixed action-ranking endpoint, observer-effect measurement protocol, or fair current attribution comparator was jointly frozen. A schema/visualization selector would be generic telemetry.

## S3-118-RQ02 — vLLM aggregate metrics versus event-level attribution

- Exact anchors: vLLM `main` metrics design and current V1 metric logger source; accessed 2026-08-24.
- Primary RQ: for one frozen public vLLM workload and version, can a stable request/engine metric pattern identify when aggregate server metrics preserve the same scheduler/cache optimisation decision as event-level profiling?
- Stable contract: same vLLM version, request arrival/length distribution, metric mode, decision endpoint and full collection/correlation cost.
- Current-source/flag facts: vLLM exposes request/server metrics such as TTFT, prefill/decode time and cache utilization through `/metrics`; multiprocess behavior and `--api-server-count` change which built-in process metrics are exposed. Thus metric observations cannot be assumed to reflect a unique event-level cause.
- Finite falsifier: a frozen workload with the same aggregate pattern but a different full-trace decision, or an existing current attribution comparator producing the same endpoint at no worse full cost.
- Result: `PRE_RQ_NONADMISSION`. The exact public workload/trace, instrumentation mapping from metric to event, fixed scheduler/cache choice and observer-effect accounting are not frozen. No current-system absence or debugging fault is asserted.

## S3-118-RQ03 — OpenTelemetry GenAI trace hierarchy observability budget

- Exact anchors: OpenTelemetry GenAI semantic-conventions repository/schema `1.42.0` and current GenAI attribute registry; accessed 2026-08-24.
- Primary RQ: for one frozen public agent/LLM trace and declared OTel GenAI schema, does a bounded span/attribute subset preserve a fixed routing or observability decision under an explicit capture-cost budget?
- Stable contract: same trace/span hierarchy, attribute-stability version, sampling/export configuration, decision endpoint and privacy/capture cost.
- Current-source/flag facts: current conventions cover client model/agent signals and define provider discriminators, while current public discussion distinguishes missing server/engine semantics. This is an interface boundary, not proof of a residual research contribution.
- Finite falsifier: a same-object trace in which the retained subset changes the frozen decision, or a current implementation/configuration already captures the same sufficient subset with no worse cost.
- Result: `PRE_RQ_NONADMISSION`. No canonical public trace, source-level instrumentation/flags, fixed decision endpoint, current server/engine comparator or full-cost protocol is jointly specified; semantic-convention text alone is a carrier.

## Funnel accounting

`offline_seed=6`; `selected_rq=3`; `denylist_exact_or_contains=0`; `denylist_related_only=3`; `valid_selected_locator=0`; `pre_rq_nonadmission=3`; `evidence_qualified_raw=0`; `deep=0`; `clean_stage0_brief=0`.

These outcomes are bounded contract closures, not evidence of global absence, a tool/category STOP, a profiler defect, or a scientific negative result.
