# Hash-only Prior Identity Denylist Control Specification

## Scope and authority

- `spec_id`: `R11A-PRIOR-IDENTITY-DENYLIST-V1`
- `purpose`: close only the historical-case exclusion proof required by the already frozen R11A Phase-1 contract
- `changes_scientific_thresholds`: `false`
- `changes_case_selection_or_strata`: `false`
- `changes_canonical_mode`: `false`
- `requires_fresh_user_approval`: `true`

The approval must be narrow: permit one deterministic, local, no-network transform to read the exact protected identity-bearing inputs listed below and emit only digests, algorithm/profile metadata, source-manifest hashes and aggregate counts. It does not authorize semantic reuse, method execution, repacking, source acquisition or downstream dispatch.

## Least-privilege owner

Recommended owner: `MAINLINE_CONTROL_PLANE` using a deterministic no-model `HASH_CURATOR_TRANSFORM`.

No current or future R11A PACKER, EXECUTOR or AUDITOR lane may read the protected historical identity values. No language-model lane is required. Mainline is the least-privilege owner because it already owns the R11A control directory, registry transition and resume gate; the transform is mechanical rather than substantive research. Standard output and error must contain only file paths, counts, digests and fixed status codes.

Using an archived AUDITOR lane as curator is not recommended: it needlessly exposes protected identities to another model and would force that lane to recuse from the later R11A audit. If a deterministic transform is unavailable, this is a fallback requiring a separately frozen lane assignment and permanent recusal from R11A PACKER/EXECUTOR/AUDITOR decisions.

## Exact inputs

Read access is limited to:

1. `D:\project\writing\reserch\stages\discovery\_method-backtests\CONSOLIDATED_DISCOVERY_STAGE0\V8.8-R3\packer\auditor_key\case_key.yaml`
2. `D:\project\writing\reserch\stages\discovery\_method-backtests\CONSOLIDATED_DISCOVERY_STAGE0\V8.8-R3\packer\HASH_MANIFEST.sha256`
3. `D:\project\writing\reserch\stages\discovery\_method-backtests\CONSOLIDATED_DISCOVERY_STAGE0\V8.8-R3R1\resume2\packer\auditor_key\AUDITOR_KEY.yaml`
4. `D:\project\writing\reserch\stages\discovery\_method-backtests\CONSOLIDATED_DISCOVERY_STAGE0\V8.8-R3R1\resume2\packer\HASH_MANIFEST.sha256`
5. `D:\project\writing\reserch\stages\discovery\_method-backtests\DISCOVERY_CLAIM_PACK\V9-R0\paired-blind-r10\packer\handoff.yaml`
6. `D:\project\writing\reserch\stages\discovery\_method-backtests\DISCOVERY_CLAIM_PACK\V9-R0\paired-blind-r10\packer\HASH_MANIFEST.sha256`

R3R1 initial and resume1 are excluded because resume2 is the final immutable superset. R10 contributes zero identities but its manifest and count remain in provenance so absence cannot silently become an omitted surface.

## Exact output boundary proposed for mainline

`D:\project\writing\reserch\stages\discovery\_method-backtests\DISCOVERY_CLAIM_PACK\V9-R0\paired-blind-r11a\control\prior-identity-denylist-v1\`

Control-private files:

- `NORMALIZATION_PROFILE.yaml`
- `PRIVATE_PRIOR_IDENTITY_DENYLIST.sha256`
- `PRIVATE_CURATION_PROVENANCE.yaml`
- `PRIVATE_VALIDATION_REPORT.md`
- `HASH_MANIFEST.sha256`

Packer-visible subdirectory:

- `packer-visible/PRIOR_IDENTITY_EXCLUSION_RESULT.yaml`
- `packer-visible/HASH_MANIFEST.sha256`

The raw private denylist should not be given to PACKER. PACKER first freezes its own candidate hashes in its existing write directory as `CANDIDATE_IDENTITY_COMMITMENT.yaml`. Mainline then performs deterministic set intersection and returns only the Packer's own opaque family IDs/hashes, match booleans, aggregate counts, normalization/profile hash, private denylist root hash and unlabeled source-manifest hashes. This is safer than exposing the full historical hash set and still satisfies hash-only exclusion.

## Normalization and hash algorithm

Profile name: `R11A-STABLE-FAMILY-IDENTITY-NORM-V1`.

1. Accept only an explicit identity-bearing scalar from the protected key or an exact persistent locator directly attached to that identity. Do not infer identity from outcome, answer, class, stratum or free-form scientific reasoning.
2. Identifier priority is deterministic: DOI; arXiv base identifier; OpenReview forum identifier; official publisher/preprint locator; official repository plus immutable commit for software-only targets; final fallback of normalized title, ISO first-publication date and normalized first author/organization.
3. Apply Unicode NFKC, trim leading/trailing Unicode whitespace, collapse internal whitespace to one ASCII space, normalize line endings to LF and lowercase identifier schemes/hosts and case-insensitive identifier components.
4. DOI: remove `doi:`, `https://doi.org/` or `http://dx.doi.org/`, percent-decode unreserved characters and lowercase the result.
5. arXiv: remove URL/prefix and version suffix `vN`, preserving the base identifier.
6. URL: require HTTP(S), lowercase scheme/host, remove default port and fragment, normalize dot segments, remove tracking parameters, sort remaining query pairs and preserve the normalized path/query bytes.
7. Fallback title: NFKC, lowercase, normalize Unicode dashes/quotes to ASCII, replace punctuation with spaces and collapse whitespace; date is `YYYY-MM-DD`; author/organization uses the same text normalization. Fallback is legal only when all three components are explicitly present.
8. Serialize exactly as UTF-8 without BOM using canonical JSON with sorted keys and no insignificant whitespace: `{"identity_kind":"...","identity_value":"...","profile":"R11A-STABLE-FAMILY-IDENTITY-NORM-V1"}`.
9. Digest is uppercase hexadecimal `SHA-256(canonical_json_bytes)`, exactly 64 characters.

