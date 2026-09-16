# Question Cards — Source39 S2

| card | exact object and endpoint | current official locus | decisive contrary / result |
|---|---|---|---|
| QC-S39-01 | fixed OpenMP program, mapped values and device semantics / target-data result | OpenMP 6.0 target-enter-data and map semantics, accessed 2026-08-15 | map clauses and target data environment express the purported construction. No target-specific whole action or guarantee frozen; `EXCLUDED_BEFORE_RAW__CURRENT_MAP_UNION`. |
| QC-S39-02 | fixed NVSHMEM tensor values, team and tile collective result / collective completion | NVSHMEM 3.7 tile-collective API, accessed 2026-08-15 | stock tensors/layouts, team requirements, tile algorithms and wait actions cover the sketch. No distinct guarantee; `EXCLUDED_BEFORE_RAW__CURRENT_TILE_COLLECTIVE_UNION`. |
| QC-S39-03 | fixed Level Zero image values, format and device reader semantics / image operation result | Level Zero 1.17.24 Core Programming Guide, accessed 2026-08-15 | image layout is implementation-specific and stock image/copy paths own encoding/decoding. A proposed layout action needs changed reader or is generic packing; `EXCLUDED_BEFORE_RAW__CHANGED_READER_OR_GENERIC_PACKING`. |

No EVIDENCE_QUALIFIED_RAW record resulted. A later external-evidence reopen would measure offload mapping CPU/bytes/device memory, tile communication/compute/sync, or image create/copy/decode CPU/RSS/bytes/latency respectively; no experiment was run.
