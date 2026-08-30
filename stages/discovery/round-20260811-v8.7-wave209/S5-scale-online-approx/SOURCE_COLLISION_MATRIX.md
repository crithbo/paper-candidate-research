# Wave209 Exact External-Memory Matrix

| Object | Fixed output/oracle | Current union | Disposition |
|---|---|---|---|
| GNU sort | byte/line ordering incl. keys/stability | memory buffer, temp dirs/files, merge, compression, parallel option | `UNION_ABSORBED` |
| SQLite ORDER BY | SQL ordered rows | VDBE sorter, existing index, transient temp storage | `UNION_ABSORBED` |
| SQLite compound set op | SQL set result | transient index create/remove/walk | `UNION_ABSORBED` |
| DataFusion sort | exact Arrow row ordering | spill reservation/native spill | `UNION_ABSORBED` |
| GNU merge | merged sorted stream | `-m` and existing temp/buffer controls | `UNION_ABSORBED` |
| stable/unique sort | contract-specific output | not same fixed output if changed | `OBJECT_VARIANT_EXCLUDED` |

Future finite killer: pin public natural stream; compare stock oracle; charge CPU/RSS/temp/I/O/bytes/query and reject on any mismatch, bound breach or no full-cost gain.
