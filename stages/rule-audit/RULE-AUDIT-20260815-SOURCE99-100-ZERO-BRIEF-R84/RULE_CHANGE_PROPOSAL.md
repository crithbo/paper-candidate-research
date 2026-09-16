# Rule Change Proposal

## Proposal identity

- `audit_id`：`RULE-AUDIT-20260815-SOURCE99-100-CONSECUTIVE-ZERO-BRIEF-R84`
- `proposal_id`：`R84-NO-CHANGE`
- `decision_label`：`NO_CHANGE`
- `user_policy_approval_required`：`false`
- `backtest_required`：`false`

## Problem statement

Source100 的 pending closure 与 x264 transport blocker 可能被误读为低发现率或科学失败。两者已按规则被正确隔离。

## Proposed minimum delta

| File | Heading/field | Current semantics | Proposed semantics |
|---|---|---|---|
| 无 | 无 | pending raw、clean brief 与 resource-only blocker 分离 | 不修改共享规则 |

## Safety and decision request

Q2、same-object、current union、强基线、自然/canonical、full-cost、复现、claim ceiling、STOP non-revival 和 StageB 用户门不变。无迁移和回滚。不得将 robots-denied 当作科学证据，且不得执行队列。无需新批准。
