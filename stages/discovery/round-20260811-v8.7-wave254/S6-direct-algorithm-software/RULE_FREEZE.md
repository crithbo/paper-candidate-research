# Rule freeze

| Field | Frozen value |
|---|---|
| Assignment | `DISCOVERY-S6-20260811-V8.7-WAVE254-ROCKSDB-SST-RESTART-BLOCK-FILTER-JOINT-N2-CLOSURE` |
| Scope | One standard RocksDB BlockBasedTable SST, not an LSM policy or a compression-dictionary topic. |
| Write boundary | `stages/discovery/round-20260811-v8.7-wave254/S6-direct-algorithm-software/` only |
| Registry SHA-256 | `2C4E0E4303C95210C67A4B7B0D27C094A18BB263EC15ACAF35ECD3F6313D33DB` |
| Plan SHA-256 | `207DA61FF4231F14C4D104508C62DAEC7905FC110ECDE9D3880377DB45BEC8E3` |
| ROLE_DISCOVERY SHA-256 | `FCB9BD73C39F39D31F6C8154E6B48EA23187FF28BDF2BB3D9C59E3D28FA518A3` |
| Authoritative method | v8.7 + R5-P0; `DISCOVERY_QUALITY_MODE=OFF` |
| Evidence cutoff | 2026-08-11; official/current source, documentation, format material, and primary papers only |

## Admission discipline

The fixed semantic object is a sorted key/value manifest encoded as one standard
BlockBasedTable SST.  A candidate must preserve stock reader acceptance, checksum
validity, complete scan result, and point/range lookup result. It may not change
the reader, table format, key/value sequence, comparator, or use external
compression. Known legal actions may be jointly optimized under corrected N2
semantics, but a settings sweep, generic packing/ILP, wrapper, or dictionary
sampling is not an N2 contribution.

`ROCKSDB-DICT-COVER` is terminal and excluded by object: this package neither
reopens its dictionary-sampling question nor imports its negative evidence.

## Frozen decision ceiling

One brief maximum. Current-source action union and same-object direct-collision
closure are both required before admission. A missing closure is
`NOT_ADMITTED_UNFROZEN`, not an absence claim or scientific STOP.
