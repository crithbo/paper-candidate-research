# Rule Audit Report

## 中文摘要

- 发现的问题：Source112 与 Source113 都是零 raw/零 clean brief，但不是同一种失败。Source112 已有至少 6 个异构口径下的有效 RQ/locator，随后全部在 raw gate 前被 current union、已存在动作或 exact carrier/action/endpoint 缺口吸收；Source113 则主要更早失败于 trace schema、session/prefix/cache event、arrival-time 语义与固定 decision endpoint 无法在同一 exact carrier 上闭合，唯一明确的有效 locator 仍未进入 raw。
- 对推进速度或研究质量的影响：两轮提供了诚实的来源饱和与 carrier 缺口诊断，但没有证据表明规则、模板决策、执行或资源故障造成误淘汰。继续对相同具名家族做完整六路轮换，近期 raw yield 预期较低。
- 建议修改：`NO_CHANGE`。保持现行科学门、Source112/113 evidence ceiling、assignment-local explicit denylist 与 honest abstention；不新增 production micro-rule，不启动 A5 backtest。未来 source allocation 可按本报告的具名家族 disposition 排序，但本 assignment 不提出新的行为补丁。
- 是否需要用户批准：否。本报告不改变规则、状态、资源或 Stage B 权限。

## Identity

- `audit_id`: `RULE-AUDIT-20260824-SOURCE112-113-TRACE-VLA-A7`
- `trigger`: `SOURCE112_AND_SOURCE113_CONSECUTIVE_COMPLETE_ZERO_BRIEF`
- `requested_by`: `MAINLINE`
- `date`: `2026-08-24`
- `write_directory`: `stages/rule-audit/RULE-AUDIT-20260824-SOURCE112-113-TRACE-VLA-A7`
- `shared_files_modified: false`

## Question and scope

- User/process question: 比较 Source112 VLA/multimodal 与 Source113 serving/agent trace 两轮，定位第一失败转换，评估 evidence ceiling 与 source rotation，并对既有 pilots 给出 `RETAIN / DOWNGRADE / REMOVE`。
- Rules inspected: `AGENTS.md` 的连续零产出审计、科学硬门、资源与 proposal-only 边界；`rules/ROLE_RULE_AUDIT.md`。
- Registered examples inspected: A6 handoff；Source112/113 control、portfolio note、assignment-local denylist addendum；两轮 12 个 registry-registered handoff；S1 两个 registered raw-gate decision。
- Out of scope: Source114 的任何结果或材料；网络检索；下载、构建、实验、queue、automation、backtest；共享规则、模板、skill、registry、plan 或候选状态修改。
- Claim ceiling: `PROCESS_DIAGNOSIS_AND_CHANGE_PROPOSAL_ONLY`。
- Evidence ceiling: `REGISTERED_SOURCE112_SOURCE113_A6_ARTIFACTS_ONLY`。

## Current authoritative behavior

1. `AGENTS.md`“连续两个完整六路零 brief 周期”要求先定位第一个失败转换，再对上一轮试点逐项给出 disposition，下一周期至多冻结一个有界改变；禁止把每轮零产出叠加成 production micro-rule。
2. `AGENTS.md` 与 `rules/ROLE_RULE_AUDIT.md` 保持 Q2 minimum、Q1 priority、same-object、current collision、公平强基线、自然/canonical evidence、full-cost、reproducibility、claim ceiling 与 STOP non-revival 不变。
3. Source112 的冻结 ceiling 是公开静态 source/trace/canonical benchmark，禁止机器人部署 claim；Source113 只允许 public trace schema/replay 类证据，禁止用泛化 realism 批评替代 exact object/action/decision endpoint。
4. A6 已接受 `NO_CHANGE`：assignment-local explicit denylist 保留，mandatory shared denylist 未安装且 A5 backtest 未启动；carrier-first、artifact rotation 与 single-GPU software rotation 只影响排序，不改变 raw admission。

## Evidence of correct behavior and first failed conversions

### Funnel summary

