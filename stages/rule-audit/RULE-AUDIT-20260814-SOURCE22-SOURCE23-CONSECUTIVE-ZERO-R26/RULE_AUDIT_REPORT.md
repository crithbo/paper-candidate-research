# Rule Audit Report：Source22/23 连续零产出与贡献终点前置

## 中文摘要

- 得到什么：Source22 的 V6 trace 成功识别了三条“动作确实到达 selector，但仍被 current union、同对象碰撞或 generic solver 淘汰”的健康负例。Source23 的 V7 又成功把题源从成熟工具/论文 constructor 转向自然载体，并把大量通用 mapping、batching、placement、partition 和 controller 在 D1 前排除。
- 主要瓶颈：不是 Q2、same-object 或 current-union 门过严，而是 carrier-first 后没有在 raw 前预提交“如果研究成立，究竟改变什么论文结论”。六个 Source23 C0 全部卡在贡献终点：S1 是普通 compiler mapping/form，S3 缺非 controller 后果，S5 是 controller 或 generic test selection；S6 的四条 raw 更在 C0 前就退化为通用问题。
- 规则缺口：V7 的全局 raw 门要求 `exact_public_natural_carrier`，但其 BENCHMARK/THEORY 类型合同本身允许 public/canonical corpus。S4 因 MLPerf Storage 使用按真实分布生成的合成文件而在 raw 前排除，这对“自然部署性能”是正确限制，但对“canonical benchmark 的覆盖、有效性、排名、复现或 full-cost”过严。
- 建议：下一安全边界仅运行一轮 `NATURAL_OR_CANONICAL_CLAIM_SHAPE_PRECOMMIT_V7R1`。每条 raw 在 carrier 之后、C0 之前预提交三类论文终点之一：target-native action delta、measurement/benchmark conclusion delta、formal guarantee delta。measurement/benchmark 不再被要求必须提出控制器或干预动作；canonical evidence 的 claim ceiling 明确限制在 suite/corpus 内。
- 用户动作：不需要新的 generic approval。现有 `USER_ADAPTIVE_DISCOVERY_CONTINUE_UNTIL_FIVE_STAGEA_PASS_20260814` 与本次明确要求已覆盖一个不增 lane/容量、不改科学门、V9 OFF 的 assignment-local 周期。永久共享规则修改仍需另行批准。

## Identity

- `audit_id`: `RULE-AUDIT-20260814-SOURCE22-SOURCE23-CONSECUTIVE-ZERO-R26`
- `trigger`: Source22 V6 与 Source23 V7 连续两个完整六路周期均为零 clean brief
- `requested_by`: 主线
- `date`: 2026-08-14
- `write_directory`: `stages/rule-audit/RULE-AUDIT-20260814-SOURCE22-SOURCE23-CONSECUTIVE-ZERO-R26`
- `shared_files_modified: false`

## 1. 审查问题与范围

已读取 `AGENTS.md`、`plan.md`、`registry.yaml` 相关登记、`rules/ROLE_RULE_AUDIT.md`、`rules/ROLE_DISCOVERY.md` 相关合同、R24/R25 canonical 包、Source22/23 control 与六路最小 handoff/log，以及 Source23 决定性 funnel/collision 文件。

本审计只判断流程与下一轮 assignment-local 策略，不修改共享规则、候选状态或历史结论；不联系 Discovery，不运行 Stage、实验、下载或自动化。

## 2. 两轮实际漏斗

### 2.1 分轮对照

| 周期 | Locator | Raw 前排除 | 报告 fresh raw | C0 | Trace | D1 | Deep | Brief |
|---|---:|---:|---:|---:|---:|---:|---:|---:|
| Source22 V6 | 33 | 17 | 16 | 6 | 3 | 2 | 2 | 0 |
| Source23 V7 | 33 | 14 | 19 | 6 | 0 | 0 | 0 | 0 |
| 合计 | 66 | 31 | 35 | 12 | 3 | 2 | 2 | 0 |

V7 并没有让题源完全枯竭：reported raw 从 16 增到 19，C0 仍为 6。它把两个 V6 才在 deep 发现的 generic/direct-collision 类问题更早挡住，因此 D1 从 2 降到 0 不能简单解释为方法退步。

### 2.2 Source23 六路

