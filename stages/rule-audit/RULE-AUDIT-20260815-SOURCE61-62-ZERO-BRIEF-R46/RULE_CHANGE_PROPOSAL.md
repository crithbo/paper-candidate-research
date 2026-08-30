# Rule Change Proposal

## Proposal identity

- `audit_id`: `RULE-AUDIT-20260815-SOURCE61-62-CONSECUTIVE-ZERO-BRIEF-R46`
- `proposal_id`: `R46-NO-SUCCESSOR-MICRO-RULE`
- `decision_label`: `NO_CHANGE`
- `user_policy_approval_required`: `false`
- `backtest_required`: `false`

## Problem statement

Source62 没有发现 R45 未覆盖的可归因漏斗故障：它重复 no-anchor、locator-only、current-union/generic 的健康分布，并展示了一个真实边界仍仅有通用修复的负面对照。

## Current rule

- File/heading: `AGENTS.md` 的连续零 brief 审计与 RQ/raw 分层；`rules/ROLE_DISCOVERY.md` 的 R40 ordinary funnel。
- Current behavior: 不把 generic repair、未闭合 locator 或无 anchor 的 seed 越级送入 raw；不因连续零自动叠加微规则。
- Why it is sufficient: Source62 的新增实例符合而非反驳此语义。

## Proposed minimum delta

| File | Heading/field | Current semantics | Proposed semantics |
|---|---|---|---|
| 无 | 无 | ordinary R40 及分离 telemetry 已生效 | 无变更；禁止 R46 后追加 successor micro-rule |

## Safety invariants

- Q2/Q1、same-object、latest collision、强基线、自然证据、full-cost、可复现性、claim ceiling、STOP non-revival 和 StageB 用户门：全部保持。

## State and compatibility migration

- Existing states/assignments/templates: 无变化。
- Rollback: 不适用。

## Validation plan

- Expected change: 无。
- Forbidden regressions: 不得把 `LOCATOR_ONLY` 算作 raw，不得将 generic repair 当 N1/N2，不得读取或回写 Source63。
- Acceptance: 范围合规、Source63 未读、共享文件未修改、Source61/62 分母一致。

## Decision request

无待批准政策。该包不授权执行 queue、外部检索、启动 Stage、修改 Source63 或变更共享规则。
