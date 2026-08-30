# Raw screen-row events

| Family | Native object and static action witness | Initial result |
|---|---|---|
| Avro OCF | Fixed schema/value sequence; legal record-block boundaries and sync placement regenerate container references while the reader decodes the same records. | UNFROZEN |
| OpenEXR scanline/tile | Fixed pixels/channels/metadata; legal chunk-table offsets and chunk emission schedules regenerate file references. | UNFROZEN |
| libtiff strile/IFD | Fixed decoded raster/tags; legal strip/tile offsets and IFD placement regenerate directory references. | UNFROZEN |
| Apache Thrift compact | Fixed schema/message; compact field-ID delta encoding is driven by field order/state. | STRUCTURAL_DROP: order changes can affect protocol-level sequence/producer contract; no frozen whole-object planner |
| GNU tar/pax | Fixed tree and metadata; record padding/header sequencing exists. | STRUCTURAL_DROP: archive member order is a visible stream/order contract or candidate reduces to packing |
| cpio newc | Fixed archive entries; header/padding layout is finite state. | STRUCTURAL_DROP: no nontrivial native joint action after fixed entry order/semantics |

These are source-review classifications, not results from generated files or measurements.
