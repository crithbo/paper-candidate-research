# Rule Change Proposal

## Proposal identity

- `audit_id`: `RULE-AUDIT-20260810-FULL-SYSTEM-AI-AUTONOMY-R3`
- `proposal_id`: `AI-AUTONOMY-USER-TIME-AND-CONTROL-PLANE-V9-PROPOSAL-R3`
- `decision_label`: `PATCH_RECOMMENDED`
- `user_policy_approval_required`: `PRESENT_FOR_DIRECTION_AND_RULE_CHANGE_BY_CURRENT_USER_INSTRUCTION`
- `backtest_required`: `ONLY_FOR_P2_DISCOVERY_STAGE0_BEHAVIOR_CHANGE`
- `migration_validation_required`: `YES_FOR_P1_REGISTRY_TEMPLATE_REFACTOR`
- `shared_writer`: `MAINLINE_ONLY`
- `production_patch_authorized_for_sentry`: `false`

## Problem statement

The current pipeline is optimized primarily for academic filtering and stage safety. It does not fully encode the user's operational objective: AI should autonomously perform most claim-critical discovery, implementation, evaluation, analysis and paper preparation, while the user spends limited time only at true authority or scientific-policy boundaries. High-value topics whose critical path is human-owned must remain visible and recoverable.

The scientific gates are largely correct. The control plane is not. It lacks an operational user-time/autonomy contract, mixes multiple state dimensions into 72 ad hoc `status` values, repeats the same facts across 973 template lines, embeds common policy in eight role files, uses fixed WIP/calendar/model parameters as if they were scientific rules, and has no authoritative pipeline after `FORMAL_CANDIDATE`. A project-level hardware Stage B skill also references obsolete/nonexistent control paths.

This proposal therefore separates four change packages so that quality behavior is not silently altered by a documentation cleanup.

## Current rule

- File/heading: `AGENTS.md`“核心目标”; `rules/ROLE_MAINLINE.md`“AI、资源与授权”.
- Current behavior: academic value controls retention; AI executability provides bonus/routing; no explicit user-attention objective or operational denominator.
- Insufficiency: the scheduler cannot compare two equally viable topics by expected user burden, AI-owned critical work, information gain or fidelity closure cost.

- File/heading: `rules/ROLE_MAINLINE.md`“状态机”; `registry.yaml`.
- Current behavior: 18 formal states coexist with 72 different generic `status` strings that include scientific, task, artifact and UI meanings.
- Insufficiency: machine decisions require string-specific knowledge and risk confusing archived task windows, blocked execution and scientific disposition.

- File/heading: all stage templates and `templates/HANDOFF.yaml`.
- Current behavior: each stage repeats object, claim, tier, baselines, collision, full-cost, AI and authorization fields.
- Insufficiency: manual duplication creates drift and unnecessarily expands AI context/output.

- File/heading: `rules/ROLE_STAGE0_REVIEW.md`“目标”“PRIMARY 必做”“PASS 条件”.
- Current behavior: the goal says no implementation/proof/positive result is required, while natural headroom language can be read as an existing positive-result prerequisite.
- Insufficiency: this has already produced a policy-conflict pattern in WebGraph-like reviews.

- File/heading: `projects/README.md` and pipeline terminal.
- Current behavior: the controlled pipeline ends at Formal Candidate; formal paper work is unspecified.
- Insufficiency: the user's final outcome is a defensible, reproducible submission package, not a candidate label.

- File/heading: `.agents/skills/hardware-stageb-runner/SKILL.md` and references.
- Current behavior: reads `RESEARCH_CONTROL_STATUS.md` and `stage-b/_shared/`, neither of which exists in the current project.
- Insufficiency: stale instructions can block or misroute the most costly execution stage.

## Proposed minimum delta

### Package P0 — clarification and compatibility repairs

