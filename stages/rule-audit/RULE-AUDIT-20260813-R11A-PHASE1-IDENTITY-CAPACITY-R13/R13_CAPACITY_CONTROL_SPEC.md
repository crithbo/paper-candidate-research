# R11A Phase-1 Bounded Identity-Capacity Control Specification

## Scope

- `spec_id`: `R11A-BOUNDED-OPAQUE-IDENTITY-CAPACITY-V1`
- `authorization_id_proposed`: `R11A-BOUNDED-OPAQUE-IDENTITY-CAPACITY-20260813-R13A`
- `base_assignment`: `BACKTEST-PACKER-L1-20260813-DISCOVERY-CLAIM-PACK-V9-R0-R11A-PHASE1-INDEX`
- `resume_anchor`: checkpoint 011 plus blocker 012
- `changes_scientific_or_statistical_thresholds`: `false`
- `changes_identity_normalization_or_prior_denylist`: `false`
- `changes_canonical_mode`: `false`
- `fresh_user_approval_required`: `true`

This is an assignment-local capacity amendment. It authorizes a finite number of additional opaque candidate-identity commitments and mainline-private intersections. It does not authorize a new Packer assignment, a repack, Phase 2, method execution, evidence scoring, or any shared-rule patch.

## Owners and least privilege

1. `R11A_PHASE1_PACKER` may identify public candidate families, normalize their own explicit stable identities with the already frozen `R11A-STABLE-FAMILY-IDENTITY-NORM-V1`, and append commitment batches in the existing index directory. It continues to be prohibited from reading the private prior denylist or historical identity plaintext.
2. `MAINLINE_CONTROL_PLANE__DETERMINISTIC_NO_MODEL_HASH_INTERSECTION` is the only owner allowed to compare a sealed batch with the existing R12A private denylist. It returns only the allowlisted Packer-visible result.
3. Executor, Auditor and every Discovery/Stage0/A/B lane receive nothing and remain undispatched.
4. No language model may read the R12A private denylist, private provenance or historical identity plaintext for this amendment.

## Bounded capacity

The caps are inclusive of the four identities already committed under R12A:

- total raw public identity leads examined: `<=160`;
- total unique candidate identity commitments: `<=128`;
- total eligible families admitted to the Phase-1 index: unchanged at `<=80`;
- new unique commitments available under R13A: `<=124`;
- no fifth batch and no replacement batch are allowed.

| Batch | Maximum new raw leads | Maximum new unique commitments | Cumulative unique ceiling including the original four |
|---|---:|---:|---:|
| `R13-01` | 40 | 32 | 36 |
| `R13-02` | 40 | 32 | 68 |
| `R13-03` | 40 | 32 | 100 |
| `R13-04` | 36 | 28 | 128 |

Duplicate, unhashable, ambiguous, prior-matched and source-ineligible leads consume their applicable raw or commitment capacity. They do not create an entitlement to additional batches. A batch may seal fewer than its maximum; unused capacity from a closed batch may not be moved forward. This prevents adaptive infinite expansion.

## Mandatory order within each batch

1. **Public identity preflight:** Packer may use only its existing R11A Phase-1 public-source authority to confirm an explicit stable identity, a plausible qualifying evidence route, and deficit-aware provisional coverage. This is not eligibility and cannot support scientific inference.
2. **Local pre-commit validation:** normalize deterministically; reject unhashable or ambiguous identities; deduplicate against the original four and every earlier R13 commitment. Only Packer-owned candidate data are used.
3. **Immutable commitment:** append the batch commitment and manifest. The file contains no source semantics, outcome, stratum, contribution type or qualification judgment.
4. **Mainline-private intersection:** only after the commitment hash is frozen, mainline performs the offline comparison against the unchanged R12A private denylist.
5. **Restricted visible result:** mainline emits only the allowlisted per-candidate match booleans and aggregates. Historical hashes, identities, labels and mappings remain private.
6. **Full source qualification:** Packer performs expensive byte freezing, cutoff, same-object bridge, target-anchor, two-authority, claim-structure and coverage qualification only for `prior_identity_match: false` candidates. A nonmatch is necessary but never sufficient for eligibility.
7. **Batch checkpoint:** Packer writes the batch capacity checkpoint; mainline applies the mechanical batch gate before any next batch may open.

This order prevents wasting full qualification effort on a prior match and prevents the private result from steering which identities are committed.

## Exact proposed future paths

No file below exists or becomes authorized merely because this audit names it. Mainline creates them only after exact user approval.

Mainline control root:

