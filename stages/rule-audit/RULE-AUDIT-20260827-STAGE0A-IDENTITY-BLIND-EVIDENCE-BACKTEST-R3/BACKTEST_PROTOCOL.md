# Stage 0 + Stage A Identity-Blind Evidence Backtest R3

## Objective

使用新的历史高水平论文样本，只向 reviewer 提供对应阶段材料，不提供论文名、作者、venue、DOI、artifact 名称或发表结局，并禁止这些批次的 reviewer 做外部检索/查重。直接提取论文成果，不做本地实现、构建或实验。

本模式是 `IDENTITY_BLIND / PURPOSE_VISIBLE`：reviewer 可以知道自己在处理冻结评估批次，但不知道案例身份、gold 标签和预期决定。

## Population selection

- Target positives: 12 个此前所有 R1/R2 未使用、未向选定 reviewer 暴露的 Q2+ 或领域同等级论文。
- Negative controls: 4 个预登记缺陷案例。
- Time range: 2019–2025，除非某贡献类型没有足够样本。
- Contribution strata：
  - 3 × `METHOD_ALGORITHM / SYSTEM_ARCHITECTURE`
  - 3 × `COMPILER_TOOL / THEORY_FORMAL`
  - 3 × `MEASUREMENT_CHARACTERIZATION / BENCHMARK_DATASET`
  - 3 × `HARDWARE_ARCHITECTURE / MEMORY_SYSTEM`
- 必须有公开全文或足以抽取 Stage A 证据的官方/作者材料。
- 排除上一轮 HNSW、ANN-Benchmarks、egg、cvc5、Carcara、WebGraph、PGM-index、ALEX、Pythia、Berti、BOLT、A Mess，以及 reviewer 已处理的其他具名 gold case。
- PACKER 先按身份辨识风险和贡献类型筛选，再在同层以 identity-key SHA256 排序取前项；不得根据预期 gate 结果回填。

## Packet separation

### Stage 0 reviewer packet

只包含：

- neutral random ID；
- exact object/problem；
- proposed action/mechanism；
- contribution type；
- evidence route、natural/canonical plan、full-cost initial boundary、minimum falsifier；
- 去身份化的历史 related-mechanism matrix。

不包含论文最终结果、论文 locator、作者 artifact、paper identity 或 gold。

Stage 0 reviewer：

- 禁止网络、外部检索、项目全局查重和身份猜测；
- 只判断 non-collision gates；
- 输出 `BLIND_STAGE0_NONCOLLISION_DECISION`。

### Collision auditor packet

独立 AUDITOR 在 Stage 0 reviewer 输出不可变后读取 exact identity、历史 cutoff 与 source union，输出 `COLLISION_ADJUSTMENT`。两者组合才是完整 Stage 0 compatibility；不能把 noncollision decision 单独称为完整 Stage 0 PASS。

### Stage A reviewer packet

仅对 collision-adjusted Stage 0 存活案例提供：

- 去身份化 Stage A claim contract；
- 论文报告的关键 evidence、metric、单位和分母；
- 匿名 workload/comparator IDs 与映射后的公平性描述；
- full-cost、legality/equivalence/witness 与边界；
- exact evidence locators 的去身份化引用号。

不提供 title/author/venue/DOI/repository/final acceptance。Reviewer 禁止网络与查重，输出 identity-blind Stage A compatibility decision。

## Contamination and fallback

- 任一 reviewer 识别一个案例身份，立即停止该 blind phase；识别后的输出作废。
- 不换样本、不删除难例。
- 同一冻结包转为 nonblind compatibility；gold/expected labels仍只在 reviewer 决定冻结后由 AUDITOR读取。
- blind 与 nonblind 指标绝不合并。

## Negative controls

四项覆盖：

1. same-object direct absorption；
2. proxy/change-object；
3. weak comparator or noncanonical-only evidence；
4. omitted decisive full-cost denominator。

Stage 0 与 Stage A 适用的缺陷分别注入并由 AUDITOR保管 expected label。

## Canonical flow

`PACKER → Stage0 blind noncollision reviewer → AUDITOR collision adjustment → StageA identity-blind gate → AUDITOR gold comparison → final report`

如果任一 blind phase 污染：

`same sealed packet → nonblind reviewer decision → AUDITOR gold comparison`

## Metrics

- identity contamination count/rate；
- Stage 0 noncollision positive survival；
- collision-adjusted Stage 0 survival；
- Stage 0 negative specificity；
- Stage A positive compatibility survival；
- Stage A negative specificity；
- false-pass count；
- source-evidence-missing count；
- blind vs fallback-nonblind results，分开报告。

## Resource boundary

- 允许 PACKER 获取公开论文、附录和 AE 元数据；建议 <=768 MiB、<=96 attempts。
- reviewer 和 gate network=false。
- 禁止代码/artifact binary 下载、构建、probe、实验或本地复做。
- 既有本地结果不得进入新样本主证据。

## Final report

Canonical path:

`stages/stageA/_compatibility/stage0a-identity-blind-paper-evidence-20260827/FINAL_STAGE0A_IDENTITY_BLIND_BACKTEST_REPORT.md`

报告必须明确：这是 identity-blind 而非 purpose-blind；Stage 0 碰撞是独立合成门；任何 fallback nonblind 结果不计入 blind rate。

