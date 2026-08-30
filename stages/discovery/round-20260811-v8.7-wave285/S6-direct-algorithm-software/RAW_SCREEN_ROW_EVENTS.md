# Raw screen row events

| event | first-party evidence | disposition |
|---|---|---|
| Native toolchain | dotnet/runtime build documentation includes Crossgen2 and R2RDump in the CoreCLR tool set. | native route fixed |
| Loader coupling | Current runtime design material describes R2R code/stubs and mode transitions; sections/relocations cannot be treated as independent PE bytes. | same-object boundary |
| Layout witness | Two R2R outputs might differ only if section/table offsets, relocations and every loader-visible reference are regenerated while loader/reflection behavior is equal. | representation witness only |
| Admission | Current Crossgen2/R2RDump/CoreCLR source, flags and direct-collision union were not completely pinned. | `NOT_ADMITTED_UNFROZEN` |

PE section order, generic delta/packing, a flag selector, wrapper or controller is excluded from N2.