| File | Heading/field | Current semantics | Proposed semantics |
|---|---|---|---|
| `AGENTS.md` | Core objective | Academic target plus advisory AI executability | Add the operational objective: under hard gates, maximize AI-owned claim-critical work and publishable evidence per unit of user attention; preserve high-value human-core topics. |
| `AGENTS.md`, `ROLE_MAINLINE.md`, `ROLE_RULE_AUDIT.md` | Authority | User approves; mainline writes; SENTRY proposes, but direct authorization wording is implicit | Define `POLICY_AUTHORITY=user`, `SHARED_FILE_WRITER=mainline`, `AUDIT_PROPOSAL_AUTHOR=RULE-AUDIT-SENTRY`. User authorization does not require a second generic permission request, but does not permit unsafe concurrent writers. |
| `ROLE_STAGE0_REVIEW.md` | PRIMARY item 7 / PASS natural headroom | May imply an observed positive result is mandatory | Require `SOURCE_GROUNDED_NATURAL_OR_FORMAL_OPPORTUNITY_HYPOTHESIS` plus a finite falsifier. Existing public/static/low-cost quantitative evidence is preferred when available; missing candidate output/positive result alone is not STOP. Undefined object/opportunity or structurally untestable route remains STOP. |
| `ROLE_CANDIDATE_OWNER.md`, `ROLE_STAGEA_REVIEW.md` | full-cost terminology | Directional Stage A requirement and complete Stage B closure are not named separately | Define `STAGEA_DIRECTIONAL_FULL_COST`: all decisive dimensions measured/bounded on the pilot, sufficient for the risk decision; define `STAGEB_PAPER_GRADE_FULL_COST_CLOSURE`: final scale, statistics, failure regions and formal claim coverage. No dimension may be omitted at Stage A. |
| `ROLE_CANDIDATE_OWNER.md`, `ROLE_STAGE0_REVIEW.md` | route-specific evidence | Some minimum wording assumes runnable natural workload even for formal/theory routes | Use `natural workload or canonical formal object/problem family`, with reproducible generators/instances and real relevance. This is a route clarification, not a relaxation of natural-object honesty. |
| hardware Stage B skill and references | project entry and paths | obsolete `RESEARCH_CONTROL_STATUS.md`, `stage-b/_shared/` | Read `AGENTS.md`, `plan.md`, `registry.yaml`, candidate approval packet and `stages/stageB/`; use mainline-registered shared assets only. Refuse initialization if `stageb_user_approval_id` and assignment/write boundary are absent. |
| Mainline/role rules | durations and model names | normative wall-clock/model strings | Keep as configurable planning defaults in registry/plan. Scientific rules state capability class, bounded work units and resource envelope. |

P0 does not change a candidate state, quality tier, revision limit, user gate or admission threshold. It aligns conflicting subordinate text with existing authoritative semantics.

### Package P1 — normalized control plane and concise rules

| File | Heading/field | Current semantics | Proposed semantics |
|---|---|---|---|
| new `rules/CORE_POLICY.md` | common policy | repeated in AGENTS and role files | One versioned definition of quality tiers, invariant gates, collision classes, evidence ceilings, revision/pivot/blocker/hold semantics, user gates, state axes and shared terminology. Every assignment records the core-policy SHA-256. |
| all role rules | common sections | self-contained copies of common policy | Retain only identity, minimum inputs, allowed actions, decision rights, required outputs, role-specific gates and escalation. Reference pinned core policy for invariants. |
| `registry.yaml` schema v9 | state model | composite strings and mixed topic/task/UI states | Use orthogonal fields described below; keep a compatibility renderer for old labels during shadow migration. |
| new canonical topic files | repeated facts | brief/report/handoff duplicate immutable facts | Introduce `TOPIC_CONTRACT.yaml`, `EVIDENCE_LEDGER.yaml`, and `AUTONOMY_AND_USER_BUDGET.yaml`; stage reports record judgments/deltas and reference hashes. |
| `templates/HANDOFF.yaml` | large copied record | second copy of topic facts | Reduce to identity, pinned contract/ledger/policy hashes, stage decision/tier/ceiling, unresolved risks, next killer, user request, assignment/lane state and artifact manifest. |
| stage templates | all sections | exhaustive repeated questionnaires | Keep mandatory stage-specific gates and extension blocks; generate shared facts from canonical data. |
| `history.md` | long chronology | 1,315 lines of policy epochs and batch details | Retain recent policy changes, terminal failure kernels and migrations; move old chronological detail to read-only dated archive. Do not delete terminal kernels. |
| model routing | fixed names in rules | requires rule edits on model changes | Use capability aliases such as `FAST_RESEARCH`, `DEEP_RESEARCH`, `FINAL_ADJUDICATION`; map aliases to available models in registry/plan. |

#### Proposed orthogonal state schema

