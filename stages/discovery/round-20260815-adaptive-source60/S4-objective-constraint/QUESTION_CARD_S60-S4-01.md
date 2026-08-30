# Question Card S60-S4-01

## Identity and contract

- Exact public identity: Linux current media debugging guide's `perf stat -d` Fluster H.264 V4L2 decoder example; carrier: `CANONICAL_BENCHMARK_ONLY`.
- Same-object estimand: PMU-derived energy/throughput interpretation for that fixed decoder invocation, conditional on identical conformance outcome.
- Claim endpoint: validity of a performance/energy measurement conclusion, not a changed decoder, hardware controller, or profiler configuration.
- Initial full-cost boundary: benchmark wall time, decoder process CPU/RSS, perf observer CPU/RSS, PMU event scheduling/scaling, and the energy counter's interval/coverage semantics.
- Network-security exclusion: `PASS`.

## Source-supported facts, not conclusions

1. The Linux media guide publishes the exact `perf stat -d python3 fluster.py run ...` usage on an RK3399 V4L2 H.264 decoder route.
2. Fluster's upstream README exposes named test suites/vectors, decoder selection, jobs/timeout and output options.
3. Current Linux `perf-list(1)` says time-based multiplexing occurs when active events exceed counters, can cause errors when execution profile changes, and recommends event groups to minimize multiplexing errors.

## Raw-gate assessment

- Current native locus: `tools/perf/Documentation/perf-list.txt` on Linux upstream master, Event Groups section; default/non-default current action includes time multiplexing and `{...}` event groups.
- Strongest immediate skeptic: the current tool already exposes the generic scale/group response; an estimator that merely scales multiplexed counts or groups events is directly absorbed.
- Missing discriminator: no source-backed target-specific estimator/action has been frozen that remains outside scaling/grouping while preserving the same performance/energy endpoint.
- Minimum falsifier if later reopened with external evidence: a fixed Fluster vector/decoder panel for which group/scaling and the proposed estimator yield the same ranking within a predeclared uncertainty bound.
- Finite closure route: one exact Linux source commit plus one exact Fluster commit and a predeclared canonical vector/decoder panel; then compare the proposed estimator against the current scale/group union. No experiment is run in Discovery.
- Stop/narrow condition: if the only surviving action is event grouping, time scaling, job/timeout selection, or a changed energy endpoint, it cannot enter raw.

## Disposition

- RQ audit: `RQ_COMPLETE`.
- RAW_REQUIRED audit: `INCOMPLETE`.
- Identity: `UNKNOWN`; no all-history exact five-field exclusion has been asserted, and no-match is not novelty evidence.
- Disposition: `LOCATOR_ONLY__RQ_BACKLOG`.
- Reason: the official sources establish a concrete carrier and a real current limitation, but also provide the generic current mitigations. The required non-generic same-object action/estimand and version-pinned panel remain unclosed. This is not a scientific DROP, resource failure, or exhaustion claim.
- Eligible for C0: `NO`.
