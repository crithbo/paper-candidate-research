# Discovery Question Cards

## QC-S82-01 — GNU ar archive symbol-index construction

- Exact public identity: current GNU Binutils `ar`/`ranlib` documentation, checked 2026-08-15.
- Same-object contract: fixed normal archive member object files, member order, symbol definitions and archive format; stock linker resolution and `nm --print-armap` contents must remain the same.
- Carrier kind: `NATURAL`; a public static-library build is a finite future carrier, not acquired here.
- Contribution: `METHOD_ALGORITHM`, N2; symbol-index construction.
- Security scope: `PASS`.

### Current union and native oracle

Official GNU documentation states that `ar s` writes/updates an object-file index and is equivalent to `ranlib`; `ranlib` stores an index listing each symbol defined by a relocatable object member. `nm -s` / `nm --print-armap` lists it. `S` suppresses generation but yields an archive unusable by the linker; deterministic `D`/`U` and thin archive are documented separate format controls.

### Minimal action divergence / falsifier

For two fixed members defining different symbols, any candidate index must associate each required symbol key with its member location. Reordering index entries or changing an internal key-table layout leaves the same symbol-to-member relation. It is a generic associative table/symbol-index construction, while changing member order or using thin archive changes the frozen archive/format object.

The direct falsifier is met: there is no source-supported GNU-ar-specific semantic guarantee beyond generic key-to-offset table representation. This fails the non-generic discriminator before raw.

### Full cost and disposition

If viable, full cost would include archive/index bytes, `ar`/`ranlib` CPU/RSS/temp, linker lookup/link CPU and `nm --print-armap` equality. A finite stock route exists but is not executed. Disposition: `EXCLUDED_BEFORE_RAW__CURRENT_AR_RANLIB_INDEX_CONTRACT_PLUS_GENERIC_SYMBOL_TO_MEMBER_TABLE_KERNEL`.

中文理由：官方接口已固定 index 必须映射成员定义的 symbol；重排或表布局只属通用 key→member table，不能形成 GNU ar 专属算法或保证，故 raw 前排除。与实现、结果、资源和 AI readiness 无关。
