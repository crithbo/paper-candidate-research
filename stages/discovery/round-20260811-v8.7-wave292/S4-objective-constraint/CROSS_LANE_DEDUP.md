# Cross-lane and registry de-duplication

This package deliberately excludes all listed active, blocked, terminal, and prior S4 object contracts, including V8 snapshots, Mach-O export tries, Clang PCH/PCM, Go unified export data, generic checked-proof formats, Qt RCC, FlatBuffers, Zarr, KLL/Theta/CPC/FrequentItems, DuckDB, and GPU-resource-lifetime objects.

| New family | Exact object boundary | De-duplication conclusion |
|---|---|---|
| Linux BTF | Versioned `vmlinux` BTF section interpreted by the matching Linux BTF parser/verifier | New object; not a snapshot, certificate, or existing data-structure contract. |
| Lucene segment opening | Same-version Lucene segment files interpreted by its segment readers | New object; not a database physical-store proposal. |
| fontconfig cache | Native fontconfig cache consumed by the matching cache reader | New object; no overlap with startup-artifact objects already reviewed. |
| JavaScriptCore cached bytecode | Same-engine bytecode cache and interpreter semantics | New object; distinct from V8 snapshot contract. |
| PostgreSQL GIN pending list | Fixed GIN index/query/update semantics and native cleanup | New object; distinct from DuckDB and storage objects already recorded. |
| Linux module alias index | `depmod` module-alias output consumed by `modprobe` semantics | New object; distinct from link-edit and generic startup formats. |

No row is a re-name or recovery of a terminal object. Registry/current-plan inspection found no same exact-object assignment among the active six lanes.