| Lane | Locator | Raw 前排除 | 报告 raw | C0 | D1/Deep/Brief | 主要停点 |
|---|---:|---:|---:|---:|---:|---|
| S1 | 4 | 0 | 4 | 2 | 0/0/0 | ordinary compiler mapping/form selection |
| S2 | 4 | 0 | 4 | 0 | 0/0/0 | 缺 exact dataset/project/version 与 oracle/union |
| S3 | 4 | 1 | 3 | 2 | 0/0/0 | Wikidata/Common Crawl 有估计量，但无非 controller 后果 |
| S4 | 5 | 5 | 0 | 0 | 0/0/0 | 四条历史身份；MLPerf Storage 被 universal-natural 门排除 |
| S5 | 8 | 4 | 4 | 2 | 0/0/0 | configuration controller 或 generic test selection |
| S6 | 8 | 4 | 4 | 0 | 0/0/0 | generic batching/layout/memory planning/sparse partition |
| 合计 | 33 | 14 | 19 | 6 | 0/0/0 | 贡献终点未闭合 |

### 2.3 分母仍有一次执行违例

Source23 数值上满足 `33=14+19`，但 S2 的四条 raw 仍只是 `GPU workload trace / interconnect carrier / NPU trace / NDP-PIM workload`，没有 exact dataset/project/version/source locus。这与 R24、R25 已指出并在 V7 control 明令禁止的领域桶 raw 相同。

因此：

- 19 是报告事件数，不是 19 个可审计 unique opportunity families；
- 最小材料中至多 15 条 raw 有具名 carrier identity；
- raw→C0 的 6/19 不能当作方法精度；
- 这是 S2 的重复执行偏差，不是放宽 raw identity 规则的理由。

## 3. 五类可能瓶颈的独立判定

| 假设 | 判定 | 证据 |
|---|---|---|
| Source entry | `PARTIAL_SUCCESS_WITH_LOCAL_DEFECTS` | S1/S3/S5/S6 已产生具名自然载体；S2 仍是领域桶，S4 被 universal-natural 门压空。 |
| Action/consequence precommit | `DOMINANT_BOTTLENECK` | Source23 六个 C0 全部因普通 mapping、controller、generic selection 或无结论后果而失败；S6 四 raw 也全为通用动作。 |
| Type contract | `MATERIAL_AMBIGUITY` | measurement/benchmark 的“decision consequence”在执行中被解释成 target-specific noncontroller action；global natural 门又覆盖了 canonical benchmark/type-specific 许可。 |
| Historical saturation | `SECONDARY_BUT_REAL` | S4 五 locator 中四条为 Source17–19 历史身份；MLPerf、SuiteSparse、成熟 compiler facet 在多轮反复出现。 |
| Scientific hard gates | `CORRECT_AND_NON_NEGOTIABLE` | V6 三条 trace 后淘汰和 V7 generic residual 都有具体 current-union/direct-collision/generic-kernel 理由；删除这些门只会制造弱题。 |

结论：源入口已部分改善，科学门工作正常；下一轮应把可成论文的 contribution consequence 前置，并修正 measurement/benchmark 的类型解释。

## 4. 为什么“有自然载体”仍然不够

自然载体只证明问题不是合成特例，不自动证明存在新贡献。Source23 的典型失败为：

- ACT/Embench：对象和 oracle 清楚，但只能做当前 compiler 已有的 lowering、instruction selection、RA 或 cost tuning；
- Wikidata/Common Crawl：可提出稳定规律，但目前只导向 incremental index、snapshot selection 或 graph partition，仍是 controller/generic；
- Buildings/sv-tests：panel 合法，但“选 solver/tolerance/test order”是配置控制器，单纯 pass-rate 表又没有独立 validity threshold；
- MLPerf/SuiteSparse：质量 oracle 完整，但候选动作是 batching、placement、memory planning 或 partition。

这说明当前流程问得太晚：先花 raw/C0 预算建立 carrier、estimand、confounds，再问“论文到底改变什么”。更高效的顺序是，在 raw 入场时就预提交一个可证伪的 claim-shape endpoint，但不要求证明结果。

## 5. S4 的 natural/canonical 边界

### 5.1 现行 V7 内部不一致

V7 全局 `raw_requires` 要求 `exact_public_natural_carrier`；但同一 control 的：

- `BENCHMARK_DATASET` 允许 `versioned_public_corpus`；
- `THEORY_FORMAL` 允许 `finite_natural_or_canonical_instance_family`；
- 项目总合同也把 benchmark/dataset、measurement/characterization 作为独立论文入口。

所以 universal-natural 不是所有类型的正确共同门。

### 5.2 MLPerf Storage 应如何处理

官方生成的 synthetic file population 不能支持“自然部署中一定如此”的结论；这一限制必须保留。但它可以作为公开、版本化、canonical benchmark artifact，支持以下受限问题：

