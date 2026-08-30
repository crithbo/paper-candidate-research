# MLPERF-INFERRED-RANK-VALIDITY — Independent Stage A Gate

## 中文摘要

- Scientific verdict: `INCONCLUSIVE__INVALID_CONSTRUCTION__NO_SCIENTIFIC_INFERENCE`。
- Operational disposition: `EXECUTION_CONTRACT_HOLD__ENGINEERING_CORRECTIONS_EXHAUSTED__ONE_SAME_OBJECT_METHOD_REDESIGN_AVAILABLE`。
- v5.1/v6.0 的 raw zero eligible pairs 不是科学 falsifier：大量 unit mismatch 缺少被拒绝 raw unit tokens，无法区分官方源单位不兼容与 parser alias coverage 缺陷。
- peak RSS 缺失不单独否定 zero-pair source fact，但它是冻结 full-cost contract 的实质缺口，足以阻止 Stage A PASS 与完整构造验收。
- A1 attempt 已消费、retry=0；原 assignment 不得重跑。累计 A0 engineering corrections 已用尽 2/2，但同对象 method redesign 尚余 1/1，因此仍有一条合法、非科学 revision 的恢复路线。
- Q2 viability 不因该无效构造而降低；保持 prior conditional `TIER_B_Q2_VIABLE`，尚未获得 Stage A 支持。

## Frozen identity and execution facts

- Exact object: versioned MLPerf Edge result rows plus official inference formulas.
- Releases: v5.1 development and v6.0 held-out; neither excluded.
- Frozen formula, pair key, missingness, 0.02 threshold, denominator and cost dimensions were not changed.
- One no-bytecode compile and one claim process completed; retry=0, network=0, source hashes match.

## Zero-pair classification

The runner emitted zero exact eligible pairs for both releases, but this result is invalidated as scientific evidence. The unit classifier rejected 571/862 v5.1 Edge rows and 34/55 v6.0 Edge rows as unit mismatches while omitting the rejected source unit tokens. Without those tokens, the gate cannot audit whether the official rows truly violate the unit contract or whether valid official aliases were not recognized.

Therefore `FALSIFIER_TRIGGERED__NO_EXACT_ELIGIBLE_PAIRS` is a raw program outcome, not a source-level falsifier. It supports neither benchmark-validity failure nor STOP.

## Full-cost materiality

CPU, wall, input and output bytes were recorded, but `peak_rss_bytes` is null. Peak RSS is decision-reversing for a measurement/benchmark workflow and was explicitly frozen. Its absence is material to construction completeness and blocks PASS. It does not by itself explain the zero pairs; the unit-observability gap is the primary denominator invalidator.

## Formal and operational state

The correct formal topic state remains `STAGEA_ACTIVE` with no scientific transition. `PASS_RECOMMENDED` and `STOP` are both prohibited by invalid construction. `HUMAN_RESEARCH_RESERVE` is inapplicable because the remaining work is bounded and AI-executable. No external user resource is missing, so `BLOCKED_USER_ACTION_REQUIRED` is also inapplicable.

The assignment-level state is `EXECUTION_CONTRACT_HOLD`: the single A1 attempt is consumed and retry is forbidden. A new assignment cannot reset the cumulative budget.

## Sole legal same-object recovery

One result-independent same-object method redesign remains (`0/1` used). MAINLINE may freeze exactly one new A0 redesign that:

1. emits every rejected raw unit token and its source field before any scientific aggregation;
2. freezes a versioned alias-normalization table derived from authoritative MLPerf schema/documented units, not from desired pair yield;
3. adds a real peak-RSS collector and fail-closed receipt;
4. preserves releases, formulas, pair key, missingness, threshold, denominator and all cost dimensions;
5. passes a nonclaim witness and independent preclaim fidelity gate before a new A1 assignment.

This route is a method/observability redesign, not a scientific revision or retry. If it fails, the cumulative same-object redesign budget is exhausted and MAINLINE must return to an appropriate hold or scientific gate based only on valid evidence.

## Final decision

- Scientific verdict: `INCONCLUSIVE__INVALID_CONSTRUCTION__NO_SCIENTIFIC_INFERENCE`
- Operational disposition: `EXECUTION_CONTRACT_HOLD__ONE_SAME_OBJECT_METHOD_REDESIGN_AVAILABLE__NO_RETRY`
- Stage B: not authorized
- User action: none
- Current reset cycle: false

