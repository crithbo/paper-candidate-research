# VLLM-PREFIX-FUTURE-KV-RESERVATION-REV0 Stage 0 Report

## 中文摘要

- 结论：`STOP / BELOW_Q2_STOP`。
- 为什么：current SGLang 已在 prefix-aware prefill admission 中使用 `max_new_tokens`、prefix hit、当前可用/可驱逐 KV 与 `new_token_ratio` 计算未来 KV 预算；冻结候选在此之外保留的“对 admitted finite-cap requests 给出零 KV-capacity preemption 的硬保证”，在不读取真实输出长度的条件下必然要求按各请求剩余声明 cap 做 worst-case private-KV 可行性约束。固定前缀状态后，这只是 cap-sum/集合并成本下的通用容量选择（knapsack/submodular-cost packing），brief 没有给出可区别于该通用核或 TOPAS/Preble prefix-aware selection 的新算法、复杂度或竞争保证。与此同时，Azure/BurstGPT 公开 trace 只披露已实现的 input/output token counts，不披露请求到达时的 declared output cap 或可复核 prefix identity；把真实 output length 当 cap 会产生 oracle leakage。故非平凡 N2 与自然/canonical 正证据两道 Q2 硬门均不成立。
- 下一道门：无 Stage A；若未来提出新的 exact object/RQ（例如可证明的非平凡在线 prefix-set packing，或带真实 declared-cap/prefix provenance 的新 benchmark），必须使用新 topic id，不能复活本 STOP。
- 是否需要用户操作：否。

- Lane id: `STAGE0_PRIMARY`
- Assignment id: `STAGE0-PRIMARY-20260830-VLLM-PREFIX-FUTURE-KV-RESERVATION`
- Input freeze SHA-256: `D6E0E35986F2CA7C6A3FA8F964B17569E20421531EE03352056EC85344EE6B17`
- Cross-assignment contamination declaration: none; no successor or unrelated queued topic was read.
- Scientific verdict: `STOP`
- Operational disposition: `NONE`
- Quality tier: `BELOW_Q2_STOP`
- Confidence: high (`0.88`)
- Evidence ceiling: official current documentation/source snapshot plus paper full-text/abstract source review; no implementation, build, experiment, or candidate result.
- Novelty route: `N2` claimed, but not established after current-union subtraction and generic-kernel deletion.
- Candidate Q1 venue family: systems/ML-systems; current residual is below a credible Q2 contribution.
- Stage semantics: conditional paper-potential screen; this report does not establish any performance result.

## Optional process telemetry

- Search/open attempts: `32/32`; cutoff `2026-08-30`; official/current upstream and primary paper sources prioritized.
- Atomic repair trace mode/artifact path/hash, if assignment-enabled: not enabled by frozen context.
- Decision effect while nonproduction: `NONE`.

## Structural paper potential vs current readiness

- Structural paper potential if successful: a nontrivial online algorithm with a meaningful theorem or systems mechanism could be publishable if it improved goodput/latency while retaining the hard guarantee across realistic cap slack and prefix sharing.
- Current evidence-acquisition readiness/risk: public runtimes and replay tools are available, but the frozen action is already native-adjacent in SGLang and the named public traces lack ex-ante cap provenance.
- Why missing implementation/results/proof/hardware is or is not structurally fatal: missing results are not fatal. The fatal issue is structural: after deleting method names, the frozen hard-guarantee action reduces to generic worst-case capacity feasibility, while no nontrivial algorithmic delta is frozen.

## Discovery provenance

- Opportunity origins: S5 scale/online/approximation lane; current vLLM preemption and prefix-cache structure.
- Domain tags: LLM serving, KV cache, prefix caching, admission control, online scheduling.
- Paper genealogy: PagedAttention/vLLM → FastServe/Sarathi-Serve → Preble/TOPAS; output-length-aware branch CacheOPT and Robust KV Cache Management.
- Discovery method revision: `RQ_REFINEMENT_STAGED_EVIDENCE_V1 / PRODUCTION`.
- Discovery claim-pack mode: `OFF`.
- Opportunity family ID: `VLLM-PREFIX-FUTURE-KV-RESERVATION`.
- Contribution type and type-contract verdict: `SYSTEM_ARCHITECTURE / METHOD_ALGORITHM`; fails nontrivial algorithm/mechanism substance after subtraction.
- Independently audited A/C/D/E coordinates: exact action and decision variables audited; direct collision is partial, but generic-kernel and evidence-carrier failures are decisive.
- Backtest reference and status: not candidate evidence.
- Reminder: method backtest is calibration, not candidate evidence.

