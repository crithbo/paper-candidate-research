# PB-DELETE-SCHEDULE Stage 0 PRIMARY Report

- Lane id: `STAGE0-BATCH-GATE/PRIMARY`
- Assignment id: `STAGE0-P1-20260809-PB-DELETE-SCHEDULE-PRIMARY-V8.4`
- Input freeze SHA-256: verified against Discovery manifest; see `SOURCE_AUDIT.md`.
- Cross-assignment contamination declaration: `NONE`. 未使用其他候选的得分、实验或机制。
- Decision: `PASS_RECOMMENDED` — `PENDING_CONFIRMATION`
- Quality tier: `TIER_B_Q2_VIABLE`
- Confidence: `0.74`（条件性论文形状，不是算法效果）
- Evidence ceiling: `MODERATE_FINITE_CPU_ROUTE`
- Novelty route: `N2`
- Candidate Q1 venue family: SAT / CP / IJCAR / formal-certification；仅 Q1 conditional。
- Stage semantics: 条件性 paper-potential screen；未运行 trace、构造算法或性能测量。

## Structural paper potential vs current readiness

- Structural paper potential if successful: `TIER_B_Q2_VIABLE`。在固定 natural MaxPre-style WCNF transformation trace 上，构造一个选择**已有、checked core deletions**的合法 order/partition 与 rederivation plan 的算法，并保持相同 output WCNF/objective 和 VeriPB/CakePB equioptimal contract。这是有明确 correctness invariant 的 N2，不是 rule/checker wrapper。
- Current evidence-acquisition readiness/risk: `MODERATE_FINITE_CPU_ROUTE`。公开 MaxPre/VeriPB/CakePB 与 MaxSAT Evaluation carriers 可提供 30-trace CPU 路线；尚未冻结实际 traces、重复 checked-deletion 数或得到结果。
- Why missing implementation/results/proof/hardware is or is not structurally fatal: 不是。没有当前实现、30 条 trace 或性能结果只限制 readiness；形式 invariant 尚待独立审核，但有有限的可证伪路线。若资源实际取得失败，应报告 blocker，不能以其构成 STOP。

## Discovery provenance

- Opportunity origins: `O7` direct-algorithm/software；checked-deletion 的强保证与 unchecked mode 的性能张力。
- Domain tags: `ALGORITHM_DATA_STRUCTURE`, `SOLVER`, `FORMAL_CERTIFICATE`, `CPU_REPRODUCIBLE`。
- Paper genealogy: BGMN/JAIR 2023 formal checked deletion → IJCAR 2024 certified MaxSAT preprocessing → current VeriPB 3.x/CakePB contract；PBLean and SAT 2025 redundancy rules are neighboring proof-system work.
- Discovery method revision: production `v2/v8.1`; backtest `CALIBRATED`，不作为候选证据。

## Frozen object and claim

`MAXPRE_STYLE_FIXED_NATURAL_WCNF_PREPROCESSING_TRACE__DEPENDENCY_SCHEDULED_EXISTING_CHECKED_CORE_DELETIONS__FIXED_OUTPUT_WCNF_OBJECTIVE_AND_VERIPB_CAKEPB_EQUIOPTIMAL_CONTRACT`

输入：一条固定 MaxPre preprocessing trace 中已有的 checked core deletions、其 rederivation obligations 和同一信息。输出：对同一 deletion set 的 legal schedule/batches 和既有 proof-format steps。函数/质量：input WCNF、transformation trace、output WCNF、objective、VeriPB/CakePB acceptance/equioptimal guarantee 均相同。不得变成 generic proof compressor/checker UI、新 deletion rule、MaxPre emission concatenation 或 unchecked deletion 的弱保证。

## Positive opportunity map

- Natural workloads: MaxSAT Evaluation natural instances；IJCAR anchor 使用 MaxSAT Evaluation 2023 的 1,130 weighted/unweighted instances。当前尚未证实其中≥30条有至少2个 checked deletions。
- Observed or expected cost/headroom: IJCAR 已指出 certified preprocessing 的 checker/proof overhead；官方 PB25 说明 unchecked deletion 能显著更快、而 checked mode 需 justification。这证明真实 full-cost tension，不是候选加速结果。
- Mechanism-specific prediction: ready dependency frontier 大于 1 且 proof prerequisite slices 重叠时，schedule/batch 可减少 rederivation；ready sets singleton 或 slices 独立时预注册为 no-gain。

