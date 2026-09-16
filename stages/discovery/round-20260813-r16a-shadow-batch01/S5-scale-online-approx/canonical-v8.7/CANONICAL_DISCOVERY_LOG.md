# Canonical v8.7 discovery output

Assignment: `DISCOVERY-S5-20260813-R16A-V9-PROSPECTIVE-SHADOW-BATCH01`; canonical method remains v8.7 authoritative.  It was prepared solely from `neutral-source-snapshot/FAMILY_SIGNATURES.md`.

| Family | Canonical disposition | v8.7 reason |
| --- | --- | --- |
| Cargo index | `DROP__CURRENT_UNION_OR_CONTROLLER` | Sparse/git protocol, ETag invalidation and cache handling are current native union; choosing refresh/batching is controller-only. |
| APT archive index | `DROP__CURRENT_UNION_OR_OBJECT_CHANGE` | `apt-ftparchive` already constructs every stock index class; changed ordering/config is union, altered signed metadata changes object. |
| ThinLTO cache | `DROP__CONTROLLER` | Current cache/pruning controls cover the apparent recourse decision; final linked binary is unchanged. |
| Conda repodata | `NOT_ADMITTED_UNFROZEN` | No source-pinned current writer/config union and no fixed versioned natural update carrier were closed; no absence claim follows. |

No `PROPOSE_STAGE0`. Full-cost requirements for all four are frozen in the neutral signatures: producer/update CPU/RSS/temp, metadata/index bytes, checksum/signature or protocol traffic, reader/solver/link behavior, cache/disk I/O and rollback. A 72h falsifier for any future admission is stock consumer equivalence on one fixed versioned update sequence, current-union replay, and charged full-cost Pareto failure. No V9 material is used here.
