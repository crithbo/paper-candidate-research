# Rule Change Proposal

## Proposal identity

- `audit_id`: `RULE-AUDIT-20260830-SOURCE118-119-ZERO-YIELD`
- `proposal_id`: `SOURCE118_119_ZERO_YIELD_NO_CHANGE`
- `decision_label`: `NO_CHANGE`
- `user_policy_approval_required`: false
- `backtest_required`: false

## Problem statement

Source118 与 Source119 均为零 clean brief。审计定位 Source118 主要停在 RQ/carrier 形成，Source119 稳定停在 selected locator→evidence-qualified raw。DMR prospective 0/12 没有 eligible nomination，不能证明 repair 能提高转化。

## Current rule

- Canonical owner: `rules/ROLE_DISCOVERY.md`。
- Current behavior: canonical source/current-locus closure 后，只有 same-object、non-generic action、natural/canonical carrier、fixed endpoint、fair comparator、finite falsifier 与 full-cost 初界共同成立才进入 raw。
- Assessment: current behavior correctly rejects absorbed/generic/unfrozen packets and preserves honest abstention.

## Proposed minimum delta

`NONE`。不得新建规则文件、不得追加 parallel maturation micro-rule、不得放宽 raw gate。

The only retained advisory is the already accepted DMR narrow-shadow hypothesis: it remains dormant and may be separately frozen only for a future packet with exactly one named finite public closure debt. This advisory does not alter production behavior.

## Canonical ownership and retirement

- `canonical_owner`: `rules/ROLE_DISCOVERY.md`
- `supersedes_or_merges`: `NONE__NO_LIVE_PATCH`
- `new_rule_file`: none
- `live_files_to_retire`: []
- `reference_migration`: none
- `post_migration_zero_reference_check`: not applicable

## Safety invariants

- Q2 minimum preserved: true
- Q1 priority preserved: true
- Same-object preserved: true
- Latest collision preserved: true
- Fair current strong baseline preserved: true
- Natural input/evidence preserved: true
- Full-cost preserved: true
- Reproducibility preserved: true
- Claim ceiling preserved: true
- STOP non-revival preserved: true
- User StageB approval preserved: true

## Validation / rollback / sunset

- Historical evidence: Source118 0 raw; Source119 five lanes 0 raw, S6 2 raw/0 brief; DMR prospective 0/12 nominations.
- Rollback: none because no behavior changes.
- Narrow-shadow sunset if later activated: two eligible packets with zero maturation, or any false promotion/result-aware reformulation.
- Reopen only on one eligible packet reaching clean brief + independent Stage0, or registered false structural drop.

## Decision request

MAINLINE should accept `NO_CHANGE`, keep DMR production OFF, retain canonical funnel, and avoid treating Source118/119 zero yield as evidence for a weaker raw gate, additional model escalation, new parallel rule, or broad topic exclusion.

