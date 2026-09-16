# Six current-heuristic constructor families

| ID | Fixed object/oracle | Current action/config union | Natural carrier + full cost | Status |
|---|---|---|---|---|
| F1 gperf | fixed keyword set and generated lookup semantics; generated-code tests | association values, hash/table layout, generator options | compiler keyword sets; generation/compile/lookup CPU-RSS-bytes | NOT_ADMITTED_UNFROZEN |
| F2 Bison | fixed grammar and parse/action semantics; parser test suite | table construction/packing/default reductions/options | public language grammars; generator/compile/parser CPU-RSS-table bytes | NOT_ADMITTED_UNFROZEN |
| F3 dot | fixed DOT input and renderer output | rank/mincross/network-simplex attributes/options | public DAG corpora; layout CPU-RSS/drawing bounds | STRUCTURAL_DROP: coordinates are the deliverable |
| F4 CUDD | fixed Boolean function and consumer API | reorder methods/groups/thresholds | public logic/circuit suites; build/apply/memory | STRUCTURAL_DROP: variable order is exposed structural object |
| F5 ar | fixed archive members/resolution | member/index ordering and flags | source archives; build/link/bytes/load | STRUCTURAL_DROP: ordering is not neutral generally |
| F6 Qhull | fixed point set and hull oracle | conflict graph, facet/horizon traversal/options | public geometric data; construct/verify/memory | NOT_ADMITTED_UNFROZEN |

Only F1/F2/F6 reached candidate-grade review. Any N2 would need an explicit target-specific exact/FPT/approximation theorem versus the full native union—not frequency ordering, generic ILP, a wrapper or solver swap.
