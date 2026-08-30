# Assignment Artifact Lifecycle — V1

Policy ID: `PHASE_CLOSEOUT_STORAGE_LIFECYCLE_V1`
Protocol revision: `V1`

Authoritative workspace root: `E:\project\writing\reserch`

## Purpose and non-scientific scope

This rule controls assignment-local storage from creation through phase closeout. It is orthogonal to scientific state: cleanup cannot create, strengthen, weaken or replace `PASS / REVISE / HOLD / BLOCKED / RESERVE / STOP`, cannot consume a scientific revision and cannot alter Q1/Q2, same-object, current collision, strong baseline, natural/canonical evidence, full-cost, reproducibility or claim ceiling.

It applies only to resource-producing assignments frozen after explicit production cutover. Legacy directories are `GRANDFATHERED`; they require a separate inventory, exact leaf targets and exact user approval. Missing lifecycle mode fails closed to `OFF` without scientific inference.

## Modes and artifact states

Assignment mode is exactly one of:

- `OFF`: schema may be present; no lifecycle action.
- `DRY_RUN`: classify, generate capsules/receipts and validate targets without deletion.
- `PRODUCTION_NEW_ASSIGNMENTS_ONLY`: authorized automatic classes may be deleted after every precondition passes.

Artifact state is orthogonal to topic state:

- `ARTIFACT_OPEN`
- `HANDOFF_ACCEPTED__GC_PENDING`
- `DOWNSTREAM_INPUTS_SEALED`
- `CAPSULE_SEALED`
- `GC_COMPLETE`
- `STORAGE_GC_BLOCKED__NO_SCIENTIFIC_INFERENCE`
- `RETAINED_WITH_EXCEPTION`
- `TERMINAL_CAPSULED`

## Required assignment freeze

Every new resource-producing assignment freezes:

- mode, policy path/version/SHA-256 and cutover ID;
- exact unique write directory, `RESOURCE_ROOT` and canonical inventory path;
- `post_close_retained_bytes_max`, cleanup owner and closeout event;
- downstream consumer or terminal event;
- allowed automatic deletion classes;
- phase/terminal/resume capsule and cleanup receipt paths;
- legacy disposition: `NOT_APPLICABLE / GRANDFATHERED / MIGRATION_APPROVED`.

## Required inventory classification

Before an accepted handoff, every persisted entry has exact relative/absolute path, logical bytes, hash or hash scope, creating run, claim-critical flag, reproducibility-minimum flag, downstream consumers, deterministic provenance/license/version/hash, reacquirability, recovery command, one retention class, deletion gate and receipt reference. Unclassified or ambiguous persisted entries block production cleanup and further resource-producing work on the same over-budget assignment; they do not affect scientific evidence already obtained.

Retention classes:

- `KEEP_CAPSULE_CLAIM_CRITICAL`
- `KEEP_CAPSULE_REPRODUCIBILITY_MINIMUM`
- `TRANSFER_TO_DOWNSTREAM_THEN_DELETE_SOURCE_COPY`
- `REACQUIRABLE_DELETE_AFTER_HANDOFF`
- `EPHEMERAL_DELETE_BEFORE_CLOSEOUT`
- `RESUME_CRITICAL_UNTIL_UNBLOCKED`
- `SHARED_ASSET_REFERENCE_ONLY`
- `RETENTION_EXCEPTION_USER_APPROVAL_REQUIRED`

Only these inventory dispositions are automatic-deletion eligible in production:

- `EPHEMERAL_DELETE_BEFORE_CLOSEOUT`
- `REACQUIRABLE_DELETE_AFTER_HANDOFF`
- `TRANSFER_TO_DOWNSTREAM_THEN_DELETE_SOURCE_COPY`
- legacy-compatible `SAFE_TO_DELETE_NOW`
- legacy-compatible `SAFE_TO_DELETE_AFTER_ACCEPTED_HANDOFF`

The following are never automatic: claim-critical capsule content, reproducibility minimum, resume-critical material, registered shared assets, retention exceptions, unclassified content and any root or parent directory.

## Phase closeout protocol

1. Owner stops assignment processes and finalizes `RESOURCE_INVENTORY.yaml`.
2. Owner writes `PHASE_CLOSEOUT_RETENTION.yaml` and extracts every claim-critical small file from deletable trees.
3. MAINLINE accepts or rejects the scientific handoff independently of cleanup.
4. For a transition, downstream records and accepts exact input paths/hashes before upstream copies become eligible.
5. MAINLINE seals the phase, resume or terminal capsule.
6. Cleanup owner verifies literal leaf targets, containment, consumer state, inventory class, recovery route, reparse absence and zero active owner/process.
7. Production deletes only eligible exact leaves and writes `CLEANUP_RECEIPT.yaml`.
8. MAINLINE revalidates retained hashes, receipt and post-close budget, then updates artifact state.

