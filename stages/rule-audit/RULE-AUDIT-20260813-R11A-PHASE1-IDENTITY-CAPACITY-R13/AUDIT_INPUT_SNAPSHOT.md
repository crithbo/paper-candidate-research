# Audit Input Snapshot

## Identity

- `audit_id`: `RULE-AUDIT-20260813-R11A-PHASE1-IDENTITY-CAPACITY-R13`
- `frozen_at`: `2026-08-13T17:36:00+08:00` identity-capacity blocker boundary
- `workspace_root`: `D:\project\writing\reserch`
- `shared_files_modified`: `false`
- `packer_contacted`: `false`
- `private_denylist_or_historical_identity_plaintext_read`: `false`

## Frozen control inputs

| Artifact | SHA-256 |
|---|---|
| `AGENTS.md` | `84FB3A35189C22EFFD426D49B71E2848CA29ED76D971A1B387DCD99A2DA1BF35` |
| `plan.md` | `E99ABA11DB753F03CED93B811006ABA3A37E197C9073E209A661EC67DF32C81F` |
| `registry.yaml` | `8FBF687E70C66B1CCD3E66A7CEFE2BFBE1B9BEAE94E7DA4A07A4F353C521DF17` |
| `rules/ROLE_RULE_AUDIT.md` | `9D0064D8E448ECFD3761E7125E776074417F81EF7012C9C49967AB7FA7148C99` |
| `rules/ROLE_DISCOVERY_BACKTEST.md` | `82EF55746418D5F507681878BCB7046445A65F4B892CCB5BACAAEE5BC7A758C0` |
| R11A `TWO_PHASE_MASTER_CONTRACT.yaml` | `2B61BBD0197C2462C60E94D836C546D0DD29259E0375E5B9A5F662CBF071358F` |
| R11A `PHASE1_INDEX_ASSIGNMENT.yaml` | `641E28EA6AD3FA9E0D3036E4AD377D52375B2F901B6495B4EB23051BA93B485A` |
| R12 `HASH_MANIFEST.sha256` | `28E84CB97E6FBD11531A2EB4160C2C297B03779D259236C816B5F0AAA31C5B5E` |
| R12A `R12A_PHASE1_RESUME_AMENDMENT.yaml` | `6E0A65B3ABD017AB28FC0238843B25B8A7E14B006B8A0A9AB4829DACCD7FFD7B` |
| R12A amendment manifest | `36A6E74C742A59200CA69889A56A5B2441D7960C0A1F753BF3FE25562157BBDA` |
| Existing candidate commitment | `7BD8EEB5BD135DCFF681EBE5A80313FE2CFFCFF33A5FC848259C4A9C7CA986BF` |
| Existing commitment manifest | `0A41E8C24729CBB552DAAD9B1944BBCE474982A39DB7006A8CD728BBDA6697D6` |
| Checkpoint 011 | `BC280D6E3D9D86841A1B889E308129DED101EF3FEDC4FD5072018E7DEE83A43B` |
| Capacity blocker 012 | `87F5CCE193AA49B8D6586354FFAAF4BE784B103AA2466CBFDB66DBE3BF0A129B` |

The approved R12A control is treated only through its public contract, approval ID, manifests, counts and packer-visible result. This audit did not open the private denylist, private provenance, protected historical keys or any historical identity scalar.

## Registered facts

- Current immutable commitment count: `4`.
- Current R12A intersection: `PASS_NO_REUSE__4_CHECKED__0_MATCHED`.
- Current source-qualified eligible count: `2`; the other two committed families remain pending.
- R11A Phase-1 eligible-index minimum/target/maximum: `60 / 72 / 80`.
- Six strata remain required at `>=8` each; at least five contribution types and the `<=30%` single-type cap remain unchanged.
- Maximum eligible count under the current frozen identity set is exactly `4`, so additional source reading on only those identities cannot make 60 reachable.
- Remaining R11A resource envelope exists; the blocker is control-plane identity capacity, not scientific evidence or exhausted retrieval budget.
- Canonical mode remains `OFF`; Phase 2, Executor, Auditor, shadow and production remain undispatched.

## Capacity arithmetic

| Total unique commitment ceiling | Minimum yield needed for 60 | Attrition capacity before 60 becomes impossible | Audit judgment |
|---:|---:|---:|---|
| 80 | 75.0% | 20 | too brittle; duplicates, prior matches and source-qualification rejects are not realistically buffered |
| 96 | 62.5% | 36 | bounded but unsupported by the current `2/4` final-eligible observation |
| **128** | **46.875%** | **68** | recommended balance: arithmetic reachability plus bounded rejection buffer |
| 160 | 37.5% | 100 | unnecessary unique-identity exposure and qualification cost before evidence justifies it |

The `2/4` current eligible rate is descriptive only and is not a calibrated forecast. The 128 ceiling does not guarantee success; it makes success arithmetically possible without requiring more than 46.875% of committed identities to become eligible. A separate raw-lead ceiling of 160 prevents duplicate/unhashable replacement from becoming an unbounded loop.