`<LEGACY_LOCAL_PROJECT_ROOT>\stages\discovery\_method-backtests\DISCOVERY_CLAIM_PACK\V9-R0\paired-blind-r11a\control\identity-capacity-r13\`

- `R13_PHASE1_CAPACITY_AMENDMENT.yaml`
- `R13_PHASE1_CAPACITY_AMENDMENT_MANIFEST.sha256`
- `private/PRIVATE_INTERSECTION_R13_BATCH_01.yaml` through `_04.yaml`
- `private/HASH_MANIFEST.sha256`
- `packer-visible/PRIOR_IDENTITY_EXCLUSION_R13_BATCH_01.yaml` through `_04.yaml`
- `packer-visible/HASH_MANIFEST.sha256`
- `R13_BATCH_GATE_01.yaml` through `_04.yaml`
- `HASH_MANIFEST.sha256`

Packer append-only index outputs:

`<LEGACY_LOCAL_PROJECT_ROOT>\stages\discovery\_method-backtests\DISCOVERY_CLAIM_PACK\V9-R0\paired-blind-r11a\index\`

- `CANDIDATE_IDENTITY_COMMITMENT_R13_BATCH_01.yaml` through `_04.yaml`
- `CANDIDATE_IDENTITY_COMMITMENT_R13_BATCH_01_MANIFEST.sha256` through `_04_MANIFEST.sha256`
- `IDENTITY_CAPACITY_BATCH_CHECKPOINT_R13_01.yaml` through `_04.yaml`
- `IDENTITY_CAPACITY_BATCH_CHECKPOINT_R13_01_MANIFEST.sha256` through `_04_MANIFEST.sha256`

The original `CANDIDATE_IDENTITY_COMMITMENT.yaml`, checkpoint 011, blocker 012, R12A files and all prior evidence remain immutable and must not be overwritten.

## Commitment schema visible outside the Packer

Allowed commitment fields only:

```yaml
schema: R11A_CANDIDATE_IDENTITY_COMMITMENT_BATCH_V1
assignment_id: <frozen Phase-1 assignment>
authorization_id: R11A-BOUNDED-OPAQUE-IDENTITY-CAPACITY-20260813-R13A
batch_id: R13-01
prior_commitment_chain_root_sha256: <64hex>
normalization_profile: R11A-STABLE-FAMILY-IDENTITY-NORM-V1
normalization_profile_sha256: <64hex>
raw_leads_examined_this_batch: <integer within batch cap>
candidate_identity_count: <integer within batch cap>
precommit_duplicate_count: <integer>
unhashable_or_ambiguous_count: <integer>
entries:
  - opaque_family_id: <packer-owned nonsemantic token>
    candidate_identity_hash: <64hex>
decision: COMMITTED__AWAITING_CONTROL_PLANE_HASH_ONLY_INTERSECTION
```

No title, DOI, URL, author, target identity, outcome, answer, case semantics, class, stratum, contribution type, method label, source locator or qualification status is allowed in the commitment file.

## Packer-visible intersection result

Allowed fields only:

```yaml
schema: R11A_PRIOR_IDENTITY_EXCLUSION_BATCH_RESULT_V1
authorization_id: R11A-BOUNDED-OPAQUE-IDENTITY-CAPACITY-20260813-R13A
batch_id: R13-01
algorithm: SHA-256
normalization_profile: R11A-STABLE-FAMILY-IDENTITY-NORM-V1
normalization_profile_sha256: <64hex>
private_denylist_root_sha256: <unchanged R12A root, 64hex>
source_manifest_sha256: [<unchanged unlabeled R12A manifest hashes>]
candidate_commitment_sha256: <64hex>
candidate_identity_count_checked: <integer>
matched_candidate_count: <integer>
unmatched_candidate_count: <integer>
candidate_results:
  - opaque_family_id: <exact token from this batch>
    candidate_identity_hash: <exact Packer-owned hash from this batch>
    prior_identity_match: true|false