## Named baselines and fairness contract

1. unmodified MaxPre trace-order emitter + current VeriPB/CakePB；
2. stable legal order，保持同 deletion set/信息；
3. greedy earliest-ready legal order，保持同 deletion set/信息；
4. small trace 的 exact order/partition search（time-unbounded ceiling，非部署 baseline）；
5. unchecked deletion 仅作**弱保证 reference**，绝不能作为等质量胜者。

full-cost：dependency graph/index、schedule/partition、witness discovery/elaboration、proof bytes、checker CPU、preprocess CPU、peak RSS、disk I/O、timeouts、output WCNF/objective equality 与失败 fallback。existing rule/checker/MaxPre emission 是 direct subtractors，不能成为候选主张。

## Collision analysis

### Nearest-prior facet matrix

| Facet | Candidate | IJCAR 2024 / VeriPB | Residual |
|---|---|---|---|
| Exact object | fixed MaxPre WCNF→WCNF certified preprocessing trace | same certified ecosystem | same object |
| Decision variables | legal order, batches, witness-slice reuse | transformation logging and supplied deletion sequence | schedule construction |
| Core method | dependency frontier / rederivation-cost selection | checked-deletion rule/checker; trace-order emission | nontrivial algorithm if invariant holds |
| Guarantee | existing equioptimal acceptance | same guarantee | no weaker certificate permitted |
| Cost | end-to-end proof construction/checking | existing logger/checker | must win after index/bytes/RSS costs |

### Seed-distance and method-name deletion test

名称删除后仍为：在语义不变、输出固定的已认证 constraint removals 上，寻找最小 executable rederivation cost 的合法 ordered partition。它不是某个 checker command、删规则或 MaxPre 的 emit loop。若最终只是调整日志顺序且没有依赖/成本算法或 invariant，则 N2 失败。

`DIRECT_FATAL: none found through 2026-08-09`。IJCAR preprocessing、VeriPB checked-deletion / multi-deletion order、CakePB verification 是 `DIRECT_SUBTRACT`；PBLean、DRAT trimming、SAT redundancy rules 为 different system/target 的 adjacent work。官方文档明确多个 core deletions 按给定顺序依次 checked，这支持问题对象，并未给出最优 schedule constructor。

## Competing mechanism decision

- Selected mechanism: `dependency-frontier batching`，以 live-core reverse dependencies 和 ready frontier 选择 acyclic batch，最小化 estimated rederivation footprint。
- Registered backup: `proof-DAG reuse with lazy invalidation`；必须独立同对象比较，不能自动拼接为 hybrid。
- Pivot boundary: 修改 output WCNF/objective、certificate guarantee、deletion rule、checker 或改为 unchecked mode 即越界，须新 ID。

## Residual paper kernel

窄 N2：把提供 fixed deletion sequence 的 certified preprocessor，转化为一个有证据义务的 online dependency scheduling/indexing problem，并用 checker-accepted same output 保证其 correct。成功后可主张“在可特征化 natural subset 上降低强 certificate 的全成本”，不能主张 solver quality 改善、通用 proof compression 或所有 VeriPB trace 加速。

## Evidence route

`PERFORMANCE + formal preservation invariant`。CPU-only，先在冻结自然 trace 上做 extractor/replay，再做 full-cost Pareto；不需要 GPU 或专有硬件。

## Performance-optimization admissibility, if applicable

- Same-function contract: WCNF/input trace/output/objective hash 与 checker verdict 一致。
- Algorithmic delta: live-core index + legal schedule/batch selection + witness-slice reuse。
- Full-cost ledger: 已固定。
- Strong-implementation fairness: 同 deletion set/信息的 trace, stable, greedy orders；unchecked 显示为 weaker guarantee。
- Generality and failure boundary: 仅适用于多 checked-deletion 且有 scheduling choice 的 certificate traces。
- Why not routine tuning: decision variable是受 post-deletion rederivability 约束的 combinatorial ordered partition。

