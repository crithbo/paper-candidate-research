# Action-space / collision matrix — WAVE13

| Mechanism | Same final object | Actions / information | Full-cost coverage | Relation to candidate |
|---|---|---|---|---|
| Parquet Java / Iceberg current writer | Standard Parquet file | Page size/row caps, codec, dictionary and Bloom configuration | Writer bytes/CPU and metadata controls | Strong current writer baseline; scalar actions do not by themselves express nonuniform workload-conditioned partitioning. |
| Arrow `arrow-rs` | Same Parquet query result | PageIndex pruning, predicate-first `RowSelection`, late materialization, cache; RLE/bitmask policy | Reader I/O/decompression/decode/caching | Direct subtractor for read-side work; candidate must beat it unchanged. |
| Oasis | Same Parquet query result with specialized deployment | SmartNIC decoding and network overlap | Read/decode/network cost, special hardware | Deployment baseline; does not justify omitting writer/full-cost ledger. |
| Workload-aware external layout/index schemes | Often related data/query goal | Repartition rows/files or maintain extra indexes | Usually different storage/object and update cost | Adjacent only unless shown standard-Parquet/same-reader/same-ledger. |
| Candidate | Same standard Parquet query result | One DP jointly chooses nonuniform page cuts, per-page encoding/codec and native synopsis | Write + index + bytes + range I/O + decode + query cost | Action-gap hypothesis; direct fatal if current same-object mechanism is found. |

## Reality-check collision constraints

- Native sources already expose `withPageSize`, `withPageRowCountLimit`, page-size checks, and Bloom controls; no proposal may pretend these actions do not exist.
- Arrow already uses PageIndex and skips decompression for wholly pruned pages; no reader-side pruning claim is novel here.
- The retained question is only whether a *joint construction algorithm* adds action beyond independent scalar configuration and current read execution.
- If achieving a gain requires an external index, a changed reader/format, approximate answers, or a policy selector over unchanged layouts, classify `DROP`.

## Current collision disposition

`PARQUET-PAGE-COSEGMENT`: `DIRECT_SUBTRACT` for existing components; no `DIRECT_FATAL` identified within the documented/current-source boundary. Require independent Stage 0 latest collision search focused on workload-aware standard-Parquet page co-construction.
