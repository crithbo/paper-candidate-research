# S66-QC01 — CPython free-threaded reference-lifetime seam

- Exact identity: Python 3.14.6 free-threading documentation + CPython current `Objects/object.c`.
- Carrier: `IMPLEMENTATION_CARRIER_ONLY`; a natural multi-threaded CPython workload would be required only after the raw gate survived.
- Network-security exclusion: `PASS`.
- Identity relation: `NO_MATCH__NO_NOVELTY_INFERENCE`.

## Same-object contract

- Fixed output/guarantee: Python object values/identity, C-API lifetime, free-threaded thread-safety and deallocation correctness.
- Candidate endpoint considered: lower contention/delay under a CPython-specific bounded guarantee, with full cost including CPU, RSS, queue/merge work, safe-point/GC pause and object lifetime delay.
- Current union: biased owner fast path/shared count, queued state, owner-thread merge, deferred counting, per-thread counts, eval-breaker, GC, thread-exit and explicit `gc.collect()` merge/reclaim paths.

## Decisive structural result

The official current documentation specifies queued/deferred/per-thread state and the points that merge or reclaim it; current `object.c` implements queued owner-merge and shared-count transitions. Once the same lifetime and API safety contract are fixed, changing the timing/priority at which those native transitions are selected is a GC/refcount controller policy. A construction that changes which references are counted, when an object can be observed dead, or how thread-safety is enforced changes the frozen guarantee.

- Minimum falsifier: two object traces with identical current transitions and outputs whose only difference is merge/collection trigger timing.
- Result: `EARLY_FATAL__CURRENT_NATIVE_UNION_PLUS_CONTROLLER_ONLY`.
- No resource/result inference: this is current documented/source action coverage plus the controller-only boundary, not a claim about unavailable builds, benchmarks or performance.
- Front-end disposition: `EXCLUDED_BEFORE_RAW`; C0 eligible `NO`.