If one historical record has no explicit persistent identity and cannot meet the exact fallback, emit only `UNHASHABLE_IDENTITY_COUNT>0` in the private report and fail closed. Do not ask a model to reconstruct it from case semantics.

## Duplicate and collision handling

- Expected raw records: 28; R10 frozen-case count: 0.
- Identical canonical preimages produce one unique digest; record raw count, unique count and duplicate count.
- Duplicate digests from byte-identical canonical preimages are safe deduplication, not a new case.
- The curator keeps canonical preimages only in volatile memory. If distinct canonical preimages produce the same SHA-256, return `HASH_COLLISION_FATAL` and publish no usable denylist.
- Missing records, unhashable records, source-manifest mismatch, ambiguous identifier priority or parser repair produce `FAILED_NOT_DISPATCHABLE__IDENTITY_CONTROL_UNCLOSED`.
- Sort the final private digest set lexicographically. Do not preserve case order or source grouping in any Packer-visible output.

## Mechanical validation

1. Verify all six exact input hashes before parsing.
2. Verify each protected key is covered by its canonical source manifest.
3. Require raw identity count 28 and R10 case count 0.
4. Recompute twice in clean temporary directories; byte-identical output is mandatory.
5. Run synthetic fixtures for DOI aliases, arXiv versions, URL normalization, fallback normalization, identical duplicates and injected distinct-preimage collision handling.
6. Scan Packer-visible output and logs: no URLs, DOI/arXiv strings, titles, authors, target IDs, old case IDs, outcomes, answers, classes, strata, method labels or scientific text.
7. Require every exposed identity digest to match `^[0-9A-F]{64}$` and every source reference to be a manifest SHA-256 only.
8. Require canonical manifests for private and Packer-visible outputs; manifests exclude themselves and verify exactly.
9. Require the Packer candidate commitment to predate the exclusion result and be immutable before comparison.
10. Any validation failure restores checkpoint-008 blocker state and prohibits PACKER resume.

## Packer-visible result schema

Allowed fields only:

```yaml
schema: R11A_PRIOR_IDENTITY_EXCLUSION_RESULT_V1
normalization_profile_sha256: <64hex>
private_denylist_root_sha256: <64hex>
source_manifest_sha256:
  - <64hex>
raw_prior_identity_count: 28
unique_prior_identity_hash_count: <integer>
duplicate_prior_identity_count: <integer>
unhashable_prior_identity_count: 0
candidate_commitment_sha256: <64hex>
candidate_identity_count_checked: <integer>
matched_candidate_count: <integer>
candidate_results:
  - opaque_family_id: <current-packer-owned opaque id>
    candidate_identity_hash: <current-packer-owned 64hex>
    prior_identity_match: true|false
decision: PASS_NO_REUSE | FAIL_REUSE_FOUND | FAILED_CONTROL_UNCLOSED
```

No historical entry-level digest, source-to-entry mapping or method/source label is Packer-visible.

## Resume and rollback

After user approval and successful validation, mainline may freeze an additive control amendment referencing the two Packer-visible file hashes and resume the same R11A Phase-1 assignment from checkpoint 008. This is not a second calibration revision or repack and changes no evidence bytes or threshold.

Rollback is fail-closed and non-destructive: remove the artifact from the Packer input allowlist, mark it `REVOKED_NOT_INPUT`, restore `BLOCKED_USER_ACTION_REQUIRED__CONTROL_PLANE_IDENTITY_DENYLIST`, and preserve all files for audit. Never overwrite checkpoint 008 or historical inputs.

