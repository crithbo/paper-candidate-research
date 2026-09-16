# Unique families

| Family | Same object/oracle and legal witness | Full cost/natural carrier | Decision |
|---|---|---|---|
| LevelDB blocks | fixed sorted key/value sequence; stock iterator equality; alternate legal prefix/restart groupings regenerate offsets. | public KV traces; build/read CPU-RSS-temp-bytes/seek. | NOT_ADMITTED_UNFROZEN |
| LLVM GlobalMerge | fixed IR/target ABI and object semantics; alternate legal groups regenerate references. | LLVM test suite; compile/link/run CPU-RSS/code size. | NOT_ADMITTED_UNFROZEN |
| graph-tool coarsening | fixed graph/property/query objective and verifier; alternate coarsening groups. | public graphs; construct/query/memory. | NOT_ADMITTED_UNFROZEN |
| Lucene | fixed index/reader semantics. | occupied; no deep review. | STRUCTURAL_DROP |
| Bison | fixed grammar/parser semantics. | duplicate Wave249. | STRUCTURAL_DROP |
| Yosys opt_merge | fixed RTL semantics. | duplicate/active scope. | STRUCTURAL_DROP |

Candidate form, if source closure succeeds: target-specific local-search/FPT/approximation over existing legal group actions with an explicit size–read/compile/memory guarantee. Generic matching/ILP, flag sweeps and wrappers are excluded.
