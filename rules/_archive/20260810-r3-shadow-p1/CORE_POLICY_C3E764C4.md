# Common Research Policy — Shadow v9

Status: `SHADOW_P1__NOT_YET_PRODUCTION_AUTHORITY`

This file defines the common policy proposed by the user-approved R3 audit. Existing assignments keep their frozen v8.7 rules. Until mainline records a production cutover after shadow validation, this file and `rules/_shadow_v9/` are preview controls only.

## Mission and authority

The project discovers, filters, tests and develops research directions that can support at least a credible Q2-equivalent paper, with Q1-equivalent potential preferred. Under those scientific gates, scheduling should maximize AI-owned, auditable claim-critical work and publishable evidence while minimizing routine user attention.

- `POLICY_AUTHORITY=USER`: the user approves policy exceptions, Stage B per topic, formal-project activation, authorship, venue, submission and external communication.
- `SHARED_FILE_WRITER=MAINLINE`: only mainline changes `AGENTS.md`, `plan.md`, `history.md`, `registry.yaml`, `rules/`, `templates/` and authoritative project structure.
- `AUDIT_PROPOSAL_AUTHOR=RULE_AUDIT_SENTRY`: the audit lane explains and proposes; it never applies shared changes.
- Explicit user approval for a named package is not requested again as a generic approval. It does not authorize concurrent shared writers or actions outside its scope.

## Quality tiers and contribution routes

- `TIER_A_Q1_POTENTIAL`: credible Q1/top-equivalent shape if the registered evidence route succeeds.
- `TIER_B_Q2_VIABLE`: credible Q2-equivalent paper shape; minimum continuation tier.
- `BELOW_Q2_STOP`: the Q2 shape fails a scientific hard gate.

At least one route must be nontrivial:

- `N1`: new abstraction, mechanism, representation or action.
- `N2`: new algorithm, joint optimization, approximation, data structure, complexity result or generalizable software construction.
- `N3`: new stable natural-workload law plus a mechanism that uses it.

AI readiness, missing commodity hardware or user burden never lower the academic tier. A Tier A/B topic whose claim-critical scientific step is human-owned goes to `HUMAN_RESEARCH_RESERVE`, not STOP.

## Non-relaxable scientific gates

Every advancing topic must preserve:

1. `SAME_OBJECT`: candidate and fair baselines solve the same function/problem with the same quality, protocol and information contract.
2. `LATEST_COLLISION`: current papers, first-party current implementation and relevant default/non-default action/configuration surfaces are checked to the registered cutoff.
3. `FAIR_CURRENT_STRONG_BASELINE`: named, version-compatible, same-information comparators receive a fair implementation/tuning budget.
4. `NATURAL_OR_CANONICAL_OBJECT`: evidence uses natural workloads or a canonical real formal problem family; synthetic cases may certify legality but cannot launder the main claim.
5. `FULL_COST`: no conclusion-changing preprocessing, search, planning, conversion, compile, memory, I/O, sync, validation, fallback, quality or resource cost is omitted.
6. `REPRODUCIBILITY`: inputs, versions, commands, seeds, stopping rules, raw outputs and hashes are recoverable.
7. `EVIDENCE_CLAIM_HONESTY`: wording never exceeds the evidence level or registered claim ceiling.

Q2 allows less breadth or scale than Q1; it does not relax these gates.

## Evidence, inference, hypothesis and ceiling

- `EVIDENCE`: a source, static certificate, formal proof object, executed observation or reproducible measurement that can be inspected.
- `INFERENCE`: a stated conclusion derived from evidence and assumptions; assumptions must be visible.
- `HYPOTHESIS`: a falsifiable proposition assigned to a later gate; it is not a result.
- `CLAIM_CEILING`: the strongest wording permitted by current evidence.

Stage 0 may pass a coherent conditional paper hypothesis without candidate implementation, positive natural result or complete theorem. Stage A positive evidence is normally limited to `NOT_FALSIFIED` or `PRELIMINARY_SUPPORT`. Stage B is the first stage intended to support a principal paper claim.

## Collision and algorithm-residual classes

- `DIRECT_FATAL`: same exact object, objective, substantive mechanism/algorithm, main guarantee/result, cost boundary and claim; scientific STOP/DROP.
- `DIRECT_SUBTRACT`: remove the occupied contribution and reassess the residual.
- `METHODOLOGICAL_ADJACENT`: related method, not automatic absorption.
- `DEPLOYMENT_BASELINE`: mandatory fair comparator, not automatic novelty failure.
- `SEARCH_BOUNDED_OPEN`: the documented search did not close every uncertainty; allowed before Stage B.

