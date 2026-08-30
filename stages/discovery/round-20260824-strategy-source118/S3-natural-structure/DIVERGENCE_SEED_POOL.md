# Source118 S3 Divergence Seed Pool

## Pool metadata

- Assignment / lane: `DISCOVERY-S3-20260824-SOURCE118-PROFILER-TELEMETRY-ATTRIBUTION-V1` / `DISCOVERY_S3`
- Frozen profile: `SOURCE118_PUBLIC_PROFILER_TELEMETRY_ATTRIBUTION_MEASUREMENT_ROTATION_V1`
- Seed ceiling: `12`; generated: `6`; RQ ceiling: `8`
- Network-security exclusion: `PASS`; generation completed before evidence lookup: `YES`
- Prelookup denylist rule: exact-or-contains identities (`SPEC_OR_TEST_ONLY_WITHOUT_CURRENT_SAME_OBJECT_RESIDUAL`, generic interoperability, patch novelty, CRFEPOCH) are excluded; no replacement after outcome observation.

## Seed records

### S3-118-SEED01

- Engine / perspective: `ABSTRACTION_LADDER` / `MEASUREMENT_REVIEWER`; prelookup denylist: `RELATED_ONLY` (distinct profiler event schema and decision-changing attribution).
- Hunch: a fixed LLM request/workload may exhibit stable host–operator–kernel nesting classes across a versioned PyTorch Profiler trace schema; the class could support a bounded attribution decision rather than a dashboard.
- Anchor candidate: current PyTorch Profiler/Kineto trace schema and one public LLM trace. The cautious conclusion would be only that a defined event-class invariant changes a declared optimization choice.
- Risk: no public trace, observer-effect accounting, comparator or endpoint would reduce this to telemetry presentation; `KEEP_FOR_CONVERGENCE`.

### S3-118-SEED02

- Engine / perspective: `CONSTRAINT_MANIPULATION` / `OPERATOR`; prelookup denylist: `RELATED_ONLY`.
- Hunch: removing GPU-kernel events or host enqueue events from a canonical Perfetto trace may reverse a fixed optimisation ranking; natural event hierarchy may predict when that loss is decision-relevant.
- Anchor candidate: Perfetto Trace Event/Track Event schema plus a named public LLM trace. The claim must include trace capture cost and a fixed ranking decision.
- Risk: missing workload/decision endpoint makes it a generic trace visualization; `KEEP_FOR_CONVERGENCE`.

### S3-118-SEED03

- Engine / perspective: `JANUSIAN_TENSION` / `COMPILER_OR_BACKEND_ENGINEER`; prelookup denylist: `RELATED_ONLY`.
- Hunch: vLLM's serving metrics and profiler event timeline expose different temporal granularities; a stable mapping may predict whether a scheduler/cache action is attributed to the correct source.
- Anchor candidate: current vLLM metrics documentation/source plus an official trace or benchmark. The falsifier is a same workload where the mapping does not preserve the fixed action decision.
- Risk: metric names alone lack event schema and a fair attribution baseline; `KEEP_FOR_CONVERGENCE`.

### S3-118-SEED04

- Engine / perspective: `BISOCIATION_STRUCTURAL_TRANSFER` / `THEORIST`; prelookup denylist: `RELATED_ONLY`.
- Hunch: causal-observability concepts could identify a minimal trace cut that preserves a fixed tuning decision under an explicit observer-effect budget.
- Anchor candidate: OpenTelemetry GenAI semantic conventions and a public LLM serving trace. The conclusion would need a concrete decision-loss bound, not a schema extension.
- Risk: standards often define fields but not kernel/host causality or natural trace; `KEEP_FOR_CONVERGENCE`.

### S3-118-SEED05

- Engine / perspective: `NEGATION_OR_INVERSION` / `HARDWARE_ARCHITECT`; prelookup denylist: `RELATED_ONLY`.
- Hunch: GPU and CPU event-clock alignment may fail exactly for a natural stream class, yielding a fixed decision boundary for ROCm profiler attribution.
- Anchor candidate: rocprofiler SDK schema/current source and a canonical public trace. A debug claim is prohibited unless an actual fault is found.
- Risk: without one versioned schema, flags, workload, comparator and endpoint this is only a tooling concern; `KEEP_FOR_CONVERGENCE`.

### S3-118-SEED06

- Engine / perspective: `COMPOSE_DECOMPOSE_SIMPLIFY` / `MAINTAINER`; prelookup denylist: `RELATED_ONLY`.
- Hunch: a simple current attribution baseline may agree with full traces on common LLM event-shape classes but fail on a finite exceptional class, enabling a measurement contribution.
- Anchor candidate: one exact profiler schema and public LLM operator/kernel/host trace. The natural invariant must be tied to a fixed action, error estimand and full cost.
- Risk: absent a non-generic estimator/action it is a selector wrapper; `KEEP_FOR_CONVERGENCE`.

## Convergence

| Cluster | Seeds | Representative | Reason selected before lookup |
|---|---|---|---|
| event hierarchy / trace-cut attribution | 01, 02, 06 | S3-118-SEED02 | preserves natural nested-event structure and an explicit ranking endpoint |
| serving metrics versus event timeline | 03 | S3-118-SEED03 | distinct source family and service-level attribution object |
| observability budget / causal cut | 04, 05 | S3-118-SEED04 | distinct telemetry contract and observer-effect boundary |

Selected RQ IDs: `S3-118-RQ01`, `S3-118-RQ02`, `S3-118-RQ03`. The other seeds remain non-evidence backlog. None is a locator, raw record, novelty claim or STOP inference.
