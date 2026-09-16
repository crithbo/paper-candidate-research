# Private Hash Curator Validation Report

- Authorization: `R11A-HASH-ONLY-PRIOR-IDENTITY-DENYLIST-20260813-R12A`
- Status: `PASS_PRIVATE_DENYLIST_BUILD__CANDIDATE_COMMITMENT_AND_INTERSECTION_PENDING`
- Scientific inference: `NONE`
- Canonical mode: `OFF`
- Network, download, experiment, automation: `NOT_USED`

## Mechanical checks

- Exact protected input hashes: PASS (3/3)
- Exact source-manifest hashes: PASS (3/3)
- Protected-key manifest coverage: PASS (3/3)
- Raw protected identities: 28
- R10 frozen cases: 0
- Unhashable identities: 0
- Distinct-preimage digest collision: NONE
- Raw protected values persisted or logged: NO
- Private digest set sorted and uppercase 64-hex: PASS
- Two clean deterministic recomputations: PASS (validated before publication)

## Synthetic fixtures

- doi_alias: PASS
- arxiv_version: PASS
- url_normalization: PASS
- fallback_normalization: PASS
- identical_duplicate: PASS
- collision_injection: PASS

## Remaining mandatory gate

The same R11A PACKER must first freeze `CANDIDATE_IDENTITY_COMMITMENT.yaml` using the profile hash above. Mainline then performs the private intersection and publishes only the approved Packer-visible result schema. No Phase-1 scientific search resumes until candidate commitment ordering, result leak scan, manifests, and intersection validation all pass.
