# Question card

| Field | S82-RQ-01 |
|---|---|
| Exact identity | Fixed PIC ELF shared-object/executable, logical pointer values, dynamic symbol/binding interface, and stock loader semantics |
| Current locus | GNU ld packing action/default; GABI RELR bitmaps; glibc DT_RELR support |
| Candidate whole action | Reorder/align relocatable pointer slots, then invoke the stock RELR encoder |
| Fair union | Default and enabled stock GNU ld relative-relocation packing, normal legal input layout controls, and stock RELR loader |
| Full-cost boundary | Link CPU/RSS/temp, relative-relocation bytes, data/padding bytes, dynamic tags, loader relocation CPU/RSS/startup, and application behavior |
| Minimal falsifier | A target-specific non-generic construction/guarantee outside address/bitmap packing would be required before raw; none was named |
| Natural route | Not frozen because the action fails before raw; no carrier acquisition is justified |
| Disposition | `EXCLUDED_BEFORE_RAW__GENERIC_RELR_ADDRESS_BITMAP_PACKING` |

The use of standard output files and a stock loader does not turn generic format packing into a research contribution.
