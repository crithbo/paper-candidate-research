# Rule Change Proposal

## Proposal identity

- `audit_id`: `RULE-AUDIT-20260826-STAGE0A-Q2-LOCAL-RESOURCE-BACKTEST-R1`
- `proposal_id`: `NO-PRODUCTION-PATCH-BEFORE-BACKTEST-R1`
- `decision_label`: `BACKTEST_REQUIRED`
- `user_policy_approval_required`: `false` for the diagnostic design; any later production rule change requires its own mainline/user boundary as applicable.
- `backtest_required`: `true`

## Problem statement

当前没有可识别的历史正控分母来判断 Stage 0/Stage A 是否过严。现有通过率同时受候选质量、资源、artifact 构造、用户门与审查判断影响，不能直接解释为规则召回率。用户提出的“75%”需要拆成科学存活率和本地可执行推进率，否则会奖励错误放松或惩罚正确阻塞。

## Current rule

- File/heading: `rules/ROLE_STAGE0_REVIEW.md`、`rules/ROLE_CANDIDATE_OWNER.md`、`rules/ROLE_STAGEA_REVIEW.md`
- Current behavior: 维持 Q2 最低线、same-object/current collision/强基线/自然证据/full-cost/可复现性硬门，并允许 revise/reserve/block/hold 等非 STOP 路由。
- Why it is insufficient or why clarification is needed: 规则本体未必过严；缺的是用已知正控、负控和正确分母验证执行语义。直接改规则会在没有因果定位时增加弱论文风险。

## Proposed minimum delta

| File | Heading/field | Current semantics | Proposed semantics |
|---|---|---|---|
| Shared rules | none | current production behavior | 暂不修改 |
| New backtest assignment | frozen protocol | no dedicated Stage0→StageA Q2+ calibration | 运行 `BACKTEST_PROTOCOL.md` 的隔离试点 |
| Future report only | outcome taxonomy | PASS rate may be read naively | 必须并列 academic survival、operational advancement、construction validity |

本目录不编辑共享文件，也不附带 production patch。

## Safety invariants

- Q2 minimum preserved: yes
- Q1 priority preserved: yes
- Same-object preserved: yes
- Latest collision preserved: yes, evaluated at historical cutoff for backtest validity
- Fair current strong baseline preserved: yes
- Natural input/evidence preserved: yes
- Full-cost preserved: yes
- Reproducibility preserved: yes
- Claim ceiling preserved: yes
- STOP non-revival preserved: yes
- User StageB approval preserved: yes

## State and compatibility migration

- Existing states affected: none
- Existing assignments affected: none
- Template compatibility: no shared template change
- Old filename compatibility: not applicable
- One-time migration required: none
- Rollback path: discard invalid sealed packs; no registry rollback required

## Validation plan

- Historical/time-slice cases: 12 qualified positives；仅 PACKER/AUDITOR 知道金标，执行支线看不到“回测/已发表/Q2+/正控”信息、身份、venue、作者实现或结果。
- Negative controls: 4 direct-fatal or generic-mechanism controls.
- Expected behavior changes: none during pilot; obtain identifiable evidence about whether a later clarification is justified.
- Forbidden regressions: no direct-fatal false pass; no result-aware sample replacement; no resource failure interpreted as scientific STOP.
- Acceptance threshold: Stage 0 at least 11/12 academic survival; local Stage A at least 7/8 academic survival; negative controls 4/4 correct. Pilot remains diagnostic and must be followed by a larger confirmatory sample before production calibration claims.

## Decision request

主线只需批准并冻结三角色隔离的回测 assignment、资源 envelope 和 case-pool 哈希，然后只向 PACKER 投递完整审计上下文。给 Stage 0/Stage A 执行支线的 assignment 必须伪装成普通新候选，使用随机中性 ID 和独立可见目录，不得提及回测、既有论文、Q2+、正负控或预期结论。回测完成前，禁止修改 production 规则、改变候选状态、宣称已达到 75% 校准、或启动 Stage B。
