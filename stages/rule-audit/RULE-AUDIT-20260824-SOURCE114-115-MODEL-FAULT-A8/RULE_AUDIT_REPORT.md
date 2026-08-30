# Rule Audit Report

## 中文摘要

- 发现的问题：Source114 与 Source115 均为零 raw/零 clean brief，且共同先在 exact carrier/source closure 处大量失败。Source114 的模型题缺 exact object、estimand、units、decision endpoint、contrary result 与 full-cost 的联合冻结，或同一 estimand/decision route 已被当前 simulator 覆盖；Source115 的 issue-first fault 题无法同时闭合 current docs、current source、default/non-default flags、exact commit/path/test 与 same-object negative endpoint。
- 对推进速度或研究质量的影响：现行硬门正确阻止了“模型有误差即可成题”和“旧 issue 即当前 fault”的过度推断。Source115 的 issue-first 路径执行性 carrier closure 较弱，使用 exact merged patch + changed regression test lineage 作为来源排序入口有合理性，但它只能提高身份与历史动作可审计性，不能证明当前 residual 或论文新颖性。
- 建议修改：`NO_CHANGE`。保留 MAINLINE 已独立冻结的 merged-patch/test-lineage 作为 bounded source-ordering pilot；不将其安装为 admission、yield、novelty 或 fault-presence 规则，不读取其结果，不新增第二个行为改变。
- 是否需要用户批准：否。本报告不改变共享规则、候选状态、资源或 Stage B 权限。

## Identity

- `audit_id`: `RULE-AUDIT-20260824-SOURCE114-115-MODEL-FAULT-A8`
- `trigger`: `SOURCE114_AND_SOURCE115_CONSECUTIVE_COMPLETE_ZERO_BRIEF`
- `requested_by`: `MAINLINE`
- `date`: `2026-08-24`
- `write_directory`: `stages/rule-audit/RULE-AUDIT-20260824-SOURCE114-115-MODEL-FAULT-A8`
- `shared_files_modified: false`

## Question and scope

- User/process question: 比较 Source114 performance-model/theory 与 Source115 current-upstream fault/negative-replication 两轮，定位第一失败转换，评价 exact merged-patch/test lineage 是否是有用的来源排序改变，并对既有 pilots 给出 `RETAIN / DOWNGRADE / REMOVE`。
- Rules inspected: `AGENTS.md` 的连续零产出审计、current-upstream reality、科学硬门和 proposal-only 边界；`rules/ROLE_RULE_AUDIT.md`。
- Registered examples inspected: A7 handoff；Source114/115 control、portfolio note、assignment-local denylist addendum；两轮 12 个 registry-registered handoff；两份 registered S1 raw-gate decision。
- Out of scope: Source116 的结果、handoff、输出或科学判断；网络检索；下载、构建、实验、queue、automation、backtest；共享/候选文件与状态修改。
- Claim ceiling: `PROCESS_DIAGNOSIS_AND_CHANGE_PROPOSAL_ONLY`。
- Evidence ceiling: `REGISTERED_SOURCE114_SOURCE115_A7_ARTIFACTS_ONLY`。

## Current authoritative behavior

1. `AGENTS.md` 要求连续两个完整六路零 brief 后定位第一个失败转换，区分 source、rule、template、execution 与 resource 原因，对上一轮试点逐项处置，并且下一周期至多一个有界改变。
2. `AGENTS.md` 的 `CURRENT_UPSTREAM_REALITY_CHECK` 要求 current docs、current source 与 default/non-default feature flags 同时核对；旧 issue、release note 或 future-work 不能单独证明当前缺口。
3. Source114 只有在模型误差改变固定系统决策且 exact object/estimand/units/full-cost 可闭合时才可进入 raw；Source115 debug/negative-replication 路线要求真实 fault、exact current commit/path/test、same-function/protocol 与有限 falsifier。
4. A7 已接受 `NO_CHANGE`：exact carrier/evidence ceiling、assignment-local denylist 与 honest abstention 保留；mandatory shared denylist 仍未安装、未回测。

## Evidence and first failed conversions

### Funnel summary

