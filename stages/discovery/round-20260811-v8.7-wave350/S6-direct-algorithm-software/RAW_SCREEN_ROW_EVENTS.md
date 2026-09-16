# Raw benchmark/oracle screen

| ID | Native heuristic constructor | Official source | Natural benchmark/oracle route | Status |
|---|---|---|---|---|
| R1 | Clang static-analyzer exploded-graph construction | https://github.com/llvm/llvm-project | LLVM tests/SV-COMP; analyzer diagnostics | `NOT_ADMITTED_UNFROZEN` |
| R2 | OpenSMTPD rule-table construction | https://github.com/OpenSMTPD/OpenSMTPD | public mail configs; delivery semantics | `NOT_ADMITTED_UNFROZEN` |
| R3 | libjpeg-turbo Huffman-table construction | https://github.com/libjpeg-turbo/libjpeg-turbo | JPEG corpora; decoded pixels | `NOT_ADMITTED_UNFROZEN` |
| R4 | MuPDF display-list construction | https://github.com/ArtifexSoftware/mupdf | public PDFs; rendered-page oracle | `NOT_ADMITTED_UNFROZEN` |
| R5 | GStreamer caps-negotiation graph construction | https://gitlab.freedesktop.org/gstreamer/gstreamer | public media; decoded output | `NOT_ADMITTED_UNFROZEN` |
| R6 | FreeType glyph-cache/load construction | https://github.com/freetype/freetype | font packages; raster oracle | `NOT_ADMITTED_UNFROZEN` |
| R7 | libgit2 revwalk graph construction | https://github.com/libgit2/libgit2 | public repository histories; commit-set oracle | `NOT_ADMITTED_UNFROZEN` |
| R8 | Apache Arrow C++ compute expression-plan construction | https://github.com/apache/arrow | public Arrow tables; result equality | `NOT_ADMITTED_UNFROZEN` |

No candidate produced a current-union-external native witness; no benchmark was run and no lack of result/resource was used negatively.
