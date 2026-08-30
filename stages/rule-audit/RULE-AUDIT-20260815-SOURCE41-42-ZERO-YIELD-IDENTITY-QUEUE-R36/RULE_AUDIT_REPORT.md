# Rule Audit Report

## 中文摘要

- 发现的问题：Source41–42 的零 brief 不是单一原因。五字段历史 identity 预检正确拦住已结束/直接碰撞身份，也保留了 `RELATED_ONLY` 邻近题；closure queue 最终记账真实，但 Source42 唯一两条拟入队路线都不够具体，需要主线追加纠正。更重要的是，Source41 已出现一个字段较完整、闭合路线有限的 raw，却因为完整 current union、直接论文碰撞和 Q2 校准仍未闭合而没有交给 Stage 0，出现了阶段职责重叠。
- 对推进速度或研究质量的影响：identity/queue 控制提高了精度和可审计性，暂时没有可见的过度去重证据；raw→brief 的职责歧义则可能让下游没有可识别分母。继续让 Discovery 穷尽 Stage 0 工作会降低吞吐，但放松 carrier、same-object、current-source 或 generic-solver 门会增加弱题。
- 建议修改：保留现行 identity/queue 规则；不动 Source43。在 Source44 或更晚安全边界仅试行一轮 `RAW_TO_STAGE0_OWNERSHIP_BRIDGE_V1`，只为新 raw 补齐一个 exact/deterministic carrier 并核对 Discovery 自有字段；完整碰撞/current union/Q2 作为显式 debt 交独立 Stage 0 重建。
- 是否需要用户批准：不需要新的政策批准。该试点不增加 lane、模型、预算、配额或权限，只把已批准并已写入共享规则的 stage separation 变成 assignment-local 验收步骤；仍须由主线在安全边界实施。

## Identity

- `audit_id`: `RULE-AUDIT-20260815-SOURCE41-42-ZERO-YIELD-IDENTITY-QUEUE-R36`
- `trigger`: Source41 and Source42 completed two consecutive six-lane cycles with zero clean brief
- `requested_by`: MAINLINE under the user's continuous zero-yield audit policy
- `date`: `2026-08-15`
- `write_directory`: `stages/rule-audit/RULE-AUDIT-20260815-SOURCE41-42-ZERO-YIELD-IDENTITY-QUEUE-R36/`
- `shared_files_modified: false`

## Question and scope

- User/process question: Did the active global identity and queue-accountability rule improve precision/accountability, where does recall now fail, and should a later assignment change?
- Rules inspected: `AGENTS.md`, `rules/ROLE_RULE_AUDIT.md`, `rules/ROLE_MAINLINE.md`, `rules/ROLE_DISCOVERY.md`, `rules/RESOURCE_LOCALIZATION.md`.
- Candidate examples inspected: Source41/42 controls and all six canonical handoffs; Source41 S1 raw/queue; Source42 identity regression and S1/S5 append-only queue corrections; Source43 control only for non-interference and already-active semantics.
- Out of scope: changing Source43, shared-file editing, new retrieval, scientific review, candidate/Stage execution, experiments, downloads, automation, V9, and reopening prior terminal or bounded identities.

## Current authoritative behavior

- `rules/ROLE_DISCOVERY.md`, Question Card/raw and closure-debt sections: raw requires an exact public identity/carrier, same-object question/estimand, endpoint, non-generic discriminator, a current locus, falsifier, finite route and full-cost boundary. Complete union/collision/genealogy/witness/corpus/results/Q2 may be bounded debt.
- The same file's C0/D1 section: Discovery provides a preliminary current-union map; Stage 0 independently rebuilds the full union/collision/Q1/Q2 judgement.
- Queue section: `EXHAUSTED` requires an attempted route or mechanically unavailable proof; attempts=0 with an executable route is pending, not exhausted.
- Source43 control already adds exact project/object/version or a deterministic one-project rule before queue admission.

