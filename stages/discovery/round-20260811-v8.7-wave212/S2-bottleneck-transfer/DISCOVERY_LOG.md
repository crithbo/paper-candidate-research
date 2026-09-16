# Discovery log — S2 stock-verifier access-path constructor breadth

**Assignment:** `DISCOVERY-S2-20260811-V8.7-WAVE212-STOCK-VERIFIER-ACCESS-PATH-CONSTRUCTOR-BREADTH`  
**Cutoff:** 2026-08-11  
**Result:** `COMPLETE_ZERO_PROPOSALS`

Frozen method: `production_v2_v8.1 + v8.6 fidelity-closure-plan + v8.7 CURRENT_UPSTREAM_REALITY_CHECK`; `DISCOVERY_QUALITY_MODE=OFF`. Supplied hashes matched disk: plan `F0B885E43DC30CBB2BA0400286AEF1F69DECA5D4005B0989BCFDEE075FED7219`, registry `393DC81B3BC5D15011D4F04C42DE3339AFE3BFA084188E513E86A9331F8A0B1A`, ROLE `FCB9BD73C39F39D31F6C8154E6B48EA23187FF28BDF2BB3D9C59E3D28FA518A3`.

## Six de-duplicated checked-artifact families

| Family / fixed object | Producer + stock checker/reader union | Natural carrier and testable transfer acquisition | Minimal legal access-path divergence / 72h killer | Status |
|---|---|---|---|---|
| eBPF program plus fixed maps/BTF/kernel target | Clang/libbpf producer, ELF/BTF/load attributes and kernel `BPF_PROG_LOAD` verifier | Pin kernel+libbpf and a versioned in-tree selftest/program trace; compare producer/relocation/load-verifier/readback, CPU/RSS/bytes/temp/verifier-log terms | Two program objects with same hook, maps, target and packet observations, but a new global instruction/state-access constructor. Fail if altered helper/map contract, controller, or current compiler/load attribute expresses it. | `NOT_ADMITTED_UNFROZEN` |
| Rust crate `.rmeta` for fixed public crate API/dependency resolution | rustc metadata encoder, header/version/hash, lazy arrays/tables, locator/decoder and atomic metadata write | Pin nightly rustc revision and a public Cargo workspace revision history; charge compile/encode, crate-location/metadata decode, dependent compile/readback, bytes/RSS/temp | Two stock-rustc-loadable metadata objects for the same crate API and dependency graph, differing in a whole table/access constructor outside encoder union. | `NOT_ADMITTED_UNFROZEN` |
| MLIR bytecode module for fixed dialect semantics | MLIR bytecode writer/reader, dialect versioning and `verify()` union | Pin MLIR revision and upstream dialect test corpus; measure lower/write, parse/verify/readback, CPU/RSS/bytes/temp | Need stock-reader/verification-equivalent bytecode with a new cross-section access constructor, not resource-elision, bytecode version/config or a postprocessor. | `NOT_ADMITTED_UNFROZEN` |
| FlatBuffers table buffer for fixed schema/value semantics | generated builder, vtable/vector layout choices and `flatbuffers::Verifier` traversal limits | Pin FlatBuffers release and a versioned public generated-schema corpus; charge build, verifier/read, bytes/RSS/temp | Need two verifier-accepted buffers of equal values/schema where a new global vtable/offset layout action is outside builder union; fail on cache, sampling or changed schema. | `NOT_ADMITTED_UNFROZEN` |
| Apache Iceberg table snapshot/manifests for fixed table contents and snapshot semantics | current writer, manifest/manifest-list/snapshot metadata, reader/planner and validation/config surfaces | Pin Iceberg format/runtime release and versioned table snapshot history; charge data write, manifest build/update, scan/validation/read, bytes/RSS/temp | A new snapshot/manifest access-path constructor must retain stock-reader snapshot/isolation semantics, not select existing compaction/config or add an external catalog wrapper. | `NOT_ADMITTED_UNFROZEN` |
| SQLite database B-tree pages and schema for fixed logical rows/query result | SQLite page/B-tree writer, journal/WAL recovery, stock reader and `PRAGMA integrity_check` | Pin SQLite release and a public versioned database mutation history; charge insert/update/checkpoint, integrity/read/query, bytes/RSS/temp | Must produce same stock-reader values, query semantics and integrity result by a new global page/index access construction, not page size/pragma/cache/journal tuning. | `NOT_ADMITTED_UNFROZEN` |

These are distinct from CVC5/QRP/PB/LRAT, generic proof compression, JAR/checksum work, and all excluded prior objects. The stated producer-to-check/lookup bottleneck transfer is deliberately an acquisition hypothesis; no profile is presented as evidence before a versioned natural trace is frozen.

