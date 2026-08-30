# Rule Change Proposal

## Proposal identity

- `audit_id`：`RULE-AUDIT-20260815-SOURCE95-96-CONSECUTIVE-ZERO-BRIEF-R80`
- `proposal_id`：`R80-NO-CHANGE`
- `decision_label`：`NO_CHANGE`
- `user_policy_approval_required`：`false`
- `backtest_required`：`false`

## Problem statement

两轮零 clean brief 可能诱发为提高产出而叠加微规则，或误将 `PENDING_UNEXECUTED` raw 升格为 brief。Source95–96 的记录不支持这种推断。

## Current rule

- 文件/位置：`AGENTS.md` 的 Discovery RQ 前端与 `rules/ROLE_RULE_AUDIT.md` 的 `NO_CHANGE` 决策标签。
- 当前行为：有限 source closure 可作为 raw 的未执行债务；只有 clean brief 才进入独立 Stage0；零 brief 合法。
- 充分性：Source96 S5 正按该分层工作，其他 lane 的拒绝均有精确 endpoint/anchor/current-union/generic-kernel 原因。

## Proposed minimum delta

| File | Heading/field | Current semantics | Proposed semantics |
|---|---|---|---|
| 无 | 无 | ordinary R40 维持 | 无共享规则修改 |

## Safety invariants

Q2、Q1 优先、same-object、latest collision、公平强基线、自然/canonical 证据、full-cost、复现、claim ceiling、STOP non-revival 和用户 StageB 门全部原样保留。

## State and compatibility migration

- Existing states / assignments：无变更。
- Template compatibility / migration：无。
- Rollback：不适用。

## Validation plan

- 不运行回测或 shadow。
- 最小机械验收：Source96 的 raw=1、brief=0、`S5-96-CQ01.attempts=0` 与 Source96 S4 的资源/科学计数不变。
- 禁止回归：不得把 pending queue、locator 或机械修正计入 brief、Stage0 或科学结论。

## Decision request

无需用户或主线批准新政策。继续现有 ordinary R40；任何 closure 只能在独立冻结 assignment 内处理。
