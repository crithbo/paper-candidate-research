# Stage A 论文证据回测 R2：最终 AUDITOR 报告

## 结论

在本次可审计的论文证据回放中，Stage A gate 没有显示出对**已具备精确来源定位**的正控过严：9 个可评估正控全部得到 `COMPATIBILITY_PASS`，4 个预登记证据缺陷负控全部没有通过。其余 3 个正控缺少 PACKER 在预算内获得的官方/作者论文定位，只能登记为 `PACKER_SOURCE_EVIDENCE_MISSING`；它们不是 Stage A 的错误 STOP，也不能被计作已通过。

因此，现阶段不建议为这一证据路径安装最小规则 patch。首个未闭合门是 P1 的 source-locator capture，而非 P3 Stage A 的对象、比较器、自然/canonical 证据或 full-cost 判断。若未来要扩大到全体 12 个正控，所需的是对三个缺 locator 案例的受控来源补齐与重新 gate，而不是降低科学门或用本地结果替代论文证据。

本报告的证据上限是 `PAPER_REPORTED_OR_AUTHOR_ARTIFACT_REPORTED__NO_PROJECT_REPRODUCTION_CLAIM`。它不构成独立复现、无偏召回估计、75% 阈值结论、生产候选登记或 Stage B 结论。

## 审计范围与隔离

- AUDITOR assignment：`BACKTEST-AUDITOR-20260827-STAGEA-PAPER-EVIDENCE-R2-NB2`
- Population：12 个预登记正控与 4 个预登记证据缺陷负控。
- Gate 在未读取 gold/expected label 的条件下完成；本 AUDITOR 在 MAINLINE START 后才读取 gold key。
- Blind arm：`BLIND_UNAVAILABLE__NO_FRESH_REVIEWER`。该非盲审计不与 blind 指标合并，也不作无偏泛化推断。
- 未执行网络、下载、build、probe、实验、资源创建或生产状态转换。

## 正控结果

| 视图 | 12 个正控中的 compatibility pass | source-evidence-missing | 与另一视图的差异 |
|---|---:|---:|---|
| Paper-only | 9 | 3（ANN_BENCHMARKS、ALEX、BOLT） | 基线 |
| Paper + existing local supplement | 9 | 3（同上） | 0；local supplement 不提高论文证据 ceiling |

已捕获 locator 的 9 个案例为 HNSW、EGG、CVC5、CARCARA、WEBGRAPH_LLP、PGM_INDEX、PYTHIA、BERTI 与 A_MESS，gate 均给出 `COMPATIBILITY_PASS`。本地补充材料没有把未通过案例变为通过：HNSW/CVC5 的补充仅保留为不提高 ceiling 的背景，PGM_INDEX 的无效 local supplement 没有被消费。

### 即时与澄清后口径

- 即时、全体 population 视图：12 个正控中已有 9 个 paper-only `COMPATIBILITY_PASS`；另 3 个处于 source-evidence-missing，而不是 gate 的 FAIL/STOP。
- 条件性可评估视图：9 个拥有 locator 的正控为 9/9 compatibility pass。
- “一次 evidence-only clarification 后”的可观察结果：对这 9 个可评估案例没有额外澄清需求，故仍为 9/9。
- 全体 12 个在澄清后的 survival **未被观察**：三个缺 locator 案例没有被补填、没有重跑 gate，不能把它们假定成通过或失败，也不能生成 12-case 的 after-clarification 成功率。

该区分防止把 PACKER 的来源缺口误写成 Stage A 规则误杀，或反过来把尚未获得的论文证据当作成功。

## 负控特异性

| 负控 | 注入的决定性缺陷 | Gate 结果 |
|---|---|---|
| N-A_PROXY_OBJECT | exact object/action 缺失 | `STRUCTURAL_FAIL` |
| N-B_UNFAIR_COMPARATOR | 同对象强比较器缺失 | `STRUCTURAL_FAIL` |
| N-C_NONCANONICAL_ONLY | 无自然或 canonical 路线 | `EVIDENCE_INSUFFICIENT` |
| N-D_FULL_COST_OMITTED | 决定性成本分母缺失 | `STRUCTURAL_FAIL` |

4/4 负控为 nonpass，false-pass count 为 0。特别地，N-D 表明 full-cost 门仍能阻止只保留主收益、删除决定性成本分母的包装。

## 归因与规则判断

| 问题 | 审计判断 |
|---|---|
| Stage A 是否过严 | 对 9 个有精确 locator 的正控，没有过严证据；对全体 12 个，不可判定为“过严”或“不过严”，因为 3 个未到 gate 可评估输入状态。 |
| 首个失败门 | P1 PACKER source-locator capture；不是 P3 Stage A gate。 |
| 规则过严 / contribution mismatch | 未观察到。9 个已评估正控跨索引、编译器/验证、图系统、体系结构和 benchmark/measurement 路线均存活。 |
| 论文证据或 PACKER 缺口 | ANN_BENCHMARKS、ALEX、BOLT 均为官方/作者 locator 未在冻结预算内取得；应标为 source-evidence-missing。 |
| 是否需要规则 patch | 当前不需要。可考虑的仅是后续独立 PACKER 的来源获取/定位流程改进；不得降低 object、强基线、natural/canonical 或 full-cost 门。 |

## 本地工作与节省

R2 在 P0 关闭新的本地 redo。既有 local supplements 被保留为背景材料，但不提升 paper-reported ceiling；paper-only 与 paper-plus-supplement 的结论完全一致。因此本轮避免了对 12 个案例重新下载、构建或 probe，同时没有把既有本地工作伪装为独立复现证据。

## 冻结证据

- Gate report：`089C34B34E796598BD7E91A2696946B990697B9A49B1A0D8F134FABD3BAD4569`
- Gate handoff：`6A8E2628D531733143A89261BE62A7514F0642F6AF4FD6F52E9906BA14296438`
- Enriched locator manifest：`152E118F169F43DAA7316C19F6EE2745425FE3CF72F7E579B7A29E9643050061`
- Auditor key：`C3F813395CDB4AF93FFDF7DC89E77973FEA24749C3E36FDA6A2CACEB55043D82`
- Blind disposition：`3F1D8B9A4A4F7263DBE5F52A9F65B6ED6F219C354758BDDAAD90FBDE5F36312D`

科学与生产状态均未改变。
