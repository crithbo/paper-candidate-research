# Source39 current-union matrix

| Exact family | Current primary comparison | Result | Disposition |
|---|---|---|---|
| SPARC-DELAY-SLOT-RESTORE-COMBINE-CONSTRUCTION | LLVM SPARC delay-slot filler | named current pass fills slots and combines restore patterns | `STRUCTURAL_DROP__CURRENT_UNION_ABSORPTION` |
| LANAI-DELAY-SLOT-HAZARD-AWARE-CONSTRUCTION | LLVM Lanai delay-slot filler | current pass selects legal fillers and inserts NOP after hazard checks | `STRUCTURAL_DROP__CURRENT_UNION_ABSORPTION` |

SPARC and Lanai share a broad delay-slot genealogy but are not treated as exact
identities. Neither overlaps active OFST or bounded NVPTX tcgen05.

