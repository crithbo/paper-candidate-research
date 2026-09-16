# Candidate-grade deep reviews

## D1 — Avro OCF finite-state block/sync planner

- **Object/oracle:** same schema and ordered records; stock Avro reader must yield identical records.
- **Witness:** two legal block-boundary placements for adjacent records, with regenerated count/size/sync state, can preserve decoded record sequence.
- **Strongest union:** current DataFileWriter block/sync/codec configuration and default/non-default controls; exact source-path/flag closure and direct collision remain open.
- **N2 ceiling:** exact/FPT state DP over boundary and codec-state cost, with a stated byte/read/seek trade-off; not segmentation tuning or an external codec.
- **Natural/full cost/72h killer:** public versioned Avro stream; write/read CPU-RSS-temp-bytes-latency; pin source, enumerate controls, validate two-boundary reader equality, and reject if configuration union or prior work absorbs it.
- **Decision:** `NOT_ADMITTED_UNFROZEN`.

## D2 — OpenEXR chunk/offset-table joint planner

- **Object/oracle:** same pixels, channels and metadata; reference OpenEXR reader must decode equivalently.
- **Witness:** legal chunk offset-table regeneration with two admissible chunk emission/layout schedules, subject to line/tile ordering rules.
- **Strongest union:** OpenEXR header/compression/tile/scanline/chunk and offset-table writer paths. Source/default/config and direct-collision closure not finished.
- **N2 ceiling:** finite-state joint schedule with an exact/approximate bound over bytes and bounded seek/decode amplification, not compression selection or emitter patch.
- **Natural/full cost/72h killer:** official OpenEXR images; write/read CPU-RSS-temp-bytes/seek; pin source and rules, validate two layouts, subtract native/commercial-reference mechanisms, reject if ordering is forced or absorbed.
- **Decision:** `NOT_ADMITTED_UNFROZEN`.

## D3 — libtiff strile/IFD finite-state layout planner

- **Object/oracle:** same decoded raster and tags; stock libtiff reader must preserve values.
- **Witness:** permitted strip/tile offset and IFD-reference regeneration can produce distinct legal placements for a fixed raster, where geometry/tags remain fixed.
- **Strongest union:** current libtiff write-directory, strip/tile, codec and checkpoint paths. Current tag/default/config union and collision are not fully enumerated.
- **N2 ceiling:** exact/FPT planner over legal strile/IFD state with a size–random-read bound, not choosing rows-per-strip, a codec parameter or generic packing.
- **Natural/full cost/72h killer:** public TIFF corpus; write/read CPU-RSS-temp-bytes/seek; source-pin, produce a two-layout legal witness, compare all native knobs and stop on absorption or changed TIFF semantics.
- **Decision:** `NOT_ADMITTED_UNFROZEN`.
