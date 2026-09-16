# Rule Change Proposal

## Proposal identity

- `audit_id`：`RULE-AUDIT-20260815-SOURCE98-99-CONSECUTIVE-ZERO-BRIEF-R83`
- `proposal_id`：`R83-NO-CHANGE`
- `decision_label`：`NO_CHANGE`
- `user_policy_approval_required`：`false`
- `backtest_required`：`false`

## Problem statement

Source99 的两条 raw 均未生成 brief，可能被误解为漏斗异常。实际记录显示一条按正确 ceiling 留作 closure debt，另一条通过深审找到了同对象直接吸收。

## Proposed minimum delta

| File | Heading/field | Current semantics | Proposed semantics |
|---|---|---|---|
| 无 | 无 | raw/deep/direct-subtract/pending-closure 与 clean brief 分层 | 不修改共享规则 |

## Safety and validation

Q2、same-object、current union、强基线、自然/canonical、full-cost、复现、claim ceiling、STOP non-revival 和用户 StageB 门全部不变。无迁移、无回滚。最小验收：不得将 pending raw 当 Stage0 brief，也不得把 current PEA direct-subtract 改写为保留题。

## Decision request

无需新的政策批准；继续 ordinary R40，不执行 queue，不叠加 successor micro-rule。