| Cycle | Registered lower bound before raw | Raw | Deep | Clean brief | Dominant first failed conversion | Main cause |
|---|---:|---:|---:|---:|---|---|
| Source114 performance-model/theory | at least 2 selected RQ/locators in S2/S3; heterogeneous schemas | 0 | 0 | 0 | `RQ_OR_PRE_RQ_SOURCE_CLOSURE -> VALID_SELECTED_RQ_OR_LOCATOR`; survivors also fail `-> RAW` | current simulator/estimand coverage plus incomplete object-estimand-units-decision-full-cost tuple |
| Source115 upstream fault/negative replication | at least 1 valid locator in S3; S2/S4/S5/S6 predominantly fail before valid selection | 0 | 0 | 0 | `RQ_OR_PRE_RQ_CURRENT_UPSTREAM_CLOSURE -> VALID_SELECTED_RQ_OR_LOCATOR`; survivor also fails `-> RAW` | issue-level carrier without docs/source/flags + commit/path/test + same-object negative endpoint closure |

The handoff schemas are heterogeneous, so these are registered lower bounds rather than normalized rates.

### Source114 observations

- S1 records that Vidur、LLMCompass 与 GenZ already provide current performance-model decision routes or validation; no decision-changing unit, denominator or calibration residual with finite contrary/full-cost closure survived.
- S2 reaches one selected seed/RQ but closes before raw because Vidur covers the same simulator estimand and decision endpoint.
- S3 preserves one valid locator, then cannot jointly freeze object、estimand、units、decision endpoint、contrary result and full-cost.
- S4/S5/S6 predominantly fail before valid selection. This is a mix of current-union saturation and exact model-contract carrier shortage, not a theory/model category STOP.

### Source115 observations

- S1 finds Triton/LLVM issue-level records but the required current docs/source/flags triad and same-object carrier remain unclosed.
- S2/S4/S5/S6 predominantly stop before valid selection; S4 has zero complete current-upstream packets among five candidates.
- S3 retains one locator but still cannot jointly freeze docs/source/flags and same-object negative endpoint.
- No lane performed a build, reproduction, experiment or resource action; therefore zero yield cannot be attributed to missing compute or execution failure.

### Defect classification

| Class | Finding | Basis |
|---|---|---|
| Source/current-union saturation | `SHOWN_FOR_SOURCE114` | current simulator estimand/decision coverage |
| Exact carrier/contract shortage | `SHOWN_FOR_BOTH` | model tuple incomplete; fault triad/commit/test/endpoint incomplete |
| Scientific rule defect | `NOT_SHOWN` | rejected records lack required object/action/endpoint/current closure or are absorbed |
| Template decision defect | `NOT_SHOWN` | heterogeneous counters limit normalization but do not change decisions |
| Execution defect | `NOT_SHOWN` | both 6/6 cycles completed and registered checks were executed |
| Aggregate resource cause | `NOT_SHOWN` | failures precede builds, experiments and resource attempts |

## Evaluation of exact merged-patch/test lineage ordering

### Why it is useful

- A merged patch supplies an exact historical commit and parent/current delta rather than an issue-only claim.
- A changed regression test or benchmark supplies a concrete path, trigger and expected behavior, reducing ambiguity in same-object carrier identity.
- Patch lineage can expose which source file, flag, threshold or protocol semantics changed, making current docs/source/flags closure more targeted.
- This directly addresses Source115's observed executional carrier weakness and is therefore a rational source-ordering pilot.

### What it cannot establish

- A merged patch normally indicates that the historical fault was fixed; it is not evidence that the current tree still contains that fault.
- The changed test may be narrow, synthetic, obsolete, disabled or already fully absorbed by current source; natural/canonical evidence and current flags still require independent closure.
- Patch identity does not prove a distinct current residual, generalizable mechanism, strong-baseline gap, full-cost advantage, negative replication or Q2 paper shape.
- Therefore it must not become an admission shortcut, fault-presence assertion, novelty presumption, related-family exclusion or yield quota.

### Disposition

`RETAIN_AS_BOUNDED_SOURCE_ORDERING_PILOT__NOT_AS_ADMISSION_YIELD_NOVELTY_OR_FAULT_RULE`.

This is not a new A8 behavior change: MAINLINE had already frozen the pilot independently before A8 results. A8 does not inspect Source116 outcomes or backwrite into that cycle.

## Pilot dispositions

