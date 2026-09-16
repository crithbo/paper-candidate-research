# Rule Change Proposal

## Proposal identity

- `audit_id`: `RULE-AUDIT-20260810-DISCOVERY-TO-STAGE0-YIELD-R2`
- `proposal_id`: `DISCOVERY-TO-STAGE0-BRIEF-PRECISION-V8.8-PROPOSAL-R2`
- `supersedes_or_consolidates`: consolidates the unapproved R1 proposal `DISCOVERY-BROAD-DEEP-ALGORITHMIC-RESIDUAL-V8.8-PROPOSAL-R1`; neither proposal is in production
- `decision_label`: `BACKTEST_REQUIRED`
- `USER_APPROVAL_REQUIRED`: `true`
- `user_policy_approval_required`: `true`
- `backtest_required`: `true`
- `production_patch_authorized`: `false`

## Problem statement

R1 correctly identified that native action-space overlap cannot automatically absorb a new algorithm. Operational application of that clarification produced useful rescreens, including HNSW. The next bottleneck is precision at the Discovery→Stage 0 boundary.

The two new Stage 0 briefs examined in this audit both omitted a decisive, pre-cutoff nearest source that Stage 0 found immediately:

- WebGraph omitted first-party Rust `BvCompZ` and Zuckerli, so its broad global-reference-forest action and sibling witness were absorbed.
- HNSW omitted FastHNSW/FastKCNA PVLDB 2025 and generic b-matching genealogy, so global layer construction and plain matching were absorbed.

At the same time, both Stage 0 revision gates asked for a realized native/metric witness and exact comparator outputs. That evidence is valuable, but when it requires executing the native cost model or constructor it is the first Stage A fidelity killer, not a condition that Stage 0 must already have satisfied. Stage 0 should require a complete model-level action certificate and finite native falsifier, while retaining all current-collision and same-object gates.

Wave42/43 show the necessary negative boundary: structural potential alone is not enough. SPLIDT, Kafka and Flink correctly remained unproposed because no complete constructor/transition and guarantee could be frozen. This proposal must not turn labels such as “online,” “partial cut,” “global,” “matching” or “repair” into candidates.

## Current rule

- File/heading: `rules/ROLE_DISCOVERY.md`“论文机会包”“三遍发现法”“Discovery 保真计划与 Stage A 保真执行门”“新颖性与基线”“输出与结论”。
- Current behavior: the rule requires competing work and current-source checks, but the template does not mechanically require one closest current same-object paper, every known first-party implementation family, or the generic algorithm kernel before `PROPOSE_STAGE0`.
- File/heading: `rules/ROLE_STAGE0_REVIEW.md`“目标”“PASS 条件”“资源与可执行性边界”。
- Current behavior: the prose says implementation/results/small-witness closure are not required, but revision reports can still phrase an actual native instance/output as an admission requirement.
- Why clarification is insufficient by itself: correcting these two behaviors can change which briefs are sent to Stage 0 and which conditional shapes reach Stage A; historical/time-slice backtesting is mandatory before production use.

## Proposed minimum delta

