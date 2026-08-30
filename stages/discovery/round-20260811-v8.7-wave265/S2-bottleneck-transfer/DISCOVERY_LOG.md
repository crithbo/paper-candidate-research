# Discovery log — S2 reader-access bottleneck witness-first breadth

**Assignment:** `DISCOVERY-S2-20260811-V8.7-WAVE265-READER-ACCESS-BOTTLENECK-WITNESS-FIRST-BREADTH`  
**Cutoff:** 2026-08-11  
**Result:** `COMPLETE_ZERO_PROPOSALS`

Frozen method: `production_v2_v8.1 + v8.6 fidelity-closure-plan + v8.7 CURRENT_UPSTREAM_REALITY_CHECK`; `DISCOVERY_QUALITY_MODE=OFF`. Dispatch hashes matched disk: AGENTS `66231F71EF6AB250A1AD9FF576D5840978F09EFC03BF5D2F0527D47F4D82B063`, plan `38322375B100868C99B92D4330418DA1F61B765239D1E28E351AE465EBBD4764`, registry `DFC49ABCE63D2EE991AC0FF930C76B5031F7CC08482BDFBEC6B62A72D09AA9AC`, ROLE `FCB9BD73C39F39D31F6C8154E6B48EA23187FF28BDF2BB3D9C59E3D28FA518A3`.

## Witness-first screening

| Fresh family / fixed object | Current writer+reader union and stock oracle | Minimal legal divergence witness | Natural route/full cost/72h killer | Disposition |
|---|---|---|---|---|
| Fuchsia persisted FIDL non-resource value | generated bindings, `persist`/`unpersist`, canonical wire traversal, stock equality | none: wire format states exactly one encoding for a given message | Fuchsia source/example persistence cases; encode/decode/bytes/RSS/temp; fail if bytes differ under same value | `STRUCTURAL_DROP` |
| SBE fixed-template financial message | generated encoder/decoder, fixed header/template/version, schema evolution | none: streaming body/header order is schema-defined; changed placement changes schema/message | official SBE samples; encode/decode/bytes/RSS/temp; fail on header/schema difference | `STRUCTURAL_DROP` |
| Bond CompactBinary fixed schema/value | CompactBinary writer/reader, schema/protocol selection, deserialize value oracle | field/protocol change is current protocol selection or a changed encoded object; no zero-copy stock reader | official Bond examples; serialize/deserialize/bytes/RSS/temp | `STRUCTURAL_DROP` |
| Apache Thrift CompactProtocol fixed struct/value | generated protocol writer/reader and field tags | any target-specific ordering either changes tagged bytes or is ordinary protocol writer behavior | official Thrift conformance/example corpus route | `NOT_ADMITTED_UNFROZEN` |
| Apache Avro OCF fixed schema/records/order | writer block/codec/sync marker and stock datum reader | only block/codec arrangement identified; it is configuration/compression, not reader-access joint action | official Avro datafile/example route | `NOT_ADMITTED_UNFROZEN` |
| CBOR deterministic-profile fixed value | canonical/deterministic encoder and stock decoder | canonical ordering removes alternative action; noncanonical action changes guarantee | official deterministic CBOR vectors | `STRUCTURAL_DROP` |

All listed exact objects are distinct from current FlatBuffers, OpenVDB and ORC assignments. Candidate-grade deep reviews are FIDL, SBE and Bond.

## Deep review D1 — persisted FIDL

Fuchsia documents [explicit persistence](https://fuchsia.dev/docs/reference/fidl/bindings/rust-bindings) with `persist`/`unpersist`, and its [wire format specification](https://fuchsia.googlesource.com/fuchsia/%2B/refs/heads/main/docs/reference/fidl/language/wire-format/README.md) says objects are stored in traversal order and encoding is canonical—exactly one encoding for a given message. Its zero-copy/in-place property is native, but eliminates the required same-object action divergence. A layout change violates canonical encoding or changes the type/message contract. `STRUCTURAL_DROP`.

## Deep review D2 — SBE

The [official SBE project](https://github.com/aeron-io/simple-binary-encoding) and [C++ guide](https://github.com/aeron-io/simple-binary-encoding/wiki/Cpp-User-Guide) fix the message header (block length/template/schema/version) and streaming encoder/decoder traversal. Exact same template, version and values leave no stock-reader-equivalent physical reorder action: changing block order/length is a schema/message change; buffering/packing outside that contract is a wrapper. `STRUCTURAL_DROP`.

## Deep review D3 — Bond CompactBinary

The [official Bond manual](https://microsoft.github.io/bond/manual/bond_cs.html) fixes the generic serializer/`CompactBinaryReader` contract and protocol alternatives; the [C++ reference](https://microsoft.github.io/bond/reference/cpp/index.html) gives stock serialize/deserialize. This is not a zero-copy stock-reader access object. Selecting a protocol, reuse/caching, or rearranging generic fields is respectively a configuration, wrapper or changed object. No nontrivial reader-access joint constructor is named. `STRUCTURAL_DROP`.

## Outcome

`PROPOSE_STAGE0: []`. The three direct drops are based on canonical/schema/protocol-contract absorption, not implementation, results, resources or AI readiness. The remaining three lack a frozen legal witness rather than being scientifically negative. No experiment, benchmark, asset download, Stage0/A/B, automation or shared-control edit occurred. State: `IDLE_REUSABLE_AWAITING_MAINLINE`.
