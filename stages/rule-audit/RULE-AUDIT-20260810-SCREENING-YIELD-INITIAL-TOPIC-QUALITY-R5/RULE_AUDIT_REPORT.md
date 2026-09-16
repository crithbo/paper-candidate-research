# Rule Audit Report

## Identity

- `audit_id`: `RULE-AUDIT-20260810-SCREENING-YIELD-INITIAL-TOPIC-QUALITY-R5`
- `trigger`: R4 parallel scheduling passed; user asked why at least 238 heterogeneous screening units produced only six Stage0 proposals and how deeper/broader literature work could improve initial topic quality.
- `requested_by`: user and frozen mainline assignment
- `date`: 2026-08-10（Asia/Shanghai）
- `write_directory`: `stages/rule-audit/RULE-AUDIT-20260810-SCREENING-YIELD-INITIAL-TOPIC-QUALITY-R5/`
- `shared_files_modified: false`

## Executive answer

**`6 / at least 238` is not by itself too low. The downstream precision of those six is too low.**

The denominator mixes fresh genealogies, natural carriers, measurement/tool stacks, repeated near-miss deep audits and targeted rescreens. Canonical artifacts reconstruct 244 row-events, at least 17 of which are explicit repeats/rescreens. A 2.46% mixed-row proposal rate may be healthy under a Q2 minimum and mature current baselines; it cannot measure recall because the denominator has no blinded label saying how many genuine Q2 opportunities existed.

The actionable inefficiency appears after selection:

- only `2/6` proposals ultimately obtained independent Stage0 PASS;
- only `1/6` passed Stage0 without a scientific revision;
- WebGraph then stopped at StageA full-cost review;
- AIGER is active, so the six have produced zero realized StageA PASS so far without implying that AIGER will fail;
- all six proposal packages required a material Stage0 source/action correction, although AIGER's correction was nonfatal.

Therefore the system should **not target a larger proposal numerator**. It should target fewer omitted decisive sources, a higher clean-brief rate, faster decisive StageA observations and lower cost per clean brief. More indiscriminate papers would worsen throughput. More strategically selected and more deeply read sources should help.

## Question and scope

- User/process question: distinguish healthy abstention from shallow screening; assess source quantity versus quality; separate Discovery recall, Stage0 precision and StageA yield; recommend literature and scheduling changes without lowering scientific gates.
- Rules inspected: `AGENTS.md`; `plan.md`; `registry.yaml`; `rules/ROLE_RULE_AUDIT.md`; `rules/ROLE_DISCOVERY.md`; `rules/ROLE_STAGE0_REVIEW.md`; `rules/ROLE_MAINLINE.md`; `rules/ROLE_DISCOVERY_BACKTEST.md`; rule-audit report/proposal templates; R1/R2/R3/R4 relevant proposals and implementation evidence.
- Candidate examples inspected: Wave29–47 registered logs/handoffs; the six proposal briefs and collision matrices; the corresponding Stage0 source audits; registered revision/closing/StageA failure kernels.
- Out of scope: no candidate is reopened; no terminal STOP is reconsidered; no new Discovery/Stage0/A/B assignment, experiment, download or automation is run; no shared file is edited; the audit does not claim a missed raw row should have become a paper.
- Evidence snapshot: see `AUDIT_INPUT_SNAPSHOT.md`.

## Current authoritative behavior

