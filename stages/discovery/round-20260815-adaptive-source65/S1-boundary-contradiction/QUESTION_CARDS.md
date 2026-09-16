# S65-QC01 — Linux rseq V2 region/abort seam

- Identity: Linux rseq V2 official ABI/documentation and current kernel/selftest source loci.
- Carrier kind: `IMPLEMENTATION_CARRIER_ONLY`; natural allocator/per-CPU update workloads would become relevant only after the non-generic raw gate survived.
- Network-security exclusion: `PASS`.
- History relation: `NO_MATCH__NO_NOVELTY_INFERENCE`.

## Fixed contract

- Same object: one registered per-thread rseq ABI and one per-CPU update sequence.
- Same guarantee: completion occurs atomically relative to preemption/signal delivery or execution transfers to the fixed abort handler; ABI fields and legacy/V2 semantics retained.
- Initial full cost: code bytes, compiler CPU/RSS, rseq registration/state traffic, abort/retry frequency, update latency and throughput.
- Official current locus: rseq documentation plus `kernel/rseq.c` start/post-commit/abort flow and selftest `rseq-abi.h` descriptor fields.

## Cheapest decisive test and result

For a normal program whose update is not already an rseq per-CPU operation, converting a set of basic blocks into an rseq critical section changes its concurrency/abort guarantee and violates same-object. For a program already fixed as rseq, its start/post-commit/abort sequence is part of the ABI-level action; choosing code-region boundaries or layout without a new ABI/semantic property is ordinary compiler region placement/code generation. The current documentation also makes legacy/V2 behavior an ABI compatibility condition rather than a free algorithmic action.

- Minimum falsifier: two proposed layouts with identical rseq descriptor/action semantics that differ only by basic-block selection or assembly layout.
- Result: `EARLY_FATAL__SAME_OBJECT_FAILURE_OR_GENERIC_REGION_PLACEMENT`.
- No implementation/result/resource inference: this conclusion follows from the fixed semantic fork, not from lack of hardware, source access or observed performance.
- Front-end disposition: `EXCLUDED_BEFORE_RAW`; C0 eligible `NO`.