## Frozen object and claim

Single-GPU vLLM-like continuous batching with PagedAttention blocks and prefix-cache refcounts. At admission, use only prompt tokens, finite request-declared output caps, current prefix/cache state, and occupancy; reserve maximum remaining private KV, marginally charge shared prefix blocks, select a feasible active set/prefill chunks, and release unused reservation on early stop. Claimed guarantee: identical token semantics and zero KV-capacity preemption for admitted finite-cap requests.

## Claim-package completeness audit

- Atomic action and mechanism: action is clear; the claimed “online prefix-tree algorithm” is not specified beyond generic feasible-set selection.
- Information/assumption contract: clear and appropriately excludes realized output length.
- Effect target/output/guarantee: zero capacity preemption is precise; performance improvement is conditional.
- Boundary/failure region/competing explanation: loose caps, no sharing, outputs reaching caps, and static cap-sum optimality are correctly named; current SGLang future-token budgeting is the strongest alternative explanation.
- Minimum falsifier: satisfied structurally when the residual is only generic worst-case packing without a nontrivial N2 delta; additionally, public trace cap provenance is absent.
- Dependencies and evidence ceiling: native runtime integration would be finite, but cannot repair the contribution-shape failure.
- Opportunity-family relation audit: same object as current SGLang/vLLM admission, not a distinct family after method-name deletion.
- Independent search identity/scope: current vLLM/SGLang scheduler/KV/prefix/cap loci; TOPAS, Preble, Sarathi, FastServe, CacheOPT, Robust KV; Azure and BurstGPT trace schemas.
- Evidence-ledger integrity and contradiction disclosure: Discovery's bounded statement that no full-future reservation was observed is contradicted by current SGLang source; SGLang's guarantee remains weaker, so this is not mislabeled as DIRECT_FATAL.

## Positive opportunity map

- Natural workloads: bursty single-GPU serving with repeated tool/system prefixes and explicit user output caps.
- Observed or expected cost/headroom: current vLLM documents recompute preemption under insufficient KV; SGLang documents conservative/over-aggressive tradeoffs and request retraction.
- Mechanism-specific prediction: strict cap reservation eliminates capacity preemption but strands memory when caps are loose; prefix sharing only reduces the already-materialized/shared portion.

## Named baselines and fairness contract

1. Current vLLM V1 FCFS/priority with chunked prefill, prefix caching, `scheduler_reserve_full_isl` default on, and watermark grid.
2. Current SGLang LPM/DFS/FCFS with the native `new_token_ratio`, `schedule_conservativeness`, and `SGLANG_CLIP_MAX_NEW_TOKENS_ESTIMATION` grid, including a conservative cap-setting configuration.
3. Exact static cap-sum greedy with block/page rounding and marginal prefix charge.
4. CacheOPT and Robust KV fixed-quantile/DRO reservation; Sarathi/FastServe/Preble/TOPAS as scheduling/prefix/preemption subtractors; exhaustive small-state oracle only as an upper bound.

Fairness requires identical prompt/cap arrival information, identical model/sampling/stop semantics, equal KV capacity, no access to realized output length, and full accounting of queue delay, stranded reservation, prefix lookup, preemption/recompute, and scheduler overhead.

## Collision analysis

### Eight-predicate direct-coverage audit — strongest single current source: SGLang main

| Predicate | Independent evidence/locator | PASS / FAIL / UNKNOWN |
|---|---|---|
| Same object/function/protocol | `PrefillAdder` operates on a running/waiting single-runtime batch and prefix cache | PASS |
| Same scenario/workload | Continuous batching with prefix-aware prefill admission and future decode KV growth | PASS |
| Same or weaker information | Uses `sampling_params.max_new_tokens`, generated length, prefix-derived `extend_input_len`, and current available/evictable KV | PASS |
| Atomic action covered | Charges future tokens through `new_token_ratio`; new requests charge uncached extend length plus capped `max_new_tokens`; admission stops when budget is exhausted | PASS |
| Same/stronger legality, quality and guarantee | Default 4096 clipping, ratio decay, and documented request retraction do not give the frozen hard zero-capacity-preemption guarantee | FAIL |
| Same non-worse full-cost boundary | Current source/docs expose conservativeness and retraction tradeoff, but do not establish a non-worse full-cost result against strict reservation | UNKNOWN |
| Comparable scale/platform/version/config | Current open-source SGLang single-GPU scheduler path is comparable | PASS |
| Sufficient full-text/implementation/reproduction depth | Official current source and tuning documentation inspected | PASS |