Action or configuration availability is not by itself algorithm absorption. Absorption requires the same-information, same-contract comparator to replay the candidate decision rule/property with fair full cost, or a proof that no residual remains in decision rule, information, complexity/resource, quality/guarantee, full-cost or generality.

When a proposal depends on “current implementation lacks X”, Discovery and Stage 0 independently perform `CURRENT_UPSTREAM_REALITY_CHECK`: current official documentation, pinned upstream source, relevant default and non-default flags/thresholds/configuration, and contrary evidence. Transport failure never proves absence.

## Stage semantics

### Discovery

Freeze a source-grounded opportunity, exact object, at least two non-synonymous mechanisms, current collision boundary, fair comparator set, model-level action certificate and finite Stage A fidelity/falsifier route. Output only `PROPOSE_STAGE0` or `DROP`. Missing candidate results is not DROP; a structurally unclosable object/action or direct absorption is.

### Stage 0

Judge whether the research would have a Tier A/B paper shape if successful and whether a finite Stage A route exists. Require a `SOURCE_GROUNDED_NATURAL_OR_FORMAL_OPPORTUNITY_HYPOTHESIS`, not a completed result. PRIMARY PASS/REVISE receives independent confirmation. Legal outputs are PASS, REVISE, RESERVE, HOLD where policy permits, BLOCKED for external execution gates, or scientific STOP.

### Stage A

Before the first claim-bearing observation, close `PRE_CLAIM_CONTRACT_FIDELITY_GATE`: complete frozen action, real comparator/native semantics, identical object/denominator, all decision-relevant cost dimensions and a small legality/equivalence witness. Then run the smallest real risk probe.

`STAGEA_DIRECTIONAL_FULL_COST` measures or conservatively bounds every cost dimension that could change the pilot decision. It does not require paper-scale statistics, but it forbids deferring a decisive cost.

### Stage B

Stage B starts only with a topic-specific, non-empty `stageb_user_approval_id` matching the mainline assignment. It develops the principal claim and closes `STAGEB_PAPER_GRADE_FULL_COST_CLOSURE`: paper scale, statistics, formal comparator parity, failure regions, orthogonal validation and main-claim coverage. Independent review follows.

### Formal project

No real topic enters `projects/<ID>/` without independent Stage B acceptance and explicit formal-project user approval. No authorship, venue, submission or external communication is automated.

## Revision, invalid construction and STOP

- Stage 0 and Stage A allow at most one scientific `REVISE_ONCE`; an explicitly preregistered `MECHANISM_PIVOT` may be used once without changing object, problem, main metric or target workload.
- Preclaim implementation/fidelity corrections before any claim-bearing observation do not consume scientific revision.
- If the only scientific revision is consumed and an independent gate finds the construction invalid while evidence supports neither PASS nor scientific STOP, use `INCONCLUSIVE_POLICY_HOLD`. Do not invent a second revision, reserve or STOP.
- STOP requires scientific evidence: direct collision, same-object failure, fair-union absorption, natural/canonical counterexample, formal refutation or full-cost elimination of the residual.
- A terminal STOP is never revived or renamed. A genuinely different object/problem receives a new ID.

## Resource failure and reserve

External download, permission, license, data, network, toolchain, hardware or required-user-input failure before claim-bearing evidence yields:

- `BLOCKED_USER_ACTION_REQUIRED`;
- ceiling `RESOURCE_FAILURE_ONLY__NO_SCIENTIFIC_INFERENCE`;
- unchanged scientific revision count;
- immutable failed attempt plus a new resume directory after unblock;
- an actionable blocker packet with exact error, versions/hashes/size/license, minimum user action, fallback, cost, safety boundary and resume point.

The lane may be released for other work. The topic remains in its stage and is neither archived nor sent to reserve. Reserve is only for a long-term human-owned scientific critical path or an explicit user choice.

## Orthogonal state axes for shadow migration

The v9 shadow view separates:

