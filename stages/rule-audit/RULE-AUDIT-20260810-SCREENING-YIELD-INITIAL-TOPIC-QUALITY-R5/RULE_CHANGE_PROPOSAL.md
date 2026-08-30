# Rule Change Proposal

## Proposal identity

- `audit_id`: `RULE-AUDIT-20260810-SCREENING-YIELD-INITIAL-TOPIC-QUALITY-R5`
- `proposal_id`: `DISCOVERY-SOURCE-QUALITY-FUNNEL-CLARITY-R5`
- `decision_label`: `PATCH_RECOMMENDED_P0__BACKTEST_REQUIRED_P1_P2`
- `USER_APPROVAL_REQUIRED`: `true`
- `user_policy_approval_required`: `true`
- `backtest_required`: `true` for P1/P2 behavior; `false` for P0 metric terminology only
- `production_patch_authorized`: `false`
- `shared_files_modified`: `false`

## Problem statement

Wave29–47 contain 244 reconstructable mixed row-events and six Stage0 proposals. At least 17 events are explicit re-audits/rescreens, so the denominator is not a set of independent opportunities. The proposal rate (`2.46%`) therefore cannot diagnose recall.

The proposal-quality signal is clearer: only two of six obtained independent Stage0 PASS, only one passed without a scientific revision, and all six required material source/action corrections at Stage0. Five corrections materially narrowed, contradicted or invalidated the proposed action; AIGER's correction was nonfatal and the residual survived. This pattern shows that current source/paper/generic-kernel synthesis is too often deferred to Stage0.

The current rules already request a substantial opportunity package. The failure is a combination of:

1. ambiguous funnel units and an internally inconsistent diagnostic (`18–24 raw → 6–10 grounded briefs` despite at most four proposal briefs from two lanes);
2. proposal packages listing sources without proving all strategic source roles were covered at sufficient read depth;
3. repeated contribution-first breadth after source-family saturation;
4. M1 sampling tools rather than published phenomena or natural measurement evidence;
5. raw logs collapsing `not yet frozen` and `structural drop`.

R1/R2 and the active v8.8 backtest already cover algorithmic-residual correction, current-collision minimum set and atomic action certificates. R5 must not change that frozen packet or create a competing production patch. It adds funnel clarity, source-role/read-scope synthesis and adaptive breadth/depth scheduling after v8.8 is independently resolved.

## Current rule

- File/heading: `rules/ROLE_MAINLINE.md` → “并发与在制品”.
- Current behavior: diagnostic 18–24 raw opportunities → 6–10 grounded briefs; `grounded brief` is undefined and exceeds two lanes × two briefs.
- File/heading: `rules/ROLE_DISCOVERY.md` → “论文机会包 / 三遍发现法 / CURRENT_UPSTREAM_REALITY_CHECK”.
- Current behavior: source counts and roles are described, but a proposal can still omit a current same-object successor, first-party sibling implementation, generic kernel or decisive source semantics while saying Stage0 will search them.
- File/heading: `rules/ROLE_DISCOVERY.md` → “M1”.
- Current behavior: M1 is a legitimate N3 source, but assignments can satisfy surface coverage by listing profiler/metrics stacks without beginning from an observed phenomenon.
- Why it is insufficient: source names and counts are not the same as verified source roles, read scope or synthesis. More breadth does not repair this.

## Proposed minimum delta

