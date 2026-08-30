# RAW_SCREEN_ROW_EVENT ledger

All six rows are mutually distinct, non-revived opportunity families.  Sources are standards, official project documentation, or upstream repositories inspected at the frozen date.

| ID | Family / primary sources | Same-object semantic focus | Raw outcome |
|---|---|---|---|
| R01 | WebAssembly binary decoder-validator ([Core 3.0](https://webassembly.github.io/spec/core/), [binary conventions](https://webassembly.github.io/spec/core/binary/conventions.html)) | One `.wasm` module accepted and executed with the same validation/execution semantics | `CANDIDATE_GRADE_DEEP_REVIEW` |
| R02 | Apache Avro writer/reader schema resolution ([authoritative specification](https://avro.apache.org/docs/++version++/specification/), [upstream](https://github.com/apache/avro)) | One Avro datum/file and specified writer/reader-schema resolution result | `CANDIDATE_GRADE_DEEP_REVIEW` |
| R03 | Lean elaborator to trusted-kernel proof checking ([official reference](https://lean-lang.org/doc/reference/latest/Elaboration-and-Compilation/), [upstream](https://github.com/leanprover/lean4)) | One theorem statement and kernel-accepted proof term | `CANDIDATE_GRADE_DEEP_REVIEW` |
| R04 | GNU ld linker-script/ELF producer boundary ([ld manual](https://sourceware.org/binutils/docs/ld/), [scripts](https://sourceware.org/binutils/docs/ld/Scripts.html)) | Same input objects and loader-visible ELF/link semantics | `STRUCTURAL_DROP__SCRIPT_OR_CONFIGURATION_SPACE` |
| R05 | CBOR deterministic encoding ([RFC 8949](https://www.rfc-editor.org/rfc/rfc8949)) | Same CBOR data model and deterministic encoding verification | `STRUCTURAL_DROP__DIRECT_CONSTRUCTION` |
| R06 | FlatBuffers builder/verifier boundary ([official docs](https://flatbuffers.dev/flatbuffers_guide_use_cpp.html), [upstream](https://github.com/google/flatbuffers)) | Same table and verifier-accepted buffer semantics | `STRUCTURAL_DROP__ORDINARY_EMITTER_PATCH` |

No current-implementation absence is asserted in the raw screening rows.
