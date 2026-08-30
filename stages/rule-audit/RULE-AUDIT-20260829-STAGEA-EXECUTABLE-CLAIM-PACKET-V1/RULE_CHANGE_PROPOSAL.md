# Rule Change Proposal

## Proposal identity

- `proposal_id`: `STAGEA_EXECUTABLE_CLAIM_PACKET_V1`
- `decision_label`: `PATCH_RECOMMENDED__PILOT_FIRST`
- `user_policy_approval_required`: `already approved for assignment-local pilot`
- `backtest_required`: `operational three-topic pilot; positive scientific results are not required`

## Proposed minimum delta

No shared file is changed before pilot acceptance. MAINLINE freezes `PILOT_CONTRACT.yaml` into APX/PPC/RVV assignment contexts and registers three immutable toolchain assets. If acceptance succeeds, install only the following minimum deltas:

| File | Proposed semantics |
|---|---|
| `rules/ROLE_CANDIDATE_OWNER.md` | Permit bounded multi-field mechanical closure inside one preclaim assignment before result visibility; require executable claim packet and result firewall |
| `rules/ROLE_MAINLINE.md` | Add shared read-only toolchain assets, risk-tiered lightweight integrity, and milestone Stage A dashboard |
| `templates/STAGEA_EXECUTABLE_CLAIM_PACKET.yaml` | Canonical packet fields |
| `templates/STAGEA_ENGINEERING_STATUS.yaml` | E0–E2 non-scientific status envelope |
| `templates/STAGEA_COMMAND_DAG.schema.json` | Explicit argv/cwd/env/dependency/output/metric schema |
| `templates/STAGEA_LIGHTWEIGHT_MANIFEST.md` | Claim-critical-only manifest guidance |

## Safety invariants

Q2/Q1 targets, same-object, current collision, fair baselines, natural input, full-cost, reproducibility, claim ceiling, STOP non-revival, revision limits and Stage B user approval remain unchanged.

## Validation plan

- Cases: APX, PPC, RVV current non-Linux Stage A routes.
- Success is at least two valid decisive Stage A observations, positive or negative.
- Forbidden regression: any result-aware packet change, hidden baseline deletion, denominator change, extra scientific revision, unauthorized Stage B, or claim based on engineering control rows.
- Rollback: do not install shared changes; retain pilot evidence as noncanonical operational audit.

## Decision request

User has approved the assignment-local pilot and conditional later installation. MAINLINE should freeze and run the pilot now; it should not install shared skill/rule/template changes until the acceptance record is complete.
