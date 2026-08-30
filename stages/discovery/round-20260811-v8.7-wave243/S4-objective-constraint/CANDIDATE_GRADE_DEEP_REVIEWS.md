# Candidate-grade deep reviews

## B01 — Clang PCH/PCM

- Exact contract: fixed translation-unit/module graph and stock matching `ASTReader`; same compiler-visible declarations, lookup and lazy-deserialization semantics.
- Current union: ASTWriter/ASTReader record emission, chained PCH and module-DAG IDs, existing PCH/module flags and cache behavior.
- Minimal proposed divergence: change record/identifier/declaration scheduling while maintaining every offset and lazy lookup index.
- Full cost/natural route/killer: writer CPU/RSS/temp, PCM bytes, import/compile latency and RSS on 20–50 public module/PCH units; stock Clang must accept and compile equivalent TUs.
- Outcome: `NOT_ADMITTED_UNFROZEN__COMPLETE_ASTWRITER_ASTREADER_RECORD_AND_FLAG_UNION_NOT_CLOSED`. The documentation proves lazy reading, not a union-external scheduling action.

## B03 — ICU `.dat`

- Exact contract: fixed data item names/bytes/API semantics and a stock ICU loader on matching platform format.
- Current union: `icupkg`/`gencmn` package construction, 16-byte alignment, package/files/library modes, directory search and cache behavior.
- Minimal proposed divergence: jointly order data items/pages to trade mapped RSS and initial access, with all 16-byte and lookup-index constraints preserved.
- Full cost/natural route/killer: package CPU/RSS, `.dat` bytes, mmap/initial item-load latency/RSS across fixed ICU data/test packages; stock `udata`/resource opening must reproduce values.
- Outcome: `NOT_ADMITTED_UNFROZEN__ICUPKG_INDEX_ORDER_AND_CURRENT_PACKAGING_CONFIG_UNION_NOT_FULLY_ENUMERATED`. Different package modes change deployment/loader semantics and cannot be silently compared.

## B05 — Go unified export data

- Exact contract: same package API, deep import summary, inlining/generic/escape-analysis metadata, and matching stock unified importer.
- Current union: compiler writer/reader serialized object graph and index-based lazy decode; build flags and import-cache behavior.
- Minimal proposed divergence: jointly schedule/index metadata chunks under the existing reader while retaining all direct-import semantics.
- Full cost/natural route/killer: compile CPU/RSS/temp, export bytes, direct-import latency/RSS on 20–50 standard-library/public-module edges; matching Go compiler must rebuild dependent packages equivalently.
- Outcome: `NOT_ADMITTED_UNFROZEN__UNIFIED_EXPORT_READER_WRITER_INDEX_ACTION_UNION_NOT_CLOSED`. The official design exposes an index/lazy reader but does not certify an unclaimed whole constructor action.

No deep row is rejected for absence of an implementation, result, hardware or AI readiness.

