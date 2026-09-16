# PHASE_CLOSEOUT_STORAGE_LIFECYCLE_V1 — Advisory Draft

Status: `PROPOSAL_ONLY__NOT_AUTHORITY`

## 1. Purpose

Prevent unbounded assignment-local storage growth while preserving the minimum evidence needed to audit scientific decisions, reproduce decisive observations, resume nonterminal topics and prove terminal non-revival.

This policy governs artifact lifecycle only. It does not change scientific admission, PASS, REVISE, HOLD, BLOCKED, RESERVE, STOP, Stage B approval or formal-project authority.

## 2. Scope

Applies to future resource-producing Discovery、Stage0、StageA、StageB、review、backtest and formal-project assignments after explicit user approval and MAINLINE cutover.

Legacy directories are grandfathered. They require a separate inventory, exact target list and approval.

## 3. Required assignment fields

Every new resource-producing assignment freezes:

- `ARTIFACT_LIFECYCLE_MODE=OFF / DRY_RUN / PRODUCTION`;
- policy path/version/SHA256;
- `post_close_retained_bytes_max`;
- stage closeout event and downstream consumer;
- cleanup owner;
- allowed automatic deletion classes;
- archive/capsule path;
- legacy behavior (`NOT_APPLICABLE / GRANDFATHERED / MIGRATION_APPROVED`).

Missing mode fails closed to `OFF`; it does not affect scientific state.

## 4. Inventory fields per entry

Each entry records:

- exact relative and absolute path;
- logical bytes and hash/hash scope;
- resource class and creating run;
- `claim_critical: true/false`;
- `reproducibility_minimum: true/false`;
- `downstream_consumers[]`;
- `reacquirable: true/false/unknown`;
- deterministic source URI/version/commit/license/hash when reacquirable;
- `retention_class`;
- `delete_after_gate`;
- `retention_expiry_or_review_gate`;
- recovery/rebuild command contract;
- deletion receipt reference.

No persisted entry may remain unclassified at accepted handoff.

## 5. Retention classes

### 5.1 KEEP_CAPSULE_CLAIM_CRITICAL

Small decisive result, minimum counterexample/witness, exact result table, independent decision, full-cost/denominator evidence or other material without which the scientific conclusion cannot be audited.

### 5.2 KEEP_CAPSULE_REPRODUCIBILITY_MINIMUM

Commands, config, version/commit, license, environment lock, small test fixture and provenance necessary to reconstruct deleted material.

### 5.3 TRANSFER_TO_DOWNSTREAM_THEN_DELETE_SOURCE_COPY

An input consumed by the next phase. It may be deleted from the upstream assignment only after downstream records exact path/hash and accepts the input freeze.

### 5.4 REACQUIRABLE_DELETE_AFTER_HANDOFF

Public source checkout, downloaded archive, portable toolchain or environment whose deterministic source/version/hash/license and recovery route are frozen. Delete only after accepted handoff/capsule.

### 5.5 EPHEMERAL_DELETE_BEFORE_CLOSEOUT

Build tree、cache、tmp、failed partial、superseded extraction and nondecisive intermediate. Claim-critical files inside must first be extracted and content-hashed into the capsule.

### 5.6 RESUME_CRITICAL_UNTIL_UNBLOCKED

Material required to resume a blocked/reserve/hold topic and not reliably reacquirable. It is not eligible for automatic cleanup.

### 5.7 SHARED_ASSET_REFERENCE_ONLY

Read-only asset referenced by registered ID/hash. Assignment-local duplicate is deleted after consumer validation unless needed for mutation/reproduction.

### 5.8 RETENTION_EXCEPTION_USER_APPROVAL_REQUIRED

Large or ambiguous content that exceeds the closeout budget or lacks a deterministic recovery route. It requires reason, bytes, evidence links, user approval and a future review gate.

## 6. Closeout protocol