| Package | File | Heading/field | Current semantics | Proposed semantics |
|---|---|---|---|---|
| P0 | `rules/ROLE_MAINLINE.md` | Discovery diagnostic funnel | 18–24 raw → 6–10 undefined grounded briefs | Define `RAW_SCREEN_ROW_EVENT → UNIQUE_OPPORTUNITY_FAMILY → CANDIDATE_GRADE_DEEP_REVIEW → STAGE0_BRIEF → CLEAN_STAGE0_BRIEF → DECISIVE_STAGEA_OBSERVATION → STAGEA_PASS`. Suggested two-lane diagnostic: 18–24 raw events, 4–6 deep reviews, 0–4 Stage0 briefs; all are nonquotas and zero proposals remains legal. |
| P0 | `rules/ROLE_MAINLINE.md` / future wave handoff schema | throughput telemetry | raw screening rate and cost fields can mix units | Count new families, repeat audits, deep reviews and proposals separately. Define clean brief as no repair of an omitted cutoff-available minimum-set source/action; scientific STOP can still be clean. |
| P0 | `rules/ROLE_DISCOVERY.md` | raw disposition readability | final output only PROPOSE/DROP; raw logs vary | Reuse R1 raw statuses: `STRUCTURAL_DROP / NOT_ADMITTED_UNFROZEN / RESOURCE_BLOCKED / DEEP_DIVE_REQUIRED / EXCLUDED`. They are log states only, not registry candidate states. |
| P1 | `rules/ROLE_DISCOVERY.md` | top-k opportunity package | anchor/predecessor/successor/contrary/artifact described, but role/read depth is not mechanical | Add `SOURCE_ROLE_PASSPORT` for top three only: anchor; closest current same-object; predecessors; successors/forward citations; first-party current family; generic kernel; contrary/negative; natural carrier/evaluation. Record version/date, read scope, supports, opposes and claim ceiling. |
| P1 | `templates/TOPIC_BRIEF.md` | paper genealogy / collision | generic lists plus R2 proposed minimum-set fields | Render one compact passport table. Proposal requires method/evaluation read scope for closest papers and decisive source-symbol/flag read scope for current implementation when action reality matters. `NOT_FOUND_WITHIN_SEARCH` remains legal after a reproducible bounded search. |
| P1 | `rules/ROLE_DISCOVERY.md` | literature search strategy | source counts without a stopping rule | One bounded backward-citation and one bounded forward-citation pass; approximately 8–12 primary artifacts per top-three review. Stop when every strategic role is filled or honestly bounded. Do not turn the cap into a minimum paper-count quota. |
| P1 | `rules/ROLE_DISCOVERY.md` | synthesis | three passes but no compact cross-source synthesis form | Require `WHY/HOW/WHAT + contradiction`: source-grounded importance/carrier; current/generic mechanisms and no-gain; exact object/action/property/falsifier. Paper-by-paper summaries alone are insufficient. |
| P2 | `rules/ROLE_MAINLINE.md` / `rules/ROLE_DISCOVERY.md` | two hot Discovery slots | both may repeatedly do broad coverage | When a qualified near-miss exists, use one breadth and one depth slot. If none exists, both may do orthogonal breadth. Do not add lanes; preserve R4. |
| P2 | `rules/ROLE_DISCOVERY.md` | source-family saturation | only historical exclusions/non-overlap | If eight fresh rows or three deep reviews end in the same structural kernel with no unresolved source gap, pause that family for two waves and rotate source mode. Pause is temporary and never a terminal candidate state. |
| P2 | `rules/ROLE_DISCOVERY.md` | M1 source quality | trace/profile/benchmark/tools all possible seeds | Require a published or source-grounded phenomenon, stable law, ranking inversion, evaluation bias or negative result before candidate generation. A profiler, metrics API, dashboard or event log alone is an artifact route, not an N3 opportunity. |

No new rule file, formal state, role, lane type or per-candidate task is proposed. Definitions should stay in the role file that each session already reads, while the template supplies the compact table. This preserves session actionability and human readability.

## Mechanical definitions

### Funnel units

- `RAW_SCREEN_ROW_EVENT`: one logged screening row; repeated reviews remain row-events.
- `UNIQUE_OPPORTUNITY_FAMILY`: one exact-object/problem/mechanism family after deduplication; confidence may be bounded.
- `CANDIDATE_GRADE_DEEP_REVIEW`: a top-k family that completes the source passport, contradiction synthesis, natural carrier and preliminary action certificate.
- `STAGE0_BRIEF`: a canonical `PROPOSE_STAGE0` package.
- `CLEAN_STAGE0_BRIEF`: Stage0 does not need to repair an omitted cutoff-available R2 minimum-set source/action family. A correct independent scientific STOP does not retroactively make the brief dirty.
- `DECISIVE_STAGEA_OBSERVATION`: a fidelity-valid claim-bearing result that can support PASS, REVISE or scientific STOP.
- `STAGEA_PASS`: existing independent PASS; monitored, never quota-driven.

### Source-role passport

Each retained top-k family records:

| Field | Meaning |
|---|---|
| `source_role` | anchor / current-same-object / predecessor / successor / first-party-current / generic-kernel / contrary / natural-carrier |
| `authority_and_version` | publisher/author/official source, date/tag/commit |
| `read_scope` | `METADATA_ONLY / ABSTRACT_INTRO / METHOD_EVALUATION / SOURCE_SYMBOLS_FLAGS` |
| `supports` | exact candidate premise supported |
| `opposes` | exact premise, action, guarantee or carrier challenged |
| `facet_disposition` | direct fatal/subtract, adjacent, baseline, natural resource or bounded open |
| `claim_ceiling` | maximum inference this source permits |

The passport does not claim exhaustive novelty. Stage0 remains independent.

### Temporary saturation

Saturation is a scheduling hint, not evidence that the field has no opportunity. It expires after two waves or earlier when a new current paper, source release, measurement result, generic kernel or natural carrier changes the evidence. It cannot revive a terminal topic or block a genuinely different object/problem ID.

## Safety invariants

- Q2 minimum preserved: yes; no proposal quota or lowered tier.
- Q1 priority preserved: yes.
- Same-object preserved: strengthened in the source passport.
- Latest collision preserved: strengthened; bounded rather than exhaustive.
- Fair current strong baseline preserved: strengthened by current family/configuration coverage.
- Natural input/evidence preserved: strengthened by carrier-schema checks and phenomenon-first M1.
- Full-cost preserved: required in WHY/HOW/WHAT and atomic certificate.
- Reproducibility preserved: source versions, read scopes, queries and hashes are recorded.
- Claim ceiling preserved: source support/opposition and bounded absence are explicit.
- STOP non-revival preserved: yes; terminal cases are controls only.
- User StageB approval preserved: yes.
- AI/human-value reserve preserved: AI executability remains queue-only; valuable human-core topics still route to reserve rather than STOP.