## Q1/Q2 paper shape

- Problem: strong equioptimal certificates 的构造/检查成本。
- Contribution: sound scheduling invariant + legal batch algorithm + characterized natural trace subset + full-cost Pareto evaluation。
- Evidence plan: 30 frozen natural traces、canonical extraction、same-output replay、stable/greedy/exact comparison、no-gain analysis。
- Expected paper narrative: “不减弱认证合同，优化 existing checked-deletion obligations 的构造顺序”。

## Q1/Q2 shape calibration

- Comparator file: `Q1_COMPARATOR_MATRIX.md`
- Reference set: IJCAR 2024, JAIR 2023, VeriPB upstream, SAT 2025 redundancy rules。
- Status: `PARITY_CONDITIONAL`
- Contribution-shape gap: N2 充分但狭窄；不得滑向 checker engineering。
- Evidence-shape gap: formal review、≥30 trace occurrence、p50/p90 full-cost、independent checker and proof-size/RSS results。
- Stage A closure plan: 预注册 CPU killer；非 killed 也只到 preliminary support。

## Non-relaxable quality audit

- Same-object: PASS as frozen contract；future work must keep transformation trace/output/objective/certificate exactly fixed。
- Latest collision: primary and upstream sources re-audited through 2026-08-09；`SEARCH_BOUNDED_OPEN` 不等于全球新颖性。
- Strong fair baselines: trace/stable/greedy, plus exact ceiling；all same information/deletion set。
- Natural input/evidence: public route；“≥30 with ≥2 checked deletions”尚未出现，属 readiness。
- Full-cost: mandatory。
- Reproducibility: Stage A 前 pin commits and input/output/proof hashes。
- Evidence/claim honesty: no current output/result/proof/invariant claim。

## Evidence path and AI completion

- AI executability class: `AI_CORE_EXECUTABLE`。
- Estimated ai_core_fraction: `0.70`。AI 可实现 extractor/index/replay/ledger；形式方法研究者必须独立审阅“batch invariant ⇒ existing checked-deletion obligations”。
- 72-hour first evidence: freeze MaxPre/VeriPB/CakePB commits、≥30 natural traces with ≥2 checked deletions；replay original proof; reconstruct graph; compare A, stable, greedy with output/checker equality and ledger。
- Human-only items and why non-decisive: invariant 的形式审阅；不是资源缺口，且不妨碍 Stage A 的反例发现。

## Stage A highest-risk probe plan

- Risk-bearing premise: `NONTRIVIAL_LEGAL_SCHEDULING_CHOICE_AND_FULL_COST_PARETO_RESIDUAL_OVER_TRACE_ORDER`。
- Cheap discriminating probe: natural trace extractor + order/batch graph；exact search on small traces；same-output checker replay。
- Negative result that kills the direction: frozen 30 natural traces中 legal choice rate `<20%`；任何 output/checker equality failure；或 p50/p90 full-cost 对 trace order 无 Pareto（proof bytes/RSS 抵消收益）。
- Positive-result ceiling: `NOT_FALSIFIED / PRELIMINARY_SUPPORT`，不是完整论文主结论。

## Stop conditions

1. 同一固定 trace 上现有 trace/stable/greedy order 已完全吸收，且无不同 schedule algorithm/guarantee；
2. legal ordering cannot preserve checker/output contract；
3. candidate collapses to a rule/checker wrapper or unchecked deletion；
4. 无法取得或冻结同对象自然 checked-deletion evidence route。

当前未触发这些条件。特别是目前没有30条 trace/结果不是 STOP。

## Dual-axis score

- Academic value: `52/70`
- AI executability bonus: `22/30`
- Total: `74/100`

## Human research reserve, if applicable

不建议 reserve。主要 algorithm/replay path 可由 AI 在公开 CPU artifacts 上承担；独立 formal review 是保证 claim ceiling 的必要审阅，不是长期人类独占研究。

## User-action blocker, if applicable

`NONE`。本轮没有下载或执行失败。未来自然 trace collection 若被具体资源/许可阻断，执行 lane 须给出 blocker packet，而不是改用 synthetic proof graphs 作为自然证据。
