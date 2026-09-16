# RULE CHANGE PROPOSAL

## 1. 提案身份

- `proposal_id`: `POLICY-HOLD-RESOLUTION-AND-REVISION-ADMISSIBILITY-R2E-P1`
- `audit_id`: `RULE-AUDIT-20260811-POLICY-HOLD-FOUR-TOPICS-R2E`
- 提案类型：`USER_POLICY_DECISION_REQUIRED + PATCH_RECOMMENDED`
- `USER_APPROVAL_REQUIRED`: `true`
- 当前生效：`false`
- 回溯状态迁移：`none`
- 生产规则直接修改：`none`
- retrospective backtest：`not required`
- pre-production shadow：`required, 2 assignments`

## 2. 问题定义

四题 HOLD 不是录取门过严，而是唯一 scientific revision 已进入或完成 claim-bearing 工作后，才由独立 gate 发现构造不可采信：

- S4：合法性、比较器、分母和 dominance 判定同时失配；
- Parquet：顺序轮转、成本归因与 representation family 失配；
- GIN：current-source strict-successor 语义、state sufficiency 与 warm-cache 边界失配；
- KALLSYMS：唯一 novelty witness 被冻结 strong-union baseline 覆盖。

现行 `INCONCLUSIVE_POLICY_HOLD` 对这些情况给出了正确的证据诚实出口。缺口是：revision 在成为 claim-bearing 前，没有统一要求把每个 hard predicate 映射到可审计定义、代码路径、checker 和 admissibility 结果。

## 3. 提案 A：四题政策处置（不修改共享规则）

### 最小政策 delta

1. 用户仅为 `PARQUET-PAGE-COSEGMENT` 签发一个新的、逐题的 `exceptional_revision_approval_id`，用途严格限定为 fidelity repair。
2. exception contract 必须逐字包含 `TOPIC_DECISION_MATRIX.md` 的 corpus、对象、action family、阈值、representation family、三类计时、对称 allocation、Latin rotation、warmup/repetition、checker 与独立 gate 边界。
3. `S4-SLO-PAGEPACK`、`GIN-POSTING-CUT-DP`、`KALLSYMS-VERSIONAWARE-TOKEN-STABILITY` 不因本提案获得运行权，继续 HOLD。
4. 若 Parquet 再次因构造无效而不能判定，不自动授权下一次 revision；回到 HOLD，用户再选择保留或撤回。

### 明确不授权

- 不授权运行任何实验、下载、Stage B 或共享控制写入；
- 不授权换 corpus、换机制、调阈值、删强 baseline、缩小 full-cost 或降低保证；
- 不授权 owner 自行解除 HOLD；
- 不把此次 audit-only 批准解释为 exceptional revision 批准。

## 4. 提案 B：未来 `REVISION_ADMISSIBILITY_MATRIX`

### 建议修改位置

只有用户批准且两次 shadow 通过后，才由主线在安全 assignment 边界修改：

- `rules/ROLE_CANDIDATE_OWNER.md`：在 `PRE_CLAIM_CONTRACT_FIDELITY_GATE` / scientific revision 首个 claim-bearing observation 之前增加 matrix 完备要求；
- `rules/ROLE_STAGE0_REVIEW.md`：对静态/形式 revision 增加 current-source semantic replay 与 baseline-union externality certificate；
- 对应 Stage 0 / Stage A 报告模板：只增加字段，不改变评分或录取阈值。

### exact minimal delta

每个 scientific revision 在首个 claim-bearing observation 或提交独立 gate 前，必须生成一份 `REVISION_ADMISSIBILITY_MATRIX`，至少包含：

| 字段 | 强制内容 |
|---|---|
| `frozen_hard_predicate` | 冻结合同中的逐条硬谓词，不得摘要合并 |
| `formal_or_operational_definition` | 单位、分母、对象、保证与允许动作的可判定定义 |
| `implementation_or_source_anchor` | 实现代码路径，或 current upstream commit/函数/状态转移 |
| `checker_or_static_replay` | 对应的 executable checker、最小 witness 或静态重放步骤 |
| `baseline_action_coverage` | 强基线 union 能表达/不能表达的动作及证据 |
| `cost_attribution_type` | `baseline_only`、`shared`、`candidate_only` 及预注册 allocation |
| `arm_schedule` | 顺序、Latin/randomization、warmup、repetition |
| `structural_legality_invariant` | non-overlap、容量、语义等决定性合法性检查 |
| `admissibility_result` | `PASS` 或 `FAIL_CLOSED_PRECLAIM`；不得写未知后继续运行 |