| File | Heading/field | Current semantics | Proposed semantics |
|---|---|---|---|
| `rules/ROLE_DISCOVERY.md` | “论文机会包 / 第三遍” | competing work and current source are required but minimally scoped | Add bounded `CURRENT_COLLISION_MINIMUM_SET`: closest current same-object paper; known first-party implementation family including sibling repo/released package/CLI; candidate's generic algorithm kernel; current documented/default/nondefault actions. Missing decisive transport is recorded, never converted to absence. |
| `rules/ROLE_DISCOVERY.md` | “Discovery 保真计划” | complete atomic action and small witness plan are required | Add `ATOMIC_ACTION_CERTIFICATE`: exact object/guarantee, information, legal action set, strongest-baseline rule, candidate rule, nontrivial property/complexity target, model-level divergence witness, full-cost scope and finite native realization falsifier. A method noun or product of known components is insufficient. |
| `rules/ROLE_DISCOVERY.md` | “新颖性与基线” | action-space overlap is not absorption | Retain R1 six-dimensional residual test and add replay rule: only same-information, same-contract replay of the decision rule/property at full cost absorbs the algorithm; source/paper collision must be resolved before broad claim is proposed. |
| `templates/TOPIC_BRIEF.md` | Paper genealogy | generic anchor/predecessor/follow-up fields | Make `closest_current_same_object_paper`, `first_party_current_implementation_family`, `generic_method_kernel`, `cutoff/date/read_scope`, and contrary-source disposition explicit and mandatory for a proposal. |
| `templates/TOPIC_BRIEF.md` | Current collision / fidelity | current upstream check and future small witness are present | Add separate `MODEL_ACTION_DIVERGENCE_CERTIFICATE` and `NATIVE_REALIZATION_FALSIFIER`; explicitly mark the first as admission material and the second as future Stage A work. |
| `rules/ROLE_STAGE0_REVIEW.md` | PRIMARY / PASS / revision | independent collision and atomic mechanism checks; no implementation/result required | Codify evidence boundary: Stage 0 may require a model-level legal witness, action/algorithm skeleton and finite native killer; it must not require candidate implementation, executed native comparator output, actual natural/native cost result or positive headroom as PASS preconditions. Undefined action/property can still REVISE/STOP. |
| `templates/STAGE0_REPORT.md` | Frozen object / collision / fidelity | model specification and native witness are not separated | Add `MODEL_ACTION_CERTIFICATE_VERDICT` and `NATIVE_REALIZATION_STATUS: FUTURE_STAGEA_GATE / ALREADY_SOURCE_DERIVABLE / STRUCTURALLY_UNCLOSABLE`. Missing future result alone cannot be STOP. |
| `rules/ROLE_MAINLINE.md` | Discovery acceptance / Stage 0 assignment | checks current-upstream bundle but not paper/kernel minimum or evidence type | Mechanically reject an incomplete brief back to Discovery without creating Stage 0; when complete, require Stage 0 assignment to preserve the model-vs-native boundary. No new formal state. |
| `rules/ROLE_MAINLINE.md` and `templates/STAGE0_REPORT.md` | Stage A ordering | AI readiness is present but not a calibrated yield priority | Preserve R1 `STAGEA_YIELD_PRIORITY` as queue-only after independent Tier A/B confirmation; current-collision closure and finite native killer are readiness factors, never admission gates. |

No shared file is edited in this audit directory. No `DRAFT_PATCH.diff` is supplied before backtest approval.

## Mechanical definitions proposed for backtest

### `CURRENT_COLLISION_MINIMUM_SET`

A proposal must contain a bounded table with four rows or documented `NOT_FOUND_WITHIN_SEARCH`:

1. closest current same-object paper or artifact paper;
2. current first-party implementation family, including sibling repositories and released packages/CLI modes known from the official project;
3. closest generic algorithm/method kernel used by the candidate;
4. strongest deployed/configuration union with default and nondefault actions.

This is not exhaustive literature closure. Stage 0 remains independent and may find additional work. `SEARCH_BOUNDED_OPEN` remains legal only after the minimum set is complete.

### `MODEL_ACTION_DIVERGENCE_CERTIFICATE`

The certificate freezes:

- `O`: exact object/function/guarantee;
- `I`: information available equally to candidate and baselines;
- `A_b`: strongest-baseline legal action and decision rule;
- `A_c`: candidate legal action and decision rule;
- `P`: nontrivial algorithmic/formal property or complexity target;
- `W_m`: a model-level legal action trace showing what differs if the hypothesis holds;
- `C`: full-cost dimensions and denominator;
- `F_n`: a finite native realization/replay falsifier.

`W_m` may be abstract or analytically derived but must obey the frozen action model. It is not evidence that a native instance or natural gain exists. `F_n` is executed only after Stage A authorization.

## Safety invariants

- Q2 minimum preserved: yes; no brief quota and no lowered quality tier.
- Q1 priority preserved: yes; readiness remains secondary to academic tier.
- Same-object preserved: yes; `O` and native contract are mandatory.
- Latest collision preserved: strengthened by the minimum set and independent Stage 0 review.
- Fair current strong baseline preserved: strengthened; first-party sibling implementations and generic algorithm controls are mandatory.
- Natural input/evidence preserved: a natural carrier and later natural evidence remain required; model witness cannot become positive evidence.
- Full-cost preserved: `C` is mandatory at proposal time and later charged.
- Reproducibility preserved: cutoff, source versions, action certificate, falsifier and hashes are frozen.
- Claim ceiling preserved: Discovery/Stage 0 may claim only conditional paper potential and source-grounded mechanism distinction.
- STOP non-revival preserved: all historical terminal cases are controls only.
- User StageB approval preserved: no Stage B behavior changes.

## State and compatibility migration

