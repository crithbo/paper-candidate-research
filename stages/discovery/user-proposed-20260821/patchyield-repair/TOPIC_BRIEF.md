# PATCHYIELD-CALL — live causal PatchYield under arrival-relative deadlines

## 中文摘要

- 研究机会：在固定 OpenHands、模型、vLLM、SWE-bench、单 H100 与 admitted task set 下，检验公开修复进展是否能在同信息调度基线之上提升按到达时间计的截止期解决数。
- 为什么可能值得做：原有固定服务时间 replay 不能代表调度导致的动态 batching、KV、prefix reuse、重算与队列耦合；修复后要求 live re-execution，问题变成可证伪的同对象在线调度问题。
- 为什么保留：对象、动作、端点和强基线合同已冻结，且 live H100 + pin/hash + fairness + full-cost 有有限闭合路径；没有在本轮声称性能、新颖性或 Stage 0 通过。
- 下一步：独立 Stage 0 审查 current union/collision/Q2 形状；若接受，再以 H100 资源门开启 Stage A fidelity gate。

- Status: `PROPOSE_STAGE0`
- Quality tier: `TIER_B_Q2_VIABLE`（仅为条件性论文形状，待独立 Stage 0 审核）
- Opportunity origins: `O5 / O6`
- Domain tags: online scheduling, LLM serving, agent evaluation, full-cost, fairness
- Contribution route: `N2`
- Discovery date: 2026-08-21
- Discovery method revision: v8.7 canonical targeted repair
- Discovery claim-pack mode: `OFF`
- Discovery RQ frontend mode/revision: `PRODUCTION`; `RQ_REFINEMENT_STAGED_EVIDENCE_V1`
- Opportunity family ID: `PATCHYIELD-CALL`
- Contribution type: `METHOD_ALGORITHM`
- Discovery question card: [DISCOVERY_QUESTION_CARD.md](DISCOVERY_QUESTION_CARD.md)
- Carrier kind: `IMPLEMENTATION_CARRIER_ONLY` plus frozen canonical benchmark/evaluator

## Research question

For the frozen agent-serving object, do public compile/test/patch-progress features have incremental, repository-held-out value over remaining-time, token, KV, queue, and load features for selecting the next ready complete LLM call, when each scheduler is live re-executed on the same H100/software snapshot under arrival-relative deadlines and bounded bypass?

## Canonical research claim package

- Exact object: FROZEN_INPUTS.md fixes the harness/SDK, model revision/hashes, vLLM revision/configuration, SWE-bench snapshot/evaluator, one H100, and the admitted task set.
- Natural/canonical scenario: the 500-row frozen SWE-bench Verified canonical benchmark; no production-SLA interpretation.
- Atomic action: select the next ready session's complete non-preemptive LLM call; all within-session tool edges, model, precision, admission, and KV policy remain fixed.
- Fair comparator: FCFS, EDF, SRPT/predicted remaining time, Cascade-style latency budget, SAGA-style workflow/fairness, same-capacity outcome-agnostic learned scheduler, and offline outcome oracle only as a ceiling.
- Information contract: progress features are public test/compile/patch evolution only; sealed labels/results, prior solution patches, and held-out labels are unavailable online.
- Endpoint: admitted tasks that complete by `arrival_i + tier_i` and pass the sealed evaluator; report deadline success, throughput/full-cost, and fairness separately.
- Mechanism: progress features matter only if they add stable information beyond service/KV/load state; replay is not primary evidence.
- Full cost: REPLAY_AND_FAIRNESS_CONTRACT.yaml freezes the complete ledger.
- Minimum falsifier: no stable incremental live benefit across deadline tiers/repository folds, or a violation of the all-cells bounded-bypass rule.

## Evidence route and fairness repair

Primary causal evidence is deterministic live re-execution for each scheduler on one fixed H100 and frozen software/model/request identity. Any recorded ready-event replay is debugging/sensitivity-only unless calibrated on live schedules and validated on held-out schedules across dynamic batching, KV residency/eviction, prefix reuse, recomputation, queue interference, and policy-dependent service time.

Each deadline is relative to request arrival, never readiness or dispatch. The fairness constraint is `bypass_i <= 16` for every admitted ready call; a policy is fair only when zero violations occur in every fold × tier × load × seed cell. Fairness is not folded into deadline success or throughput.

## Current collision classification

- Deployment/simple baselines: the named queueing and scheduling families above are mandatory same-information comparators.
- Direct fatal: none established in this repair.
- Search-bounded-open: independent Stage 0 must perform the current-union and strongest-collision audit; this brief makes no current-absence claim.
- Claim ceiling: no improvement, novelty, fairness feasibility, or paper-result assertion has been made.

## Fidelity closure plan

- Status: `FINITE_FIDELITY_GAP`.
- Resource gate: an H100 SXM 80GB, 32 physical CPU cores, 256 GiB RAM, 1 TB local NVMe, pinned software/container artifacts, and assignment-local resource paths.
- Stage A gates: validate identity/hash/parser and local paths; validate token identity; live-run each scheduler; account full cost and fairness; optionally calibrate/held-out validate replay.
- Structural failure: inability to preserve the frozen object while enforcing arrival-relative endpoint and bounded bypass; or no stable incremental progress-feature value over same-information comparator.
- This repair does not execute any gate.

## Q1/Q2 sufficiency hypothesis

If the live mechanism survives, a complete Q2 shape could combine a target-native call scheduler, policy-dependent serving-cost evidence, an explicit fairness constraint, strong same-information baselines, and repository-held-out benchmark outcomes. A Q1 claim would require broad stable effects and a decisive collision review. Independent Stage 0, not this packet, judges either threshold.

## Non-relaxable quality audit

- Same object: frozen and preserved.
- Fair strong baseline: named and information-matched; full union review deferred to Stage 0.
- Natural/canonical evidence: frozen SWE-bench Verified benchmark only; no production extrapolation.
- Full cost: repaired ledger includes GPU capacity/queue, tokens/KV/recompute, CPU/tools/predictor/scheduler, and memory.
- Reproducibility: pins/hashes and assignment-local future paths are frozen.
- Evidence honesty: repair-only, no execution/result/newness claim.
