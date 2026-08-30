# Raw screen row events

| event | family | result | reason |
|---|---|---|---|
| RAW | SQLite B-tree global page assignment | enter | Wave128 near-miss; first-party source has explicit balancing and allocation paths worth red-teaming. |
| REALITY_CHECK | Current `src/btree.c` | pass | Official SQLite GitHub mirror master head `e0725b0` (2026-08-08 in upstream history) and current file-format/VACUUM/PRAGMA documentation checked. |
| ACTION_CHECK | bounded sibling redistribution | absorbed | `balance_nonroot()` redistributes cells between a page and up to two siblings; page allocation and cell rebuild are native actions. |
| ACTION_CHECK | wider file-wide assignment | reject | It is not a frozen same-transaction native action: it either becomes VACUUM/autovacuum relocation, changes update/transaction scope, or reduces to generic packing. |
| DECISION | SQLite B-tree page assignment | STRUCTURAL_DROP | No union-external complete same-object N2 remains after accounting for balance, allocation/freelist, vacuum relocation, and commit/journal semantics. |