decision: PASS_INTERSECTION_COMPLETE__NO_MATCH | PASS_INTERSECTION_COMPLETE__MATCHES_EXCLUDED | FAILED_CONTROL_UNCLOSED
```

A prior match excludes only that candidate; it does not invalidate clean candidates in the same batch. `matched` candidates can never enter the eligibility index. No historical entry-level hash, group/order, source mapping, identity plaintext or historical semantic label is Packer-visible.

## Mechanical validation

Every batch must pass all checks before source qualification or the next batch:

1. Reverify checkpoint 011, blocker 012, base contracts, R12A amendment, normalization profile, private-denylist root and all relevant manifests by exact SHA-256.
2. Validate the raw/unique per-batch and cumulative caps; batch ID and filename must be monotonic with no gaps or overwrite.
3. Require commitment timestamp/hash to precede intersection result; the commitment must not change between two clean reads.
4. Require every digest to match `^[0-9A-F]{64}$`; require candidate hashes to be unique within the batch and absent from the original four and all prior R13 batches.
5. Require the visible result's `(opaque_family_id, candidate_identity_hash)` set to equal the committed set exactly; no added, missing or reordered semantic field is allowed.
6. Mainline privately checks that visible historical-derived values are limited to the already approved root, unlabeled source-manifest hashes and aggregate counts. Exact protected-scalar leakage count must be zero.
7. Distinct canonical candidate preimages producing the same digest are `HASH_COLLISION_FATAL`; byte-identical candidate preimages are duplicates and must be removed before commitment.
8. Recompute the intersection twice in clean temporary directories; results and manifests must be byte-identical.
9. Run deterministic negative fixtures for within-batch duplicate, cross-batch duplicate, unhashable/ambiguous identity, changed commitment after seal, injected collision, extra visible field, missing candidate, extra candidate and protected-string leak.
10. Require canonical manifests to verify exactly. Partial batches, partial intersections and repaired parser output are not acceptable.

Any failure is `FAILED_CONTROL_UNCLOSED`; no candidate from that batch may be source-qualified or admitted until a purely mechanical correction passes within the same fixed batch caps.

## Source qualification and admission discipline

- Intersection nonmatch is an exclusion proof only; it cannot raise source quality, novelty, stratum coverage or evidence status.
- Existing Phase-1 source qualifications remain unchanged: real pre-cutoff primary/official bytes, independent later-outcome/target anchor, at least two additional dated authoritative locators, strict cutoff, same-object bridge, claim-structure fields, natural/canonical carrier, contribution type and stratum.
- Full qualification order should prioritize currently deficient strata and contribution types, but the private intersection returns no labels and cannot define that priority.
- Normal completion target remains 72 eligible families. At 72, stop new identity commitments if all coverage gates pass. If a coverage gate is still deficient, only deficit-directed qualification/commitment may continue, and eligible admission still stops at 80.
- Mainline may accept 60–71 only under the original contract semantics after all six strata/type caps and all other qualification gates pass and the bounded routes/resource envelope are documented as exhausted. R13 creates no new early-acceptance rule.
- If 80 eligible admissions are reached while a coverage gate still fails, or the 128 unique/160 raw ceiling is exhausted below the complete acceptance gate, fail closed under the original no-scientific-inference policy.

At each batch gate record:

- raw examined, precommit duplicate, unhashable/ambiguous, committed, matched and unmatched counts;
- cumulative eligible and pending counts, including public counts by stratum and contribution type;
- remaining raw and unique capacity;
- `max_arithmetically_reachable = cumulative_eligible + still_open_nonmatched_pending + remaining_unique_commitment_capacity`;
- original resource-ledger consumption and remaining envelope;
- commitment/result/gate hashes, collision count and protected-leak count.

If `max_arithmetically_reachable < 60`, stop immediately with the original control-plane capacity blocker class rather than spending more source budget.

## Budget

No R11A resource ceiling is enlarged:

- network bytes: cumulative `<=1 GiB`;
- temporary plus sealed bytes: cumulative `<=2 GiB`;
- CPU: cumulative `<=16 hours`;
- wall time: cumulative `<=72 hours`;
- individual artifact: `<=25 MiB`;
- source build, package/system install, global environment change, E2, experiment, large-dataset download, exclusive hardware and external communication remain forbidden.

The R13 mainline-private control operations are additionally subcapped at network `0`, CPU `<=1 hour`, wall `<=2 hours`, and new control artifacts `<=32 MiB`, all counted without topping up the original envelope. This authorization adds no new network or download authority; resumed public-source work uses only the already approved R11A Phase-1 envelope and routes.

## Per-batch gate and approval semantics

A mainline mechanical gate is mandatory after every batch. It verifies authority, capacity, chronology, intersection, leakage, duplicates/collisions, source-qualification accounting and remaining budget. It does not judge scientific outcomes.

One exact R13A user approval covers batches 01–04. No fresh user approval is needed for each batch if every field, count, path and resource remains inside this specification. Fresh user approval is required for a fifth/replacement batch, more than 128 unique or 160 raw leads, any resource top-up, normalization/denylist change, private-data access expansion, threshold change or downstream dispatch.

## Rollback

Rollback is additive and non-destructive:

1. Mark every R13 control and batch artifact `REVOKED_NOT_INPUT` and remove it from the assignment allowlist.
2. Restore `BLOCKED_USER_ACTION_REQUIRED__CONTROL_PLANE_IDENTITY_CAPACITY` anchored at checkpoint 011 and blocker 012.
3. Preserve the original four commitments, R12A PASS, two eligible families, pending families, checkpoints, request logs and all R13 artifacts for audit.
4. Do not overwrite old evidence, modify historical identity values, infer scientific failure or start another Packer assignment.