- `topic_stage`: lifecycle location;
- `scientific_disposition`: ACTIVE, PASS_RECOMMENDED, REVISE, HOLD, STOP, HUMAN_RESERVE or ACCEPTED;
- `execution_state`: QUEUED, ACTIVE, PAUSED, BLOCKED, AWAITING_REVIEW or COMPLETE;
- `assignment_state`: NONE, FROZEN, ACTIVE, HANDOFF_READY or ACCEPTED;
- `lane_state`: HOT_IDLE, COLD_IDLE or ACTIVE;
- `authorization`: explicit IDs and scopes;
- `blocker`: kind, action and evidence ceiling;
- `revision`: scientific, pivot and preclaim-correction counters.

UI archive and artifact acceptance never overwrite scientific state. During shadow mode, `registry.yaml` remains authoritative and ambiguous old labels are quarantined without mutation.

## Autonomy and user-attention contract

For each claim-critical step record owner, weight, replayability, evidence pointer, expected/actual user minutes and next mandatory user gate.

- `AI_CORE_EXECUTABLE`: AI can reach the next mandatory gate within the standing envelope; no human scientific step decides the claim.
- `AI_CORE_CONDITIONAL`: a finite, named external/user action is non-scientific and AI resumes afterward.
- `AI_AUXILIARY_ONLY`: at least one claim-critical scientific step is human-owned; Tier A/B routes to reserve.

Ordering is lexicographic: academic tier/hard gates; expected decision information gain; collision confidence/contract completeness; Stage A fidelity effort; autonomy/user minutes; resource cost; portfolio diversity. Autonomy never admits an academically weak topic or drops an academically viable one.

## Assignment, lane and handoff invariants

Every assignment freezes topic ID, stage/mode, input hashes, common-policy hash, role-rule hash, unique write directory, allowed actions/resources and user approval IDs. A running assignment keeps its frozen rules until handoff.

For every new resource-producing assignment, `ASSIGNMENT_RESOURCE_LOCALIZATION_V1` is also mandatory: `RESOURCE_ROOT=<unique_write_directory>\resources\`, the eight standard child directories, process-local redirect preflight, a durable sibling `RESOURCE_INVENTORY.yaml`, immutable per-run inventory snapshots and mainline-owned cleanup containment. Project-controlled downloads/builds/environments/configurable caches/temporary files may not persist elsewhere. System/application caches outside project control are external and have no D-drive guarantee. Only mainline registers reusable assets under `D:\project\writing\reserch\projects\_assets\<asset_id>\`.

Each long-lived lane handles one assignment, does not pre-read the next, writes only its directory, does not reuse unregistered facts/processes/artifacts across topics and returns to reusable idle only after mainline acceptance.

Every handoff records identity, frozen policy/role/contract/ledger hashes, decision/tier/ceiling, decisive evidence and unresolved risks, next killer, blocker/user request, authorization, lane state and canonical artifact manifest. Templates store data; the role manual supplies the decision procedure.

## Risk-tiered validation and readable reporting

Validation exists to protect scientific state, not to maximize checksum work. Routine, low-risk handoffs use one bounded acceptance pass: required files are readable, identifiers/write boundaries/decisions agree, key counts are plausible and a small sample of canonical artifacts is intact. Full recursive hash verification is reserved for scientific stage transitions, claim-bearing evidence, shared-policy changes, user-approval boundaries, formal-project/submission packages, destructive migration, contamination/leakage concerns, observed drift or a concrete dispute. An already accepted immutable artifact is not rehashed in every later control cycle unless there is evidence that it changed.

Manifests should be compact and prioritize canonical or claim-critical artifacts. An unambiguous checksum line is accepted despite harmless whitespace or hex-case differences; such formatting can be normalized later and is not a scientific blocker. A noncritical metadata/checksum defect receives one bounded mechanical correction and does not stop unrelated work. This does not relax reproducibility, source integrity or independent replay for Stage B and formal projects.

Human-facing reports lead with a plain-language outcome, evidence, uncertainty, next action and any user decision. Machine codes remain available in registry/handoff fields but are translated in the main narrative and long hashes normally stay in the artifact or a short technical appendix. Missing runtime telemetry is described plainly as unavailable and not estimated; it is never silently treated as zero.

## Positive and anti-examples

Positive: Stage 0 sees a static same-object action-divergence certificate, a current-source audit, a finite natural corpus route and a nontrivial algorithm/property target. It may conditionally PASS although the candidate has no implementation or positive result; Stage A must close native fidelity and run the killer.

Anti-example: a download fails before any claim-bearing observation. Calling the topic STOP or reserve because it appears difficult violates the blocker policy. The correct result is a resource-only blocker packet and an unchanged scientific disposition.