Lane release may precede nonconflicting GC. GC lag beyond one MAINLINE control cycle is visible in `plan.md`. New resource-producing work on the same over-budget assignment remains blocked until GC or an accepted retention exception.

## STOP and terminal capsule

STOP retains a minimal terminal evidence capsule, never report-only. After direct-fatal acceptance or independent terminal confirmation, preserve:

- terminal owner and independent reports, handoff and canonical manifest;
- exact object, claim/evidence ceiling, failure kernel and terminal identity;
- decisive result table and minimum raw counterexample/witness;
- full-cost/denominator evidence when decision-relevant;
- reproduce/reacquire commands, resource provenance and deleted-material ledger;
- cleanup receipt and forbidden terminal-revival identity.

Future terminal archive root is `stages/<terminal_stage>/_terminal/<topic_id>/<terminal_event_id>/`. Original topic roots retain `ARCHIVE_POINTER.yaml` plus approved in-place exceptions. Whole source/build/toolchain/download/env/cache/tmp trees are not retained by default, but no numerical budget may override claim-critical evidence. Legacy terminal topics remain in place until separately approved.

## Transition and nonterminal closeout

- Discovery zero/transition keeps handoff, selected evidence/source closure, current loci, clean brief when any, manifest and bounded abstention/closure record.
- Stage0 STOP/transition keeps owner/confirmation reports, atomic contract, minimum decisive source/witness and exact StageA input freeze when transitioning.
- StageA STOP keeps owner/gate decisions, decisive result/minimum witness, fair comparator, full-cost and reproduce/provenance.
- StageA PASS pending StageB keeps unique raw/replay dependencies and user review packet until the user decides StageB.
- StageB/formal-project retention follows the stronger topic-specific reproducibility contract.
- Blocked/reserve/hold writes `RESUME_CAPSULE.yaml`; unique or non-reacquirable resume-critical content is retained. Only confirmed superseded/rebuildable ephemeral leaves may be cleaned.

## Default post-close budgets

- Discovery capsule: `67,108,864 bytes`
- Stage0 STOP/transition capsule: `134,217,728 bytes`
- StageA STOP terminal capsule: `536,870,912 bytes`
- StageA PASS pending StageB: `2,147,483,648 bytes`
- StageB/formal project: assignment-specific

Budgets are management ceilings only. Exceedance requires `RETENTION_EXCEPTION.yaml`; it never authorizes deletion of scientific or reproducibility minimum evidence.

## Mechanical deletion preconditions

Path containment, literal-target, root blacklist, reparse and active-process safety are defined once by `rules/RESOURCE_LOCALIZATION.md`. Lifecycle cleanup additionally proves: accepted inventory/retention and handoff/capsule gate; claim-critical and reproducibility-minimum extraction; downstream acceptance before transfer deletion; reacquire/rebuild contract when required; pre/post count and bytes; and durable receipt plus retained-hash validation.

Failure produces `STORAGE_GC_BLOCKED__NO_SCIENTIFIC_INFERENCE`, consumes no scientific revision and leaves the scientific topic state unchanged.

## Rollout and rollback

Required rollout is `OFF_SCHEMA_ONLY → DRY_RUN_NO_DELETE → PRODUCTION_NEW_ASSIGNMENTS_ONLY`. Production requires dry-run coverage of Discovery zero output, Stage0 STOP, two StageA STOP cases, StageA PASS pending StageB and two blocked/reserve cases; all negative controls; at least one recovery replay; at least one downstream-read replay; zero evidence drift/missing input/resume break/wrong-root/reparse/unclassified entries; valid receipts; and all budgets or exceptions resolved.

Any evidence drift, downstream missing input, cleanup-caused resume failure, recovery failure, wrong-root/reparse or active-process violation rolls future mode back to `OFF`. Already deleted bytes are recoverable only through the recorded route.

## Authority

- USER approves policy, budgets, automatic classes and material exceptions.
- MAINLINE is the only shared-file writer, capsule accepter, closeout/recursive-GC owner and production cutover authority.
- Assignment owners classify entries and propose closeout; they may perform only explicitly frozen in-run ephemeral-leaf cleanup allowed by `RESOURCE_LOCALIZATION`, never closeout or recursive GC.
- RULE_AUDIT proposes and audits; it never installs policy or deletes artifacts.
