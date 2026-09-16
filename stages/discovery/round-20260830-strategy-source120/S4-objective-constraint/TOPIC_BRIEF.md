# MLPERF-INFERRED-RANK-VALIDITY — Auditing inferred Edge-scenario metrics against measured same-system results

## 中文摘要

- 研究机会：MLPerf Edge 规则允许从 SingleStream 数学推导 MultiStream/Offline，并沿用准确率与功耗；公开结果摘要同时提供场景、系统、版本与 `inferred` 标记，可构造严格同对象的 measured-vs-inferred 审计。
- 为什么值得做：这些推导隐含线性缩放假设，而真实批处理、并行度和尾延迟可能非线性；若产生数值误差或系统排名反转，会直接影响 benchmark 解释。
- 下一步：独立 Stage0 重建最新碰撞和 Q2 形状；StageA 只需确定性解析公开 summary，冻结同系统配对并执行误差/排名稳定性分析。

- Status: `PROPOSE_STAGE0`
- Quality tier: `TIER_B_Q2_VIABLE`
- Opportunity origin: `O4`
- Contribution route: `N3`
- Contribution type: `BENCHMARK_DATASET` with `MEASUREMENT_CHARACTERIZATION`
- Carrier: `CANONICAL_BENCHMARK_ONLY`
- Strategic alignment: `TRANSFERABLE`

## Research question

For identical public MLPerf Edge system–benchmark submissions with measured SingleStream and measured MultiStream/Offline results, how accurately do the officially permitted inference formulas preserve metric values and cross-system rankings under the same accuracy/model contract?

## Canonical claim package

- Exact object: versioned MLPerf Edge result rows and official inference formulas.
- Action/estimand: compute formula-predicted metrics; pair with directly measured same-system scenarios; estimate relative error, calibration, and pairwise/top-k rank reversal.
- Mechanism: linear formula assumptions omit nonlinear batching, parallelism, queueing and percentile/mean differences.
- Comparator: official formula, identity/no-bias null, directly measured scenario result.
- Guarantee: no claim outside canonical benchmark interpretation.
- Full cost: missingness, inference flags, system/config/version/accuracy matching, power status, multiple comparisons and uncertainty.
- Failure region: insufficient measured pairs, unstable rankings, or ≤2% error with no material reversal.
- Minimum falsifier: complete eligible corpus shows ≤2% error and no stable material rank reversal.

## Sources and collision boundary

- Official rules: MLCommons inference rules define SingleStream, MultiStream, Offline, the exact inference formulas, and copied inferred-result directories.
- Public carrier: MLCommons public/test-submission summaries expose scenario/result/system/version/`inferred` fields and include same-system measured scenario rows.
- Prior/current search: MLPerf benchmark and power papers characterize scenarios and energy; bounded search found no direct measured-vs-inferred ranking-validity audit.
- Novelty status: `SEARCH_BOUNDED_OPEN`, not a global-first claim.

## Fidelity closure plan

- Status: `READY_TO_CLOSE_IN_STAGEA`
- Deterministic parser over pinned summary files; no benchmark execution required for the first decisive probe.
- Matching key: release, division, availability, system ID, benchmark, accuracy target, software/model contract.
- Pre-register metric conversions, 2% materiality threshold, bootstrap confidence intervals, rank-correlation and reversal criteria before reading outcomes.
- Small witness: one system with measured SingleStream, MultiStream and Offline rows; verify formulas and units manually.
- Structural failure: too few exact pairs or formula/metric semantics cannot be reconciled without changing object.

## 72-hour evidence

Parse two recent public result repositories plus the official test-submission corpus; report eligible-pair counts, formula error distributions, measured-vs-inferred rank correlation, reversals, and held-out release stability.

## Q1/Q2 hypothesis

A reproducible multi-release benchmark-validity audit with a public normalized dataset, parser, matched-pair protocol and actionable reporting rule is a complete Q2 paper shape. Q1 would require broader benchmark-governance insight or a validated replacement estimator across releases; this is not assumed.

## Non-relaxable audit

- Same-object: exact system/benchmark/scenario contracts only.
- Strong baseline: official formulas and directly measured scenario results.
- Natural/canonical evidence: canonical benchmark only, explicitly labeled.
- Full-cost: all matching, missingness, uncertainty and power/inference fields counted.
- Reproducibility: public summaries, pinned versions, deterministic parser and preregistered analysis.
- AI boundary: core analysis is auditable and locally executable; interpretation and venue choice remain human decisions.
