# Current-upstream reality check — S82-RQ-01

| Facet | Current/primary evidence | Consequence |
|---|---|---|
| Writer action | GNU ld documents `pack-relative-relocs`; `nopack-relative-relocs` is default | fair comparison must include the explicitly enabled stock packing action, not only default output |
| Output contract | Writer adds `DT_RELR`, `DT_RELRSZ`, and `DT_RELRENT` for PIC executable/shared-object output on documented targets | candidate cannot change reader, format, binding, or ABI |
| Reader/format | GABI specifies address-plus-bitmap RELR decoding; glibc upstream record includes support/tests | stock-format acceptance is available in scope |
| Concrete residual action | Pointer-slot order/alignment to make more bitmap clusters | this is generic packing, not a current-implementation-absence claim |

No claim is made that GNU ld or glibc lacks a particular interface. The structural exclusion follows from the candidate action itself, not missing source code, missing implementation, resource limits, or lack of results.
