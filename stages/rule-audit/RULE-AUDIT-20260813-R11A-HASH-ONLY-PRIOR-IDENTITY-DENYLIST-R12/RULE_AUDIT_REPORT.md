# Rule Audit Report

## Identity

- `audit_id`: `RULE-AUDIT-20260813-R11A-HASH-ONLY-PRIOR-IDENTITY-DENYLIST-R12`
- `trigger`: R11A Phase-1 checkpoint 008 forced gate
- `requested_by`: `MAINLINE`
- `date`: `2026-08-13`
- `write_directory`: `stages/rule-audit/RULE-AUDIT-20260813-R11A-HASH-ONLY-PRIOR-IDENTITY-DENYLIST-R12`
- `shared_files_modified: false`

## Question and scope

- User/process question: can a contamination-safe, hash-only prior-identity denylist close R11A's V8.8/R10 exclusion proof without exposing protected case information or changing the frozen method?
- Rules inspected: `AGENTS.md`; `plan.md`; `registry.yaml`; `rules/ROLE_RULE_AUDIT.md`; `rules/ROLE_DISCOVERY_BACKTEST.md`; R11A master/Phase-1 contracts.
- Instances inspected: checkpoint 008; only paths, schemas, counts and hashes from the two final V8.8 protected-key surfaces and the zero-case R10 failure surface.
- Out of scope: reading/copying target identities or case semantics; changing shared rules; contacting PACKER; running any method, stage, experiment, shadow, source download or automation.

## Current authoritative behavior

R11A freezes `prior_v8_8_case_identity_reuse: forbidden`, `r10_failed_case_reuse: forbidden` and `old_material_use: IDENTITY_HASH_DEDUP_AND_EXCLUSION_ONLY`. Phase 1 requires `stable_family_identity_hash` and `dedup_and_exclusion_proof`. The Packer may read a pre-existing prior V8.8 identity hash, but may not read or reuse old cases/outcomes.

Checkpoint 008 correctly treats the absence of comparable hashes as `BLOCKED_USER_ACTION_REQUIRED__CONTROL_PLANE_IDENTITY_DENYLIST`; it explicitly refuses to convert field absence into exclusion PASS or to derive identities from protected semantics.

## Evidence of a problem or of correct behavior

| Observation | Source/artifact | Repeated? | Classification |
|---|---|---:|---|
| No comparable pre-existing stable-family identity hashes exist on the authorized surfaces | checkpoint 008, SHA `B3C614...C3C1` | yes across both historical families | assignment-contract/interface gap |
| Packer did not read/copy identities or fabricate hashes | checkpoint 008 | one decisive gate | correct execution |
| Historical provenance contains 18 + 10 protected identity records; R10 has zero frozen cases | frozen handoffs/manifests | three surfaces | usable control-plane input, not Packer input |
| R11A authorizes reading existing hashes but not a new actor reading protected identities to derive them | Phase-1 contract | structural | authorization gap |
| Scientific/resource envelope remains open and no candidate/method inference exists | checkpoint 008 | current | non-scientific blocker |

The failure is not evidence against V9 and not a reason to lower thresholds. It is a missing compatibility artifact between legacy protected identity schemas and the R11A stable hash field.

## Risk analysis

- False-negative risk: without a denylist, every family remains ineligible; this is a process false negative, not scientific rejection.
- False-positive/weak-paper risk: accepting absence as exclusion PASS would permit old-case reuse and invalidate blind calibration.
- Scientific-integrity risk: exposing identities, outcomes or labels to Packer would contaminate the benchmark. A plain LLM curation lane also creates unnecessary memory/leak risk.
- Resource/time risk: low for a deterministic 28-record transform; high if the project instead repeats literature search while the control artifact is missing.
- State-migration risk: low if implemented as an additive R11A control artifact and resume amendment; high if original contracts/checkpoints are overwritten.
- Terminal-revival risk: none; no candidate lifecycle state changes.
- Residual hash-preimage risk: public identifiers can be guessed. Mitigation is to keep the full denylist control-private and expose only committed-candidate intersection results, not the prior digest set.

## Recommendation

- Decision: `USER_POLICY_DECISION_REQUIRED__ASSIGNMENT_LOCAL_CONTROL_ARTIFACT_RECOMMENDED`
- Minimum effective change: authorize mainline to run the deterministic, no-model hash curator specified in `HASH_ONLY_DENYLIST_CONTROL_SPEC.md`, then resume the same R11A Phase-1 assignment only after mechanical validation.
- Why a smaller operational fix is insufficient: the missing hashes cannot be created without some actor reading the protected identity-bearing fields; current R11A authority does not grant that new access. Giving Packer the old semantics or treating missing hashes as PASS would violate the frozen contract.
- Why no shared-rule patch is needed now: the scientific method, thresholds, roles and state machine are correct; this is a one-time legacy-schema adapter. A future template clarification may require precomputed hash denylist availability before dispatch, but it is not needed to unblock this frozen assignment.
- Non-relaxable gates preserved: Q2/Q1, same-object, current collision, strong baseline, natural/canonical evidence, full-cost, reproducibility, claim ceiling, blind separation, terminal STOP non-revival and all StageB/formal gates.

## Validation and rollback

- Historical cases/backtest required: no scientific backtest; deterministic fixture and full-input recomputation are mandatory.
- Shadow-run plan: none for this control artifact. Existing R11A shadow gates remain unchanged and later in sequence.
- Success criteria: exact input hashes; 28 raw historical records; zero R10 cases; zero unhashable identities; two byte-identical recomputations; no protected-string leakage; valid manifests; candidate commitment frozen before intersection.
- Failure criteria: any missing/unhashable identity, source hash mismatch, non-determinism, leakage, parser repair, ambiguous identity priority or collision returns to checkpoint-008 blocker with no Packer resume.
- Rollback condition: any later provenance mismatch, leak or normalization defect; revoke artifact from allowlist, restore blocker and preserve files.

## Mainline handoff

- User approval already present: `no` for derivation of new hashes from protected identities; R11A generic approval is insufficient for this new read authority.
- Files proposed for change: no shared rule/template file. After approval, add only the assignment-local control files specified in the control spec, then mainline may update `registry.yaml`, `plan.md` and `history.md` as the single writer.
- Registry migrations proposed: register approval ID, curator input/output hashes, counts, validation result, Packer-visible result hash and resume point.
- Existing active/blocked/hold/terminal topics affected: only R11A Phase 1 moves from the current blocker back to the same assignment; no candidate state changes.
- Shared files modified: `false`

## Explicit recommendation to mainline

Do not contact R11A PACKER yet. Ask the user for the exact narrow approval in the proposal. If approved, freeze a mainline-owned deterministic curator contract, generate and validate the private denylist, obtain a Packer candidate commitment before any comparison, publish only the restricted exclusion result, and resume the same Phase-1 assignment. Do not expose the full denylist or use a current R11A role as curator.

