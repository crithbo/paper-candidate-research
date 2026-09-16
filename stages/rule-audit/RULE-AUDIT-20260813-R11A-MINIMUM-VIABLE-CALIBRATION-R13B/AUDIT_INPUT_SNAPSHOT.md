# Audit Input Snapshot

## Identity and authority

- `audit_id`: `RULE-AUDIT-20260813-R11A-MINIMUM-VIABLE-CALIBRATION-R13B`
- `approval_id`: `R11A-MINIMUM-VIABLE-CALIBRATION-20260813-R13B`
- `approval_status`: `USER_APPROVED_IN_SOURCE_THREAD`
- `implementation_status`: `MAINLINE_IMPLEMENTATION_AUTHORIZED`
- `workspace_root`: `<LEGACY_LOCAL_PROJECT_ROOT>`
- `shared_files_modified`: `false`
- `packer_contacted`: `false`
- `private_denylist_read`: `false`
- `historical_identity_plaintext_read`: `false`

The user's approved replacement policy is sufficient to determine the remaining mechanical details. No further generic policy approval is requested by this package.

## Frozen public control inputs

| Artifact | SHA-256 |
|---|---|
| `AGENTS.md` | `84FB3A35189C22EFFD426D49B71E2848CA29ED76D971A1B387DCD99A2DA1BF35` |
| `plan.md` | `E99ABA11DB753F03CED93B811006ABA3A37E197C9073E209A661EC67DF32C81F` |
| `registry.yaml` | `8FBF687E70C66B1CCD3E66A7CEFE2BFBE1B9BEAE94E7DA4A07A4F353C521DF17` |
| `rules/ROLE_RULE_AUDIT.md` | `9D0064D8E448ECFD3761E7125E776074417F81EF7012C9C49967AB7FA7148C99` |
| `rules/ROLE_DISCOVERY_BACKTEST.md` | `82EF55746418D5F507681878BCB7046445A65F4B892CCB5BACAAEE5BC7A758C0` |
| R11A `TWO_PHASE_MASTER_CONTRACT.yaml` | `2B61BBD0197C2462C60E94D836C546D0DD29259E0375E5B9A5F662CBF071358F` |
| R11A `PHASE1_INDEX_ASSIGNMENT.yaml` | `641E28EA6AD3FA9E0D3036E4AD377D52375B2F901B6495B4EB23051BA93B485A` |
| R12A `R12A_PHASE1_RESUME_AMENDMENT.yaml` | `6E0A65B3ABD017AB28FC0238843B25B8A7E14B006B8A0A9AB4829DACCD7FFD7B` |
| Checkpoint 011 | `BC280D6E3D9D86841A1B889E308129DED101EF3FEDC4FD5072018E7DEE83A43B` |
| Identity-capacity blocker 012 | `87F5CCE193AA49B8D6586354FFAAF4BE784B103AA2466CBFDB66DBE3BF0A129B` |
| Superseded R13 `HASH_MANIFEST.sha256` | `892996FB695776CE47277C51A28CB3C5EB4FB58CAF614544E5D8157804C4F933` |

Only public contracts, counts, statuses and hashes were used. The R12A private denylist, protected keys and historical identity values were not opened.

## Registered facts at the replacement boundary

- The current R11A assignment and write directory remain preserved at checkpoint 011/blocker 012.
- The current opaque commitment count is four; checkpoint 011 records two source-qualified eligible families and two pending.
- R12A mechanically checked the four commitments and reported zero prior matches.
- No Executor or Auditor has been dispatched, so the two currently eligible families have not been exposed to a blind executor or scored.
- The existing 28 historical cases are now user-authorized as `OPEN_DEVELOPMENT_REGRESSION_ONLY`; they are not blind cases and contribute zero observations to blind accuracy or calibration.
- Canonical `DISCOVERY_CLAIM_PACK_MODE` remains `OFF`.

## Supersession

- Old audit: `RULE-AUDIT-20260813-R11A-PHASE1-IDENTITY-CAPACITY-R13`
- Old manifest: `892996FB695776CE47277C51A28CB3C5EB4FB58CAF614544E5D8157804C4F933`
- Old proposed approval: `R11A-BOUNDED-OPAQUE-IDENTITY-CAPACITY-20260813-R13A`
- Exact status: `SUPERSEDED_NOT_APPROVED`
- Consequence: the 128-unique/160-raw capacity plan is not pending, must not be requested, and must never be used as fallback authority.

