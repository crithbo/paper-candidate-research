# Source and collision matrix — Wave265

| Family | Current first-party source | Same-object witness result | Full-cost / finite route | Decision |
|---|---|---|---|---|
| FIDL | [wire format](https://fuchsia.googlesource.com/fuchsia/%2B/refs/heads/main/docs/reference/fidl/language/wire-format/README.md), [Rust persistence](https://fuchsia.dev/docs/reference/fidl/bindings/rust-bindings) | canonical encoding directly absorbs layout alternatives | persist/unpersist + CPU/RSS/bytes; canonical-byte mismatch killer | `STRUCTURAL_DROP` |
| SBE | [upstream](https://github.com/aeron-io/simple-binary-encoding), [C++ guide](https://github.com/aeron-io/simple-binary-encoding/wiki/Cpp-User-Guide) | header/template/version and streaming traversal admit no physical reorder | generated sample message + encode/decode/bytes/RSS | `STRUCTURAL_DROP` |
| Bond | [C# manual](https://microsoft.github.io/bond/manual/bond_cs.html), [C++ reference](https://microsoft.github.io/bond/reference/cpp/index.html) | non-zero-copy protocol selection/field sequence is not N2 | stock serialize/deserialize/bytes/RSS | `STRUCTURAL_DROP` |
| Thrift Compact | [Apache Thrift upstream](https://github.com/apache/thrift) | writer/reader union not source-pinned for a legal layout witness | conformance corpus, full cost pending pin | `NOT_ADMITTED_UNFROZEN` |
| Avro OCF | [Avro specification](https://avro.apache.org/docs/current/specification/) | only codec/block configuration identified | datafile reader/writer cost pending action closure | `NOT_ADMITTED_UNFROZEN` |
| deterministic CBOR | [RFC 8949](https://www.rfc-editor.org/rfc/rfc8949) | canonical representation removes same-value layout freedom | standard vectors/full cost | `STRUCTURAL_DROP` |

No interface absence, missing implementation, resource condition or search failure was used as a DROP reason.