Written policy and observed execution differ at one point: Source41 S1's handoff treated complete union/direct-collision/Q2 closure as a reason not to route its otherwise finite raw, even though those items are permitted Stage 0 debt. This is not authority to declare that raw Q2-viable; it is evidence that the independent Stage 0 denominator was never created.

## Evidence of a problem or of correct behavior

| Observation | Source/artifact | Repeated? | Classification |
|---|---|---:|---|
| Known FPMR terminal identity caught; SME/ZA adjacent family retained | Source42 global regression | positive + negative control | Correct rule behavior |
| Source42 exact/terminal exclusions did not convert related-only overlap to identity | Six Source42 handoffs | Multiple lanes | Correct rule behavior within sample |
| Two purported queue items lacked a single executable project/version route | Source42 S1/S5 original handoffs and corrections | 2/2 purported items | Execution/schema compliance defect |
| Corrections preserved attempts=0 and removed false pending/exhaustion implication | Source42 append-only corrections | 2/2 | Correct recovery |
| Source41 S1 legitimate finite raw did not become a Stage 0 brief because Stage 0-owned debts remained | Source41 S1 handoff/deep material | One decisive case | Stage-ownership ambiguity; false-negative risk |
| Many other directions failed before exact carrier/action/RQ | Source41 S3–S5 and Source42 lanes | Repeated | Source-entry/concreteness limitation, not identity-gate evidence |

## Risk analysis

- False-negative risk: medium at raw→brief ownership; unmeasured but not presently evidenced for related-only identity matching.
- False-positive/weak-paper risk: low under the proposed bridge because exact carrier/action/same-object/falsifier/full-cost remain mandatory and Stage 0 remains independent.
- Scientific-integrity risk: low if bounded debts are named honestly; high if `NO_MATCH` is treated as novelty or if a generic/disjunctive queue is accepted. Both remain prohibited.
- Resource/time risk: low; the pass stays inside the existing one-cycle envelope and adds no lane, model upgrade or acquisition budget.
- State-migration risk: none; no historical raw is reopened and no terminal state is changed.
- Terminal-revival risk: none; STOP/terminal identities remain excluded.

## Recommendation

- Decision: `PATCH_RECOMMENDED`
- Minimum effective change: one later-boundary assignment-local `RAW_TO_STAGE0_OWNERSHIP_BRIDGE_V1`; retain identity/queue semantics unchanged.
- Why a smaller operational fix is sufficient: the written rules already separate Discovery-owned fields from Stage 0-owned exhaustive checks. A one-cycle routing clarification is sufficient to test whether this ownership gap matters before any shared-rule patch.
- Non-relaxable gates preserved: Q2 floor, same-object, known direct fatal/current-source collision, fair current strong baseline, natural/canonical carrier, non-generic action, full-cost, falsifier, reproducibility, evidence honesty and claim ceiling.

## Validation and rollback

- Historical cases/backtest required: no new historical method backtest for this one-cycle clarification; use the Source41 raw as a static positive routing regression and known direct/current/generic drops as negative controls. Do not relabel Source41.
- Shadow-run plan: one prospective assignment at Source44 or later. All raws receive a predeclared ownership disposition; no output quota or outcome-aware backfill.
- Success/failure criteria: specified in `RAW_TO_BRIEF_OWNERSHIP_AUDIT.md`. If no raw occurs, result is `NOT_EXERCISED`.
- Rollback condition: any emitted brief lacks exact/deterministic carrier or another Discovery-owned hard field; known fatal is bypassed; related-only is falsely excluded; or selection becomes outcome-aware.

## Mainline handoff

- User approval already present: `USER_ADAPTIVE_DISCOVERY_CONTINUE_UNTIL_FIVE_STAGEA_PASS_20260814` covers continued bounded adaptive Discovery; this proposal does not introduce a new policy choice or resource scope.
- Files proposed for change: no immediate shared-file change. Implement only in a later assignment control/handoff schema. Consider a shared clarification only after the one-cycle prospective result.
- Registry migrations proposed: none.
- Existing active/blocked/hold/terminal topics affected: none. Source43 remains unchanged; Source41/42 are not reopened; STOP remains final.
- Shared files modified: `false`

