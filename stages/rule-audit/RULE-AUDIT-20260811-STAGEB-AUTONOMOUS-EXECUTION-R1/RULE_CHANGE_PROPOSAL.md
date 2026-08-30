# Rule Change Proposal

## Proposal identity

- `audit_id`: `RULE-AUDIT-20260811-STAGEB-AUTONOMOUS-EXECUTION-R1`
- `proposal_id`: `STAGEB-AUTONOMOUS-EXECUTION-PROTOCOL-R1`
- `decision_label`: `PATCH_RECOMMENDED__USER_POLICY_APPROVED`
- `user_policy_approval_required`: `satisfied`
- `backtest_required`: `false`

## Problem statement

现行 Stage B 规则定义了可靠论文原型必须交付什么，却没有统一约束 agent 如何排序 kill gates、如何在预授权范围内自行恢复、如何区分工程纠错和科学 revision、如何隔离无效 run，以及 claim-bearing 之后资源阻塞时如何保存部分证据。这会增加用户中断、无效运行、证据污染与 resource failure 被误解为科学结果的风险。

## Current rule

- `ROLE_CANDIDATE_OWNER / Stage B`：进入条件后直接列 14 项必交付。
- `ROLE_MAINLINE / 转换规则与资源`：有逐题用户门，但批准包没有强制 recovery envelope 和 kill-gate order。
- `ROLE_STAGEB_INDEPENDENT_REVIEW / 必查`：检查论文充分性，但未强制核对 B0–B6 轨迹、run invalidation 与 repair classification。
- `STAGEB_REPORT`：有 prototype、workload、full-cost、replay 和 blocker 标题，但没有结构化执行 ledger。
- `USER_BLOCKER_PACKET`：适合 preclaim 资源失败，但没有 partial-evidence blocker 的强制字段。

## Proposed minimum delta

| File | Heading/field | Current semantics | Proposed semantics |
|---|---|---|---|
| `rules/ROLE_CANDIDATE_OWNER.md` | Stage B | deliverable list | 增加 B0–B6、contract artifacts、kill-gate order、recovery envelope、repair/revision、postclaim blocker 和题内并行 |
| `rules/ROLE_MAINLINE.md` | 转换/并发/验收 | generic per-topic gate | 主线冻结逐题 autonomy envelope；Stage B WIP 默认1/burst2；机械验收执行 ledger |
| `rules/ROLE_STAGEB_INDEPENDENT_REVIEW.md` | 必查/研究诚信 | outcome review | 增加执行 provenance、失效 run、repair/revision 与 clean replay 检查 |
| `templates/STAGEB_REPORT.md` | report sections | narrative headings | 增加 contract/state/run/recovery/repair/claim matrix 字段 |
| `templates/USER_BLOCKER_PACKET.md` | blocker | preclaim-oriented | 支持 partial valid evidence + unfinished gates，不改变 blocker state |
| `templates/STAGEB_EXECUTION_CONTRACT.yaml` | new | absent | 提供逐题批准与自主执行的 machine-readable contract |

exact wording 与应用位置见 `DRAFT_PATCH.diff`。

## Safety invariants

- Q2 minimum preserved: `true`
- Q1 priority preserved: `true`
- Same-object preserved: `true`
- Latest collision preserved: `true`
- Fair current strong baseline preserved: `true`
- Natural input/evidence preserved: `true`
- Full-cost preserved: `true`
- Reproducibility preserved: `strengthened`
- Claim ceiling preserved: `strengthened`
- STOP non-revival preserved: `true`
- User StageB approval preserved: `strengthened`

## State and compatibility migration

- Existing states affected：无。
- Existing assignments affected：已冻结 assignment 不变；未来 Stage B assignment 使用新版本。
- Template compatibility：新增字段；旧 Stage B 报告仍可读，但不能作为新规则 assignment 的完整 handoff。
- Old filename compatibility：保留 `STAGEB_REPORT.md` 与 `USER_BLOCKER_PACKET.md` 名称。
- One-time migration required：无候选迁移；只登记规则 revision/hash。
- Rollback：回退六个目标文件到冻结 old hash；新 contract/canary 工件保留为非权威审计记录。

## Validation plan

- Historical/time-slice cases：不需要。
- Negative controls：缺逐题批准、超预算下载、系统级安装、换对象、删强 baseline、invalidated run 混入 claim、engineering correction 偷改机制。
- Expected behavior：agent 在 envelope 内自主修复；高成本工作按 kill-gate 信息增益排序；用户只在 mandatory gate/越界 blocker 被打断。
- Forbidden regressions：generic 批准被解释为题目 Stage B 批准；自动扩大权限；资源失败变科学 STOP；reviewer 修候选；并行写 canonical 文件。
- Acceptance threshold：首个 B0/B1 canary 所有 contract hard fields 100% 非空且一致；无共享写冲突；无未授权执行。

## Decision request

用户政策批准已满足。主线应核对本包哈希和目标 old hashes，在安全 assignment 边界应用 `DRAFT_PATCH.diff`，更新规则版本与 history/registry provenance。应用前仍禁止任何具体 Stage B；应用后每题仍必须获得独立 `stageb_user_approval_id`。

