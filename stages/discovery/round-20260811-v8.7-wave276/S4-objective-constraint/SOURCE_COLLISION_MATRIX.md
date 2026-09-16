# Source / collision matrix

| putative action | direct current mechanism | result |
|---|---|---|
| reorder serialized package/type/object/body elements | `pkgbits` sections, typed relocations and relative indices | generic record/index packing |
| optimize relocation varints by global index assignment | source documents compact section-relative indices already; full remap retains protocol | generic packing, not target-specific N2 |
| alter deep-summary duplication | UIR linker / public-private root semantics | changed package/import guarantee |
| alter lazy decode blocks | `pkgReader` section/index decoder | changed reader/protocol |
| exploit build cache | cache action/output IDs and storage mechanics | policy/wrapper, not constructor |

No old issue, benchmark anecdote or source absence is used as novelty evidence.

