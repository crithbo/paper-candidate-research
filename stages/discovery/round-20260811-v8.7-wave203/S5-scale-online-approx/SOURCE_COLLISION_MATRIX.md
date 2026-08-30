# Wave203 Compact Automata / Trie Matrix

| Family | Fixed semantics / current union | Minimal witness and full-cost killer | Outcome |
|---|---|---|---|
| OpenFST | deterministic weighted acceptor/transducer; mutable operations + minimization | Must preserve same serialized reader and bound changed states/arcs; charge build/update/query/bytes/RSS/temp. | `UNFROZEN` |
| Rust fst | ordered map/set lookup under compact FST reader | Artifact replacement is rebuild; reject unless stock reader accepts bounded transition. | `UNFROZEN` |
| HFST | morphology transduction under optimized lookup/backend APIs | Backend conversion changes representation/reader. | `REPRESENTATION_CHANGE` |
| foma | transduction/matching | No frozen current action union + natural update trace. | `UNFROZEN` |
| ugrep HFA | regex search output | Auxiliary HFA/reindex workflow is not same exact constructor. | `OBJECT_MISMATCH` |
| ripgrep RegexSet | regex-set matching | RE2-style repeat/excluded family. | `SCOPE_EXCLUDED` |

All potential future claims fail closed if stock oracle differs, deterministic/compact representation changes, bounded recourse fails, or no full-cost gain remains within 72 hours.
