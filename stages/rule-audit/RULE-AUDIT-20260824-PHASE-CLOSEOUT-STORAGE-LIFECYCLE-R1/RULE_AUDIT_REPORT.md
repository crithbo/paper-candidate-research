# Rule Audit Report

## 中文摘要

- 发现的问题：现行规则已经规定资源必须本地化、inventory 必须记录 deletion status、cleanup 必须验证路径与证据依赖，`ROLE_MAINLINE` 也要求 STOP 后删除详细材料。但这些条文没有形成“每个阶段验收后必须完成 storage closeout”的生命周期门，handoff 模板仍默认 `cleanup_status: NOT_REQUESTED`。因此清理主要依赖用户发现空间膨胀后再发起专项 wave，不能持续阻止重复源码、构建树、工具链和下载包累积。
- 近期证据：2026-08-24 三轮专项清理共删除 `917,833 files / 34,933,305,880 bytes`，科学状态未改变，证明大多数膨胀来自可重建或 superseded 资源，而不是必须长期保留的论文证据。清理后仍有约 `1.54 GB` exact-duplicate upper bound，且部分 duplicate 因 pending/reserve/claim-bearing 依赖不能简单删除。
- 建议修改：设计并在未来安全 assignment 边界安装 `PHASE_CLOSEOUT_STORAGE_LIFECYCLE_V1`。每阶段 handoff 验收后必须生成 retention plan、封存最小阶段证据胶囊、删除无下游消费者的可重建内容，并记录 cleanup receipt。STOP 使用 `TERMINAL_EVIDENCE_CAPSULE_V1`，不是“只留报告”。
- 是否需要用户批准：需要。持续、自动、不可项目内撤销的删除属于用户政策权限。建议标签为 `USER_POLICY_DECISION_REQUIRED`，辅以 `PATCH_RECOMMENDED`；科学 backtest 不需要，但必须先做只读 dry-run 和恢复性验证。

## Identity

- `audit_id`: `RULE-AUDIT-20260824-PHASE-CLOSEOUT-STORAGE-LIFECYCLE-R1`
- `trigger`: `USER_DIRECT_STORAGE_LIFECYCLE_RULE_REVIEW`
- `requested_by`: `USER`
- `date`: `2026-08-24`
- `write_directory`: `stages/rule-audit/RULE-AUDIT-20260824-PHASE-CLOSEOUT-STORAGE-LIFECYCLE-R1`
- `shared_files_modified: false`
- `files_deleted_moved_archived_or_compressed: false`

## Question and scope

- Question: 能否在题目推进阶段后自动删除对下一阶段无帮助的内容，并把 STOP 题压缩为仅必要材料，以阻止存储无限膨胀？
- Rules inspected: `AGENTS.md`、`rules/RESOURCE_LOCALIZATION.md`、`rules/ROLE_MAINLINE.md`、`rules/ROLE_CANDIDATE_OWNER.md`、Stage 0/A review rules、`templates/RESOURCE_INVENTORY.yaml`、`templates/HANDOFF.yaml`、`templates/REPRODUCIBILITY_PACKAGE.yaml`。
- Registered evidence inspected: storage cleanup D1 inventory and three accepted cleanup waves；current plan/registry；history 中旧清理和近期三轮清理记录。
- Out of scope: 修改共享规则、执行新清理、改变候选科学状态、Stage B 或正式项目资源策略。

## Current authoritative behavior

### 已有正确机制

1. `rules/RESOURCE_LOCALIZATION.md` 要求每个新资源 assignment 使用 `resources/{downloads,archives,src,build,env,cache,tmp,logs}`，并在 assignment 根保存 durable `RESOURCE_INVENTORY.yaml`。
2. Inventory 已有 `RETAIN_CLAIM_CRITICAL`、`RETAIN_REPRODUCIBILITY_DEPENDENCY`、`SAFE_TO_DELETE_AFTER_ACCEPTED_HANDOFF`、`SAFE_TO_DELETE_NOW` 等 deletion status。
3. Cleanup 已要求 literal absolute containment、root blacklist、reparse/junction、active process、inventory retention 和 claim/reproduction reference 检查。
4. `rules/ROLE_MAINLINE.md > STOP、删除与归档` 已要求 STOP 后压缩 history、验证保留清单、删除详细报告/运行/下载/重复审查材料并归档会话。
5. 最近 D1 Wave 1–3 证明精确 leaf cleanup、证据抽查和 recovery contract 可以安全实施。

### 缺失的闭环

1. 没有统一的 `artifact_lifecycle_state`，科学状态与 artifact 清理状态无法分别追踪。
2. 没有要求 owner 在 handoff 前为每个 persisted entry 指定 downstream consumer、claim criticality、reacquirability 和 delete-after gate。
3. `templates/HANDOFF.yaml` 默认 `cleanup_status: NOT_REQUESTED`，主线可在未形成 cleanup plan 时接受 handoff、释放 lane。
4. 没有 stage-specific retention contract：Discovery→Stage0、Stage0→StageA、StageA→StageB/STOP 应保留什么没有统一定义。
5. STOP 的“保留清单”没有 canonical schema；“只留报告”会漏掉独立裁决、决定性小结果、最小 witness 和 provenance。
6. 没有 post-close retained-byte budget、GC lag 或 retention exception；空间只能在膨胀后专项治理。
7. 现行规则对 legacy evidence 明确不追溯搬移，这在保护证据上正确，但也意味着旧大目录必须另做迁移清单。