## State and compatibility migration

- Existing states affected: none.
- Existing assignments affected: none; current AIGER StageA and v8.8 PACKER retain frozen rules/hashes.
- Existing R1/R2/R3 proposals: not superseded. P1 implements source-strategy detail only after v8.8 determines whether their core behavior passes.
- Template compatibility: old briefs remain readable; future fields apply only after user approval and a safe assignment boundary.
- Old filename compatibility: unchanged; `handoff.yaml` and `HASH_MANIFEST.sha256` remain canonical.
- One-time migration required: none.
- Rollback path: delete/disable the future R5 source-scheduling fields at the next assignment boundary; no candidate-state rollback.

## Validation plan

### Dependency on current v8.8

The active v8.8 packet is immutable. Do not add R5 cases, sources or acceptance metrics mid-assignment. If its independent auditor returns `NOT_CALIBRATED` or `CONTAMINATION_UNKNOWN`, resolve that result before any R5 behavioral validation.

### R5 historical/time-slice replay after v8.8 PASS

Use independent long-lived `PACKER → EXECUTOR → AUDITOR` roles. The sealed set should contain:

- six proposal-quality cases: Knative, UST, WebGraph, HNSW, GIN and AIGER;
- at least two clean positive shapes including the sole historical StageA PASS shape;
- the existing v8.8 structural and resource/unfrozen controls without changing their labels;
- one M1 tool-stack negative and one published measurement-phenomenon positive.

The executor sees only cutoff-available inputs. Terminal outcomes are hidden and are never reopened.

### Two-wave noncanonical shadow

After historical calibration, run two future waves with canonical behavior unchanged. The R5 side records source passports and adaptive breadth/depth scheduling but cannot create a candidate or change a canonical decision. Stage0 receives only canonical inputs until the user approves production cutover.

### Expected behavior changes

- mixed screening units are no longer summed as a recall denominator;
- broad current-source/paper claims like WebGraph/HNSW are subtracted before proposal;
- AIGER-like residuals survive after additional flags/configurations are added;
- underdefined/resource-limited lines remain explicit nonstructural records;
- M1 begins from a phenomenon and evidence carrier rather than an instrumentation product;
- raw row volume may fall while clean-brief precision rises.

### Forbidden regressions

- using paper count as an admission quota;
- requiring exhaustive literature closure;
- treating `NOT_FOUND_WITHIN_SEARCH` as proof of novelty;
- forcing a proposal from every deep review/wave/lens;
- using a missing implementation/result as structural STOP;
- treating action-space overlap as automatic algorithm absorption;
- treating an abstract witness as native/natural evidence;
- creating a new rule authority, role or per-candidate task for this delta;
- reviving terminal STOP or bypassing independent Stage0/StageA/User StageB gates.

### Acceptance thresholds

1. All shadow handoffs distinguish the seven funnel units; mixed-denominator reporting is zero.
2. Historical six-proposal replay finds all six known material source/config corrections; AIGER remains proposal-eligible after correction.
3. WebGraph/HNSW broad-claim leakage is `0/2`.
4. Every proposed brief has complete R2 minimum-set and R5 passport fields; no method noun substitutes for an action certificate.
5. In two shadow waves, Stage0 finds zero omitted cutoff-available minimum-set direct subtractor.
6. Structural controls stay unproposed `6/6`; terminal revival is zero; at least `3/4` resource/unfrozen controls avoid scientific structural-drop mislabeling.
7. K=3 and the approximate 8–12 primary-artifact cap are respected. Exceeding the cap requires an explicit unresolved source role, not curiosity.
8. Cost per clean brief and decisive StageA observation is measured. StageA PASS is reported but has no acceptance quota.

## Expected benefits and risks

- Expected benefit: Stage0 spends less time repairing obvious source omissions; proposal packages are narrower and more defensible; StageA begins with a better comparator, carrier and killer; AI time shifts from repeated shallow rows to claim-relevant synthesis.
- Expected raw-rate effect: proposal percentage may stay flat or decrease. This is not failure if clean-brief and decisive-observation efficiency improve.
- Expected precision effect: eliminate cutoff-available minimum-set omissions from future Stage0 intake; this is measurable without forcing PASS.
- Cost: deeper reading for the top three only; bounded by source-role and artifact caps.
- False-negative risk: saturation or heavier pre-proposal work may over-prune. Controlled with temporary pauses, nonstructural statuses, positive controls, source-mode rotation and independent Stage0.
- Bureaucracy risk: a long passport can become template filling. Keep it one table and require supports/opposes claims, not prose volume.

## Decision request

`USER_APPROVAL_REQUIRED` at two separate points:

1. approve P0 funnel terminology/telemetry clarification for mainline implementation at a safe assignment boundary; this does not change admission behavior;
2. only after the independent v8.8 result is known, approve the bounded R5 historical replay and two-wave noncanonical shadow for P1/P2. Production behavior remains prohibited until those results are returned and the user separately approves an exact minimal patch.

This proposal does not authorize shared-file edits by the audit sentry, any new Discovery/Stage0/A/B assignment, experiment, download, automation, StageB, formal project or terminal revival.

