# RQ Candidate S60-S4-01

- Assignment / lane: `DISCOVERY-S4-20260815-ADAPTIVE-SOURCE60-R40-ORDINARY-BREADTH-V1` / S4.
- Seed: `S60-S4-SEED-01`.
- Exact public anchor: Linux kernel documentation, `process/debugging/media_specific_debugging_guide.html`, current page checked 2026-08-15; it gives a `perf stat -d` command over one Fluster H.264 V4L2 decoder/conformance-vector invocation. The linked carrier project is Fluendo Fluster current repository page checked 2026-08-15.
- Stable envelope: same decoder invocation and the same conformance result; no decoder change, input substitution, or quality relaxation.
- Contribution hypothesis: `MEASUREMENT_CHARACTERIZATION`; N3 only if a stable, decision-changing condition can be measured.

## Primary RQ

For the same Fluster codec-conformance invocation and correctness outcome, does an event set that exceeds the available PMU counters create a reproducible, phase-sensitive error large enough to change a fixed energy/throughput interpretation, and can a non-generic same-object estimator be specified without changing the endpoint?

## Pre-evidence commitment

- Single anchor question: Does the current official perf union already provide a generic measurement correction that absorbs the proposed endpoint correction?
- Primary sources: Linux `perf-list(1)` current source documentation; Linux media debugging guide; Fluendo Fluster upstream README.
- Transport-only fallback: corresponding official upstream GitHub source pages, not third-party mirrors.
- Null: the built-in `perf` event scaling and explicit event groups already make any proposed correction a restatement of the current tool guidance.
- Finite close/narrow condition: identify a target-specific estimand/action not represented by scaling or groups, or retain this RQ as locator-only; do not replace it with a broader profiling study.
- Selected for ordinary source closure: `YES`.
- Pre-RQ nomination: `ORDINARY_CLOSURE`; requested model route `TERRA_HIGH_ORDINARY`; selective depth is not permitted.