- benchmark 的 coverage/validity；
- checkpoint save/load 统计口径与 full-cost；
- 规则或 generator 改变导致的 ranking/comparability；
- reproducibility 或 conclusion-threshold 稳定性。

因此 MLPerf Storage 不应仅因 synthetic 而在 raw 前必然排除。它只能以 `CANONICAL_BENCHMARK_ONLY` ceiling 入场；若要外推自然 workload，必须另有独立自然证据。历史碰撞、新 estimand、strongest subtractor 与 Q2 形状仍需后续检查，不能自动 C0 或 brief。

SPEC/MLPerf Training/Inference 等已经命中历史同一身份的排除仍然正确；本修正不复活旧题。

## 6. 下一轮唯一建议：V7R1

### 6.1 Carrier kind 改为 natural-or-canonical

每条 raw 先声明：

- `NATURAL_OBSERVED`：自然 workload/trace/corpus；可支持自然规律，但仍需 confound/holdout；
- `CANONICAL_BENCHMARK`：官方 benchmark、规则、generator、result panel；claim 仅限 suite/corpus 内的 validity/coverage/ranking/reproducibility/full-cost；
- `FORMAL_CANONICAL`：标准实例族、conformance corpus 或形式模型；claim 仅限冻结语义/保证。

carrier kind 不得混写。canonical 证据不能被悄悄升级成自然正证据。

### 6.2 Raw 前提交三选一的 claim shape

每条 raw 必须在不声称结果已成立的情况下，冻结一个 endpoint：

1. `TARGET_NATIVE_ACTION_DELTA`：同对象上新增或联合一个 target/semantic-specific、非乘积动作；
2. `MEASUREMENT_CONCLUSION_DELTA`：改变一个可复核的 ranking、validity、coverage、regime boundary、reproducibility 或 cost-attribution 结论；不要求控制器动作；
3. `FORMAL_GUARANTEE_DELTA`：改变 bound、certificate、impossibility boundary 或保证，并有非通用构造/checker 路线。

同时记录：`one_sentence_counterfactual_consequence`、`non_generic_discriminator`、`strongest_likely_subtractor`、`minimum_falsifier` 和 `finite_closure_route`。这里只是贡献假设，不要求核心结果、实现、完整 action catalogue 或全量碰撞。

若只能写成 mapping/batching/placement/partition/controller，或无法说明成立后改变哪条结论，则保持 `LOCATOR_ONLY__CLAIM_SHAPE_UNFROZEN`，不消耗 raw/C0，也不是科学 STOP。

### 6.3 Measurement/N3 的明确边界

- `MEASUREMENT_CHARACTERIZATION` 可以用高质量、falsifiable、可推广或有明确 canonical ceiling 的新规律/有效性结论独立成文，不要求提出优化 controller。
- `N3` 若主张“规律及其利用”，仍需 utilization mechanism；若只有重要的新规律，则必须在 raw 时预注册相邻 `MEASUREMENT_CONCLUSION_DELTA` 路线，且保持同 object/carrier/estimand/evidence，不能在看到结果后重命名类型。
- 描述性 pass-rate、单次测量、没有独立 validity threshold/holdout/full-cost 的表格仍不能达到 Q2。

### 6.4 六路题源和贡献终点

| Lane | Primary carrier 与预提交 endpoint | 继续排除 | Deep ceiling |
|---|---|---|---:|
| S1 | official ISA/ABI/standard delta + conformance corpus；只收 `TARGET_NATIVE_ACTION_DELTA` 或 `FORMAL_GUARANTEE_DELTA` | ordinary mapping/form selection/flag tuning | 2 |
| S2 | exact named GPU/NPU/NDP workload/trace + hardware/interface contract；只收具 target-specific shared constraint 的 action delta | 领域桶、generic data movement/scheduling | 2 |
| S3 | versioned natural evolution panel；优先 `MEASUREMENT_CONCLUSION_DELTA` 的 stable law/regime/validity boundary | 强迫每个规律都立即带 controller | 2 |
| S4 | public natural 或 canonical benchmark panel/rules/generator；只收 validity/coverage/ranking/reproducibility/full-cost conclusion delta | paper-owned constructor、旧同一 estimand、canonical→natural 外推 | 3 |
| S5 | canonical instance/conformance corpus + checker；只收 non-generic guarantee/impossibility 或 semantic repair action | generic CP/ILP/SMT wrapper、configuration controller | 1 |
| S6 | exact public workload + target native constraint；只收 non-product action/guarantee delta | batching/layout/placement/packing/partition 重新命名 | 2 |

