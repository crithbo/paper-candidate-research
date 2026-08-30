# Rule Change Proposal

## Proposal identity

- `audit_id`: `RULE-AUDIT-20260815-SOURCE60-61-CONSECUTIVE-ZERO-BRIEF-R45`
- `proposal_id`: `R45-NO-SUCCESSOR-MICRO-RULE`
- `decision_label`: `NO_CHANGE`
- `user_policy_approval_required`: `false`
- `backtest_required`: `false`

## Problem statement

连续零 brief 可能被误读为规则过严或终态标签丢失。Source60/61 显示相反：主要是 no-anchor、current/direct absorption、generic remainder 或未闭合的 locator；GCC terminal identity 明确保留且未重开。

## Current rule

- File/heading: `AGENTS.md` 的连续零审计、exact terminal identity、RQ/closure/raw 分层；`rules/ROLE_DISCOVERY.md` 的 ordinary R40 与 queue semantics。
- Current behavior: 精确终态身份跨 assignment 作为 scheduling hold 传递；locator backlog 不得成为 raw；一个零产出审计不得自动叠加下一条微规则。
- Why it is sufficient: 两轮新遥测符合此行为，没有反例。

## Proposed minimum delta

| File | Heading/field | Current semantics | Proposed semantics |
|---|---|---|---|
| 无 | 无 | 普通 R40 与 exact-only terminal hold 已生效 | 无改动；继续按现有 control 传递 hold，不新增 gate/profile |

## Safety invariants

- Q2 minimum / Q1 priority / same-object / latest collision / fair current strong baseline / natural evidence / full-cost / reproducibility / claim ceiling: 全部保持。
- STOP non-revival: 保持，且不扩展为 broad category exclusion。
- User StageB approval: 保持。

## State and compatibility migration

- Existing states / assignments / templates: 无变化。
- Migration / rollback: 不需要。

## Validation plan

- 预期行为变化：无。
- 禁止回归：不得把 exact terminal hold 遗漏、改名重开、扩展为 RELATED 排除；不得把 locator-only 或 zero brief 当科学 STOP。
- Acceptance threshold: 包范围合规、Source62 未读、共享文件未修改、Source60/61 的关键分母一致。

## Decision request

无待批准事项。主线可继续 ordinary R40，但本包不授权执行任意 queue、修改 Source62、启动 Stage、外部检索或更改科学状态。