```yaml
topic_stage: STAGEA
scientific_disposition: ACTIVE
quality_tier: TIER_B_Q2_VIABLE
execution_state: BLOCKED
assignment_state: NONE
revision:
  scientific_used: 0
  mechanism_pivot_used: 0
  preclaim_corrections: 1
authorization:
  stageb_approval_id: null
  formal_project_approval_id: null
blocker:
  kind: TOOLCHAIN
  evidence_ceiling: RESOURCE_FAILURE_ONLY__NO_SCIENTIFIC_INFERENCE
lane:
  lane_id: null
  state: COLD_IDLE
```

Rules:

- `execution_state=BLOCKED` never changes `scientific_disposition` to STOP or reserve.
- `lane.state` and UI archive never appear in topic state.
- artifact acceptance and hash verification are artifact fields, not topic status.
- `PENDING_USER_STAGEB_REVIEW` may remain a `topic_stage` compatibility value or be derived from `topic_stage=STAGEA`, independent PASS and missing Stage B approval; one representation must be canonical.
- every old status receives a documented compatibility mapping; ambiguous values are quarantined for mainline adjudication without state mutation.

#### Proposed autonomy contract

For each claim-critical step, record:

```yaml
claim_critical_steps:
  - id: strongest_baseline_reproduction
    weight: 4
    owner: AI
    replayable: true
    evidence: path-and-hash
    expected_user_minutes: 0
  - id: private_device_access
    weight: 3
    owner: USER_OR_EXTERNAL
    replayable: false
    expected_user_minutes: 20
    trigger: only_if_public_same-semantics_route_fails
```

Keep compatibility labels, but define them operationally:

- `AI_CORE_EXECUTABLE`: AI can reach the next mandatory user gate within the standing resource envelope; no human research step decides the claim.
- `AI_CORE_CONDITIONAL`: a finite external/user action is named, costed and non-scientific; AI resumes after it.
- `AI_AUXILIARY_ONLY`: at least one claim-critical scientific step is human-owned; if academic tier passes, route to reserve.

`ai_core_fraction` becomes a disclosed weighted interval derived from the ledger, not a free-form percentage.

#### Proposed execution-priority vector

Ordering is lexicographic, not one opaque scalar:

1. academic tier and hard-gate status;
2. expected decision information gain;
3. current-collision confidence and atomic-contract completeness;
4. Stage A fidelity-closure effort;
5. AI autonomy class and expected user minutes;
6. compute/storage/resource cost;
7. portfolio diversity.

Tier A/B topics are never academically dropped by low autonomy. Human-core topics go to reserve with a preservation/reactivation contract.

### Package P2 — consolidated v8.8 Discovery/Stage 0 behavior patch

P2 incorporates, rather than duplicates, R1/R2:

| Area | Proposed semantic delta |
|---|---|
| Discovery collision | Require closest current same-object paper, first-party sibling/released implementation family, generic method kernel and current deployed/configuration union, each with cutoff/read scope or bounded `NOT_FOUND_WITHIN_SEARCH`. |
| Atomic action certificate | Freeze object/guarantee, information, legal baseline/candidate action and decision rules, nontrivial property/complexity target, model-level divergence witness, full-cost scope and finite native falsifier. |
| Algorithm residual | Action/hook/config availability is not algorithm absorption; require same-information same-contract replay of method/property at full cost, or show decision/information/complexity/quality/guarantee/full-cost/generality residual. |
| Model/native boundary | Discovery/Stage 0 require a coherent model-level certificate and finite native killer, not candidate implementation, native output or positive natural result. Native realization is the first Stage A fidelity killer. |
| Search allocation | Bounded broad scan, top-k candidate-grade deep review, zero proposal allowed. Fixed counts are budgets, not output targets. |
| Stage A ordering | Queue-only readiness/autonomy/information-gain priority after independent Tier A/B confirmation; never an admission gate. |

P2 remains `BACKTEST_REQUIRED`. The user has authorized rule improvement; the backtest is the scientific regression test that determines whether this semantic patch is safe.

### Package P3 — AI-led formal paper project

Add the following authoritative flow after `PENDING_USER_DECISION` and explicit formal-project approval:

```text
FORMAL_PROJECT_ACTIVE
  -> EVIDENCE_COMPLETION
  -> MANUSCRIPT_DRAFT
  -> REPRODUCIBILITY_AND_CITATION_AUDIT
  -> INDEPENDENT_MANUSCRIPT_REVIEW
  -> USER_FINAL_RELEASE_REVIEW
  -> SUBMISSION_PACKAGE_READY
```

