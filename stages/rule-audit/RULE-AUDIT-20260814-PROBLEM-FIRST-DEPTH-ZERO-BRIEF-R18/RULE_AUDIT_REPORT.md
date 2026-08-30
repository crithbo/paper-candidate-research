# Rule Audit Report

## 中文摘要

- 发现的问题：source04 的 hard preflight 把“完整 current-union 外动作/保证”前移到 raw 之前，已经接近 clean-brief 门，导致 S1、S5、S6 三路 raw 直接归零；source05 S6 恢复 problem-first 后，6 条真实问题重新进入 raw，但现有 depth 选择只看“动作承诺看起来清楚、存在有限 falsifier”，没有在投入完整深审前单独检验 same-object 保证是否存活、是否会退化为 controller/generic kernel、以及 current-source closure 是否真的有限。
- 为什么恢复 2 次深审仍然零 brief：样本太小，不能据此否定 problem-first。source01–03 的描述性基线是 42 次深审产生 2 份 brief；按该非独立、非平稳比率，仅做直觉性计算，任意两次均无 brief 的结果约有 90.7% 的机会出现。定性上，source05 S6 的 Paralegal 卡在 current union 未闭合，TypeScript 卡在 completion-set 保证改变或退化为通用状态最小化；这是深审对象选择问题，不是 Q2 门过严。
- 建议修改：保持正在运行的 source05 不变。下一安全 assignment 使用 `PROBLEM_FIRST_RESIDUAL_SURVIVAL_TRIAGE_V2`：继续宽松但诚实的 problem-first raw admission，在 raw 与完整 depth 之间加入一个不作科学裁决的 `RESIDUAL_SURVIVAL_CARD`，先排除换对象、换保证、controller/generic 高风险，再对预先排序的最多 2–3 条做 current-union 与 contrary 的定向闭合。
- 是否需要用户批准：用户已有持续 adaptive Discovery 授权，且该试点不增加 lane、不改科学门、不设提案配额、仍为 V9 `OFF`，下一安全 assignment 可由主线直接冻结；永久共享规则修改、自动分类器或常态化扩大资源预算仍需另行政策批准。

## Identity

- `audit_id`: `RULE-AUDIT-20260814-PROBLEM-FIRST-DEPTH-ZERO-BRIEF-R18`
- `trigger`: adaptive-source03 零 brief、source04 hard-preflight 多路 raw starvation，以及 source05 S6 恢复 6 raw/2 depth 后仍为零 brief
- `requested_by`: mainline under continuing user adaptive-discovery authority
- `date`: `2026-08-14`
- `write_directory`: `stages/rule-audit/RULE-AUDIT-20260814-PROBLEM-FIRST-DEPTH-ZERO-BRIEF-R18/`
- `shared_files_modified: false`

## Question and scope

- User/process question: 为什么恢复深审仍无 clean brief；怎样在不降低 Q2、same-object、current union、fair baseline、natural/full-cost 门，不设配额、不启用 V9 的情况下提高有效题数。
- Rules inspected: `AGENTS.md`; `plan.md`; relevant `registry.yaml` records; `rules/ROLE_RULE_AUDIT.md`; `rules/ROLE_DISCOVERY.md`; `rules/ROLE_STAGE0_REVIEW.md`.
- Evidence inspected: R17 packet; adaptive-source01–03 six-lane handoffs; source04 six assignment contracts and handoffs, with detailed S1/S6 preflight artifacts; source05 contracts and S6 log/deep-review/collision/handoff; the two real adaptive-source Stage0 PRIMARY reports.
- Out of scope: new retrieval, contacting Discovery lanes, changing active source05, candidate execution, Stage0/A/B, experiments, downloads, V9, shared-file edits or state transitions.

## Current authoritative behavior

The authoritative policy is sound on the scientific boundary:

1. `AGENTS.md` and `ROLE_DISCOVERY.md` permit variable source allocation after repeated zero-yield cycles, but explicitly prohibit proposal quotas and gate relaxation.
2. Discovery must produce a falsifiable conditional research package and a finite fidelity-closure plan. It need not implement the method, obtain results or prove the main claim.
3. If the action gap depends on current implementation absence, Discovery must inspect current official documentation, current source and relevant controls. This bounded reality check is not a global novelty proof.
4. Stage0 independently redoes same-object/current-union/collision review, calibrates Q1/Q2 shape, selects the mechanism and defines the Stage A killer. Discovery must not absorb this independent judgment role.

The source04 pre-raw conjunction was an assignment-local strategy experiment, not a standing scientific gate. Source05 correctly restored the policy distinction between problem potential and readiness.

## Evidence

### 1. Source01–03 establish a low but nonzero depth-to-brief base rate

| Cycle | Lane-reported screening units | Candidate-grade depth | Clean brief | Downstream state so far |
|---|---:|---:|---:|---|
| adaptive-source01 | 36 | 13 | 1 | Stage0 `REVISE_ONCE` |
| adaptive-source02 | 36 | 15 | 1 | Stage0 `REVISE_ONCE` |
| adaptive-source03 | 36 | 14 | 0 | no Stage0 input |
| Combined | 108 | 42 | 2 | no Stage0 PASS yet |