## Failure classification

| 类别 | 判断 | 说明 |
|---|---|---|
| Scientific rule defect | `NO` | 科学录取、STOP 与证据门不需要改变 |
| Artifact lifecycle rule gap | `YES` | 缺 mandatory phase-closeout retention/GC contract |
| Template gap | `YES` | inventory/handoff 缺 consumer、retention class、capsule 与 GC completion gate |
| Execution violation | `NOT PRIMARY` | 历史执行遵循当时规则；问题是清理为按需而非生命周期化 |
| Resource anomaly | `REPEATED` | 多次 resume/revision 各自保留 source/build/toolchain，形成可预期增长 |
| Scientific-integrity risk | `HIGH_IF_REPORT_ONLY` | 只留报告可能无法复核 STOP 的决定性证据 |

## Why STOP should not mean report-only

建议把用户的“只剩报告”实现为“只剩最小终态证据胶囊”。严格 report-only 有四个风险：

1. 独立 gate 的 STOP 结论可能无法核对 owner 原始结果或最小反例；
2. 以后无法区分真实科学 STOP 与 invalid construct/resource failure；
3. 无法证明 full-cost、分母、same-object 和 comparator 当时如何闭合；
4. 删除后仅有摘要，容易造成 terminal identity 被错误重包装。

最小胶囊应保留报告，但通常还需 handoff/manifest、独立裁决、决定性结果表或最小 witness、复现命令、resource provenance 和 cleanup receipt。大规模 raw、build、工具链、源码 checkout 与下载包默认不留，除非通过 retention exception 证明不可替代。

## Recommendation

- Primary decision: `USER_POLICY_DECISION_REQUIRED`
- Secondary recommendation: `PATCH_RECOMMENDED`
- Scientific behavior backtest: `NOT_REQUIRED`
- Destructive operational dry-run: `REQUIRED`
- Minimum effective change: 新增一个集中权威 `rules/ARTIFACT_LIFECYCLE.md`，并在 AGENTS、RESOURCE_LOCALIZATION、ROLE_MAINLINE、阶段角色与 handoff/inventory 模板中做最小引用和字段接线。
- Existing scientific states affected: none。
- Existing artifacts: grandfathered；只有独立 legacy migration assignment 和用户精确批准后才清理。
- Non-relaxable gates preserved: Q2/Q1、same-object、latest collision、fair strong baseline、natural/canonical evidence、full-cost、reproducibility、claim ceiling、STOP non-revival 与 Stage B approval 全部不变。

## Proposed lifecycle in one line

`PHASE HANDOFF → MAINLINE ACCEPTS SCIENCE → DOWNSTREAM INPUTS SEALED → RETENTION PLAN ACCEPTED → CAPSULE SEALED → SAFE LEAVES DELETED → RECEIPT VERIFIED → ARTIFACT GC COMPLETE`

科学状态在 MAINLINE 接受 handoff 时生效；storage cleanup 是正交的 artifact lifecycle，不得因失败产生科学推断或消费 revision。

## Validation and rollout

1. `OFF`: 仅安装 schema，不执行。
2. `DRY_RUN`: 对至少五种历史案例生成计划但不删除：Discovery zero-output、Stage0 STOP、StageA STOP、StageA PASS/pending StageB、blocked/reserve 各至少一例。
3. `SHADOW_CLEANUP`: 只对 `tmp/cache/build` 中明确 `SAFE_TO_DELETE_NOW/AFTER_ACCEPTED_HANDOFF` 的新 assignment 做精确 leaf 演练；保留可重取证明。
4. `PRODUCTION_NEW_ASSIGNMENTS_ONLY`: 仅未来 assignment 生效；legacy 单独迁移。
5. 任一 claim-critical hash drift、resume failure、downstream missing input、wrong-root/reparse 或 restore/reacquire failure，立即回到 `OFF`。

## Mainline handoff

- User approval already present: 仅授权本轮审查与方案，不授权规则生效或删除。
- Files proposed for future change: `AGENTS.md`、`rules/RESOURCE_LOCALIZATION.md`、`rules/ROLE_MAINLINE.md`、相关 stage role、`templates/RESOURCE_INVENTORY.yaml`、`templates/HANDOFF.yaml`；建议新增 `rules/ARTIFACT_LIFECYCLE.md` 及三个模板。
- Shared files modified: `false`。
- Cleanup executed: `false`。
- Next user gate: 审阅并决定是否批准 policy bundle、自动删除范围、默认 retained-byte budgets 与 rollout 模式。

