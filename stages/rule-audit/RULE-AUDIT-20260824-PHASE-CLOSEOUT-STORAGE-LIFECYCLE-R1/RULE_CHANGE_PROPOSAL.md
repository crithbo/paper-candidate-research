# Rule Change Proposal

## Proposal identity

- `audit_id`: `RULE-AUDIT-20260824-PHASE-CLOSEOUT-STORAGE-LIFECYCLE-R1`
- `proposal_id`: `PHASE_CLOSEOUT_STORAGE_LIFECYCLE_V1`
- `decision_label`: `USER_POLICY_DECISION_REQUIRED`
- `secondary_label`: `PATCH_RECOMMENDED`
- `user_policy_approval_required`: `true`
- `scientific_backtest_required`: `false`
- `destructive_dry_run_required`: `true`

## Problem statement

Current storage rules localize resources and make explicit cleanup safe, but cleanup is not a required phase-closeout step. Handoffs may be accepted with `cleanup_status: NOT_REQUESTED`, repeated resume/revision directories retain rebuildable resources, and storage growth is discovered only after it becomes material. Recent cleanup recovered 34.93 GB without scientific-state changes, demonstrating a recurring lifecycle gap rather than an isolated accident.

## Proposed policy bundle

Install one coherent behavior package: `PHASE_CLOSEOUT_STORAGE_LIFECYCLE_V1`.

| Future file | Minimum semantic delta |
|---|---|
| `rules/ARTIFACT_LIFECYCLE.md` (new) | authority for retention classes, phase capsules, STOP capsule, GC states, budgets, exceptions and rollout |
| `AGENTS.md` | require artifact lifecycle hash/mode on new resource-producing assignments; scientific state remains independent |
| `rules/RESOURCE_LOCALIZATION.md` | add downstream consumer, retention class, post-close budget, capsule/receipt and required inventory finalization |
| `rules/ROLE_MAINLINE.md` | make closeout planning mandatory after accepted handoff; enforce GC queue/SLA and archive registration |
| stage role rules | owner proposes retention plan and extracts claim-critical small evidence before handoff |
| `templates/RESOURCE_INVENTORY.yaml` | add lifecycle and per-entry consumer/reacquire/delete-after fields |
| `templates/HANDOFF.yaml` | replace `cleanup_status: NOT_REQUESTED` default with required closeout state |
| new templates | `PHASE_CLOSEOUT_RETENTION.yaml`、`TERMINAL_EVIDENCE_CAPSULE.yaml`、`CLEANUP_RECEIPT.yaml` |

No shared files are modified in this assignment.

## Core rules

1. Every persisted resource receives exactly one retention class before handoff acceptance.
2. Every retained entry names a downstream consumer or a scientific/reproducibility reason.
3. No transition deletes upstream inputs until downstream input freeze/hashes are accepted.
4. STOP triggers a terminal capsule after independent confirmation or direct-fatal acceptance.
5. Artifact lifecycle state is separate from scientific topic state.
6. Cleanup failure emits `STORAGE_GC_BLOCKED__NO_SCIENTIFIC_INFERENCE`; it cannot cause STOP/reserve or consume revision.
7. Blocked/reserve/pending topics use a resume capsule and are not treated as terminal.
8. Large retention beyond stage defaults requires `RETENTION_EXCEPTION.yaml` with reason, bytes, owner, expiry/review gate and user approval when material.
9. Legacy directories are not automatically migrated.

## Retention classes

- `KEEP_CAPSULE_CLAIM_CRITICAL`
- `KEEP_CAPSULE_REPRODUCIBILITY_MINIMUM`
- `TRANSFER_TO_DOWNSTREAM_THEN_DELETE_SOURCE_COPY`
- `REACQUIRABLE_DELETE_AFTER_HANDOFF`
- `EPHEMERAL_DELETE_BEFORE_CLOSEOUT`
- `RESUME_CRITICAL_UNTIL_UNBLOCKED`
- `SHARED_ASSET_REFERENCE_ONLY`
- `RETENTION_EXCEPTION_USER_APPROVAL_REQUIRED`

## Stage contracts

