# Audit Input Snapshot

## Identity

- `audit_id`: `RULE-AUDIT-20260813-R11A-HASH-ONLY-PRIOR-IDENTITY-DENYLIST-R12`
- `frozen_at`: `2026-08-13T13:29:00+08:00` checkpoint acceptance boundary
- `workspace_root`: `<LEGACY_LOCAL_PROJECT_ROOT>`
- `shared_files_modified`: `false`
- `protected_identity_values_copied_into_audit_packet`: `false`

## Control-plane inputs

| Artifact | SHA-256 |
|---|---|
| `AGENTS.md` | `84FB3A35189C22EFFD426D49B71E2848CA29ED76D971A1B387DCD99A2DA1BF35` |
| `plan.md` | `6615B8C831973CFF1AA4B68E8A12A3F694D35152ED2A42E79DD417CC71A8A730` |
| `registry.yaml` | `DC1F36CE4F0EA63B542A9A942529B9F2714702E2D545E570C0228BC8B5262341` |
| `rules/ROLE_RULE_AUDIT.md` | `9D0064D8E448ECFD3761E7125E776074417F81EF7012C9C49967AB7FA7148C99` |
| `rules/ROLE_DISCOVERY_BACKTEST.md` | `82EF55746418D5F507681878BCB7046445A65F4B892CCB5BACAAEE5BC7A758C0` |
| R11A `TWO_PHASE_MASTER_CONTRACT.yaml` | `2B61BBD0197C2462C60E94D836C546D0DD29259E0375E5B9A5F662CBF071358F` |
| R11A `PHASE1_INDEX_ASSIGNMENT.yaml` | `641E28EA6AD3FA9E0D3036E4AD377D52375B2F901B6495B4EB23051BA93B485A` |
| R11A checkpoint 008 | `B3C614BA87C8F8266DEA1CE2DC02517EAD263D5D7883C4E73D1C31D867BBC3C1` |

## Authorized historical provenance surfaces inspected without copying values

| Surface | Role in proposed transform | SHA-256 |
|---|---|---|
| `CONSOLIDATED_DISCOVERY_STAGE0/V8.8-R3/packer/auditor_key/case_key.yaml` | 18 protected historical identity records | `DC1949187185841B88C05113BA9C2552EFD68727A88A08AF6C9CA95BBE9A35AE` |
| `CONSOLIDATED_DISCOVERY_STAGE0/V8.8-R3/packer/HASH_MANIFEST.sha256` | source-integrity root | `69357EE2B5F29FAE3CA590382EA36E87647DDAA031CFF6063AF1F6FF6AF59BBD` |
| `CONSOLIDATED_DISCOVERY_STAGE0/V8.8-R3R1/resume2/packer/auditor_key/AUDITOR_KEY.yaml` | 10 protected historical identity records | `50E28F843A96655BC97108ED30995B5DA288ABDC721F65CBB5E0D77CB14F2FD1` |
| `CONSOLIDATED_DISCOVERY_STAGE0/V8.8-R3R1/resume2/packer/HASH_MANIFEST.sha256` | source-integrity root | `856FD1DE777B0F40542FFC58D4934CDA78F78AA6A57192AA7CAF24A756584AB5` |
| R10 failed packer `handoff.yaml` | proves zero frozen blind cases | `30BF2876F291835C55246FF31C6EEE328D51FF0DB400B932D1985C99E6DD3D51` |
| R10 failed packer `HASH_MANIFEST.sha256` | source-integrity root | `D66507876068BA4084830FA6D16307BC422BCB8C167747215BBE973DA9E845C4` |

Only field names, record counts, paths and cryptographic hashes were used in this audit. Target names, target identifiers, outcomes, answers, case semantics, classes, strata and method labels are intentionally absent from every deliverable in this audit directory.

## Registered facts

- R11A permits old-material use only as `IDENTITY_HASH_DEDUP_AND_EXCLUSION_ONLY`.
- R11A permits reading an existing prior identity hash for exclusion, but does not explicitly authorize deriving new hashes from protected identity values.
- Checkpoint 008 found no comparable pre-existing stable-family identity hashes and correctly blocked promotion of every pending family.
- Historical surfaces account for 18 records in the first frozen set, 10 records in the later frozen set and zero frozen cases in R10. A future curator must mechanically recover exactly 28 raw identity records or fail closed; this audit does not assert that the unique count is 28.
- Canonical mode remains `OFF`; Phase 2, Executor, Auditor, shadow and production remain undispatched.

