# Raw screen row events

| family | event | first-party finding | disposition |
|---|---|---|---|
| PDB type/public hash streams | lld PDB source | COFF lld merges/re-writes type indices and creates TPI/IPI, then constructs publics/globals before commit. | direct same-object native subtractor found |
| PDB type/public hash streams | TPI/IPI source | `TpiStreamBuilder` appends records with hashes/index offsets and fixes hash bucket mapping to `MaxTpiHashBuckets - 1`. | current whole action partially frozen |
| PDB type/public hash streams | GSI/PSI source | public symbols are name-sorted; global/public hashes use fixed `IPHR_HASH`, bucket grouping and in-bucket name sorting; stream order and offsets are regenerated. | direct current whole-output constructor found |
| PDB type/public hash streams | MSF source | `PDBFileBuilder` commits all streams through one MSF layout. | stream/block layout is part of native writer action |
| PDB type/public hash streams | current-union closure | lld source is accessible but immutable commit pin, Microsoft reference-writer/incremental behavior, `llvm-pdbutil` query coverage and all producer flags are not closed. | `NOT_ADMITTED_UNFROZEN` |

