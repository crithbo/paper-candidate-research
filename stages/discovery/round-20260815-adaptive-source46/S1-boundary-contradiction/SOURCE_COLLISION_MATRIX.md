# Current union and collision matrix

| Family | Same-object current union | Direct collision / contrary evidence | Canonical decision |
|---|---|---|---|
| AArch64 MOPS copy/move | LLVM selects `G_MEMMOVE` to a native MOPS pseudo when `+mops` is enabled. | Official LLVM implementation record establishes existing native primitive selection; no literature-absence claim made. | Excluded before raw: remaining RQ is only threshold/lowering. |
| Hexagon HVX packet/call | Current LLVM packetizer has HVX resource mutations and call/callee-save constraints after RA. | Official current source establishes existing packetization constraint union; no paper-newness claim made. | Excluded before raw: remaining RQ is generic joint scheduling. |

No `SEARCH_BOUNDED_OPEN` label is used as a novelty conclusion.