1. Owner stops all processes and finalizes `RESOURCE_INVENTORY.yaml`.
2. Owner generates `PHASE_CLOSEOUT_RETENTION.yaml`, classifying every persisted entry.
3. Owner extracts all claim-critical small files from deletable build/env/cache/tmp trees.
4. MAINLINE accepts or rejects the scientific handoff independently of cleanup.
5. For a transition, downstream accepts exact inputs/hashes.
6. MAINLINE seals the phase or terminal capsule.
7. Cleanup owner validates exact leaf targets, containment, reparse, active process, inventory class and preconditions.
8. Only authorized leaf descendants are deleted.
9. `CLEANUP_RECEIPT.yaml` records targets、bytes、file counts、recoverability、actor、time and retained hashes.
10. MAINLINE verifies retained material and updates `artifact_lifecycle_state`.

## 7. STOP closeout

After terminal acceptance:

- keep one terminal capsule;
- delete nondecisive raw, source, build, toolchain, downloads, env, cache and tmp by default;
- preserve actual decisive small evidence, not merely prose summaries;
- archive the task window only after capsule/receipt registration;
- retain terminal identity and failure kernel in registry/history;
- do not rename or revive the topic.

If decisive raw evidence is large, select the smallest sufficient subset or compressed canonical object; otherwise require retention exception. Do not silently replace raw evidence with an unverified summary.

## 8. Transition closeout

### Discovery → Stage0

Keep the clean brief、source/evidence ledger、current loci、collision matrix、fidelity closure plan、handoff and manifest. Delete caches, temporary downloads and nonselected material after exact references are frozen.

### Stage0 → StageA

Keep Stage0 reports、confirmation、atomic contract、claim/falsifier matrix and exact StageA input freeze. Remove duplicate source and review copies after StageA acknowledges the inputs.

### StageA → StageB review

Keep decisive results、minimum raw/witness、full-cost、comparators、commands and environment/source provenance. Delete build/cache/tmp immediately; retain unique replay dependencies until the user decides Stage B.

### StageB → formal project

Formal-project reproducibility rules dominate. Transfer approved canonical material to registered assets/project package before deleting assignment-local copies.

## 9. Nonterminal closeout

Blocked、reserve and hold are not terminal. Generate `RESUME_CAPSULE.yaml` containing blocker、exact resume point、required resources、reacquire route、scientific revision state and evidence ceiling.

Only superseded/rebuildable ephemeral leaves may be deleted. Unique resume-critical assets remain until user withdrawal, successful resume or explicit compaction approval.

## 10. Budgets and telemetry

Track per assignment/stage:

- created bytes;
- retained bytes after closeout;
- deleted bytes;
- retention ratio;
- GC lag control cycles;
- exception bytes;
- reacquisition/rebuild test result;
- downstream missing-input incidents;
- claim-critical drift incidents.

Budgets are management controls and cannot alter scientific decisions.

## 11. GC scheduling

- `SAFE_TO_DELETE_NOW`: before handoff where authorized.
- `SAFE_TO_DELETE_AFTER_ACCEPTED_HANDOFF`: same or next MAINLINE control cycle.
- transition copies: after downstream input acceptance.
- terminal resources: same control cycle as terminal capsule acceptance where practical.
- GC backlog beyond one control cycle must appear in `plan.md`; backlog cannot be hidden by lane reuse.

Scientific work need not wait for nonconflicting GC, but new resource-producing work on an over-budget assignment is blocked until GC or retention exception.

## 12. Safety and recovery

All current destructive-action protections remain. Automatic mode is limited to inventoried leaf descendants under the frozen resource root. Topic roots and canonical capsule paths are never deletion targets.

Deletion is not project-locally reversible. Recovery is by recorded reacquisition/rebuild. Production requires at least one successful recovery test in dry-run/shadow rollout.

## 13. Authority

- USER approves policy, automatic deletion classes, budgets and terminal archive semantics.
- MAINLINE applies shared-file changes, accepts capsules and executes/authorizes cleanup.
- Assignment owner classifies entries and proposes closeout; it cannot declare policy effective.
- RULE_AUDIT only audits and proposes.

