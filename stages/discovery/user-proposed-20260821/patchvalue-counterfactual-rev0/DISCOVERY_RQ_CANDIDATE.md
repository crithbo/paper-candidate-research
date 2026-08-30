# PatchValue research-question candidate

- RQ candidate ID: `PV-RQ-01`
- Seed: `PV-S01`
- Tentative public object: one frozen OpenHands software-agent run on a SWE-bench Verified instance at a completed-LLM-call boundary, with a fixed randomized continuation decoder policy.
- Exact identity anchors: OpenHands/benchmarks `f60e4ed11262b667896ce9f554dd487057fd1ef2`; Software Agent SDK `43376f1868ffd702746080714a59c16d3f69ec12`; Qwen/Qwen3-Coder-30B-A3B-Instruct-FP8 `dcaee4d4dfc5ee71ad501f01f530e5652438fde0`; SWE-bench Verified `c104f840cc67f8b6eec6f759ebc8b2693d585d4a`; SWE-bench harness `7a21e05772954cc81471ae19d56f436cecf43c54`.
- Stable semantic boundary: full next LLM calls and their native tool consequences only; final benchmark evaluation is sealed/offline; no model routing, restart, early exit, admission control, evaluator budget allocation, or token-level scheduling claim.
- Contribution type hypothesis: `MEASUREMENT_CHARACTERIZATION` with an optional `METHOD_ALGORITHM` allocation consequence.

## Primary RQ

For the fixed coding-agent/decoder policy, can repository-held-out, public pre-dispatch progress features identify and calibrate the conditional incremental effect of granting one or `h` additional complete LLM calls from the same snapshotted intermediate state on sealed SWE-bench success per full cost, beyond static difficulty, calls/tokens spent, remaining-time prediction, and outcome-agnostic allocation?

## Scope and answerability

- Phenomenon: `Delta_h(s) = E[H | clone(s), do(continue h calls under omega)] - E[H | clone(s), do(stop now)]`, where `omega` is a precommitted randomized decoder-seed schedule independent of state and `H` is only an offline evaluator label.
- In scope: state snapshots at completed-call boundaries; copy-isolated continuation branches; repository-disjoint learning and evaluation; a fixed-total-call allocation experiment only after the estimand is validated.
- Out of scope: ordinary terminal-success classification, routing to another model, restart/early stop policy, rollout-summary reuse, fair queueing, and production agent-serving claims.
- Minimum carrier/oracle: versioned SWE-bench Verified instances, native OpenHands history/worktree snapshots, and the official evaluator run separately on each terminal branch.
- Earliest falsifier: after controlling the named non-progress features, the randomized branch estimate has no stable repository-held-out incremental calibration/ranking signal, or its uncertainty is too wide to distinguish feasible allocations.

## FINER-lite

- Feasible: `CONDITIONAL` — a finite snapshot/clone/seed/evaluator protocol must be shown semantically valid before any run.
- Interesting: `CLEAR` — the answer changes whether extra coding-agent calls should be uniformly spent or allocated by an identifiable state-level value.
- Novelty threat: `HIGH` — recent routing, restart, budget-awareness, rollout-scaling and agent-serving work are named deep-review subtractors.
- Ethical/scope fit: `PASS`; no network-security topic.
- Relevant: `CONDITIONAL` — a benchmark-bound causal measurement and allocation result could be Q2-shaped only if it survives the fixed-budget and difficulty-stratified falsifiers.

## Pre-evidence selection

- Selected for evidence lookup: `YES`
- Primary route: official OpenHands/SWE-bench current documentation plus primary papers on SWE-Router, FailFast-RestartSmart, BAGEN, agentic test-time scaling, MARS, and SAGA.
- Transport-only fallback: archived arXiv abstract/project page for a named paper.
- Pre-RQ closure: `ORDINARY_CLOSURE`; no strong-model packet nominated or run.
