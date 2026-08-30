# R13B Mainline Implementation Directive

## Authority

- `approval_id`: `R11A-MINIMUM-VIABLE-CALIBRATION-20260813-R13B`
- `authority_status`: `USER_APPROVED`
- `implementation_status`: `MAINLINE_IMPLEMENTATION_AUTHORIZED`
- `shared_writer`: `MAINLINE_ONLY`
- `audit_lane_implementation_allowed`: `false`
- `additional_generic_user_approval_required`: `false`

This directive authorizes mainline to translate the approved policy into additive control artifacts and to resume the same Phase-1 assignment after mechanical acceptance. It does not authorize this audit lane to edit shared files or contact PACKER.

## Mandatory implementation order

1. **Register supersession.** Record old audit manifest `892996FB695776CE47277C51A28CB3C5EB4FB58CAF614544E5D8157804C4F933` as `SUPERSEDED_NOT_APPROVED`. Preserve its directory byte-for-byte. Never request or apply R13A.
2. **Freeze R13B amendment.** Add a mainline-owned immutable amendment referencing the exact R11A, R12A, checkpoint 011, blocker 012 and R13B package hashes.
3. **Freeze development/blind separation.** Designate the aggregate 28 historical cases as `OPEN_DEVELOPMENT_REGRESSION_ONLY`; create separate path roots, manifests and scoring namespaces. Do not place their identities, artifacts or outcomes in the new blind index/packer/executor/auditor packets.
4. **Audit the current two.** Run the six-condition mechanical admission audit in `POLICY_ALIGNMENT_REPORT.md`. Publish only opaque IDs, hashes and PASS/FAIL reason codes; do not expose private identity material.
5. **Replace the capacity gate.** Mark blocker 012 as resolved only by the approved R13B policy amendment. Do not overwrite blocker 012 or checkpoint 011.
6. **Resume the same Phase-1 assignment.** Allow append-only R13B rolling commitments in the existing index directory, under the `72 unique / 88 raw / four new batches` ceiling.
7. **Run per-batch control.** For each batch: commit → mainline-private intersection → visible result → source qualification → checkpoint → mainline mechanical acceptance. A later batch cannot start before the previous gate passes.
8. **Freeze the blind pool.** Before the first Executor dispatch, freeze exactly 24 core families and zero, six or twelve balanced reserve families, their artifacts, deterministic ordering, identities and Auditor keys. No Packer re-entry is allowed afterward.
9. **Dispatch serially.** Mainline accepts Phase 1 and Phase 2, then dispatches Executor on the 24 core only. Auditor applies trigger rules. Mainline may release only a complete presealed six-family tranche on a valid hashed trigger record.
10. **Preserve downstream gates.** Two noncanonical prospective shadows follow only an independent calibrated/PASS result. Production remains OFF until both shadows pass and mainline separately freezes a safe-boundary cutover.

## Exact implementation paths

Mainline-owned control root:

`D:\project\writing\reserch\stages\discovery\_method-backtests\DISCOVERY_CLAIM_PACK\V9-R0\paired-blind-r11a\control\minimum-viable-calibration-r13b\`

Required files:

- `R13B_POLICY_ALIGNMENT_AMENDMENT.yaml`
- `R13B_POLICY_ALIGNMENT_AMENDMENT_MANIFEST.sha256`
- `R13B_SUPERSESSION_RECORD.yaml`
- `R13B_OPEN_DEVELOPMENT_SEPARATION.yaml`
- `R13B_EXISTING_ELIGIBLE_ADMISSION_AUDIT.yaml`
- `R13B_ROLLING_COMMITMENT_CONTROL.yaml`
- `R13B_PHASE1_RESUME_GATE.yaml`
- `R13B_AUDITOR_TRIGGER_CONTRACT.yaml`
- `R13B_MAINLINE_IMPLEMENTATION_REPORT.md`
- `HASH_MANIFEST.sha256`

Open-development root:

`D:\project\writing\reserch\stages\discovery\_method-backtests\DISCOVERY_CLAIM_PACK\V9-R0\paired-blind-r11a\open-development-regression-r13b\`

Required control files if the 28 cases are actually materialized or used:

- `OPEN_DEVELOPMENT_CASE_MANIFEST.yaml`
- `OPEN_DEVELOPMENT_USE_LEDGER.yaml`
- `REGRESSION_RESULTS.md`
- `ERROR_TYPE_LEDGER.yaml`
- `HASH_MANIFEST.sha256`

Blind index append-only files:

`D:\project\writing\reserch\stages\discovery\_method-backtests\DISCOVERY_CLAIM_PACK\V9-R0\paired-blind-r11a\index\`

- `CANDIDATE_IDENTITY_COMMITMENT_R13B_BATCH_01.yaml` through `_04.yaml`
- corresponding `*_MANIFEST.sha256`
- `R13B_POOL_CHECKPOINT_01.yaml` through `_04.yaml`
- corresponding checkpoint manifests

Private intersection and Packer-visible results remain in the R13B control root under separate `private/` and `packer-visible/` subdirectories. The Packer-visible schema remains hash-only and candidate-owned; it must not contain historical entry-level hashes or semantics.

Phase-2 Packer outputs remain in the already reserved `paired-blind-r11a\packer` directory, with R13B-specific additive filenames. Existing files are never overwritten.

## Open-development policy

Allowed uses of the 28 historical cases:

- input/schema/format validation;
- deterministic regression testing;
- error-type and abstention taxonomy inspection;
- pre-blind implementation debugging whose changes are frozen before the blind method seal.

Forbidden uses:

- blind accuracy, recall, false-drop, calibration or noninferiority numerator/denominator;
- choosing, revealing or reweighting new blind families;
- post-blind threshold tuning or implementation repair;
- presenting open-dev performance as prospective evidence;
- sharing open-dev identity/outcome material with the blind Packer or Auditor.

Every open-dev report must display `OPEN_DEVELOPMENT_REGRESSION_ONLY__ZERO_BLIND_WEIGHT`. The method implementation, prompts, thresholds and code hashes must be frozen after development and before the first blind Executor run.

## Existing-two admission output

Mainline writes one row per currently eligible opaque family with only:

```yaml
opaque_family_id: <existing Packer-owned token>
commitment_sha256_verified: true|false
r12a_prior_nonmatch_verified: true|false
source_qualification_verified: true|false
open_dev_and_prior_blind_exclusion_verified: true|false
blind_nonexposure_verified: true|false
deterministic_selection_eligible: true|false
admission: BLIND_POOL_ELIGIBLE | NOT_ADMITTED_CONTROL_UNCLOSED
reason_codes: [<allowlisted code>]
```

No private identity, target name, outcome, answer or historical mapping is emitted.

## Rolling commitment mechanics

Caps include the current four commitments:

| Batch | New raw cap | New unique cap | Cumulative raw cap | Cumulative unique cap |
|---|---:|---:|---:|---:|
| existing R12A | 4 | 4 | 4 | 4 |
| R13B-01 | 24 | 20 | 28 | 24 |
| R13B-02 | 24 | 20 | 52 | 44 |
| R13B-03 | 24 | 20 | 76 | 64 |
| R13B-04 | 12 | 8 | 88 | 72 |

- `unhashable` or `ambiguous`: reject before commitment, consume raw cap, no scientific inference;
- within/cross-batch duplicate: reject before commitment, consume raw cap, no unique slot;
- `prior_identity_match`: exclude after private intersection, consume unique cap, never source-qualify or admit;
- source-qualification failure: consume unique cap, remain `NOT_ELIGIBLE__SOURCE_CONTRACT_UNCLOSED`, no scientific inference;
- no unused cap transfer, fifth batch, replacement batch or post-Executor commitment.

Stop rolling when 36 source-qualified families are available or the caps are exhausted. If fewer than 24 qualify, fail closed at Phase 1. If 24–35 qualify, seal 24 core and only complete balanced six-family reserve tranches; any incomplete remainder is not revealable and has zero blind weight.

## Deterministic core and reserve selection

Use public seed:

`DISCOVERY-CLAIM-PACK-V9-R0-R11A-R13B-MVC-SEAL-20260813`

Rank input:

`SHA256(stable_family_identity_hash || public_seed || accepted_phase1_manifest_sha256)`

Within each stratum:

- ranks 1–4 form the initial core;
- rank 5 forms reserve tranche 1;
- rank 6 forms reserve tranche 2;
- ranks beyond 6 are not admitted.

Selection must simultaneously enforce at least five contribution types and a single-type cap of 7/24, 9/30 and 10/36. If deterministic selection cannot satisfy both stratum and contribution constraints, mainline fails closed rather than manually swapping for a preferred answer.

## Auditor trigger and reveal protocol

The Packer seals core and all usable reserve artifacts and keys before Executor. Reserve packet hashes are held by mainline and hidden from Executor and the initial Auditor view until release.

At n=24:

- hard-stop/contamination failure → no expansion, final fail/unknown under the frozen rule;
- no allowlisted trigger → close at 24;
- allowlisted trigger plus complete tranche 1 → mainline releases exactly one presealed family per stratum, cumulative n=30;
- trigger but no complete tranche → `PILOT_NOT_CALIBRATED_INCONCLUSIVE__PRESEALED_RESERVE_UNAVAILABLE`.

At n=30:

- no allowlisted trigger → close at 30;
- allowlisted trigger plus complete tranche 2 → cumulative n=36;
- trigger but no complete tranche → final inconclusive with reserve-unavailable reason.

At n=36 no expansion is legal. The Auditor must return the frozen terminal calibration category even if uncertainty remains.

The trigger record contains only sample size, hard-gate status, endpoint decision classes, trigger reason code, requested tranche ordinal, input hashes and Auditor signature/hash. It contains no target identity, answer text or discretionary rationale.

## Resource and permission boundary

R13B does not enlarge the original R11A Phase-1 resource envelope. Existing public-source retrieval authority and prohibitions remain unchanged. The implementation itself authorizes no new download, E2, experiment, installation, automation, external service or external communication.

## Resume from checkpoint 011/blocker 012

After all control files above mechanically verify:

1. mainline records blocker 012 as `SUPERSEDED_BY_USER_APPROVED_R13B_POLICY__ORIGINAL_BYTES_PRESERVED`;
2. mainline records old R13 as `SUPERSEDED_NOT_APPROVED`;
3. mainline freezes `R13B_PHASE1_RESUME_GATE.yaml` referencing checkpoint 011 and blocker 012 hashes;
4. the same Phase-1 assignment resumes in the same index directory with additive R13B filenames;
5. prior request logs, evidence, current commitments, pending families and R12A results remain immutable;
6. no Phase 2 dispatch occurs until mainline accepts the R13B core/reserve pool and all separation/manifest checks.

## Rollback

If implementation validation fails before Packer resume, mark R13B artifacts `REVOKED_NOT_INPUT`, remove them from the allowlist and restore blocker 012/checkpoint 011. If a batch fails, preserve it and fail closed within the fixed batch/cap; do not revive R13A or enlarge capacity. If contamination occurs after blind dispatch, the calibration is not usable and no automatic replay, method revision or production cutover is allowed.

Rollback never changes the user's R13B policy decision, old evidence, R12A status, candidate scientific states or terminal STOP states. It only revokes a defective implementation instance.