New `rules/ROLE_PAPER_PROJECT.md` should specify:

- only a user-approved formal candidate may enter;
- AI owns reproducible experiment completion within the approved envelope, analysis, plots/tables, claim-evidence mapping, manuscript drafting, citation checks, limitations and artifact packaging;
- every claim maps to an evidence-ledger item or is marked unsupported;
- no fabricated citation/result, no silent exclusion of negative runs, no claim above evidence ceiling;
- independent manuscript reviewer did not author the decisive analysis/draft section under review;
- user-only decisions: authorship/contribution, unpublished ownership, venue, paid/controlled resources, claim-changing interpretation, external communication and final submission;
- the project may be blocked or returned for revision without changing the scientific Stage B acceptance history;
- `academic-research-suite` supplies the substantive writing/reviewer/integrity workflows; project rules supply authority and artifacts.

Minimum templates:

- `FORMAL_PROJECT_PLAN.md`
- `CLAIM_EVIDENCE_MATRIX.yaml`
- `REPRODUCIBILITY_PACKAGE.yaml`
- `MANUSCRIPT_AUDIT_REPORT.md`
- `USER_FINAL_RELEASE_PACKET.md`
- `SUBMISSION_CHECKLIST.md`

### Package P4 — human research reserve lifecycle

Each reserve item must have:

- quality tier and value rationale;
- exact human-owned claim-critical step;
- estimated user/researcher time, resource and expertise;
- minimum reactivation action and acceptable substitutes;
- preserved artifact/contract hashes;
- current-collision refresh trigger/date;
- AI work that can proceed without the human step;
- archive/withdrawal policy chosen by the user.

Reserve is shown in a separate ranked portfolio packet and never counted as failed AI work or terminal STOP.

## Safety invariants

- Q2 minimum preserved: yes.
- Q1 priority preserved: yes.
- Same-object preserved: yes.
- Latest collision preserved: strengthened in P2.
- Fair current strong baseline preserved: yes.
- Natural input/evidence preserved: yes; formal routes use canonical real problem objects, not synthetic claim laundering.
- Full-cost preserved: Stage A directional and Stage B paper-grade meanings are clarified; no cost dimension is dropped.
- Reproducibility preserved: strengthened by canonical ledgers and project package.
- Claim ceiling preserved: yes.
- STOP non-revival preserved: yes; migration is state-preserving.
- User Stage B approval preserved: yes.
- Formal project/final submission approval preserved: yes.
- Resource failure remains non-scientific: yes.

## State and compatibility migration

- Existing scientific states affected: none during shadow mode.
- Existing assignments affected: none; no automatic resume, rerun or revision.
- Existing blocked/paused/hold topics: preserve exact blocker, resume directory and scientific revision accounting.
- Existing terminal topics: map to `scientific_disposition=STOP`; never reevaluate or rename.
- Existing reserve topics: map to `HUMAN_RESERVE`; populate missing reactivation fields from current records without inventing facts.
- Template compatibility: old reports remain immutable and readable; normalized files are created only for future assignments or as read-only derived views.
- Old filename compatibility: canonical old handoff/manifest names remain readable during migration.
- One-time migration required: yes for registry/control-plane P1; no for P0; P2 only affects future assignments after backtest; P3 affects only user-approved formal projects.
- Rollback path: preserve a full current registry snapshot; keep current parser authoritative until two successful dual-validation cycles; delete only derived v9 views on rollback.

## Validation plan

### P0 mechanical validation

1. Replay wording on WebGraph and GIN: missing native output/positive result alone never yields structural STOP.
2. Replay a true direct-absorption and a structurally unclosable object: both still STOP/DROP.
3. Hardware skill preflight fails closed without `stageb_user_approval_id`, resolves only current project paths when present, and writes only the assigned Stage B directory.
4. Candidate state/revision/hash counts remain byte-identical.

### P1 shadow migration

1. Produce a deterministic old-status→axis mapping table.
2. Before/after counts must match for topics, Stage 0 PASS, Stage A PASS/STOP, blocked, paused, hold, reserve, terminal and formal candidates.
3. Every artifact pointer and recorded SHA remains resolvable or is explicitly labeled historical/deleted by an authorized cleanup record.
4. Two mainline update cycles must be representable in both old and new schemas without conflicting scientific state.
5. Stage report generation from canonical contract/ledger must produce zero object/tier/baseline/authorization conflicts on at least five heterogeneous historical packages.
6. Rollback if any topic has ambiguous scientific disposition, revision count changes, blocker is lost or terminal state changes.