Therefore SGLang is `DIRECT_SUBTRACT`, not `DIRECT_FATAL`.

### Nearest-prior facet matrix

| Work | Same-object facet | Subtracted facet | Remaining difference |
|---|---|---|---|
| vLLM current | PagedAttention, prefix cache, chunked prefill, recompute preemption | input-sequence fit, watermark, native semantics | no declared-output-cap future reservation |
| SGLang current | prefix-aware admission and future `max_new_tokens` budget | core information and reservation/admission action | no hard guarantee under default clipped/decaying heuristic |
| CacheOPT | output-length-aware allocation, global reserve, proactive allocation | preemption-avoidance motivation and full-cost tradeoff | predicted rather than declared cap; still has preemption policy |
| Robust KV | reservation/admission/routing under output uncertainty | reservation optimization and fixed/max baselines | stochastic/DRO multi-group object, not hard finite-cap contract |
| Preble/TOPAS | joint prefix-state/request scheduling | prefix-aware selection and cache/load tradeoff | distributed/workflow objectives, not the same guarantee |
| Sarathi/FastServe | chunked prefill/preemptive scheduling | batching and preemption comparator space | not future-cap reservation |

### Seed-distance and method-name deletion test

Delete “PrefixReserve”, vLLM, and prefix-tree names. For any admitted request whose output may legally reach its declared remaining cap, zero capacity preemption requires that the union of already-live blocks plus every admitted request's worst-case private growth fit capacity. Shared prefix blocks contribute their set-union/marginal cost once. Selecting requests under that constraint is generic capacity packing; a utility objective makes it knapsack/submodular-cost selection. The brief freezes neither a new solvable structure nor a competitive/approximation result. The systems-specific residual is therefore a strict configuration/contract around a native-adjacent budget, not a Q2-grade algorithm.

## Competing mechanism decision

- Selected mechanism: none retained; frozen mechanism fails the nontriviality gate.
- Registered backup: none. Moving to prediction/DRO weakens the hard guarantee; moving to a new formal online algorithm changes the research kernel and needs a new topic.
- Pivot boundary: no same-topic mechanism pivot is recommended.

## Residual paper kernel

The only residual after direct subtraction is “make SGLang-like future-token budgeting exact and hard under declared caps.” That residual is a useful engineering contract/test suite, but without a nontrivial algorithm/theorem or a new empirical regularity it is below Q2.

## Evidence route

- `PERFORMANCE / PARETO_APPROXIMATION / COMPLEXITY_THEORY`
- Current route fails before Stage A because the algorithmic and natural-evidence contracts are not closed.

## Performance-optimization admissibility, if applicable

- Same-function contract: clear; token generation semantics must remain unchanged.
- Algorithmic delta: absent beyond generic worst-case feasibility and active-set packing.
- Full-cost ledger: correctly names used/reserved/stranded blocks, TTFT/ITL, queue delay, lookup, preemptions, and recompute; missing admission-rejection/starvation and cap-misreporting incentives should also be charged.
- Strong-implementation fairness: current SGLang conservative configuration is mandatory and was omitted from the Discovery current-union statement.
- Generality and failure boundary: strict reservation becomes static worst-case under loose caps and can sharply reduce concurrency.
- Why not routine tuning: the frozen residual currently is routine conservativeness/configuration plus validation; no separate nontrivial algorithm is defined.

## Q1/Q2 paper shape

- Problem: important and current.
- Contribution: insufficient after current-union subtraction; hard contract alone is too small and generic.
- Evidence plan: public traces do not expose the required ex-ante declared caps and prefix identity, so the proposed natural route cannot test the frozen information contract without synthetic reconstruction or leakage.
- Expected paper narrative: would read as a conservative admission mode and benchmark comparison against a runtime that already implements the underlying budget.

## Q1/Q2 shape calibration

