# S2 canonical resume01 — Discovery log

- Assignment: `DISCOVERY-S2-20260814-CANONICAL-RESUME01`; method: `V8_7_POTENTIAL_READINESS_SEPARATED`.
- Scope is canonical only. `DISCOVERY_CLAIM_PACK_MODE=OFF`; no V9 artifact was created.
- Six fresh diagnostic families were screened, with three candidate-grade deep reviews. None has a non-generic same-object N1/N2/N3 residual above the current native union. Result: `COMPLETE_ZERO_PROPOSALS`.

## Breadth screen

| ID | family and bottleneck-transfer lead | status |
|---|---|---|
| R01 | Clang implicit PCM modules: parsing moves cost to module-cache validation/reuse. | Deep review; DROP. |
| R02 | rustc incremental sessions: compilation moves cost to dep-graph/work-product publish/reload. | Deep review; DROP. |
| R03 | GDB `.gdb_index`: symbol scan moves cost to mapped index construction/access. | Deep review; DROP. |
| R04 | createrepo_c `repomd`: package scanning moves cost to metadata/checksum/compression construction. | Raw exclusion: current record construction is already native; residual was generic serialization. |
| R05 | DuckDB WAL checkpoint: update compute moves cost to checkpoint materialization. | NOT_ADMITTED_UNFROZEN: current whole-action/source and a union-external atomic action were not closed without using a speculative absence claim. |
| R06 | CPack package metadata/checksum: install staging moves cost to generator-specific packaging metadata. | Raw exclusion: object splits across generators; a single same-object joint action was not defined. |

## Deep conclusions

### R01 — Clang implicit PCM module cache

Exact object is a fixed module-map/header set, target and compiler-option contract, with the same compiled object/diagnostics. Official current Clang documentation defines the cache, module hash, explicit/prebuilt module paths, implicit-module policy, ignored macros and prune controls. The source-level cache abstraction also owns lock/read/write/finalization. Thus the apparent action is already a broad current action/configuration union; a cache-layout planner would be a selector/generic packing rather than a target-specific complete algorithm. Natural carrier: LLVM test-suite or an open module-map project; finite killer: fixed semantic build must beat the configuration-union full cost (parse/validation/cache I/O/RSS/temp/object bytes) without changing module semantics. `DROP__CURRENT_UNION_AND_GENERIC_REMAINDER`.

### R02 — rustc incremental dep-graph/work-product persistence

Exact object is a fixed crate graph, toolchain, target and executable semantics. Current official rustc documentation exposes dep-graph serialization/reload, work-product copy, session-directory publication/rename and invalid-session deletion; Cargo documents incremental outputs, dep-info and build-cache paths. The named action is therefore an existing native persistence/reuse pipeline. A different invalidation threshold or cache placement is controller/config; a cross-crate rewrite would change the fixed compilation object or use generic cache scheduling. Natural carrier: versioned Rust crates from Cargo's public corpus; finite killer: equal executable/diagnostic build across a controlled commit pair, charging query/dep-graph/CGU/rename bytes and CPU/RSS. `DROP__CURRENT_UNION_AND_GENERIC_REMAINDER`.

### R03 — GDB mapped symbol index

Exact object is fixed DWARF/symbol data and unchanged stock GDB lookup/debug semantics. Current GDB documentation supplies `save gdb-index`, `gdb-add-index`, DWARF-5 alternative outputs, `objcopy` integration and a mapped `.gdb_index` layout whose authoritative behavior is `dwarf2read.c`. A byte-layout change that preserves the stock reader is constrained by the documented format; using a new reader or different index changes the object. The only unconstrained remainder is generic table packing, and direct target-specific N2/guarantee was not identified. Natural carrier: GNU/binutils debug packages or GDB test artifacts; killer: preserve stock reader acceptance and charge index generation, `objcopy`, bytes, mmap/startup/symbol lookup CPU/RSS. `DROP__CURRENT_UNION_AND_GENERIC_REMAINDER`.

## Evidence boundary

All research was read-only official/current documentation and source-reference review, completed 2026-08-14. No experiments, E2, build, download, installation, automation, Stage0/A/B work or shared-file write occurred. Missing runtime results are not used as negative evidence. The DuckDB row is nonterminal because it lacks a closed source/action union, not because of implementation or resources.
