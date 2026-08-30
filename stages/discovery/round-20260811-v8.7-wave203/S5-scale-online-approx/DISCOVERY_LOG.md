# Wave203 Dynamic Compact Automata Update Breadth

Frozen controls matched: plan `FE7C5BF21D6032656BCE57E172778B9F0156AC6CDE38DC9A76D2F0FAD290B074`, registry `5CCF0A94B4C361F526D26FA0FDC6AB72DAB9418FBAC8FE6C171DD7B2F731A3AE`, ROLE_DISCOVERY `FCB9BD73C39F39D31F6C8154E6B48EA23187FF28BDF2BB3D9C59E3D28FA518A3`. v8.7/R5-P0, quality OFF. No experiment, download, automation, Stage0/A/B or shared-control write.

## Breadth funnel

Six non-MARISA/Cedar/Lucene-FST/Aho-Corasick/RE2/filter/HNSW families were screened: OpenFST, Rust `fst`, HFST optimized lookup, foma, ugrep HFA and ripgrep RegexSet. The search fixed language/transduction or lookup output and stock reader semantics.

| Family | Current union and action-witness disposition |
|---|---|
| OpenFST | Mutable FST operations plus deterministic minimization; minimization produces an equivalent minimal machine only under explicit semiring/determinism conditions. A batch minimization/rebuild is not a bounded online same-reader transition. `NOT_ADMITTED_UNFROZEN`. |
| Rust `fst` | Compact immutable ordered set/map FST and mmap-oriented reader/builder contract. Insert/delete would require a new artifact; no native legal in-place transition/stock-reader witness is supported by the current source. `NOT_ADMITTED_UNFROZEN`. |
| HFST optimized lookup | Same interface can convert among OpenFst/SFST/foma/optimized lookup representations. That conversion changes backend/format and thus cannot witness same-reader N2. `NOT_ADMITTED_REPRESENTATION_CHANGE`. |
| foma | General finite-state compiler/transducer family; no current source-backed versioned natural update trace and stock compact-reader transition was frozen. `NOT_ADMITTED_UNFROZEN`. |
| ugrep HFA | Incremental indexer exists, but recompiling an index over changed files is a rebuild workflow and its HFA is an auxiliary prefilter; not fixed exact regex output constructor. `NOT_ADMITTED_OBJECT_MISMATCH`. |
| ripgrep RegexSet | Regex DFA/RegexSet compilation is a matching engine, overlapping excluded RE2-style family; no new dynamic compact-reader object. `REPEAT_SCOPE_EXCLUDED`. |

No deep item has both a native-legal transition witness and a public versioned lexicon/rule update trace. This is not evidence that such an algorithm is impossible; missing source/result/resource is not a scientific negative.

## Closure contract if revived

Require a pinned natural lexicon/rule corpus and update sequence; exact stock-reader membership/matching/transduction oracle; frozen current builder/incremental/minimization union; and a transition that preserves bytes/format/reader semantics. Charge update/build/query/serialized bytes/RSS/temp plus transition writes and rollback. A <=72h killer fails on oracle difference, loss of determinism, recourse-bound breach, union absorption, or no full-cost compactness/query gain.

Sources: [OpenFST Minimize](https://openfst.org/twiki/bin/view/FST/MinimizeDoc), [Rust fst](https://github.com/BurntSushi/fst), [HFST API](https://hfst.github.io/cplusplus/index.html), [HFST transitions](https://hfst.github.io/python/next_release/classhfst_1_1HfstBasicTransducer.html), [ugrep HFA](https://github.com/Genivia/ugrep-indexer), [ripgrep](https://github.com/BurntSushi/ripgrep).

Decision: `COMPLETE_ZERO_PROPOSALS`; no scientific STOP.