- Comparator file: `q1_calibration.md`
- Reference set: vLLM/PagedAttention (SOSP 2023), Sarathi-Serve (OSDI 2024), Preble, CacheOPT, Robust KV, TOPAS.
- Status: `PARITY_NOT_PLAUSIBLE`
- Contribution-shape gap: no frozen nontrivial N1/N2/N3 after subtracting SGLang and generic packing.
- Evidence-shape gap: no public natural trace simultaneously provides arrival-time caps, prefix provenance, and realized outputs.
- Stage A closure plan: none; the gaps require a new research kernel/data artifact, not a bounded Stage A probe.

## Non-relaxable quality audit

- Same-object: PASS.
- Latest collision: PASS for bounded current union; exact immutable upstream commit SHA was not exposed by the bounded web renderer, so conclusions are date-pinned to official `main`/stable docs on 2026-08-30.
- Strong fair baselines: FAIL in the Discovery packet; repaired here by naming the SGLang native configuration grid.
- Natural input/evidence: FAIL for the declared-cap/no-leakage contract.
- Full-cost: conceptually complete after adding rejection/starvation/cap-incentive cost, but no evidence exists.
- Reproducibility: source paths and search scope are reproducible; natural trace contract is not.
- Evidence/claim honesty: PASS; no candidate result or absence claim is asserted.

## Evidence path and AI completion

- E1/E2 execution-readiness audit; scientific inference explicitly excluded: no E2 performed. Current source and public benchmark interfaces make an implementation route plausible, but this does not repair scientific STOP.
- AI executability class: `AI_CORE_EXECUTABLE` if a new eligible topic existed.
- Estimated ai_core_fraction: `0.85`.
- 72-hour first evidence: static small-state equivalence between strict reservation and cap-sum/packing plus SGLang config comparison; this is a killer/counterexample, not a positive claim route.
- Human-only items and why they are non-decisive: none.

## Fidelity closure plan audit

- Discovery status: `STRUCTURALLY_UNCLOSABLE` for this frozen claim.
- Complete action and native semantics are finite and same-object: yes, but native-adjacent.
- Comparator, denominator, full-cost and small-witness plan: finite.
- Why an unimplemented interface/format/checker is or is not structurally fatal: not fatal; the fatal issue is generic contribution collapse plus unavailable natural cap provenance.
- Reminder: no Stage A is authorized or recommended.

## Independent current upstream reality check, when applicable

- Frozen upstream commit/tag and check date: vLLM and SGLang official `main` plus vLLM stable docs, checked `2026-08-30`; exact HEAD commit SHA unavailable in bounded search/open output and therefore not claimed.
- Current official documentation checked: vLLM scheduler API, optimization/preemption/chunked-prefill docs; SGLang current source and hyperparameter documentation.
- Actual source paths/symbols checked:
  - vLLM `vllm/config/scheduler.py::SchedulerConfig.scheduler_reserve_full_isl`
  - vLLM `vllm/v1/core/kv_cache_manager.py::KVCacheManager.allocate_slots(full_sequence_must_fit, reserved_blocks)`
  - vLLM `vllm/v1/core/sched/scheduler.py::Scheduler`
  - SGLang `python/sglang/srt/managers/schedule_policy.py::PrefillAdder`, `_get_running_request_total_token_offset`, `_update_prefill_budget`, `CLIP_MAX_NEW_TOKENS`
- Default/non-default flags, thresholds and configurations checked: vLLM `scheduler_reserve_full_isl=True`, `watermark=0.0`, chunked prefill; SGLang `new_token_ratio`, `schedule_conservativeness`, default `SGLANG_CLIP_MAX_NEW_TOKENS_ESTIMATION=4096`.
- Discovery absence claim confirmed, narrowed or contradicted: contradicted. SGLang current source explicitly budgets future output tokens using `max_new_tokens` and prefix-derived marginal extend length.
- If contradicted, current native mechanism and finite configuration-grid baseline: native SGLang ratio/conservativeness/clip grid, including conservative high-cap settings.
- Any non-tuning residual that remains: only the hard guarantee and formal accounting contract; without a nontrivial algorithm or theorem this is below Q2.

## Stage A highest-risk probe plan