### P2 sealed historical backtest

Use the accepted R2 protocol and thresholds:

- WebGraph and HNSW sentinel minimum-set recall `2/2`, broad-claim leakage `0/2`;
- structural negatives `6/6` not packaged;
- at least `5/6` positive shapes receive candidate-grade deep review and `4/6` remain proposal-grade or explicitly non-structural-unfrozen;
- at least `3/4` resource/unimplemented controls are not misclassified as structural scientific failure;
- every proposal has full action certificate and provenance;
- every Stage 0 replay distinguishes model certificate from native result;
- terminal revival `0` and all hard-gate violations `0`;
- two shadow waves have no minimum-set direct subtractor first discovered only after intake.

### P3 project dry run

1. Use a template-only dummy plus one frozen archived evidence package; do not create new scientific claims.
2. Every draft claim maps to evidence, limitation or unsupported status.
3. Reproducibility and citation/integrity audits are mandatory before user final packet.
4. External submission, authorship and venue selection remain impossible without user approval.
5. Measure AI-owned work and actual user minutes for the dry run.

### Portfolio acceptance metrics

- hard-gate violation `0`;
- terminal revival `0`;
- user minutes and user decisions per independent Stage A PASS trend downward without decreasing quality-tier precision;
- duplicate artifact conflicts `0` after normalized template adoption;
- all reserve entries have complete reactivation contracts;
- registry status axes validate deterministically;
- formal projects, when available, can reach a reproducible submission package with explicit user-only boundaries.

## Risks and mitigations

| Risk | Impact | Mitigation |
|---|---|---|
| Central core policy becomes a single point of error | all roles inherit a bad change | pin version/hash per assignment; require explicit migration/backtest labels; role-specific constraints can only tighten core. |
| Autonomy metric is gamed by choosing a favorable denominator | AI readiness overstated | enumerate weighted claim-critical steps and ownership evidence; report interval and user minutes, not just percentage. |
| Low user-time objective suppresses high-value human work | false loss of ambitious topics | academic tier decides retention; autonomy decides automatic queue vs reserve only. |
| Registry migration loses exception states | blockers/revisions/terminal kernels corrupted | dual-read shadow, deterministic map, frozen snapshot, count/hash reconciliation and rollback. |
| Shorter templates hide necessary nuance | integrity/claim ceiling omitted | canonical ledgers are mandatory; stage-specific extension blocks remain; no field is removed before conflict/usage analysis. |
| New paper phase creates uncontrolled scope/cost | AI launches expensive formal experiments | formal-project user gate, standing envelope, phase budgets, decision-changing checkpoints and final user release gate. |
| Discovery patch increases weak briefs | Stage A waste | P2 backtest and shadow waves; no quota; academic hard gates unchanged. |

## Implementation order

1. **P0 clarification/path patch** — small, immediate, reversible, state-preserving.
2. **P1 schema/design freeze** — mainline produces exact schemas and compatibility map; no production cutover.
3. **P2 v8.8 sealed backtest** — independent PACKER/EXECUTOR/AUDITOR; apply only on pass.
4. **P1 shadow implementation** — dual-read registry and normalized artifacts for future assignments; two validation cycles.
5. **P3 paper-project scaffolding** — dry run before first formal project.
6. **Compaction cutover** — shrink role rules/templates/history only after old/new equivalence is demonstrated.

This order keeps immediate ambiguity fixes separate from admission behavior and from high-risk state migration.

## Decision request

The user has already authorized rules to be improved and has stated the desired optimization target. Therefore:

- mainline may treat P0 as an authorized clarification/compatibility patch after its mechanical diff review;
- mainline may start designing the P1 schema and shadow migration without changing authoritative state;
- P2 production behavior remains prohibited until the registered sealed backtest passes; the backtest is required scientific validation, not a request to weaken gates;
- P3 may be scaffolded and dry-run without a real candidate, but a real formal project still requires per-topic user approval;
- RULE-AUDIT-SENTRY remains prohibited from directly editing shared control files under the current single-writer architecture.

Mainline should return a compact implementation record: exact files changed, core-policy hash, migration/backtest result, preserved counts, rollback point and any user-only decision still required.