附加两条阶段规则：

1. Stage 0 的形式/静态 revision，若 novelty 依赖一个 witness，必须在提交前给出 `BASELINE_UNION_EXTERNALITY_CERTIFICATE`；若依赖 current implementation 语义，必须由独立 reviewer 重放 decisive source transition。
2. Stage A 的计时/成本 revision，actual arm schedule 与 typed cost ledger 必须由运行日志机械生成；报告中的计划值不能替代实际值。

### fail-closed 语义

- matrix 任一 hard predicate 未映射或 checker 失败：在 claim-bearing observation 前停止；可在同一 preclaim assignment 内纠正，不消费新的 scientific revision。
- matrix PASS 只表示构造可采信，不表示学术 PASS，也不提高 evidence ceiling。
- 独立 gate 仍复核所有 hard predicate；matrix 不能替代 gate。

## 5. 不变项

以下全部保持不变：

- `TIER_B_Q2_VIABLE` 最低质量线；
- same-object / same-function / same-guarantee；
- current collision 与 current-upstream reality check；
- 公平当前强基线与 baseline union；
- 自然输入、自然正证据；
- full-cost、共同分母与对称计价；
- fidelity gate、可复现、证据等级和 claim ceiling；
- `REVISE_ONCE` 默认上限；
- 终态 STOP 不复活；
- 只有用户能批准例外，只有主线能修改共享规则与状态。

## 6. Shadow 验证设计

在两个新的、原本就会发生的 revision assignment 中 shadow 生成 matrix，但不让它改变当次录取或运行权：

### 验收指标

- frozen hard predicate 映射覆盖率：`100%`；
- 关键构造缺陷漏检：`0`；
- baseline action coverage 未决项在 claim-bearing 前显式率：`100%`；
- actual arm schedule 与 cost ledger 可从日志重建率：`100%`；
- 用户新增常规操作：`0`；
- AI 工件生成与独立复核额外壁钟时间：记录 p50/p90，不设牺牲科学门的硬时限；
- false block：由独立 gate 认定 matrix FAIL 但原构造实际完全 admissible 的次数 `0/2`。

### 通过条件

两次 shadow 均满足前五项，且没有因字段歧义造成 false block，才可请求用户批准将 matrix 设为 mandatory。样本不足时保持 shadow，不宣称已校准。

## 7. 风险与缓解

| 风险 | 缓解 |
|---|---|
| 工件膨胀，降低吞吐 | 只映射冻结 hard predicates；允许机器生成 schedule/cost/code anchors；不复述全部报告 |
| owner 自证造成形式主义 | current-source replay、union externality 和 closing gate 由独立角色复核 |
| 把 precheck 误当学术通过 | 固定 claim ceiling：matrix PASS 仅为 admissibility |
| 例外 revision 成为常规路径 | approval ID 限题、限次、限 delta；第二次 invalid 后无自动续期 |
| 对历史 assignment 追溯改判 | 明确不迁移、不重写、不回填历史状态 |

## 8. 回滚

### 提案 A

在 Parquet 首个 claim-bearing observation 前，任一冻结边界未满足，则主线撤销该 exception assignment 的后续运行权；保留旧 HOLD 和所有旧证据，不产生 PASS/STOP。有效 observation 已产生后不得因结果不利而回滚数据。

### 提案 B

若 shadow 失败或用户不批准 mandatory：删除“必须”要求，不删除 shadow 工件；现有 `PRE_CLAIM_CONTRACT_FIDELITY_GATE`、`REVISE_ONCE` 和 `INCONCLUSIVE_POLICY_HOLD` 原文继续有效。不得回滚为更低科学门。

## 9. 用户决策请求

请用户分别裁决：

1. 是否批准 `PARQUET-PAGE-COSEGMENT` 一次、严格限界的 fidelity-only exceptional revision？
2. 是否批准未来两个 revision assignment 进行非阻塞 `REVISION_ADMISSIBILITY_MATRIX` shadow？

在明确批准前，本提案没有执行效力。

