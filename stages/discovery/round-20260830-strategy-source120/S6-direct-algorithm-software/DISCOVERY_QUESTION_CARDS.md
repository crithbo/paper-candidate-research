# Source120 S6 — Carrier-grounded Question Cards

## S120-S6-RQ01 — vLLM heterogeneous KV-group allocation
- Exact carrier: `vllm/tests/v1/core/test_kv_cache_utils.py`, current main; implementation loci `kv_cache_coordinator.py`, hybrid manager docs and `kv_cache_utils.py`.
- Current union: coordinator constructs one manager per group, resolves scheduler/hash granularity using group block sizes, enforces divisibility, supports partial-hash lookup under manager capability, and coordinates group cache-hit intersections. Free-block queue is already an intrusive O(1) block-pool structure.
- Frozen action relation: joint heterogeneous-group allocation/refcount/free-queue invariants are current native semantics. No distinct source-grounded algorithm remained; a stronger queue design would be invented after results.
- Disposition: `EXCLUDED_BEFORE_RAW__CURRENT_NATIVE_UNION_ABSORPTION`.
- Scientific state effect: none; this is not a registry/topic STOP.

## S120-S6-RQ02 — SGLang partial-page reuse full-cost replication
- Exact carrier: open PR `sgl-project/sglang#35635`, commits `f3b9c76/f349371/b777589/751c45d`, named radix-cache unit suites and `generated-shared-prefix` benchmark.
- Carrier kind: `IMPLEMENTATION_CARRIER_ONLY` plus canonical project benchmark.
- Exact claim object: default-disabled ordinary CUDA FULL-attention Python RadixCache partial-page reuse via private-page copy, exact LCP, page-aligned ownership and source locking.
- Endpoint/counterfactual: whether full-cost results change the operator/upstream enablement decision.
- Current evidence: PR reports 78 tests/87 subtests, exact generation parity, throughput/TTFT matrices and mixed P90/P99; it explicitly excludes cache construction and exact-shape warmups and remains unmerged.
- Non-generic discriminator: same PR action and its private-page copy/lock lifetime; no redesign or feature substitution.
- Minimum falsifier: complete accounting does not materially change the published decision, or observed variance dominates action cost under the frozen workload.
- Full-cost dimensions: cache construction, exact-shape warmup, page copy, locks/lifetime, allocation failures, cache flush, throughput, mean/median/P90/P99 TTFT and E2E.
- Bounded debt: independent reproduction; exact hardware availability; raw logs/statistical protocol; current PR CI interpretation.
- Disposition: `EVIDENCE_QUALIFIED_RAW`; eligible for deep review, not a brief.

## S120-S6-RQ03 — xFormers dispatch-test coverage validity
- Exact carrier: `facebookresearch/xformers/tests/test_mem_eff_attention.py`, current main; current `xformers/ops/fmha/dispatch.py` and official benchmark are located.
- Carrier kind: `CANONICAL_BENCHMARK_ONLY / IMPLEMENTATION_CARRIER_ONLY`.
- Exact estimand: coverage of runtime backend-dispatch predicate combinations for fixed input semantics, not kernel speed itself.
- Endpoint/counterfactual: whether an observed regression is attributed to selected backend/coverage or kernel implementation.
- Non-generic discriminator: xFormers-specific `supports`/priority dispatch lattice and exact attention operator eligibility; falsified if merged tests already cover every branch or a generic logging line fully closes the decision.
- Minimum falsifier: deterministic enumeration of current dispatch predicates shows full test coverage.
- Full-cost dimensions: predicate extraction, fixture generation, test runtime, backend availability and false attribution risk; no run performed.
- Bounded debt: exact test parametrization, dispatch priority branches, current logging state, canonical hardware/config panel.
- Disposition: `EVIDENCE_QUALIFIED_RAW`; eligible for deep review, not a brief.

## S120-S6-RQ04 — MLC engine spec scheduler-action coverage
- Exact carrier: `mlc-llm/tests/python/serve/test_serve_engine_spec.py`; current `cpp/serve/engine.cc`.
- Current evidence: fixture defines prompt/request/generation configurations; engine source creates request-state entries and appends requests to the waiting queue.
- Frozen action relation: no exact incremental scheduler data structure or decision endpoint is exposed by the fixture. Any proposed action would be invented after source results or collapse to generic queue handling.
- Disposition: `EXCLUDED_BEFORE_RAW__FIXTURE_API_PLUMBING_NO_ATOMIC_ACTION`.
- Scientific state effect: none.

## Funnel counts

- Frozen carrier candidates: 8
- Exact carriers closed: 4
- Carrier unresolved: 4
- Primary RQs: 4
- Unique opportunity families: 4
- Excluded before raw: 2
- Evidence-qualified raw: 2
- Candidate-grade deep review: 2
- Clean Stage0 brief: 0