| Cycle | Registered lower bound before failure | Raw | Deep | Clean brief | First failed conversion | Dominant cause |
|---|---:|---:|---:|---:|---|---|
| Source112 VLA/multimodal | at least 6 valid selected RQ/locators across S2/S3/S5/S6; schemas are heterogeneous | 0 | 0 | 0 | `VALID_SELECTED_RQ_OR_LOCATOR -> EVIDENCE_QUALIFIED_RAW` | current union/named-family saturation, then exact carrier/action/endpoint gap |
| Source113 serving/agent trace | at least 1 valid selected locator in S3; S2/S4/S5/S6 predominantly close before valid selection | 0 | 0 | 0 | dominant earliest: `RQ_OR_PRE_RQ_SOURCE_CLOSURE -> VALID_SELECTED_RQ_OR_LOCATOR`; the surviving locator also fails `-> RAW` | exact immutable trace tuple/decision endpoint gap; where tuple exists, current union and missing distinct action/result artifact |

The handoff schemas do not expose one normalized denominator, so the table deliberately uses registered lower bounds rather than inventing conversion rates.

### Source112

- S1 records that Spec-VLA/SV-VLA already cover speculative or closed-loop action verification and π0-FAST defines the tokenizer contract; no distinct same-object semantic action plus finite canonical benchmark route survived.
- S2/S5 identify current OpenVLA acceleration, adaptive chunk, visual-token reuse and relaxed-acceptance routes as already represented in the current union.
- S3/S6 each preserve a valid locator but no exact non-generic action/endpoint sufficient for raw admission.
- S4 closes all five RQ candidates before valid selection. No robot resource action or deployment claim was used.

### Source113

- S1 shows an important split: BurstGPT, Mooncake and Vidur can define event/session/prefix/time and decision/full-cost semantics, but no exact result artifact plus distinct non-generic counterfactual action survived.
- S2/S4/S5/S6 predominantly fail earlier because one carrier does not freeze the required concurrency/event/session/prefix/cache/arrival-time tuple and fixed decision endpoint.
- S3 retains one valid locator, then fails raw because the trace schema/time-arrival/decision endpoint contract is not closed.
- Therefore “all public traces lack schema” would be an overstatement. The registered evidence supports a conditional diagnosis: some named carriers are current-union saturated; others are incomplete for the frozen endpoint.

### Defect classification

| Class | Finding | Basis |
|---|---|---|
| Source/current-union saturation | `SHOWN` | Source112 current VLA action routes; Source113 S1 named trace systems |
| Exact carrier/action/endpoint gap | `SHOWN` | Both cycles; especially Source113 S2–S6 |
| Scientific rule defect | `NOT_SHOWN` | raw gate rejected only when same-object/action/endpoint/finite closure was absent or absorbed |
| Template decision defect | `NOT_SHOWN` | handoff fields are heterogeneous, but all canonical decisions and ceilings remain auditable |
| Execution defect | `NOT_SHOWN` | six lanes in both cycles completed and were accepted; denylist checks recorded no admitted exact/contains repeat |
| Resource cause | `NOT_SHOWN` | no build, experiment, robot deployment or persisted resource action occurred; failures precede resource execution |

## Evidence-ceiling evaluation

- Source112 ceiling is `RETAIN`: it correctly prevented robot-deployment inference while still allowing a static/canonical benchmark or measurement paper if an exact action and decision endpoint had survived. The zero result came from collision and closure, not from absence of robot hardware.
- Source113 trace-only/no-deployment ceilings are `RETAIN`: they prevented schema realism criticism from masquerading as a scientific contribution. Public trace evidence could still support a measurement, benchmark-validity or fixed-decision performance-model claim if the exact tuple and counterfactual action closed.
- Source113 control and handoffs use several mechanically different ceiling strings, but no scientific judgment diverged. This is metadata normalization debt, not evidence of a rule or template decision defect and not a reason for a behavioral patch in A7.

## Pilot dispositions