总容量完全不变：六 lane、locator≤48、fresh raw≤24、C0≤12、deep≤12；每路 raw≤4、C0≤2。V6 的 single-witness/single-mode action/observation survival trace 继续只对 near-D1 C0 触发，不增加 artifact budget。

## 7. 文献与 source 深度

下一轮不需要“更多篇数”，而需要在每个实际 C0 的五 artifact 预算内固定三角证据：

1. carrier/rules/semantics 的 authoritative anchor；
2. current union 或公平当前强基线；
3. strongest contrary/direct-collision/validity subtractor。

近期论文的 future-work 不能作为缺口证明；paper-owned constructor 不能改名为 residual。只有当 current source、canonical/natural carrier 和 precommitted claim endpoint 独立闭合时，论文才用于定位 strongest subtractor。

## 8. 风险、反方攻击与控制

- 反方一：允许 canonical synthetic 会降低 natural 门。控制：设置 `CANONICAL_BENCHMARK_ONLY` ceiling，禁止自然外推；自然主张仍必须有自然证据。
- 反方二：claim-shape precommit 会过早淘汰尚未成熟的好题。控制：无法命名 endpoint 时只保留为 locator-only/unfrozen，不作科学 DROP；precommit 只要假设与 falsifier，不要结果。
- 反方三：measurement 不要求 action 会放进描述性弱论文。控制：必须有 unowned conclusion delta、independent subtractor、held-out/replication、effect/conclusion threshold、full-cost 和 Q2 论文形状。
- 反方四：要求 target-specific 会误伤通用算法。控制：通用算法仍可通过 `METHOD_ALGORITHM`，但必须有非平凡新算法/保证；普通通用 solver wrapper 仍不合格。
- 资源风险：不增加 locator、raw、C0、deep、artifact、lane 或网络预算；只是改变入场次序与类型解释。
- 状态风险：无迁移；所有 STOP/HOLD/BLOCKED/PASS 保持原状。

## 9. 验收、停止与回滚

机械验收：

1. 每条 raw 的 identity、version/date、carrier kind、object/estimand、claim endpoint、counterfactual consequence、falsifier 可逐行读取；S2 式领域桶 raw=0。
2. canonical carrier 均有 explicit claim ceiling；canonical→natural 未授权外推=0。
3. measurement/benchmark 不得仅因没有 controller action而排除；algorithm/system 也不得借 measurement 类型逃避 action/guarantee 门。
4. generic mapping/batching/placement/partition/controller 在 raw 前即可识别时不得消耗 C0；不确定时标 locator-only，不伪造结构性 DROP。
5. 漏斗逐行对账，无 outcome-aware backfill、提案配额、V9、Stage/实验/下载/自动化。

brief 仍可为零。若有 brief，立即交独立 Stage0；若仍零 brief：

- 全部由 direct collision/current union/generic kernel/无独立 conclusion delta 解释，则登记真实题源饱和与 healthy abstention；
- 再次出现四条领域桶、canonical 误作 natural 或 measurement 被强迫 controller，则判 V7R1 执行失败；
- 单轮后停止自动续跑，不原样重复。

回滚只在下一安全 assignment 边界撤销 V7R1 carrier-kind 与 precommit 字段，恢复 canonical v8.7 调度。旧 ledger、负证据和候选状态不改写，STOP 不复活。

## 10. Recommendation

- Decision: `PATCH_RECOMMENDED__ASSIGNMENT_LOCAL_NEXT_BOUNDARY`
- Profile: `NATURAL_OR_CANONICAL_CLAIM_SHAPE_PRECOMMIT_V7R1`
- Historical backtest: 不需要；这是现行类型合同的 assignment-local 对齐与题源顺序试点，不改变 canonical v8.7 科学门。
- Prospective validation: 一个完整六路周期；不自动运行第二轮。
- Existing authority: `USER_ADAPTIVE_DISCOVERY_CONTINUE_UNTIL_FIVE_STAGEA_PASS_20260814` 已覆盖；fresh generic approval 不需要。
- Shared patch: 本审计不实施。若未来永久写入共享规则，仍需用户单独批准并由主线单写者完成。

## Mainline handoff

- User approval already present: 是，仅限一个 assignment-local V7R1 周期。
- Files proposed for shared change: 无；仅建议下一轮 control/六路 assignment 字段。
- Registry migrations: 无。
- Existing topics affected: 无；不复活、不重命名、不改变状态。
- Shared files modified: `false`。
