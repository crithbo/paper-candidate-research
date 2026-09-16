# Source38 current-union matrix

| Exact family | Current source comparator | Result | Disposition |
|---|---|---|---|
| M68K-MOVEM-SPILL-RELOAD-COLLAPSE-CONSTRUCTION | `M68kCollapseMOVEMPass` | named target pass realizes proposed multi-register move construction | `STRUCTURAL_DROP__CURRENT_UNION_ABSORPTION` |
| M68K-LEA-SUB-ADD-FRAME-ADJUSTMENT-CONSTRUCTION | M68k frame lowering | source enumerates intended adjustment actions; remaining claim is selector-like | `STRUCTURAL_DROP__CURRENT_UNION_ABSORPTION_OR_SELECTOR` |

These are neither OFST nor NVPTX tcgen05 identities. Broad LLVM toolchain overlap
with prior families is related-only, not an identity claim.

