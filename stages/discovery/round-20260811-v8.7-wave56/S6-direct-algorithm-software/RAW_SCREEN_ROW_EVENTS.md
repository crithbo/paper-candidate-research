# Wave56 raw screen events

| raw_id | unique family | result |
|---|---|---|
| R01 | Graphviz DOT whole-graph layout | `DROP` |
| R02 | SCOTCH nested-dissection ordering | `DEEP` |
| R03 | CHOLMOD nested-dissection ordering | `DROP` |
| R04 | nauty canonical graph labeling | `DROP` |
| R05 | bliss canonical graph labeling | `DROP` |
| R06 | KaHIP balanced graph partition construction | `DROP` |
| R07 | Boost Cuthill–McKee bandwidth ordering | `DROP` |
| R08 | NetworkX planar embedding construction | `DROP` |

`repeat=0`: each object is distinct from Wave54 LLVM DomTree, AIGER, WebGraph, HNSW, UST, active/terminal/blocked/hold registry objects, and the S2/S4 current lane scopes. No online-controller, guarantee-boundary, or objective-change object is included.