| Pilot or behavior | Disposition | Rationale |
|---|---|---|
| Source114 performance-model/theory rotation | `RETAIN_STRATEGIC_MEASUREMENT_THEORY_ROUTE__DOWNGRADE_CURRENT_NAMED_SIMULATORS_AND_UNANCHORED_MODEL_RQS_NEAR_TERM` | valuable research class, but current named estimands are covered or exact decision tuple is absent |
| Source115 issue/fault/negative-replication rotation | `RETAIN_TRUE_CURRENT_FAULT_ROUTE__DOWNGRADE_ISSUE_FIRST_AS_PRIMARY_ORDERING` | current fault/negative replication is legitimate only with exact current carrier; issue-first repeatedly failed closure |
| Exact merged-patch + changed-test lineage | `RETAIN_AS_BOUNDED_SOURCE_ORDERING_PILOT__EVALUATION_PENDING` | likely improves carrier auditability; cannot establish current residual or raw yield |
| Current-upstream docs/source/flags reality check | `RETAIN_HARD_GATE` | prevents obsolete issue/release-note claims from becoming false current gaps |
| Exact model object/estimand/units/decision/full-cost tuple | `RETAIN_HARD_GATE` | prevents generic model-error topics without a decision-changing endpoint |
| A5 explicit denylist | `RETAIN_ASSIGNMENT_LOCAL__MANDATORY_SHARED_NOT_INSTALLED` | no evidence in A8 justifies bypassing its pending independent backtest |
| Carrier/artifact-first ordering | `RETAIN_AS_ORDERING__NOT_AS_YIELD_INTERVENTION` | improves inspectability but does not manufacture a distinct action |
| Canonical raw gate, RQ frontend, honest abstention | `RETAIN` | no demonstrated false negative or decision defect |
| Quota, outcome-aware backfill, broad cooldown, gate relaxation, terminal revival | `REMOVE_KEEP_FORBIDDEN` | would replace scientific validity with apparent yield |

## Risk analysis

- False-negative risk: low on registered evidence; no complete same-object current residual with a non-generic action and finite closure was shown rejected for a procedural-only reason.
- False-positive/weak-paper risk: high if generic model error, historical issue or merged patch is promoted directly to current fault/novelty.
- Scientific-integrity risk: high if fixed historical bugs are presented as current negative replications without parent/current source and flag verification.
- Resource/time risk: issue-first browsing has low carrier-closure efficiency; merged-patch ordering may reduce wasted closure work but its yield effect is unknown.
- State-migration risk: none; no state changes proposed.
- Terminal-revival risk: none; no STOP identity is reused.

## Recommendation

- Decision: `NO_CHANGE`
- Minimum effective change: none in A8. Continue the already independently frozen merged-patch/test-lineage cycle as an isolated ordering pilot.
- Why a smaller operational fix is sufficient: the observed problem is source ordering and carrier closure, while existing scientific gates are correct. A shared rule patch before prospective results would overfit two zero cycles and duplicate a pilot already in progress.
- Future bounded change: `NONE_NEW_IN_A8`. The only evaluated change is the independently frozen merged-patch/test-lineage ordering pilot; its effect must be judged later from registered valid-locator/raw/clean-brief and independent Stage 0 feedback.
- Non-relaxable gates preserved: Q2/Q1、same-object、current collision、fair strong baseline、natural/canonical evidence、full-cost、reproducibility、claim ceiling、Stage B user approval and STOP non-revival remain unchanged.

## Validation and rollback

- Historical cases/backtest required: none for A8 `NO_CHANGE`; any future shared/mandatory installation of merged-patch ordering would require separate evidence and a safe assignment boundary.
- Shadow-run plan: A8 does not authorize or execute one. The independently frozen Source116 cycle is not read or influenced here.
- Success/failure criteria: later compare exact carrier closure, valid selected denominator, raw/clean brief and Stage 0 feedback; zero output remains valid.
- Rollback condition: if merged-patch ordering only surfaces already-fixed identities or obscures current reality closure, downgrade it to one optional source family without changing admission.

## Mainline handoff

- User approval already present: only A8 proposal-only START.
- Files proposed for change: none.
- Registry migrations proposed: none.
- Existing active/blocked/hold/terminal topics affected: none.
- Shared files modified: `false`.
- Source116 results read or influenced: `false`.

## Limitations

- Evidence is restricted to registered Source114/115/A7 artifacts; no network or independent literature verification was performed.
- Source116 inputs and results were excluded, so the merged-patch ordering disposition is mechanism-based and prospective, not an outcome claim.
- Heterogeneous handoff counters prevent exact aggregate conversion-rate estimates.