| Closeout event | Default retained package | Default deletion scope |
|---|---|---|
| Discovery zero/no raw | handoff、ledger、manifest、bounded closure | downloads/build/env/cache/tmp; source copies if provenance sufficient |
| Discovery → Stage0 | brief、evidence ledger、source/current loci、handoff/manifest | material already copied/frozen downstream; caches and duplicates |
| Stage0 STOP | terminal report + independent confirmation + small decisive source/witness + provenance | resource trees、duplicate reviews、downloads/build/env/cache/tmp |
| Stage0 → StageA | Stage0 capsule and exact StageA input freeze | duplicated upstream resources after downstream acceptance |
| StageA STOP | owner/gate reports、decisive result table/minimal witness、full-cost、reproduce/provenance | source checkout、build、toolchain、download、cache/tmp unless exception |
| StageA PASS/pending StageB | StageA evidence/reproduction capsule | build/cache/tmp; retain unique raw and exact replay dependencies until user StageB decision |
| Blocked/reserve/hold | blocker + resume capsule | only confirmed rebuildable/superseded ephemeral leaves |
| StageB/formal project | per-topic reproducibility contract | only explicitly safe entries; stronger retention applies |

## Storage budgets

Budgets are management ceilings, never scientific gates. Proposed configurable defaults:

- Discovery closeout capsule target: `64 MiB`;
- Stage0 STOP/transition capsule target: `128 MiB`;
- StageA STOP terminal capsule target: `512 MiB`;
- StageA PASS awaiting StageB: `2 GiB` until user decision;
- StageB/formal project: assignment-specific;
- exceedance: allowed only via retention exception, never by silently deleting claim-critical evidence.

The user may approve different defaults. A numeric cap cannot override content-level evidence retention.

## State model

Scientific state remains unchanged. Add orthogonal artifact states:

- `ARTIFACT_OPEN`
- `HANDOFF_ACCEPTED__GC_PENDING`
- `DOWNSTREAM_INPUTS_SEALED`
- `CAPSULE_SEALED`
- `GC_COMPLETE`
- `GC_BLOCKED__NO_SCIENTIFIC_INFERENCE`
- `RETAINED_WITH_EXCEPTION`
- `TERMINAL_CAPSULED`

Mainline may release a lane after scientific handoff acceptance, but must keep a high-priority GC queue. A resource-producing successor on the same assignment cannot proceed while prior storage is over budget and `GC_PENDING` without an accepted exception.

## Terminal archive

For future topics, store the minimal terminal package at:

`stages/<terminal_stage>/_terminal/<topic_id>/<terminal_event_id>/`

The original topic directory retains only `ARCHIVE_POINTER.yaml` and any explicitly exempt in-place evidence until migration is accepted. Existing topics remain in place unless a separate legacy migration is approved.

`TERMINAL_EVIDENCE_CAPSULE_V1` must include:

- terminal scientific report and independent gate/confirmation;
- handoff and canonical hash manifest;
- exact object/claim/evidence ceiling and terminal failure kernel;
- decisive result table or minimum falsifier/witness;
- full-cost and denominator summary when decision-relevant;
- reproduce/reacquire commands and resource provenance;
- cleanup receipt and list/hash of deleted rebuildable materials;
- forbidden terminal-revival identity.

It must not retain whole source/build/toolchain trees by default.

## Safety invariants

- Q2/Q1 and all scientific gates unchanged.
- STOP identity remains terminal and non-revivable.
- Resource deletion cannot strengthen or weaken a scientific conclusion.
- No root, stage root, topic root, glob, unresolved variable or reparse traversal may be deleted.
- Claim-critical content is content-hashed before cleanup.
- Downstream consumers are sealed before upstream copies are deleted.
- Blocked/reserve/pending-gate recovery is preserved.
- Shared assets remain mainline-only and reference-counted.

## Rollout and rollback

- Start `DRY_RUN` on at least five heterogeneous historical cases.
- Require one reacquisition/rebuild replay and one downstream-read replay.
- Production applies to new assignments only.
- Rollback disables future cleanup and leaves plans/capsules intact; already deleted bytes are recoverable only through recorded reacquire/rebuild routes.
- Any evidence drift or recovery failure blocks production.

## Decision request

The user must decide:

1. whether to approve automatic deletion for `EPHEMERAL_DELETE_BEFORE_CLOSEOUT` and `REACQUIRABLE_DELETE_AFTER_HANDOFF` on future assignments;
2. whether the proposed stage budgets are acceptable;
3. whether future STOP topics use stage-local terminal capsule directories;
4. whether cleanup must complete before lane reuse or may run under a bounded GC SLA;
5. whether legacy migration remains separate and individually approved.

Until that decision and MAINLINE implementation at a safe boundary, current rules remain unchanged.

