# Source120 S6 — Carrier-grounded Primary RQs

- RQ convergence timestamp: `2026-08-30T02:45:00+08:00`
- Converged only after exact-carrier audit: `YES`
- Primary RQs: 4; optional alternatives: none.
- Remaining source calls preallocated before results: 8 total, two per RQ for current/contrary closure.

## S120-S6-RQ01 — vLLM heterogeneous KV-group free-block allocation
- Exact carrier: `vllm-project/vllm/tests/v1/core/test_kv_cache_utils.py` current main.
- Primary RQ: For vLLM V1 KV-cache groups with fixed attention semantics but heterogeneous group block sizes, can a target-native allocation data structure preserve per-group refcount/free-queue invariants with lower scheduler full cost than independent current-manager operations?
- Contribution hypothesis: `METHOD_ALGORITHM / N2`.
- Immutable contract: same cached token content, group mapping, refcounts and request outputs; include allocation, queue operations, hashing/events, metadata and memory.
- Counterfactual decision: choose a joint heterogeneous-group allocation/update action rather than per-group independent allocation.
- Minimum falsifier: current coordinator already expresses equivalent joint allocation, heterogeneous block sizes are not a valid current object, or residual is generic multi-queue scheduling.

## S120-S6-RQ02 — SGLang partial-page reuse benchmark validity
- Exact carrier: SGLang PR #35635 and named `test_radix_cache_unit.py` family with commits `f3b9c76/f349371/b777589/751c45d`.
- Primary RQ: Under the exact PR #35635 partial-page prefix-reuse action, do the reported official-workload improvements remain decision-changing when cache construction, exact-shape warmup, copy/lock lifetime and mixed latency tails are included in one fixed full-cost estimand?
- Contribution hypothesis: `REPLICATION_NEGATIVE / MEASUREMENT_CHARACTERIZATION`.
- Immutable contract: same action, model outputs, page sizes and feature-disabled baseline; do not redesign the PR.
- Counterfactual decision: whether an operator should enable or upstream the action under the stated supported configurations.
- Minimum falsifier: existing PR artifacts already report the full estimand, or the bounded reproduction cannot separate action cost from workload/model effects.

## S120-S6-RQ03 — xFormers dispatch-test coverage validity
- Exact carrier: `facebookresearch/xformers/tests/test_mem_eff_attention.py` current main.
- Primary RQ: Does the current xFormers memory-efficient-attention test/benchmark carrier cover the runtime dispatch predicate combinations needed to predict the selected backend for a fixed input, or can a finite target-specific coverage model change the regression diagnosis?
- Contribution hypothesis: `BENCHMARK_DATASET / REPLICATION_NEGATIVE`.
- Immutable contract: same current dispatch code, supported input semantics and backend eligibility; no performance claim without execution.
- Counterfactual decision: whether a regression is assigned to kernel performance or silent backend selection/coverage.
- Minimum falsifier: current tests already enumerate the full predicate surface, or the proposed model is merely logging/schema coverage.

## S120-S6-RQ04 — MLC serving spec fixture and scheduler-action coverage
- Exact carrier: `mlc-ai/mlc-llm/tests/python/serve/test_serve_engine_spec.py` current main.
- Primary RQ: Does the current MLC engine spec fixture expose a target-specific request-state transition whose incremental scheduler data structure can be tested under fixed outputs, rather than only validating API/generation plumbing?
- Contribution hypothesis: `COMPILER_TOOL / METHOD_ALGORITHM`.
- Immutable contract: same requests/prompts, generation semantics and engine configuration; no workload substitution.
- Counterfactual decision: select an incremental native scheduler transition versus ordinary request processing.
- Minimum falsifier: fixture is API-only, current source already contains the action, or no finite same-object scheduler invariant is exposed.

## FINER-lite

Feasibility and novelty are `CONDITIONAL/HIGH_THREAT` for all four. RQ02 has the strongest fixed estimand and carrier, but single-PR replay is explicitly insufficient by itself for a paper. No compensatory score is used.
