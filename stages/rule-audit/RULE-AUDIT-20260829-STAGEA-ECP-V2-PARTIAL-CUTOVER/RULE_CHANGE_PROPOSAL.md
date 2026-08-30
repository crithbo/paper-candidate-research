# Rule Change Proposal

## Proposal identity

- Proposal: `STAGEA_ECP_V2_PARTIAL_CUTOVER`
- Decision: `PATCH_RECOMMENDED`
- User approval: present
- Scientific admission or revision policy changed: no

## Immediate patch

Apply the small additions in `DRAFT_PATCH.diff` to `ROLE_MAINLINE.md`, `ROLE_CANDIDATE_OWNER.md`, and the Stage A section of `plan.md`. Install `STAGEA_ENGINEERING_STATUS.yaml` and `STAGEA_LIGHTWEIGHT_MANIFEST.md` as templates. Do not yet install the complete ECP packet or create a Stage A skill.

## V2 pilot

Freeze `V2_PILOT_CONTRACT.yaml` into one APX, PPC and RVV assignment. Close E0.5 without tool or claim execution, apply strict E1 predicates, then run E2 and serial C1 pilots. V2 success requires valid positive or negative observations from at least two topics.

## Safety invariants

Same-object, latest collision, strong baselines, natural evidence, full-cost, reproducibility, claim ceiling, revision limits, STOP non-revival and Stage B user approval remain unchanged.
