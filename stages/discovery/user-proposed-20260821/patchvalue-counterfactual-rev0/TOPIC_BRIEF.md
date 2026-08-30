# PATCHVALUE-COUNTERFACTUAL-REV0 — Counterfactual Marginal Inference Value for Budgeted Coding Agents

## 中文摘要

- 研究机会：把“进展信号是否有用”从终局成功分类改成同一 coding-agent 中间状态上追加完整 LLM call 的可识别反事实边际价值。
- 为什么可能值得做：若公开进展在控制任务难度、已耗调用/token、剩余时间和上下文后仍校准地预测增量成功价值，固定总调用预算可以按同信息、完整成本分配，而不是统一加算力。
- 为什么保留：静态碰撞没有发现同一对象、同一 clone-state intervention、同一 hidden-evaluator endpoint 的直接覆盖；但路由、重启、rollout reuse 和预算预测已是强 subtractors，贡献必须严格保持在反事实估计上。
- 下一步：交独立 Stage 0 攻击 branch isolation、随机解码 intervention、current collision 与“是否只是 success classifier”；不得复用 PATCHYIELD 任何阶段状态。

- Status: `READY_FOR_INDEPENDENT_STAGE0`
- Quality tier: `TIER_B_Q2_VIABLE` conditional on the finite fidelity closure
- Opportunity origin: `O5`
- Domain tags: coding agents; online budget allocation; counterfactual measurement; test-time compute
- Contribution route: `N3` primary, `N2` conditional
- Discovery date: 2026-08-21
- Method: v8.7 canonical; RQ frontend `PRODUCTION`; claim-pack `OFF`
- Opportunity family: `PATCHVALUE-COUNTERFACTUAL-REV0`
- Contribution type: `MEASUREMENT_CHARACTERIZATION` with optional allocation method
- Carrier: `NATURAL` real GitHub-issue benchmark carrier, with fixed-benchmark claim ceiling

## Canonical claim package

- Exact object: the version-pinned OpenHands/SDK/Qwen/SWE-bench stack listed in `DISCOVERY_RQ_CANDIDATE.md`; a PatchValue-specific, precommitted randomized decoder schedule is part of the new object.
- Same-function boundary: stop and continuation arms operate from an identical hashed agent/repository/tool state; output is the same official evaluator's terminal pass label.
- Intervention: `do(stop)` versus `do(continue h complete calls)` in copy-isolated branches, then choose an eligible state for an extra call only after each task receives a common minimum budget.
- Mechanism/prediction: public compile/test/patch trajectory signals contain conditional incremental information beyond static difficulty, spent compute and remaining-service features; conservative lower-confidence allocation improves fixed-budget solved-task count without difficulty-layer harm.
- Information: hidden evaluator outputs and post-branch information are offline labels only; branches cannot share writable state.
- Fair comparators: uniform, round robin, static difficulty, spent calls/tokens, remaining time, SRPT, outcome-agnostic learning, and an offline oracle ceiling, all with the same public pre-decision information.
- Full cost: all call, tool, GPU/CPU, clone/restore, evaluator, predictor and failed-branch costs, as frozen in `FIDELITY_CLOSURE_PLAN.md`.
- Minimum falsifier: no stable repository-held-out incremental calibration/ranking, no fixed-budget gain, unresolvable branch interference, or gain confined to easy tasks with harm elsewhere.

## Collision, seed distance, and claim ceiling

SWE-Router and FailFast-RestartSmart forbid a terminal-success classifier, routing, restart or early-stop rephrasing.  Recent agentic test-time scaling forbids claiming rollout selection/reuse.  MARS/SAGA/FairBatching are serving-cost baselines, not same-object hidden-success allocators.  PatchYield is only `RELATED_ONLY`: it scheduled concurrent ready calls under an impossible absolute bypass guarantee, whereas PatchValue measures randomized within-state continuation effects under a total-call budget.

No performance or causal result exists.  The claim ceiling is a fixed agent/model/decoder/benchmark result until independent Stage 0 and a preclaim fidelity witness close the stated debts.

## Quality hypothesis

A Q2-shaped paper requires: state-level branch data with a correct causal contract, repository-held-out calibration beyond strong public covariates, fixed-total-budget comparison with full cost, and difficulty/coverage no-harm analysis.  Q1 would require replication across agents/models/benchmarks; that is not claimed here.  The exact current-union and branch-interface debts are finite and are handed to independent Stage 0.
