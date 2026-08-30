# Rule Change Proposal

## Proposal identity

- `proposal_id`: `RULESET-COMPACTION-AND-CONTEXT-SLICE-V1`
- `decision_label`: `PATCH_RECOMMENDED_WITH_BACKTEST_REQUIRED_FOR_REGISTRY_SLICE`
- `user_policy_approval_required`: `false_for_semantics_preserving_text_compaction`; `true_if_any_gate_or_authority_changes`
- `shared_files_modified`: `false`

## Wave 0：冻结与反向引用核查

1. 主线冻结当前 `AGENTS.md`、active rules、templates、shadow bundle 与 registry hashes。
2. 对所有非终态 assignment 检索其冻结 path/hash；生成 `COMPATIBILITY_REFERENCE_MAP.yaml`。
3. 禁止删除、覆盖或移动唯一被引用字节；历史文件先复制到版本化 archive 并校验 hash。

验收：所有非终态 assignment 的规则和模板均仍可解析；无 hash/path 悬空。

## Wave 1：无行为变化的目录与文字压缩

1. 将 V9/R3 preview bundle 迁至版本化 archive；更新 registry 的 reference path；`rules/` 只留短索引和明确 `NOT_PRODUCTION` 状态。
2. 从 `ROLE_MAINLINE.md` 和 `ROLE_DISCOVERY.md` 移出 dormant R7 的完整说明，只留 mode/status/legacy pointer。
3. `AGENTS.md` 成为全局 hard-gate 唯一文字来源；各 role 删除重复段落，保留 role-specific workflow、decision table、permissions、outputs。
4. `ROLE_DISCOVERY.md` 删除已由 project skill 权威承载的操作 runbook；skill 不接管任何科学门、状态、预算或权限。
5. 模板删除解释性重复，保留字段、enum、表格、claim ceiling 和必要 fail-closed 提示。

建议体量目标：

| 文件 | 当前 | 目标 |
|---|---:|---:|
| `AGENTS.md` | 25.1 KB | 18–20 KB |
| `ROLE_MAINLINE.md` | 38.2 KB | 20–24 KB |
| `ROLE_DISCOVERY.md` | 37.6 KB | 18–22 KB |
| `ROLE_CANDIDATE_OWNER.md` | 22.2 KB | 15–17 KB |
| `ROLE_STAGE0_REVIEW.md` | 15.4 KB | 10–12 KB |
| Stage A/B review roles 合计 | 16.9 KB | 10–12 KB |
| `templates/` active prose/schema | 68.1 KB | 45–50 KB |

验收：

- 所有 decision enum、authority、write boundary、hard gate、resource/revision/STOP 规则和 mandatory artifacts 集合完全相同；
- `$research-topic-discovery` 的操作职责与 `ROLE_DISCOVERY` 科学职责无重叠冲突；
- 使用旧 R3 的 9-role actionability cases 加当前 Stage0/StageA/blocker 正负例做语义等价重放；
- 任一拒绝行为消失、字段丢失或结论变化即回滚整波。

## Wave 2：assignment-local registry slice shadow

新增主线生成的 `ASSIGNMENT_CONTEXT.yaml`，分支在 shadow 期同时读取 full registry 与 slice，但只比较 required facts，不改变结论。至少覆盖：

- 2 个 Discovery assignment；
- 2 个 Stage0；
- 2 个 StageA owner/gate；
- 1 个 StageB/blocker；
- 1 个 rule-audit；
- terminal collision、pending queue、resource blocker、revision consumed 各一个负控。

接受条件：required-fact recall 100%，authority/terminal/revision/resource 字段 100%，决策与拒绝行为无差异，slice 不超过 128 KiB，连续两轮无遗漏或 rule drift。失败即继续全量 registry，不做自动修补或阈值放宽。

## Wave 3：安全 cutover

仅在 Wave 2 PASS 后，更新分支 lane 最小读取入口为：`AGENTS.md + plan.md + frozen assignment context + role + topic materials`；Mainline、registry migration、争议审计仍读取 full registry。任何 slice hash/字段异常自动回退 full registry 或 fail closed。

## Rollback

- 每波独立提交、独立 old→new hash manifest。
- Wave 1 回滚为恢复 archived exact bytes 与旧 role/template。
- Wave 2/3 回滚为所有 lane 恢复 full-registry read；不迁移候选状态。
- 不对任何 active/blocked/hold/terminal topic 做状态变更。
