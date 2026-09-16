# Stage A Paper-Evidence Backtest R2

## Objective

直接使用已发表论文的公开证据，测试现行 Stage A gate 是否会错误拒绝具有 Q2+ 或同等级论文形状的工作。停止把“本机重新实现论文”作为每案必需步骤。

## Population

### Qualified positive controls: 12

1. HNSW — IEEE TPAMI
2. ANN-Benchmarks — Information Systems
3. egg — POPL 2021
4. cvc5 — TACAS 2022
5. Carcara — TACAS 2023
6. Layered Label Propagation / WebGraph — WWW 2011
7. PGM-index — PVLDB 2020
8. ALEX — SIGMOD 2020
9. Pythia — MICRO 2021
10. Berti — MICRO 2022
11. BOLT — CGO 2019
12. A Mess of Memory System Benchmarking — MICRO 2024

前 8 项来自原 `LOCAL_STAGEA` pool；后 4 项来自同一预登记 Stage 0 gold pool 的 routing-only 案例。论文证据回放不执行本地硬件/trace/ELF 工作流，因此可合法扩展 Stage A 规则兼容性样本，但后 4 项不得进入 local operational denominator。

### Evidence-defect negative controls: 4

- `N-A_PROXY_OBJECT`: 只给 proxy 结果，缺 exact frozen action/object。
- `N-B_UNFAIR_COMPARATOR`: 比较器明显弱于论文历史 cutoff 的同对象强基线。
- `N-C_NONCANONICAL_ONLY`: 只有合成/toy 证据，无自然或 canonical 证据路线。
- `N-D_FULL_COST_OMITTED`: 主要收益存在，但决定性成本分母被删除。

负控由 PACKER 从合法 capsule 复制非决定性结构后只注入一个预登记缺陷；gate 不看 expected label，AUDITOR 才揭盲。

## Canonical phases

1. `P0_CLOSE_LOCAL_REDO`: 停止新增下载、构建与 probe；保留既有 local supplement。
2. `P1_PACK`: 为 12+4 生成带精确来源定位的 `PAPER_EVIDENCE_CAPSULE`。
3. `P2_BLIND_FEASIBILITY`: 仅当存在未接触身份/gold 的独立 reviewer 时，对按冻结 hash 排序选出的 4 案做 blind pilot。
4. `P3_GATE`: blind 不可用或污染即回到 nonblind；对 16 案冻结 paper-only gate 决定。
5. `P4_AUDIT`: AUDITOR 比较 gold、计算指标并解释失败原因。
6. `P5_REPORT`: 写 `FINAL_STAGEA_BACKTEST_REPORT.md`。

## Blind feasibility rule

- 干净 reviewer 必须没有读取 Stage 0 NB1/NB2、Stage A local replay、gold key 或本审计 case mapping。
- 找不到干净 reviewer：记录 `BLIND_UNAVAILABLE__NO_FRESH_REVIEWER`，不新建逐案会话，直接 nonblind。
- reviewer 识别任一身份：记录 `BLINDING_CONTAMINATION`，整组 blind pilot 作废，直接 nonblind。
- blind 结果只单列，不与 nonblind 主报告合并。

## Gate outcomes

- `COMPATIBILITY_PASS`
- `COMPATIBILITY_REVISE_ONCE`
- `EVIDENCE_INSUFFICIENT`
- `STRUCTURAL_FAIL`

正控的 compatibility survival 包含 PASS 与“只需论文已含证据的格式/澄清修订”；不得用新增实验修补。负控必须被 REVISE/INSUFFICIENT/FAIL，不能直接 PASS。

## Metrics and interpretation

- positive immediate pass / 12
- positive survival after one evidence-only clarification / 12
- negative specificity / 4
- false positive count
- missing full-cost count
- missing natural/canonical evidence count
- contribution-type-specific failures
- paper-only vs existing-local-supplement deltas

描述性参考：`>=10/12` 即高于 75%；`>=11/12` 作为较强的 pilot compatibility 信号。样本仍不足以给稳定的无偏总体结论。

## Final report requirements

报告必须回答：

1. Stage A 是否表现为过严；
2. 若存在误杀，首个失败门是什么；
3. 是规则缺陷、贡献类型错配、论文证据不足还是 PACKER 缺失；
4. 是否需要最小规则 patch；
5. blind 是否成功；若失败，失败原因；
6. 本地复做节省了哪些工作，保留了哪些 supplemental evidence。

Canonical path:

`stages/stageA/_compatibility/paper-evidence-20260827/FINAL_STAGEA_BACKTEST_REPORT.md`