## Candidate-grade deep reviews

### D1 — eBPF verifier access state

The [kernel verifier documentation](https://www.kernel.org/doc/html/latest/bpf/verifier.html) describes tracking ranges/types for registers and stack slots; `BPF_PROG_LOAD` is the native verify-and-load operation. Current `BPF_PROG_LOAD` attributes, program type, map definitions, BTF/CO-RE relocation and compiler layout are all part of the fair union. Exact object is not merely source code: it includes the program instruction stream, hook, map/BTF bindings, permitted kernel target and observed behavior.

The tempting action—reorder guards/accesses to reduce verifier exploration—is either a compiler transformation already in the producer space, changes instruction-level program/object, or is not frozen as a complete semantics-preserving constructor. The finite route is a pinned kernel/libbpf pair, two small in-tree-style programs with identical hook/map inputs and packet outputs, load-log and behavior oracle, plus compile/load/verify/readback bytes/RSS/temp. It fails closed if the candidate needs a new map/helper contract, changes verification guarantee, is an existing compiler action, or lacks natural revision provenance. No brief.

### D2 — Rust `.rmeta` lazy access layout

Current official rustc documentation identifies `.rmeta` as serialized crate metadata, with lazy arrays/tables and a header/version; the metadata crate also exposes the locator/validation responsibilities and an atomic temporary-write/rename path. See [rmeta](https://doc.rust-lang.org/stable/nightly-rustc/rustc_metadata/rmeta/index.html), [metadata crate](https://doc.rust-lang.org/stable/nightly-rustc/rustc_metadata/index.html), and [metadata filesystem path](https://doc.rust-lang.org/stable/nightly-rustc/rustc_metadata/fs/index.html). These are contrary evidence against claiming an absent native metadata access mechanism.

Exact object freezes crate public API, dependency graph, target, rustc revision/metadata version, dependent compilation and stock decoder results. A legal N2 would jointly construct metadata tables/offsets so stock rustc validates and resolves the same crate while changing dependent decode/lookup cost. Current encoder/decoder source and all internal options were not fully pinned at a single commit; nor is a complete union-external atomic action witness known. This is `NOT_ADMITTED_UNFROZEN`, not a rejection for absent implementation.

### D3 — FlatBuffers verifier traversal layout

FlatBuffers’ [C++ documentation](https://flatbuffers.dev/languages/cpp/) and its upstream verifier describe a native buffer verifier alongside generated builders and schema-controlled vtable/offset layout. Exact object must fix schema, values, verifier limits and stock consumer results. Any dynamic layout action must preserve the same offsets/references and verifier acceptance.

No legal divergence closes: changing field order/schema, enabling a preexisting builder option, cache/sampling verification, or emitting then repacking externally fails the assignment contract. The finite killer is one frozen release, adjacent public schema/message revisions, stock verifier plus value readback, and build/verify/read/bytes/RSS/temp accounting. `NOT_ADMITTED_UNFROZEN` because the full builder union and natural mutation carrier remain unclosed.

### D4 — Iceberg snapshot-manifest access path

The [Apache Iceberg specification](https://iceberg.apache.org/spec/) fixes snapshots, manifest lists and manifests as reader-visible table metadata. A same-object action must preserve table contents, snapshot identity/isolation semantics and stock reader query result. Existing writer, manifest generation, planning, maintenance/compaction and catalog configuration must be included in the strongest union; none can be ignored as a “mere API.”

The only presently named variations are existing maintenance/configuration, catalog-level coordination, or external metadata repack. No source-pinned union-external whole constructor and no finite official mutation trace with the required producer/check/read denominator were frozen. `NOT_ADMITTED_UNFROZEN`.

## Fidelity and full-cost rule

For any rescreen, pin source commit/release plus defaults/non-defaults; obtain a versioned public mutation corpus for the exact object; create two stock checker/reader-equivalent outputs with a named whole action divergence; and replay a small trace. Charge producer/construct, check/verify, reader/lookup, CPU/wall time, RSS, bytes and temporary storage. The 72-hour killer fails on union expression, external postprocess/controller, changed theorem/object/guarantee, stock rejection, missing natural route, or absent full-cost residual. This assignment performed no experiment, benchmark, download or automation.

## Outcome

`PROPOSE_STAGE0: []`. All rows remain `NOT_ADMITTED_UNFROZEN`; no absence claim is made from unimplemented action, unavailable result, resource condition or AI readiness. State: `IDLE_REUSABLE_AWAITING_MAINLINE`.