| Pilot or behavior | Disposition | Rationale |
|---|---|---|
| A5 explicit predecessor identity denylist | `RETAIN_ASSIGNMENT_LOCAL` | both rounds report pre-lookup checks and no admitted exact/contains repeat |
| Mandatory shared denylist | `RETAIN_NOT_INSTALLED__BACKTEST_PENDING` | A5 behavior proposal remains unbacktested; A7 does not start it |
| VLA/multimodal rotation | `RETAIN_STRATEGIC_AND_CANONICAL_EVIDENCE_ROUTE__DOWNGRADE_CURRENT_NAMED_FAMILIES_NEAR_TERM` | high strategic alignment, but current named action families are saturated or lack a distinct endpoint |
| Serving/agent trace rotation | `RETAIN_MEASUREMENT_PERFORMANCE_MODEL_ROUTE__DOWNGRADE_INCOMPLETE_TRACE_CARRIERS_AND_CURRENT_NAMED_FAMILIES_NEAR_TERM` | useful carrier class, but full tuple/endpoint closure is sparse and exact carriers are often current-union saturated |
| Source112/113 evidence ceilings | `RETAIN` | ceilings preserve claim honesty without causing the observed first failures |
| Carrier-first | `RETAIN_AS_ORDERING__DOWNGRADE_AS_YIELD_INTERVENTION` | exact carriers improve auditability but did not produce raw |
| Artifact rotation | `RETAIN_DIVERSITY__DOWNGRADE_REPEATED_NAMED_FAMILIES` | avoids hidden repeats but cannot create a distinct scientific action |
| Single-GPU/public software realism | `RETAIN_LONG_TERM__DOWNGRADE_IMMEDIATE_SATURATED_FAMILIES` | resource realism remains correct; zero yield is not a resource failure |
| Canonical raw gate, RQ frontend, honest abstention | `RETAIN` | prevented weak or unsupported briefs without a demonstrated false negative |
| Quota, backfill, broad category cooldown, gate relaxation, terminal revival | `REMOVE_KEEP_FORBIDDEN` | would trade scientific validity for apparent yield or violate terminal policy |

## Risk analysis

- False-negative risk: low on registered evidence; no same-object non-generic action with finite closure was shown and rejected for a merely cosmetic reason.
- False-positive/weak-paper risk: high if robot/deployment or serving realism claims are inferred from incomplete static/trace carriers; current ceilings correctly block this.
- Scientific-integrity risk: would rise if current-union saturation were re-labeled as a generic “trace/VLA gap” or if missing tuple fields were backfilled by assumptions.
- Resource/time risk: repeated full allocation to the same named families has low near-term yield, but this is an ordering issue rather than a scientific rule defect.
- State-migration risk: none; no state changes proposed.
- Terminal-revival risk: none; no STOP or prior terminal identity is reused.

## Recommendation

- Decision: `NO_CHANGE`
- Minimum effective change: none in this assignment.
- Why a smaller operational fix is sufficient: existing source allocation, exact-carrier closure, raw gate and evidence ceilings already express the necessary constraints. A new trace-tuple micro-rule would duplicate Source113's frozen contract and would not create a missing distinct action or result artifact.
- Future bounded change: `NONE_NOW`. Do not stack a new behavior proposal while A5 mandatory denylist remains unbacktested. A later independent evaluation should use actual raw/clean-brief and Stage 0 feedback, not another zero-brief cycle alone.
- Non-relaxable gates preserved: all Q2/Q1, same-object, collision, baseline, natural/canonical evidence, full-cost, reproducibility, claim ceiling, Stage B approval and STOP non-revival gates remain unchanged.

## Validation and rollback

- Historical cases/backtest required: none for `NO_CHANGE`; A5's separate mandatory-denylist proposal remains `BACKTEST_REQUIRED` and unstarted.
- Shadow-run plan: none authorized or proposed by A7.
- Success/failure criteria: not applicable because behavior is unchanged.
- Rollback condition: not applicable; no patch or migration exists.

## Mainline handoff

- User approval already present: only the frozen A7 proposal-only assignment and START.
- Files proposed for change: none.
- Registry migrations proposed: none.
- Existing active/blocked/hold/terminal topics affected: none.
- Shared files modified: `false`.
- Source114 read or influenced: `false`.

## Limitations

- Evidence is restricted to registered Source112/113 and A6 artifacts; no network or independent literature verification was performed.
- Handoff funnel schemas are heterogeneous, so exact aggregate denominators and conversion percentages are not claimed.
- This is process diagnosis only and makes no scientific claim about VLA, serving, agent, trace or performance-model research families as categories.

