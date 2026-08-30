# Discovery log — S2 parser / validator / storage bottleneck migration

**Assignment:** `DISCOVERY-S2-20260811-V8.7-WAVE70-PARSER-VALIDATOR-STORAGE-BOTTLENECK-MIGRATION`  
**Cutoff:** 2026-08-11 · **result:** `COMPLETE_ZERO_PROPOSALS`

## Frozen method

This package uses accepted `production_v2_v8.1 + v8.6 fidelity-closure-plan + v8.7 CURRENT_UPSTREAM_REALITY_CHECK`, frozen at `v8.7-authoritative-plus-r3-p0-clarity-compatibility__r5-p0-funnel-clarity__r7-p0-repair-vector-dormant-off__discovery-six-lanes-direct-20260811__p1-shadow-not-authoritative`, `DISCOVERY_QUALITY_MODE=OFF`. It does not use v8.8 or R7 shadow/dormant production semantics.

For each parser/reader object, the full contract is: native input carrier, reader/checker acceptance semantics, output/object guarantee, information set, and total cost of input movement, parse/decode, verification, construction, metadata/index creation, and readback. A representation flag, cache tuning, wrapper, or controller is not a complete N2.

## R5-P0 funnel ledger

| Event | Opportunity family | Classification |
|---|---|---|
| raw-01 | simdjson On-Demand parsing after SIMD structural scan | unique; deep reviewed |
| raw-02 | simdjson DOM index materialization | repeat of raw-01 | `EXCLUDED` |
| raw-03 | FlatBuffers builder/verifier after zero-copy reading | unique; deep reviewed |
| raw-04 | FlatBuffers alignment verifier | repeat of raw-03 | `EXCLUDED` |
| raw-05 | OpenZFS block-pointer/checksum metadata after I/O acceleration | unique; deep reviewed |
| raw-06 | OpenZFS send incremental metadata selection | repeat of raw-05 | `EXCLUDED` |
| raw-07 | LevelDB table block decode/checksum/index construction | unique; deep reviewed |
| raw-08 | LLVM bitcode reader/verification materialization | unique |
| raw-09 | Apache Avro schema resolution/decoder construction | unique |
| raw-10 | Cap'n Proto traversal-limit validation/layout | unique |
| raw-11 | Linux fs-verity Merkle-tree reader/checking | unique |
| raw-12 | HDF5 chunk/filter decode and metadata cache | unique |
| raw-13 | Protobuf parser/arena construction | repeat of Wave60 | `EXCLUDED` |
| raw-14 | SQLite pager/WAL reader | registry-previous object | `EXCLUDED` |

Counts: `raw_row_events=14`; `repeat_rescreen_events=5`; `unique_opportunity_families=9`; `candidate_grade_deep_reviews=4`; `grounded_briefs=0`.

## Deep reviews

### simdjson On-Demand and structural index — `DROP`

**Exact object:** a JSON document accepted/rejected under simdjson’s parser semantics, with values accessed under the same API/Unicode/number rules. **Information:** input bytes and requested fields; **full cost:** padding/input ownership, structural scan, validation, index/materialization when required, field traversal and error delivery. The first-party project documents On-Demand as default, DOM and On-Demand APIs, runtime implementation selection, and full UTF-8/exact-number validation. An apparent residual arises when SIMD scan makes index construction or field access dominate. The reviewed atomic actions—choose DOM vs On-Demand, defer index/use, traverse/order requested paths—are current API/path choices. A proposed global representation would either change lazy-access/error semantics or require a new parser contract; no finite divergence witness preserving all reader/checker semantics was frozen. This is an action-gap failure, not a failure due to missing benchmark or implementation.

### FlatBuffers builder/verifier/layout — `DROP`

**Exact object:** a schema-valid FlatBuffer whose generated reader and verifier retain existing compatibility/validity semantics. **Information:** schema plus field values; **full cost:** builder construction, padding/alignment, offsets/vtables, verifier traversal, and zero-copy reader access. Official upstream describes direct access without unpacking, generated code plus `FlatBufferBuilder`, and current releases include verifier fixes. The possible residual is layout/verification work after eliminating conventional parsing. Builder placement/alignment and verifier configuration are already parts of the native construction/checking union. A new layout would alter the serialized carrier or generated-reader compatibility; no same-buffer, same-verifier complete construction and bounded fidelity plan was identified. The candidate is therefore direct-object/guarantee divergent, not merely temporarily unimplemented.

### OpenZFS block pointer/checksum metadata — `DROP`

**Exact object:** a ZFS block read/send result with ZFS integrity, record-splitting, encryption and checksum semantics. **Information:** pool metadata and block pointer graph; **full cost:** physical I/O, checksum, metadata traversal, record handling, and reader verification. Current upstream discussions/release material confirm block-pointer/checksum relationships and performance changes, but the natural residual after fast I/O is metadata traversal/validation. A cached/ordered traversal or checksum policy is controller-like. A new compact pointer/index construction risks changing on-disk, encryption, record-splitting or integrity semantics. No finite same-object witness was frozen; the row is dropped without making an absence claim about all future ZFS algorithms.

### LevelDB table reader/checksum/index — `DROP`

**Exact object:** a LevelDB lookup that preserves key/value, comparator, corruption detection and snapshot semantics. **Information:** table bytes and lookup key; **full cost:** block read, block decode, checksum, restart-array search, index/filter access and output. The first-party implementation exposes table blocks, checksums, block cache and filters as a coordinated reader path. The post-I/O residual is decode/check/index layout, but its candidate atomic operations were cache/filter/block-selection choices already in the reader union. A new block representation changes SSTable format or reader compatibility; no full same-format construction with a quality/complexity delta was frozen. It fails the whole-action witness.

## Other screens

| Family | Result |
|---|---|
| LLVM bitcode reader | `NOT_ADMITTED_UNFROZEN`: the exact bitcode/diagnostic/IR-construction contract and a union-external construction were not jointly frozen. |
| Apache Avro | `STRUCTURAL_DROP`: schema-resolution configuration or decoder selection is a reader policy; changing encoding changes the carrier. |
| Cap'n Proto | `STRUCTURAL_DROP`: traversal-limit/capability configuration is validation policy; a new layout changes reader contract. |
| Linux fs-verity | `NOT_ADMITTED_UNFROZEN`: a metadata layout action preserving the Merkle integrity contract was not finitely stated. |
| HDF5 | `STRUCTURAL_DROP`: chunk/filter/cache choice is a controller/format configuration and overlaps excluded S6 format terrain. |

## Integrity and conclusion

Current-source checks used only official/upstream repositories, source documentation and releases. The four deep reviews include reader/checker, information, full-cost and action-space comparisons. The other rows are bounded screens—not claims of implementation absence. Missing implementation, core result, resources, artifact download and AI readiness were never a DROP premise. No experiment, benchmark, download, Stage0/A/B directory, automation or shared control file was created.

`PROPOSE_STAGE0: []`. Lane state after handoff: `IDLE_REUSABLE_AWAITING_MAINLINE`.