- Risk-bearing premise: strict hard guarantee can outperform current native conservative SGLang rather than merely reproduce cap-sum admission.
- Cheap discriminating probe or counterexample search: exhaustive small-state prefix-set oracle comparing the candidate rule, static marginal cap-sum, and SGLang with ratio 1 and non-binding clip.
- Negative result that kills the direction: identical feasible active sets/decisions up to tie-breaking, or any gain disappearing after stranded-reservation and queue/rejection cost.
- Positive-result ceiling: preliminary non-falsification only. This probe is recorded for audit and must not be executed for this STOP topic.

## Stop conditions

Triggered:

1. no nontrivial N1/N2/N3 remains after current SGLang and generic packing subtraction;
2. the frozen natural/canonical evidence route lacks arrival-time declared caps and prefix provenance, and using realized output length would violate the no-leakage contract;
3. repairing either issue requires a new algorithmic object/guarantee or a new benchmark/data contribution, not one bounded same-topic revision.

## Discovery repair vector

- Codes: `OMITTED_CURRENT_SAME_OBJECT`, `OMITTED_FIRST_PARTY_FEATURE`, `OMITTED_GENERIC_KERNEL`, `NATURAL_CARRIER_GAP`, `Q2_SHAPE_GAP`.
- Materiality: decisive. Current SGLang future-token budgeting was available in current official source at Stage 0 cutoff and directly changes the residual contribution.
- Was the missing information available before the frozen cutoff?: yes, at the Stage 0 cutoff; no claim is made about the exact earlier Discovery retrieval instant.
- Does this feedback alter the independent scientific decision?: `NO`.

## Dual-axis score

- Academic value: `34/70`
  - importance 13/15; nontriviality 5/20; nearest-prior delta 4/15; baseline/venue fit 5/10; falsifiability/evidence path 7/10.
- AI executability bonus: `28/30`.
- Total: `62/100`.

The score cannot override the nontriviality and natural-evidence hard gates.

## Human research reserve, if applicable

Not applicable. This is a scientific STOP, not an AI-executability reserve.

## User-action blocker, if applicable

- Claim-bearing observation obtained before failure: no.
- Evidence ceiling: not a resource failure.
- Scientific revision consumed: no.
- Immutable failure directory: this assignment directory after MAINLINE acceptance.
- Resume directory and frozen contract: none; STOP may not be revived.

## Source ledger

Official/current implementation and documentation:

- vLLM scheduler configuration: https://docs.vllm.ai/en/stable/api/vllm/config/scheduler/
- vLLM optimization/preemption/chunked prefill: https://github.com/vllm-project/vllm/blob/main/docs/configuration/optimization.md
- vLLM KV manager: https://github.com/vllm-project/vllm/blob/main/vllm/v1/core/kv_cache_manager.py
- vLLM scheduler: https://github.com/vllm-project/vllm/blob/main/vllm/v1/core/sched/scheduler.py
- vLLM prefix caching: https://docs.vllm.ai/en/latest/design/prefix_caching/
- SGLang schedule policy/PrefillAdder: https://github.com/sgl-project/sglang/blob/main/python/sglang/srt/managers/schedule_policy.py
- SGLang tuning guidance: https://github.com/sgl-project/sglang/blob/main/docs/advanced_features/hyperparameter_tuning.md

Primary papers and data documentation:

- PagedAttention/vLLM: https://arxiv.org/abs/2309.06180
- FastServe: https://arxiv.org/abs/2305.05920
- Sarathi: https://arxiv.org/abs/2308.16369
- Sarathi-Serve: https://arxiv.org/abs/2403.02310
- Preble: https://arxiv.org/abs/2407.00023
- CacheOPT: https://arxiv.org/abs/2503.13773
- Robust KV Cache Management: https://arxiv.org/abs/2607.16892
- TOPAS: https://arxiv.org/abs/2608.25523
- Azure public LLM traces: https://github.com/Azure/AzurePublicDataset
- BurstGPT trace schema/replay documentation: https://docs.nvidia.com/aiperf/tutorials/datasets-inputs/profile-with-burst-gpt-traces

## Limitations and disclosure

- Search/open was capped at 32 operations; this is a bounded current-union review, not an exhaustive systematic review.
- Exact upstream HEAD SHAs were not exposed by the bounded web pages; current-source claims are path-, symbol-, and date-pinned, not immutable-commit claims.
- No code, artifact, trace, build, implementation, or experiment was downloaded or run.
- AI-assisted research tools performed source retrieval, synthesis, and drafting; every decisive factual claim above is tied to an official source or primary paper locator.

