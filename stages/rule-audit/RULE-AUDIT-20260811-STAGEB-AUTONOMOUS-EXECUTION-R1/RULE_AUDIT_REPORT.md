# Rule Audit Report

## Identity

- `audit_id`: `RULE-AUDIT-20260811-STAGEB-AUTONOMOUS-EXECUTION-R1`
- `trigger`: 用户批准把上一轮 Stage B 自主执行建议写入文件
- `requested_by`: USER
- `date`: `2026-08-11`
- `write_directory`: `stages/rule-audit/RULE-AUDIT-20260811-STAGEB-AUTONOMOUS-EXECUTION-R1/`
- `shared_files_modified: false`

## Question and scope

- 问题：如何让 Stage B 的课题实现由 agent 尽量自主完成，遇到阻塞先在预授权范围内自行解决，同时保持逐题用户门和全部科学硬门。
- 审查文件：`AGENTS.md`、`plan.md`、`registry.yaml`、`ROLE_RULE_AUDIT`、`ROLE_CANDIDATE_OWNER`、`ROLE_MAINLINE`、`ROLE_STAGEB_INDEPENDENT_REVIEW`、`ROLE_PAPER_PROJECT`、`STAGEB_REPORT`、`USER_BLOCKER_PACKET`。
- 最小实例：当前唯一 `PENDING_USER_STAGEB_REVIEW` 的 `S6-JS-PREFIXBOUND` Stage A closing packet；只用于证明执行编排需求，没有启动 Stage B。
- 越界：不修改共享文件、不启动任何题目、实验、下载、设备或正式项目。

## Current authoritative behavior

现行规则正确规定了逐题 `stageb_user_approval_id`、Stage B 14 项交付、paper-grade full-cost、最多三个一层子代理、父会话唯一 canonical writer 和独立复审。主线也已规定高价值 Stage A/B 时减少浅层并发，Stage B WIP 诊断目标为 1–2。

不足在执行层：`ROLE_CANDIDATE_OWNER` 从进入条件直接跳到必交付清单；`STAGEB_REPORT` 是结果章节而非执行状态机；blocker 规则主要明确首个 claim-bearing observation 之前的失败；没有统一的恢复 envelope、run invalidation、工程纠错/科学 revision 分类和题内 artifact ownership。

## Evidence of a problem or of correct behavior

| Observation | Source/artifact | Repeated? | Classification |
|---|---|---:|---|
| Stage B 有完整质量清单但无 B0–B6 ordered execution contract | `rules/ROLE_CANDIDATE_OWNER.md` Stage B | systemic | rule/template gap |
| 报告模板没有实际 arm/run 状态、recovery attempt、invalidated evidence 和 repair ledger | `templates/STAGEB_REPORT.md` | systemic | template gap |
| pre-observation blocker 清楚，post-observation partial-evidence blocker 不够明确 | candidate owner + blocker template | systemic | clarification gap |
| 正式项目已有 ordered workflow，Stage B 没有同等级编排 | `rules/ROLE_PAPER_PROJECT.md` | systemic | workflow asymmetry |
| S6 有五个有序 kill gates，但没有通用规则保证先做低成本高否决力门 | S6 closing gate packet | first concrete case | implementation-planning risk |
| ARS 提供 monitoring/replay 规范，但通用逐命令确认与项目的题目级预授权 autonomy 不一致 | experiment-agent workflow | systemic | integration clarification |

## Risk analysis

- False-negative risk：agent 先跑昂贵但低信息实验，资源耗尽后未触及真正 kill gate。
- False-positive/weak-paper risk：调试 run、替代对象或未公平计价结果混入 claim evidence。
- Scientific-integrity risk：implementation bug 被包装为科学负结果，或 engineering repair 被隐蔽用来改变机制。
- Resource/time risk：普通下载/build/重放失败频繁打断用户，或无界自主重试浪费资源。
- State-migration risk：低；新规则只作用于未来 Stage B assignment。
- Terminal-revival risk：无；不触及已有 STOP。

## Recommendation

- Decision: `PATCH_RECOMMENDED__USER_POLICY_APPROVED`
- Minimum effective change：对三个角色规则、两个现有模板及一个新 Stage B contract 模板应用 `DRAFT_PATCH.diff`。
- 更小的只改报告模板方案不足：权限、重试、修复分类、并发和主线验收属于角色语义，不能只靠填表约束。
- 所有不可放松门保持不变；逐题 Stage B 批准仍为 mandatory。

## Validation and rollback

- 历史/time-slice backtest：不需要；该 patch 不改变 Discovery/Stage0/StageA 录取与 Stage B 科学接受阈值。
- Shadow：首个获逐题批准的 Stage B assignment 以 B0/B1 canary 执行；首个 claim-bearing run 前必须完成 contract completeness 与 anchor 检查。
- 成功标准：必需字段 100%；kill-gate 顺序冻结；所有 run 有 classification；engineering correction 的受影响结果 100% invalidated；用户常规中断只发生在 envelope 越界；独立 replay 可复核。
- 失败/回滚：若合同工件造成歧义、shared writer 冲突或误授权，停止在 B0/B1，恢复旧规则；不删除 canary 工件、不降低质量门。

## Mainline handoff

- User approval already present: `true`，见 `USER_APPROVAL_DIRECTIVE.md`。
- Files proposed for change：`rules/ROLE_CANDIDATE_OWNER.md`、`rules/ROLE_MAINLINE.md`、`rules/ROLE_STAGEB_INDEPENDENT_REVIEW.md`、`templates/STAGEB_REPORT.md`、`templates/USER_BLOCKER_PACKET.md`，新增 `templates/STAGEB_EXECUTION_CONTRACT.yaml`。
- Registry migrations proposed：无候选状态迁移；主线只登记规则版本/批准 provenance。
- Existing assignments affected：已经 active 的 assignment 保持冻结旧规则；未来 Stage B 使用新规则。`S6-JS-PREFIXBOUND` 仍未获逐题 Stage B 批准。
- Shared files modified: `false`

