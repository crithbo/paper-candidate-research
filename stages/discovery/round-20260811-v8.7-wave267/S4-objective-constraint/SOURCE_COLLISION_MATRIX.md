# Source/collision matrix

| putative contribution | direct current source mechanism | decision |
|---|---|---|
| reorder declaration/type records for cache locality | `WriteDeclAndTypes`, type/decl offset arrays; `DeclCursorForID`/`ReadDeclRecord` reader offset jumps | generic layout rewrite, not admissible N2 |
| reorder identifiers or visible declarations | writer hash tables and identifier offsets; reader identifier/global-ID/visible-decl maps | protocol-coupled existing constructor state |
| reorder across module DAG | module offset map and local/global ID translation | changes module reader contract unless all maps are merely recomputed; then generic layout |
| alter lazy declaration/body loading | delayed/pending offset hooks and reader cursor semantics | changed reader behavior/object |

The current-source collision is pinned; no old issue/release note/future-work statement is used to assert a gap.

