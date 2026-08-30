# Wave215 Compression-State Matrix

| Format | Exact object / strongest union | Witness / result |
|---|---|---|
| Avro OCF | decoded records under stored schema; append, block sync, compatible direct copy and recompression | `UNION_ABSORBED` |
| Trevni | decoded column values | current multi-column incremental transition not closed | `UNFROZEN` |
| Protobuf | decoded field values | schema evolution/unspecified byte order is not compression-state action | `OBJECT_MISMATCH` |
| FlatBuffers | stock-reader table values | schema evolution is not compression-state action | `OBJECT_MISMATCH` |
| Cap'n Proto | decoded messages | no closed source/natural carrier | `UNFROZEN` |
| Thrift compact | decoded messages | no closed segment-state/natural carrier | `UNFROZEN` |

Full-cost for any future transition: update/build/query, output bytes, RSS/temp, codec CPU/I/O, copied/recompressed state and rollback. 72h killer: exact decode mismatch, changed reader/format, nonlegal action, no bounded recourse or no Pareto gain.
