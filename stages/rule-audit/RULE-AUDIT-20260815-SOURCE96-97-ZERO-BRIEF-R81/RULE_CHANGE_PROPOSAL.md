# Rule Change Proposal

## Proposal identity

- `audit_id`：`RULE-AUDIT-20260815-SOURCE96-97-CONSECUTIVE-ZERO-BRIEF-R81`
- `proposal_id`：`R81-NO-CHANGE`
- `decision_label`：`NO_CHANGE`
- `user_policy_approval_required`：`false`
- `backtest_required`：`false`

## Problem statement

连续零 brief 容易诱导把 pending raw、locator 或机械 entry correction 误读成筛选失败，继而叠加没有证据支持的微规则。Source96–97 不支持这种变化。

## Current rule and minimum delta

| File | Heading/field | Current semantics | Proposed semantics |
|---|---|---|---|
| 无 | 无 | ordinary R40 的 raw、brief、queue 分层生效 | 不修改共享规则 |

Source96 的 queue 已保留可恢复的有限闭合路线；Source97 的 six-lane 拒绝都不是“缺实现/资源”的科学结论。现有规则足以处理本次记录。

## Safety and compatibility

所有 Q2、same-object、latest/current collision、公平强基线、自然/canonical、full-cost、可复现、claim-ceiling、STOP non-revival 和用户 StageB 门不变。没有 assignment、template、registry 或状态迁移；不需回滚。

## Validation and decision request

最小验收：Source97 维持 raw=0 / brief=0，S2 修正不改变资源与科学计数，Source96 pending queue 不被当前周期使用。无需新用户或主线政策批准；不得执行 queue 或添加 successor micro-rule。
