# Raw screen row events

| event | first-party/current evidence | disposition |
|---|---|---|
| Native object | libarchive supports individual entries read/written to arbitrary data sources. | stock API/reader boundary |
| Writer surface | Official project issue directs ZIP-writer configuration to `test_write_format_zip*`; options include compression behavior. | partial current union |
| Format constraints | Zip64, streaming and data descriptors constrain reader interoperability and offset/header construction. | same-object boundary |
| Admission | Full current writer/reader options and Info-ZIP/bsdtar executable union plus primary direct collisions not closed. | `NOT_ADMITTED_UNFROZEN` |

Generic packing, flag selection, local emitter changes, external recompression and wrappers are excluded.
