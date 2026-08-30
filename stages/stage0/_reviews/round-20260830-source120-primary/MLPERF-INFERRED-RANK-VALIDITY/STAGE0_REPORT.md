# MLPERF-INFERRED-RANK-VALIDITY Stage 0 Report

## 中文摘要

- 结论：`PASS_RECOMMENDED`
- 为什么：MLCommons 当前官方规则明确允许 Edge 从 SingleStream 推导 MultiStream/Offline，并继承 accuracy 与 power；各 scenario 的真实 metric、query shape 与 percentile/mean semantics不同，故“公式是否保持数值与排名”是可证伪的 canonical benchmark-validity 问题。正式 v5.1/v6.0 result repositories 提供版本化 summary carrier，submission schema提供 system/benchmark/scenario 路径；exact measured pair数量可以在不运行 benchmark的确定性 StageA parser中闭合。bounded search未发现同对象的 measured-vs-inferred value/rank audit。
- 下一道门：MAINLINE 验收后交 SENTRY；只有独立确认 PASS 才可考虑 StageA。PRIMARY 不创建 StageA。
- 是否需要用户操作：否。

- Lane id: `STAGE0_PRIMARY`
- Assignment id: `STAGE0-PRIMARY-20260830-MLPERF-INFERRED-RANK-VALIDITY`
- Input freeze SHA-256: `BB7B436524D363448F7FBD76B8AD6CD0E2D19AC0454C5533B34D54A132AAFEEB`
- Cross-assignment contamination declaration: only frozen Source120 inputs and public official/primary sources were used.
- Scientific verdict: `PASS_RECOMMENDED`
- Operational disposition: `READY`
- Quality tier: `TIER_B_Q2_VIABLE`
- Confidence: `0.78`
- Evidence ceiling: `CANONICAL_MLPERF_BENCHMARK_VALIDITY_ONLY__NO_MAIN_RESULT`
- Novelty route: `N3` with `BENCHMARK_DATASET / MEASUREMENT_CHARACTERIZATION`
- Candidate Q1 venue family: `ACM TOS / PVLDB / performance-evaluation or benchmark-governance venues`
- Stage semantics: conditional paper-potential screen; no error or ranking result was computed.

## Frozen object and claim

Versioned public MLPerf Inference Edge result rows, official inference formulas, and exact same-system/benchmark/accuracy/software contracts. Estimands are formula error, calibration, rank correlation, pairwise/top-k reversal, missingness, and release stability. Claims stop at canonical benchmark interpretation.

## Official formula and current-source reality

The current [MLPerf Inference rules](https://github.com/mlcommons/inference_policies/blob/master/inference_rules.adoc) define:

- inferred MultiStream from SingleStream as `8 × SingleStream 99th-percentile latency`;
- inferred Offline from measured MultiStream as `8000 / mean latency_ms`;
- inferred Offline from SingleStream as `1000 / mean latency_ms`;
- inferred accuracy and power as inherited from the base result.

Official LoadGen/source documentation distinguishes SingleStream latency, MultiStream 99th-percentile query latency, and Offline measured throughput. The official v5.1/v6.0 repositories contain large `summary_results.json` carriers; submission structure provides system, benchmark and scenario identities. Current v6.0 release history includes changes to when Offline inference is skipped, proving that release pinning is a scientific requirement rather than metadata hygiene.

## Measured-pair feasibility

- `FEASIBLE_AS_A_BOUNDED_STAGEA_GATE`, not yet demonstrated as a result.
- Match keys must include release, submitter/division/availability, system ID, benchmark, accuracy target, implementation/software/model contract and power status.
- Pair eligibility requires a directly measured target scenario and an independently identifiable inferred/base row; inferred copies cannot be mistaken for measured runs.
- Public unofficial test-submission summaries demonstrate the necessary row schema and same-system multi-scenario coexistence, but formal corpus counts must come only from pinned official releases.
- Structural killer: too few eligible measured target/base pairs after exact matching.

## Collision analysis

### Eight-predicate audit

| Predicate | Current union | Verdict |
|---|---|---|
| Same official result object | MLPerf benchmark/results papers use the object | `PASS` |
| Same measured-vs-inferred question | no direct audit found in bounded primary search | `FAIL/OPEN` |
| Same information | official summaries and formulas available | `PASS` |
| Same atomic action | prior work characterizes scenarios, not formula calibration/rank reversal | `FAIL` |
| Same guarantee/endpoint | no matched-pair validity endpoint found | `FAIL` |
| Same full-cost boundary | missingness/power/version matching not jointly covered | `FAIL` |
| Comparable scale/version | versioned repositories exist; no direct multi-release audit found | `PARTIAL` |
| Sufficient read depth | rules/source/repository structure and benchmark papers checked | `PASS` |

`DIRECT_FATAL`: `NO`. Novelty status: `SEARCH_BOUNDED_OPEN`.

## Strong baselines and full cost

1. Official formula itself.
2. Identity/no-bias calibration null.
3. Direct measured target scenario.
4. Per-release and per-benchmark simple calibration model, reported only as diagnostic—not a replacement claim.

Full cost includes row eligibility, missingness, inferred flags, unit/percentile conversion, exact system/software/accuracy matching, power inheritance, repeated comparisons, bootstrap uncertainty, top-k instability and release heterogeneity.

## Natural/canonical opportunity and falsifier

Canonical benchmark evidence is sufficient; no natural-deployment extrapolation is allowed. Minimum falsifier: the complete eligible official corpus has ≤2% preregistered material error, no stable material pairwise/top-k reversal, or too few exact measured pairs to support the estimand.

## Q1/Q2 shape

- Q2: a multi-release normalized public dataset, deterministic parser, matched-pair protocol, error/ranking audit, full missingness and uncertainty accounting, and an actionable reporting recommendation form a complete benchmark-validity paper if the premise survives.
- Q1: would require a broadly validated replacement estimator or general benchmark-governance result; not assumed.
- Comparator anchors: the original MLPerf Inference benchmark paper (scenario/evaluation shape), MLPerf Training benchmark (multi-round benchmark governance/evolution), and cross-framework MLPerf Edge characterization work (evaluation breadth). See `Q1_COMPARATOR_MATRIX.md`.

## Stage A highest-risk probe

Freeze two official release summaries and one official test-submission corpus before outcomes. Manually validate one same-system SingleStream/MultiStream/Offline witness, then enumerate all eligible pairs and report counts before error values. Stop on semantic mismatch, insufficient pairs, ≤2% error with no stable material reversal, or release-instability that defeats a fixed estimand. Positive observations support only the frozen benchmark-validity claim.

## AI route and scores

- AI executability: `AI_CORE_EXECUTABLE`, estimated `0.90`.
- Academic value: `48/70`.
- AI bonus: `27/30`.
- Total: `75/100`; scores do not override hard gates.

## Repair vector

`NO_MATERIAL_REPAIR`. Stage0 independently narrowed the contract to exact versioned pairs and added release-specific inference behavior as a mandatory baseline dimension; this does not alter the scientific verdict.

## Pause

Usage-reset soft-pause applies only after this PRIMARY report/handoff: no successor is dispatched by this lane. It has no scientific effect.

