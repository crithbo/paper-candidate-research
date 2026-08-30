# Candidate-grade deep review — SFrame

| Field | Frozen assessment |
|---|---|
| Exact same object | Fixed AMD64 ELF code and CFI-derived CFA/FP/RA map under SFrame V3 reader semantics. |
| Producer / consumer | GNU `as --gsframe[=yes] --gsframe-3` and GNU ld / libsframe plus readelf. |
| Strongest fair union | CFI-to-SFrame generation, generation enable/disable/version switches, linker merge and sorted FDE index, and standard decode/probe. |
| Legal two-plan witness | PC-sorted versus format-legal unsorted FDE-index order with identical FDE/FRE semantics and appropriately set flag. It is a generic representation action. |
| Candidate N2 tested | Joint FDE/FRE/index construction optimizing bytes and lookup while preserving all unwind queries. |
| Subtraction | Remaining variation is generic ordering/record packing; no target-specific state or guarantee remains after native union subtraction. |
| Natural carrier | Version-pinned CFI-bearing x86-64 GNU/binutils or LLVM Test-Suite objects; none downloaded or run. |
| Oracle | libsframe/readelf decoded PC-to-CFA/FP/RA map plus ELF load/relocation identity. |
| Full cost | Assembler/linker CPU/wall/RSS/temp, ELF/sframe bytes, decoder/query CPU/RSS, and lookup latency. |
| Finite killer | A legal same-map pair must reveal a target-specific non-generic global frame action plus nontrivial guarantee. The witness does not. |
| Structural potential | `BELOW_Q2_STOP` for this exact target-specific constructor route. |
| Evidence readiness | `SOURCE_READY`; not a readiness-based rejection. |
| Disposition | `STRUCTURAL_DROP__GENERIC_RECORD_LAYOUT_ONLY__NO_FURTHER_EXTENSION_OF_SFRAME_ROUTE`. |

No `TOPIC_BRIEF.md` is emitted: no grounded Stage0 proposal remains.
