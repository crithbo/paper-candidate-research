# V9 shadow — noncanonical

Canonical manifest `7669250A47F9DAEE1C4EEE83A094059157419997686536CCFC0D1363436D8B01` existed first. Input remains `../neutral-source-snapshot`.

| Family | V9 axes | Shadow disposition | Correction / stability |
|---|---|---|---|
| F01 | A1, C0, D2, E1 | `SHADOW_DROP` | Makes ABI acquire/release/abort direct coverage explicit; stable. |
| F02 | A1, C0, D2, E1 | `SHADOW_DROP` | Makes exceptional/returning total-order guarantee explicit; stable. |
| F03 | A1, C0, D2, E1 | `SHADOW_DROP` | Names default and nondefault lazy-import surfaces; stable. |
| F04 | A1, CU, D1, E1 | `SHADOW_NOT_ADMITTED_UNFROZEN` | Exposes unclosed integrity/collision facets; stable. |

No shadow proposal or brief exists. No shadow result has canonical or Stage0 authority. Leakage check: `PASS` (canonical precedes shadow; shadow vocabulary absent from canonical files).