- Existing states affected: none.
- Existing assignments affected: none; WebGraph, HNSW, Wave42/43 and all earlier topics retain current mainline state and revision accounting.
- Template compatibility: old briefs/reports remain readable; new fields are required only for future assignments after a production patch is separately approved.
- Old filename compatibility: unchanged; canonical files remain `handoff.yaml` and `HASH_MANIFEST.sha256`.
- One-time migration required: none. If approved, create only a sealed method-backtest assignment.
- Rollback path: if backtest fails, retain v8.7 and R1/R2 as rejected audit evidence; do not alter candidate states.

## Validation plan

### Historical/time-slice set

- Sentinel collision cases: WebGraph broad forest vs `BvCompZ`/Zuckerli; HNSW global layer builder vs FastHNSW/generic b-matching.
- Underdefined-potential cases: SPLIDT delta construction, Kafka lease/hydration/release, Flink selective checkpoint cut.
- Positive controls: at least six historical Stage 0 PASS shapes, including `S6-JS-PREFIXBOUND`.
- Negative controls: at least six direct-current, changed-object, ordinary selector/wrapper or generic-product failure cores.
- Readiness controls: at least four resource-blocked or finite-unimplemented cases that must not become scientific STOP.

PACKER freezes sources available by each historical cutoff and hides downstream labels. EXECUTOR applies v8.7 and proposed v8.8 paths independently. AUDITOR opens labels and checks hard-gate regressions. The same conversation may not hold more than one role.

### Expected behavior changes

- WebGraph and HNSW broad claims are subtracted before proposal, not discovered only after Stage 0 intake.
- A narrow residual may still be proposed only when its model action/property is complete; otherwise it is `NOT_ADMITTED_UNFROZEN`, not forced into a candidate.
- Native realization and positive headroom are deferred to the first Stage A fidelity killer when the model certificate and finite route are complete.
- SPLIDT/Kafka/Flink remain unproposed unless a complete action certificate is actually supplied.

### Forbidden regressions

- treating current action/config space as automatic algorithm absorption;
- treating `SEARCH_BOUNDED_OPEN` as permission to omit the nearest current same-object paper;
- accepting a method noun, ordinary controller, generic optimizer+wrapper or changed guarantee;
- using abstract model witness as native/natural evidence;
- requiring implementation, native output or positive result merely to establish conditional Stage 0 shape;
- weakening same-object, current collision, strong baseline, natural/full-cost/reproducibility, or reviving STOP.

### Acceptance threshold

1. Sentinel minimum-set recall: `2/2`; broad-claim leakage: `0/2`.
2. Negative controls: `6/6` not packaged; terminal revival: `0`.
3. Positive controls: at least `5/6` receive candidate-grade deep review and at least `4/6` remain proposal-grade or explicitly nonstructural-unfrozen.
4. Readiness controls: at least `3/4` are not mislabeled as structural scientific drop.
5. Every proposed brief contains all `O/I/A_b/A_c/P/W_m/C/F_n` fields and minimum-set provenance.
6. Every Stage 0 replay distinguishes model certificate from native result; absence of candidate implementation/native output/positive result is never the sole STOP reason.
7. Two shadow waves produce zero omitted minimum-set direct subtractors at Stage 0 intake; zero briefs remains acceptable.
8. Historical `STAGEA_YIELD_PRIORITY` places the sole existing independent PASS in the upper half without dropping any Tier A/B topic; future PASS count is observation, not a quota.

## Expected benefits and costs

- Expected benefit: fewer broad briefs immediately absorbed at Stage 0; clearer separation between underdefined research object and merely unimplemented hypothesis; faster Stage A first-killer decisions on precise briefs.
- Expected cost: additional bounded paper/artifact/kernel scan and one structured action certificate per proposed brief; a small increase in Stage A quick scientific failures may occur because native realization is tested at the correct stage.
- Main uncertainty: only two end-to-end sentinel briefs are available after R1. Their 2/2 pattern is strong enough to justify backtest, not immediate production inference.

## Decision request

`USER_APPROVAL_REQUIRED`.

The user may approve only the consolidated sealed v8.8 historical backtest described above. That approval does not authorize production rule/template edits, candidate creation, Stage 0/A/B execution, experiments, downloads, automation or any state change. If and only if the independent auditor reports that every acceptance threshold is met, the mainline must return the exact minimal patch and regression evidence for a second explicit user approval before applying it.

Until then, v8.7 remains authoritative, R1/R2 remain proposals, and all shared files and candidate states remain unchanged.

