# Rule Change Proposal

## Proposal identity

- `audit_id`: `RULE-AUDIT-20260815-SOURCE39-40-CARRIER-DEPTH-RECALL-R35`
- `proposal_id`: `GLOBAL_TERMINAL_IDENTITY_AND_CLOSURE_ACCOUNTABILITY_V1`
- `decision_label`: `PATCH_RECOMMENDED`
- `user_policy_approval_required`: `false`
- `backtest_required`: `false`
- `targeted_regression_required`: `true`
- `earliest_safe_boundary`: `SOURCE42_OR_LATER`
- `source41_changed_or_paused`: `false`

## Problem statement

Source40 的 carrier/source-closure 调度产生了更可审计的中间状态，但未提高 canonical raw/brief。FPMR 因 identity override 只覆盖 Source25–39 而漏掉 Source19 exact/terminal predecessor，先形成 false raw；S6 又在零 route attempt 时写出 exhausted。两者都不是科学门导致的健康零产出。

## Current rule

- Source40 control 的 identity override 是近期轮次窗口，不是全历史 exact/terminal index。
- queue 要求非空并允许有限路线，但未机械禁止 `attempts=0 + EXHAUSTED`。
- Source40 固定预留 S3/S4 两个 `sol/high` slot；实际只触发 S4 一项。

## Proposed minimum delta

| File/surface | Current semantics | Proposed semantics |
|---|---|---|
| `rules/ROLE_MAINLINE.md` identity dispatch | 依赖近期轮次/人工对账 | 主线维护或生成全历史 canonical terminal identity lookup surface；raw 前按五字段 exact/terminal containment 查询，RELATED 不自动排除。 |
| `rules/ROLE_DISCOVERY.md` preflight | 允许 bounded material 未命中后继续 | 记录 global lookup result/hash；命中 exact/terminal 或已冻结 direct collision 时 raw 前排除，未命中不等于 novelty。 |
| future assignment `SOURCE_CLOSURE_QUEUE` | 可出现 zero-attempt exhausted | `EXHAUSTED` 仅在至少一条冻结路线实际尝试，或每条路线均有机械 unavailable 原因时合法；否则必须 `PENDING_UNEXECUTED`/`BLOCKED`。 |
| future model routing | Source40 固定 S3/S4 Sol slot | 不作为永久默认。保留 neutral packet schema；Source41 及现行授权照常，未来 Sol 重新启用须有独立、明确边界。 |

## Safety invariants

- Q2 minimum/Q1 priority: preserved。
- Same-object/current collision: strengthened, not relaxed。
- Fair strong baseline/natural or canonical carrier/full-cost/reproducibility/claim ceiling: preserved。
- STOP non-revival: strengthened by global terminal lookup。
- StageB user approval: unaffected。
- No quota, outcome-aware backfill, lane/capacity/budget increase, V9 or network-security scope。

## State and compatibility migration

- Source39/40 conclusions unchanged；FPMR 保持 excluded-before-raw。
- Source41 已冻结 `terra/high`，不改写、不暂停。
- 不扫描或重判全部历史 candidate states；global lookup 可由主线从已登记 canonical identity/certificate 生成只读索引。
- 旧 handoff 保持原字节；未来 handoff 新增 lookup/attempt-consistency 字段。

## Validation plan

1. Positive regression：Source40 FPMR 必须在 raw 前命中 Source19 D01 和 GCC collision。
2. Negative control：对象相邻但 action/endpoint 不同的 Arm SME/ZA family 必须保持 `RELATED_ONLY`。
3. Queue controls：一个 `attempts=0` item 必须输出 `PENDING_UNEXECUTED`；一个全部路线 mechanically unavailable 的 item 可输出 bounded blocked/unresolved，但不得科学 DROP。
4. 下一周期接受指标：late identity reconciliation=0；zero-attempt exhausted=0；具体缺件 queue coverage=100%；scientific-gate relaxation=0。

## Rollback

若 global lookup 对 related family 产生 false exclusion，停止自动处置，回滚为 warning + mainline 五字段 reconciliation。保留 queue attempt-accounting，因为它只修复证据诚实性，不影响科学门。

## Decision request

主线可在 Source42 或以后安全边界实施该最小 patch，不需要新的用户政策批准。不得据本提案延长 Source40、暂停/回写 Source41、自动恢复 `sol/high` slot、增加检索预算或改变任何科学状态。
