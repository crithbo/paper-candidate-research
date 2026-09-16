# Raw screen rows

| ID | fixed native object / stock reader | objective tension | initial disposition |
|---|---|---|---|
| B01 | Clang PCH/PCM with matching `ASTReader` | AST bytes / import latency / compiler RSS | `DEEP_DIVE_REQUIRED` |
| B02 | Rust rmeta metadata consumed by matching rustc | metadata bytes / import/compile latency / RSS | `NOT_ADMITTED_UNFROZEN` |
| B03 | ICU common `.dat` package consumed through ICU data loader | package bytes / mmap/load / RSS / packer cost | `DEEP_DIVE_REQUIRED` |
| B04 | Qt QML cache consumed by matching Qt QML runtime | cache bytes / QML startup / RSS / qmlcachegen cost | `NOT_ADMITTED_UNFROZEN` |
| B05 | Go unified export data consumed by matching Go compiler importer | export bytes / direct-import latency / compiler RSS | `DEEP_DIVE_REQUIRED` |
| B06 | GNU MO catalog consumed by gettext | catalog bytes / load+lookup / msgfmt cost | `NOT_ADMITTED_UNFROZEN` |

An artifact is not a candidate merely because it has a size/read-cost knob. External compressors, deployment policies, profile controllers and changed readers are excluded.