1. `rules/ROLE_DISCOVERY.md` already requires a paper opportunity package with an anchor, 2–4 predecessors, 1–3 successors/competitors, at least one contrary/negative source and artifacts where available. It also requires three passes: problem genealogy, competing mechanisms, then current collision and finite execution entry.
2. The same rule requires `CURRENT_UPSTREAM_REALITY_CHECK` when an action gap relies on current implementation absence: current official documentation, actual source, commit/tag, default and nondefault flags, and contrary evidence must be recorded before proposal.
3. `rules/ROLE_STAGE0_REVIEW.md` correctly keeps Stage0 conditional. It does not require implementation, a positive result or a completed native experiment; it independently checks current paper/source collisions, exact object, action and Q2 shape.
4. R1/R2 already proposed the missing operational bridge: top-k deep review, raw nonstructural dispositions, a bounded current-collision minimum set, an atomic action certificate and a model-versus-native witness boundary. Consolidated v8.8 is currently in a frozen independent backtest and is not production authority.
5. R4 now keeps two rotating hot Discovery slots and conditionally adds only one maintenance-coexistence seat. It expressly forbids expanding production Discovery concurrency before v8.8 PASS.
6. `rules/ROLE_MAINLINE.md` currently says, as a diagnostic rather than a quota, that approximately 18–24 raw opportunities should converge to 6–10 grounded briefs. But two hot lanes have a recorded maximum of two briefs per lane, so at most four proposal briefs can be created. `grounded brief` is not defined separately from a Stage0 topic brief. This is an internal metric/readability defect even if nobody treats it as a quota.

## Evidence of a problem or of correct behavior

| Observation | Source/artifact | Repeated? | Rule defect, execution defect, resource event, or one-off? |
|---|---|---:|---|
| 244 row-events reconstruct from Wave29–47, but at least 17 are explicit deep-audit/rescreen repeats; later “fresh” rows may still share mechanism families. | registry and canonical wave handoffs | yes | Metric/schema ambiguity. Mixed units cannot estimate recall. |
| Many raw rows have valid structural reasons: current complete action, changed exact object/guarantee, ordinary tuning/wrapper, or terminal exclusion. | Wave29, 33, 44–47 logs/matrices | yes | Healthy abstention; hard gates are functioning. |
| W44 and W45 added 59 broad rows with zero proposals after prior saturation. | registry W44/W45; six handoffs | yes | Broad-coverage marginal return is low; additional raw concurrency would amplify shallow work. |
| Knative's proposed atomic action contradicted actual current request commit order, and its Azure trace lacked Knative transition semantics. | Discovery brief vs Stage0 source audit | first of six proposal corrections | Execution-depth failure: source names/version were present, but decisive source semantics were not read before proposal. |
| UST proposal omitted closest same-operation hybrid/segmentation work and the generic contiguous-DP kernel. | Discovery genealogy vs Stage0 source audit | second | Strategic literature coverage incomplete, not Stage0 over-strictness. |
| WebGraph omitted first-party sibling Rust `BvCompZ`, released CLI mode and Zuckerli; the broad claim was already implemented/published. | Discovery brief/matrix vs Stage0 source audit | third | Direct violation of the intent of current-upstream and first-party-family checks. |
| HNSW omitted a 2025 same-object PVLDB paper and generic b-matching lineage. | Discovery brief/matrix vs Stage0 source audit | fourth | Recent same-object and generic-kernel search incomplete. |
| GIN deferred actual source pinning to Stage0; current source already had segment semantics, while the proposed recurrence/witness was incomplete. | Discovery handoff/matrix vs Stage0 source audit and closing kernel | fifth | Current-source and atomic-action depth incomplete. |
| AIGER Stage0 added Yosys `-no-sort` and ABC `-u`; neither absorbed the atomic residual, and the topic passed. | Discovery brief vs Stage0 source audit/confirmation | sixth, nonfatal | Useful positive control: complete review should correct omissions without forcing a negative decision. |
| Wave45 M1 screened profiler/metrics tools rather than beginning from a published stable phenomenon, natural trace contradiction or ranking inversion. | W45 M1 log/matrix | repeated M1 zero-proposal pattern | Source-sampling imbalance. Instrumentation is not itself an N3 opportunity source. |
| Raw logs still mix structural drop with “not yet frozen / source unavailable,” although R1 showed this distinction matters. | W29 S6 vs W42/W43 and later logs | yes | Output vocabulary/template ambiguity; potential false-negative risk. |
| Stage0 found decisive information promptly and did not require positive results for AIGER. | all six Stage0 audits; AIGER PASS | yes | Stage0 independence and strictness are not the main bottleneck and should be preserved. |