The labels in source01 are heterogeneous (`raw`, diagnostic or screened-unique), so 108 is not a recall denominator. It is sufficient to show that a two-depth sample is far too small to distinguish a useful source strategy from failure. The observed descriptive deep-to-brief ratio is 2/42, and both briefs were scientifically promising enough to receive a bounded Stage0 revision rather than STOP.

### 2. Source04 hard preflight improved early rejection but collapsed observable recall

Source04 reports 18 raw rows, six deep reviews and zero brief, plus 21 separately reported pre-raw probes/rejections. Three lanes went to zero raw:

- S1: six official probes, raw/deep/brief = 0/0/0 because none already named a same-interface union-external complete action plus legal divergence witness.
- S5: five formal objects scouted, raw/deep/brief = 0/0/0 because target theorem and whole action were not already closed.
- S6: six recent-paper locators, raw/deep/brief = 0/0/0 because the complete union-external action/guarantee was not nameable before raw.

The exclusions themselves were mostly sensible: new ABI, wrapper, controller, ISA/config choice, generic proof reuse, changed guarantee or already-native action. The defect is placement. Requiring a complete action/guarantee and witness before a row can even become a raw problem makes raw admission nearly equivalent to the expensive part of a clean-brief decision. It hides useful uncertainty and makes funnel telemetry uninformative. No observed brief gain offsets that recall loss.

### 3. Source05 restored the funnel but exposed a missing middle layer

Source05 S6 used only a first-party 2025–2026 problem/result boundary plus a current same-object first-party route for raw admission. It restored six unique raw rows and selected two for depth:

- Paralegal: exact problem, artifact and finite falsifier were credible, but current PDG retention/summarization/configuration union was not sufficiently enumerated. It remained `NOT_ADMITTED_UNFROZEN`.
- Type-constrained completion: the proposed state quotient either changes the exact completion-set guarantee or becomes generic automaton/state minimization. It was a structural drop of the residual.

Four raw-only rows included two controller-shaped CXL cases and two cases without a distinct residual. This is healthy raw-level abstention. The weakness is that the two selected depth rows were not first subjected to a consistent residual-survival test. “Clearest action promise” does not separately ask whether the guarantee stays identical, whether the proposed action is target-specific rather than a generic kernel, and whether the decisive current-source enumeration is bounded.

### 4. Stage0 feedback identifies the minimum Discovery admission kernel

The only two real clean briefs from source01–02 both reached Stage0 `REVISE_ONCE`, not STOP. Their repair vectors were:

- `ATOMIC_ACTION_UNCLEAR`: 2/2;
- `NATURAL_CARRIER_GAP`: 2/2;
- `FULL_COST_GAP`: 2/2;
- `OMITTED_CURRENT_SAME_OBJECT`: 1/2.

GlobalISel needed one pinned target `RegisterBankInfo` action catalog and a native two-plan witness. MLIR needed one pinned target conversion pipeline, a complete representation/cast action catalog and a witness separated from VPlan and stock options. These are exactly the fields that should influence Discovery depth allocation and brief readiness. They do not imply that Discovery must perform Stage0's independent eight-predicate collision audit or venue calibration.

## Root-cause classification

| Cause | Evidence | Assessment |
|---|---|---|
| Q2/same-object/full-cost gate too strict | No brief was rejected solely because results or implementation were absent; two briefs received bounded revision | Not supported |
| Insufficient lane parallelism | Six lanes already run concurrently | Not supported |
| Source04 complete-action precondition too early | S1/S5/S6 all produced zero raw | High-confidence process defect |
| Source05 problem-first raw admission too loose | Raw-only controller/generic cases were not promoted | Not supported as a scientific defect |
| Source05 depth ranking lacks residual-survival dimensions | One selected row was structurally generic/guarantee-changing; the other lacked finite union closure | High-confidence, repairable |
| Two depth reviews are enough to judge the method | Descriptive prior is only 2 briefs from 42 depths | Refuted |
| Recent-paper limitation is itself a research opportunity | Several limitations map to native producers, controllers, changed contracts or benchmark objects | Refuted |

## Discovery versus Stage0 boundary

| Surface | Discovery must complete before a clean brief | Stage0 must independently complete |
|---|---|---|
| Object | Exact object, interface, semantics/guarantee and information conditions | Attack whether the object is really unchanged and publication-worthy |
| Problem anchor | Primary problem/result/measurement/theorem boundary and current first-party route | Verify genealogy completeness and contrary interpretation |
| Action | Source-grounded atomic residual and at least one legal divergence-witness skeleton | Reconstruct the relevant complete action union and decide direct coverage/subtraction |
| Baselines | Name current deployment baseline, strongest likely subtractor and full-cost dimensions | Freeze the fair finite comparator set and audit compatibility/information/cost |
| Natural/formal route | A versioned carrier or canonical real problem family, finite falsifier and fidelity closure plan | Decide whether opportunity hypothesis and Stage A killer are sufficient for Tier B/Q1 |
| Literature | Strategic anchor/current/contrary set within bounded search | Independent latest collision search and Q1/Q2 shape calibration |
| Results/implementation | Not required | Still not required at Stage0 |

