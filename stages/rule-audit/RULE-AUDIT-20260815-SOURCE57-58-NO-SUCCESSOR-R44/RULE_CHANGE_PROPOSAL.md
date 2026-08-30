# Rule Change Proposal

## Proposal identity

- `audit_id`: `RULE-AUDIT-20260815-SOURCE57-58-NO-SUCCESSOR-R44`
- `proposal_id`: `R44-NO-SUCCESSOR-MICRO-RULE`
- `decision_label`: `NO_CHANGE`
- `user_policy_approval_required`: `false`
- `backtest_required`: `false`

## Problem statement

连续零 brief 容易诱发叠加新的局部规则。Source58 的两个新增记录都没有产生 raw、deep 或 clean brief：Wasmtime post-return 只是未执行的具体 closure，Level Zero 只是未满足单项目冻结的 locator backlog。它们不能支持行为性规则 patch。

## Current rule

- File/heading: `AGENTS.md` 的 Discovery 分层前端、closure debt 与连续零审计；`rules/ROLE_DISCOVERY.md` 的 R40 ordinary funnel/queue separation。
- Current behavior: 将可闭合的具体缺口保留为 queue，将缺 exact-project bundle 的路线保留为 locator backlog；二者均不越级进入 raw。
- Why it is sufficient: Source57–58 遥测与此语义一致，且没有观察到执行偏差。

## Proposed minimum delta

| File | Heading/field | Current semantics | Proposed semantics |
|---|---|---|---|
| 无 | 无 | R40 ordinary 与 queue separation 生效 | 无改动；禁止因本次连续零 brief 追加 successor micro-rule |

## Safety invariants

- Q2 minimum / Q1 priority / same-object / latest collision / fair current strong baseline / natural evidence / full-cost / reproducibility / claim ceiling: 全部保持。
- STOP non-revival: 保持。
- User StageB approval: 保持。

## State and compatibility migration

- Existing states affected: 无。
- Existing assignments affected: 无；Source57/58 queue 保持原属主和原状态。
- Template compatibility / migration / rollback: 均不需要。

## Validation plan

- Historical/time-slice cases: 不适用。
- Negative controls: 后续 handoff 不得把 locator-only 或未执行 queue 计为 raw/brief。
- Expected behavior changes: 无。
- Forbidden regressions: 不得因零 brief 提高容量、堆叠 profile、回填结果、放松门或将 queue 当新颖性证据。
- Acceptance threshold: 对本包的最小验收为范围合规、Source59 未读、共享文件未修改及关键计数一致。

## Decision request

无待批政策。主线可在后续安全边界继续当前 ordinary R40；不得把本 `NO_CHANGE` 当作对任意 queue 执行、下载、closure assignment 或科学状态转换的授权。
