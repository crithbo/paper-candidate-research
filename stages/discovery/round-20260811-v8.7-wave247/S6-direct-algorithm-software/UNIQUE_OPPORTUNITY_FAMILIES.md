# Opportunity family — OpenEXR joint chunk/tile/level layout

**Same object.** Fixed pixels, channel values/names, part identities, level mode and dimensions, data/display windows, compression and stock OpenEXR reader observations. Changing compression, part structure, tile geometry, payload or reader is excluded.

**Current actions to subtract.** The format carries scanline/tile/deep chunks, per-part chunk-offset tables, multipart headers/part numbers, compression and level descriptions. The upstream project supplies the format and reference implementation. Current API/writer options potentially cover tiled/scanline, multipart, MIPMAP/RIPMAP, line order, compression and offset-table generation; a complete source/default/non-default enumeration was not achieved.

**Static legal action-divergence witness.** With a fixed tiled part and fixed tile geometry/level set, two physical orders of chunks can in principle be represented by regenerated chunk offsets while each tile continues to identify itself by coordinates and each offset-table entry points to its correct chunk. The native format's sorted *table* order is not proof that all physical emission orders are legal in the current writer. This is therefore a format-level conditional witness, not a claim that current upstream lacks it.

**Conditional N2 shape.** A joint planner over legal physical chunk order and offset-table realization could seek a Pareto or approximation guarantee for bytes plus bounded ROI/full-decode access cost, charging write CPU/RSS/temp and reader cache/latency. It must exceed hot-first/grid composition and cannot be generic tile packing/ILP, a compression/part/tile-size choice, a post-processor or a reader change.

**Natural route/full cost.** Official versioned OpenEXR image/sequence corpus; reference-reader digest/pixel comparison and ROI/full decode. Charge bytes, writer CPU/wall/RSS/temp and reader ROI/full decode/cache/latency. No run occurred.

**Status.** `NOT_ADMITTED_UNFROZEN`: current writer/API/flags/source path and the newest same-object image-layout/ROI collision remain incompletely closed.