Discovery should therefore deliver an attackable proposition, not a proved novelty theorem. Stage0 remains the independent judge.

## Recommendation

- Decision: `PATCH_RECOMMENDED__ASSIGNMENT_LOCAL_NEXT_BOUNDARY`
- Minimum effective change: preserve source05 problem-first raw admission and add `RESIDUAL_SURVIVAL_CARD` triage before full depth under the proposed `PROBLEM_FIRST_RESIDUAL_SURVIVAL_TRIAGE_V2`.
- Active source05: continue unchanged; do not reinterpret or restart completed/active rows.
- Parallelism: retain six lanes. Increase quality within each lane, not the number of sessions.
- Depth capacity: retain two ordinary depth slots; permit a third only when at least three cards are mechanically `D1_WITNESSABLE` and pre-ranked before any depth outcome. Never fill the third slot merely to reach a count.
- Non-relaxable gates: Q2, same-object, latest current union, fair strong baselines, natural/formal route, full-cost, reproducibility, claim ceiling and STOP non-revival all remain unchanged.

## Proposed residual-survival test

Every raw row remains a problem lead. Before allocating full current-union closure, record:

1. exact object, interface, information and invariant guarantee;
2. one source-grounded candidate residual type: target-specific action, target-specific guarantee, measurement correction or natural-law exploitation;
3. a same-object witness skeleton: two legal plans, two protocol-correct estimators, or one formal separating instance;
4. explicit early-kill checks for changed object/guarantee, configuration/controller, generic algorithm/kernel and current native direct expression;
5. the current-source files/symbols/docs needed for bounded closure;
6. the strongest contrary/subtractor class and one decisive query;
7. natural/formal carrier, falsifier and full-cost axes;
8. at most three decisive source questions whose answers would make the row brief-ready or terminate the residual.

Classify only for scheduling:

- `R0_RAW_PROBLEM`: legitimate problem lead, insufficient residual detail;
- `D1_WITNESSABLE`: object/guarantee stable, a nontrivial residual and witness skeleton exist, decisive closure is finite;
- `EARLY_STRUCTURAL_RISK`: a named changed-object/controller/generic/native-action risk dominates; keep as raw evidence, do not claim a scientific DROP without the required evidence;
- `D2_TARGETED_CLOSURE`: selected `D1` row undergoing current-union/contrary closure;
- `D3_BRIEF_READY`: unchanged v8.7 clean-brief gate met.

These labels do not change candidate state, quality tier or scientific disposition.

## Validation and rollback

- Historical backtest: not needed; the change only schedules depth and leaves canonical admission unchanged.
- Prospective pilot: after current source05 finishes, run one six-lane assignment under V2 and compare separately with source04 and source05 V1.
- Process checks, not quotas: every raw row has one disposition; no lane reaches zero raw solely because complete union closure was missing; every depth row was preclassified `D1`; third-depth use is precommitted and never outcome-selected.
- Scientific/readiness feedback: track clean briefs, Stage0 STOP/PASS/REVISE, and whether Stage0 still reports material `ATOMIC_ACTION_UNCLEAR`, `OMITTED_CURRENT_SAME_OBJECT`, `FULL_COST_GAP` or changed-guarantee defects. Do not demand a positive brief.
- Rollback: remove the residual-survival card and conditional third depth at the next assignment boundary if it recreates raw starvation, increases unproductive literature cost, or Stage0 repair burden does not improve. Preserve all raw/depth records and terminal states.
- V9: remains `OFF`; R18 authorizes no shadow, replay or Production change.

## Risks

- False-negative risk: an initially awkward but real residual may be ranked below depth. Mitigation: `R0_RAW_PROBLEM` is retained nonterminally and is not called STOP.
- False-positive risk: problem-first raw volume can look like progress. Mitigation: only independent Stage0 survival and repair burden count as effective-topic evidence.
- Resource risk: a third depth can increase reading cost by up to 50% for a lane. Mitigation: it is allowed only with three precommitted `D1` cards and stays within the existing normal 1–4 depth range.
- Role-collapse risk: the card could grow into Stage0. Mitigation: cap it at a witness skeleton and three decisive source questions; no venue calibration, exhaustive novelty verdict, eight-predicate decision or Stage A design is required.

## Mainline handoff

- User approval already present: bounded assignment-local adaptive source/depth scheduling under `USER_ADAPTIVE_DISCOVERY_CONTINUE_UNTIL_FIVE_STAGEA_PASS_20260814`.
- User approval still required: permanent shared-rule/template patch, automatic classifier/suppression, recurring resource expansion beyond the bounded pilot, V9 SHADOW/PRODUCTION or any scientific gate change.
- Files proposed for change now: none.
- Registry migrations proposed now: none.
- Existing active/blocked/hold/terminal topics affected: none.
- Shared files modified: `false`.