## Root-cause analysis

### 1. Healthy abstention is real

This search space is mature. Current compiler, database, storage and serialization implementations already contain broad global optimizers, configuration unions and representation families. The Q2 floor also excludes routine parameter sweeps, wrappers, changed formats and weak baselines. A low raw-to-proposal rate is therefore expected and desirable.

No rule should require every direction, wave or source lens to yield a paper. Proposal count is an output, not an admission quota.

### 2. The denominator overstates independent search coverage

`screening unit` currently means several things. Re-screening HNSW after a rule clarification is not a new opportunity family; a top-3 audit is not equivalent to a one-line conference-page scan; an M1 profiler stack is not equivalent to a current same-object paper genealogy. Summing them hides both cost and information gain.

The raw number should be replaced by a funnel with distinct units:

1. `RAW_SCREEN_ROW_EVENT`;
2. `UNIQUE_OPPORTUNITY_FAMILY`;
3. `CANDIDATE_GRADE_DEEP_REVIEW`;
4. `STAGE0_BRIEF`;
5. `CLEAN_STAGE0_BRIEF`;
6. `DECISIVE_STAGEA_OBSERVATION`;
7. `STAGEA_PASS`.

A `CLEAN_STAGE0_BRIEF` means Stage0 did not have to repair an omitted, cutoff-available minimum-set source/action family. It may still scientifically STOP for a deeper independent reason. This prevents “precision” from becoming a disguised PASS quota.

### 3. The main proposal bottleneck is source quality and synthesis, not paper count

The six proposals generally named several sources, but the source roles were incomplete:

- current same-object successor missing;
- first-party sibling implementation/released CLI missing;
- generic algorithm kernel missing;
- current source read at interface-name level rather than decisive transition/constructor semantics;
- contrary source recorded as a generic caveat rather than used to attack the candidate;
- natural carrier named without checking whether it contains the state required by the proposed action.

This is why “read more papers” is too vague. A ten-paper list can still miss one decisive sibling repository or generic theorem. The correct unit is a **source-role passport plus synthesis**, not citation volume.

### 4. Contribution-first breadth has saturated

The broad sweep often starts from a recent paper's completed contribution, then asks what adjacent stage remains. In mature systems, that residual is frequently a selector, controller, wrapper or representation change. Repeating the process across more accepted-paper lists increases counts but not independent mechanisms.

Future breadth should start from multiple evidence modes:

- a published measurement anomaly, stable law, ranking inversion or negative result;
- a current-source action/semantic boundary;
- a generic algorithm/formal kernel that can act on a real exact object;
- a recent paper genealogy whose mechanism moved a bottleneck;
- a natural trace/profile/corpus with a decision-relevant carrier.

The six S1–S6 lenses remain useful; this is source-mode diversification, not a new domain silo.

### 5. M1 is underpowered when it scans tools instead of phenomena

M1 cannot generate N3 by listing profilers, metrics APIs or event logs. Since Discovery does not run claim-bearing experiments, M1 should prioritize published measurement studies, official trace releases, benchmark papers, negative results and documented cross-version/platform inversions. The source must already contain or make auditable a candidate stable phenomenon; the profiler is only an artifact route.

### 6. Stage0 is doing work that Discovery promised to do

Stage0 must remain independent, but its highest-value work should be adversarial confirmation, Q2 calibration and detection of subtle collisions. It should not repeatedly be the first place to inspect a sibling repository, the nearest current same-object paper, the candidate's generic algorithm kernel or the actual source transition semantics. Moving these bounded checks earlier improves precision without requiring implementation or results.

## Literature strategy: deeper and more selective, not broadly larger

For each breadth assignment, keep inexpensive scanning. Only the top three families receive the following bounded deep package:

