# De-duplication

This screen excludes JSC, BTF, GIN, all Wave322 tail-risk families, and the documented repeat/terminal families (including Wasmtime, Avro, ripgrep, Squashfs, ThinLTO, ICU data, SQLite, certificate-chain, startup-artifact, and existing GPU/format contracts). It also avoids the active Wave326 semantic-mismatch, Wave327 verified-bottleneck, Wave328 natural-structure-reuse, Wave330 recourse-migration, and Wave331 paper/artifact-residual scopes.

| ID | Fresh same-object family | Why distinct |
|---|---|---|
| R01 | Tree-sitter grammar to generated parser/runtime | Grammar/parser object, not a regex-engine or compiler-cache object. |
| R02 | ext4 HTree directory image interpreted by stock ext4 | Native directory format, not an artifact-layout or BTF object. |
| R03 | Bazel loading/analysis graph for a fixed workspace | Build-analysis object, not a state-migration assignment. |
| R04 | rustc incremental dep-graph/work-product cache | Compiler incremental-cache object, distinct from ThinLTO and Cargo resolving. |
| R05 | GNU Make dependency-file remake graph | Native build dependency object, distinct from Bazel analysis. |
| R06 | GN target graph generation for a fixed source tree | Separate build-system semantic object. |
| R07 | Linux Kconfig configuration dependency solver | Kernel configuration semantics, not ext4 on-disk format. |
| R08 | e2fsck directory-index validation/rebuild | Native filesystem-check object, distinct from stock ext4 lookup. |
| R09 | Protobuf descriptor-pool lookup/load | Descriptor runtime object, not a prior wire-format proposal. |
| R10 | Tree-sitter query compilation/matching | Query-language semantics, distinct from parser generation/runtime. |

None is renamed from an active, blocked, or terminal registry object.
