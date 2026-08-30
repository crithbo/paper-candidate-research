# R11A Mainline Freeze Report

Authorization: `DISCOVERY-CLAIMPACK-V9-PACKER-TWO-PHASE-20260813-R11A`

Frozen at: 2026-08-13T12:13:30+08:00

## Accepted scope

The approved recovery is implemented as a new two-phase Packer sequence. The prior R10 failure package is preserved unchanged and is used only as a failure provenance and deduplication route diagnostic.

Phase 1 builds an auditor-private public eligibility index with a target of 72 families, a hard minimum of 60, a maximum of 80, at least eight families in each of six strata, at least five contribution types, and no more than 30% from one type. Each eligible family requires verified primary or official pre-cutoff bytes, an independent target/later-outcome anchor, two additional pre-cutoff authoritative locators, a claim-structure record, and identity exclusion proof.

Phase 2 is authorized but fail-closed and not dispatched. It may be frozen only after mainline accepts the Phase 1 manifest and coverage. The deterministic stratified selection reserves 12 development cases and 40 blind cases, with all blind identities frozen before Executor and the original 24-to-32-to-40 reveal rule unchanged.

## Frozen control hashes

- `TWO_PHASE_MASTER_CONTRACT.yaml`: `2B61BBD0197C2462C60E94D836C546D0DD29259E0375E5B9A5F662CBF071358F`
- `PHASE1_INDEX_ASSIGNMENT.yaml`: `641E28EA6AD3FA9E0D3036E4AD377D52375B2F901B6495B4EB23051BA93B485A`
- pre-assignment `registry.yaml`: `A1DD6EA342F104EDDEDD706DC9A8B767028B6E5666B1E927066C38CA18377B3D`
- post-freeze `registry.yaml`: `FF219CC30D3513728D55B13319CA60AD2373E2DB9989F837993D3DD472140FE7`
- pre-assignment `plan.md`: `9D888BFC125601627B3463D8FAB0FDE608EA90B96EA93B0BDCED6F607C3E0F3E`
- post-freeze `plan.md`: `3517302163EEF8445E1762FE4B13C1BA897644060593451DE6ED7019C967D560`
- pre-assignment `history.md`: `72A33877B824F143DD21FC3006F3F4411F26BB3C172BD97DF9843A615E92B025`
- post-freeze `history.md`: `DEDC11E067B1B87FD21476F04714F3DF6F4E2D7FBA56621570C8A9E264A51EC4`

## Mechanical checks

- registry top-level keys: 56; duplicates: 0
- obsolete `E:\project\writing\reserch` references in shared control files: 0
- registry tab-indentation hits: 0
- control contracts use a new immutable R11A root and do not overwrite R10
- only the long-lived Packer task is assigned; Executor and Auditor remain undispatched
- canonical `DISCOVERY_CLAIM_PACK_MODE`: `OFF`

No method, Discovery, E2, candidate experiment, Stage 0/A/B, build, install, automation, external communication, or production cutover was started by this freeze.