| Source role | Minimum question answered | Required read depth |
|---|---|---|
| Problem/contribution anchor | Why does the problem matter and what has already been solved? | abstract, introduction, method and evaluation summary |
| Closest current same-object paper | What current claim/action most directly subtracts the proposal? | method, guarantee, evaluation/full-cost and limitations |
| Predecessor genealogy | Which concepts and baselines make the apparent novelty non-new? | relevant method sections; 2–4 items total, already consistent with current rule |
| Successor/competitor/forward citation | What changed after the anchor? | one bounded backward and one bounded forward chaining pass; 1–3 items |
| First-party current implementation family | What can the current object actually do? | official release/package/sibling repo/CLI plus decisive source symbols, flags and defaults |
| Generic algorithm/formal kernel | Is the candidate merely an application of a known optimization/DP/matching theorem? | original or authoritative method source and complexity/guarantee |
| Contrary/negative source | What evidence or boundary most threatens headroom? | exact contrary claim, no-gain region or invalid assumption |
| Natural carrier/evaluation anchor | Does the public evidence contain the state and denominator required by the candidate? | schema/provenance/workload and full-cost observability |

Every source gets `role`, `version/date`, `read_scope`, `supports`, `opposes`, and `claim_ceiling`. One-hop backward/forward chaining is bounded; it stops when all roles have a credible source or are truthfully `NOT_FOUND_WITHIN_SEARCH`. A cap of roughly 8–12 primary artifacts for each top-three deep review prevents unbounded literature expansion.

The synthesis should answer `WHY / HOW / WHAT`:

- `WHY`: source-grounded importance, natural carrier and measurable residual;
- `HOW`: current and generic mechanisms, contradictions and no-gain conditions;
- `WHAT`: exact object, atomic action, property/complexity target and finite StageA killer.

Paper-by-paper summaries without a contradiction matrix do not count as deep review.

## Throughput and source scheduling recommendation

R4 parallelism is sufficient. Do **not** add more Discovery lanes now.

Use the two hot slots adaptively after v8.8 calibration:

- if there is no qualified near-miss, both slots may perform bounded breadth on orthogonal source modes;
- once at least one family reaches `DEEP_DIVE_REQUIRED`, use one slot for breadth and one for top-k depth/source synthesis;
- if eight fresh rows or three deep reviews in one source family end in the same registered structural kernel with no unresolved source gap, pause that family for two waves and rotate source mode; this is a temporary saturation pause, not a permanent exclusion or terminal state;
- M1 is triggered by published phenomena/traces/measurement contradictions, not by a list of tools;
- high-value StageA work still reduces shallow Discovery concurrency under current mainline policy.

This may reduce the raw row count. That is acceptable if clean briefs and decisive observations improve.

## Risk analysis

- False-negative risk: medium. A tighter source package might over-prune new combinations. Safeguards are the R1 nonstructural raw states, positive-control recall, `SEARCH_BOUNDED_OPEN` after the bounded set, temporary rather than permanent saturation, and independent Stage0.
- False-positive/weak-paper risk: currently medium-high at the proposal boundary; reduced by current same-object, first-party family, generic-kernel and contrary-source coverage before proposal.
- Scientific-integrity risk: reduced. Source absence cannot be inferred from transport; read scope and contrary evidence become explicit. Abstract/model witnesses remain hypotheses, not native/natural evidence.
- Resource/time risk: medium. Top-three source work becomes deeper. It is bounded by K=3, 8–12 primary artifacts, at most two briefs per lane and no Discovery experiments/downloads.
- State-migration risk: low. No new formal state, candidate migration or terminal change is required.
- Terminal-revival risk: zero by design. Terminal cases appear only as blinded controls/failure kernels.
- Readability/session risk: low if the delta is kept inside existing `ROLE_DISCOVERY`, `ROLE_MAINLINE` and `TOPIC_BRIEF` rather than creating another authority file or role.

## Recommendation

