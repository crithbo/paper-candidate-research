# Rule Change Proposal

## Proposal identity

- `audit_id`：`RULE-AUDIT-20260815-SOURCE97-98-CONSECUTIVE-ZERO-BRIEF-R82`
- `proposal_id`：`R82-NO-CHANGE`
- `decision_label`：`NO_CHANGE`
- `user_policy_approval_required`：`false`
- `backtest_required`：`false`

## Problem statement

连续零 brief 及新 raw 可能被误解为需要新的策略层。当前证据相反：Mnesia raw 正是 current R40 的分层保护在起作用。

## Proposed minimum delta

| File | Heading/field | Current semantics | Proposed semantics |
|---|---|---|---|
| 无 | 无 | raw 与 clean brief、pending queue 与已闭合证据分离 | 不修改共享规则 |

## Safety, migration and validation

Q2、same-object、latest/current collision、强基线、自然/canonical、full-cost、复现、claim ceiling、STOP non-revival 和 StageB 用户门均不变。无迁移、无回滚。最小验收：不得将 raw、pending queue 或 S2 机械延续计作 Stage0 brief 或科学结论。

## Decision request

无需新政策批准。维持 ordinary R40；不得执行 queue 或堆叠 successor micro-rule。
