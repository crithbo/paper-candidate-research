# Wave103 raw screen-row events

Frozen assignment: `DISCOVERY-S3-20260811-V8.7-WAVE103-NATURAL-SKEW-LOCALITY-CONSTRUCTOR-DEEP`  
Cutoff: 2026-08-11; rule revision `v8.7+R5-P0`; `DISCOVERY_QUALITY_MODE=OFF`.

Six new public natural carrier objects were chosen and each was deep reviewed. A visible regularity alone is never a candidate result.

| Event | Public natural carrier | Stable skew/locality regularity | Complete constructor considered | Deep-review status |
|---|---|---|---|---|
| RAW-103-01 | BAM/CRAM alignment files | Coordinate-sorted read records and repeated reference/read-group cohorts. | Select CRAM containers, slices, preservation series/codecs for the same alignments. | `DEEP_DIVE_REQUIRED` |
| RAW-103-02 | PCAPNG captures | Packets are locally concentrated by interface/flow/time inside capture sections. | Select section/block and packet-option organization for the same packet trace. | `DEEP_DIVE_REQUIRED` |
| RAW-103-03 | Zarr v3 scientific arrays | Spatially adjacent chunks have stable occupancy/compressibility regimes. | Select complete chunk-grid, shard grid and inner-chunk construction. | `DEEP_DIVE_REQUIRED` |
| RAW-103-04 | Android App Bundles / generated APKs | Device-configuration cohorts reuse restricted code/resource subsets. | Construct base/feature/configuration APK split set for the same app/device target. | `DEEP_DIVE_REQUIRED` |
| RAW-103-05 | FITS astronomical images | Astronomical image regions exhibit stable local pixel statistics. | Select rectangular tiles and per-tile legal compression construction. | `DEEP_DIVE_REQUIRED` |
| RAW-103-06 | OpenEXR production images | Image/deep-data locality varies across tiles and resolution levels. | Select tiled/chunked storage and level representation for the same pixels. | `DEEP_DIVE_REQUIRED` |