- Decision: `BACKTEST_REQUIRED`, with a separate nonbehavioral `CLARIFY / PATCH_RECOMMENDED` funnel-metric cleanup.
- Minimum effective change:
  1. clarify the funnel units and the impossible/ambiguous `18–24 → 6–10 grounded briefs` line;
  2. after the frozen v8.8 audit completes, require a bounded source-role passport/read-scope synthesis for top-k deep reviews and proposals;
  3. calibrate one-breadth/one-depth hot-slot scheduling, temporary source-family saturation and phenomenon-first M1 before production use.
- Why a smaller operational fix is insufficient/sufficient: simply telling lanes to “read more literature” would add cost without preventing the exact WebGraph/HNSW omissions. The source-role passport is the smallest content fix; adaptive breadth/depth allocation is the smallest scheduling fix. More parallelism is not required.
- Non-relaxable gates preserved: Q2 minimum, same-object, latest collision, fair current strong baseline, natural evidence, full-cost, fidelity, reproducibility, evidence honesty, STOP non-revival and user StageB approval all remain unchanged or become more explicit.

## Validation and rollback

- Historical cases/backtest required: yes for source-strategy/scheduling behavior. The currently active consolidated v8.8 packet is frozen and must not be amended mid-assignment.
- Sequence:
  1. finish independent v8.8 PACKER→EXECUTOR→AUDITOR;
  2. if v8.8 fails, repair that failure first and do not start an R5 behavior patch;
  3. if v8.8 passes, run a bounded independent R5 source-quality replay/shadow using existing long-lived backtest lanes, then request production-patch approval;
  4. never change canonical candidate decisions during a shadow.
- Historical controls: the six proposals above; at least two historical clean positive shapes including `S6-JS-PREFIXBOUND`; WebGraph/HNSW broad-claim sentinels; Knative/UST/GIN source/action corrections; M1 tool-stack negative; at least six structural negatives and four resource/unfrozen controls already required by v8.8.
- Shadow-run plan: two future waves, canonical v8.8 path unchanged and R5 source-depth path noncanonical; one breadth and one depth slot only when a near-miss exists; no experiments/downloads/candidate creation by the shadow.
- Success criteria:
  1. funnel reports separate row-events, unique families, repeated reviews, deep reviews, briefs, clean briefs and decisive StageA observations in 100% of shadow handoffs;
  2. all six historical proposal packages recover their cutoff-available material source/config corrections; AIGER remains eligible rather than being falsely rejected;
  3. WebGraph/HNSW broad-claim leakage is `0/2`;
  4. 100% of proposed shadow briefs contain the bounded source-role passport and R2 atomic certificate;
  5. Stage0 finds zero omitted cutoff-available minimum-set direct subtractor in two shadow waves;
  6. structural negatives remain unproposed `6/6`, terminal revival is zero, and resource/unfrozen controls are not mislabeled as scientific STOP;
  7. top-three and 8–12-source caps are respected; cost per clean brief and decisive StageA observation is reported honestly, not assumed improved;
  8. over the next six independently confirmed Stage0 packages, report preclaim-fidelity closure and decisive-observation rates; StageA PASS count is monitored but never made an admission quota.
- Rollback condition: any hard-gate relaxation, terminal revival, source passport becoming unbounded, positive-control recall regression, M1 accepting tooling without a phenomenon, or no clean-brief precision improvement under the bounded cost. Revert the source-scheduling delta; candidate states require no rollback.

## Mainline handoff

- User approval already present: `false` for R5 changes. The user authorized this audit, not a new production patch or backtest assignment.
- Files proposed for change: after validation only, `rules/ROLE_MAINLINE.md`, `rules/ROLE_DISCOVERY.md`, `templates/TOPIC_BRIEF.md`, and the minimal future telemetry/schema fields needed to distinguish funnel units. No new rule file or role is recommended.
- Registry migrations proposed: none for existing candidates; future wave telemetry only.
- Existing active/blocked/hold/terminal topics affected: none. AIGER remains under its frozen StageA assignment; GIN stays HOLD; all STOP remain terminal.
- Shared files modified: `false`

