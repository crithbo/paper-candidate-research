# SOURCE_COLLISION_MATRIX

| Object | Official current source / upstream anchor | Reality and strongest-union finding | Final classification |
|---|---|---|---|
| WebAssembly | [Core 3.0](https://webassembly.github.io/spec/core/), [binary grammar](https://webassembly.github.io/spec/core/binary/conventions.html), [validation algorithm](https://webassembly.github.io/spec/core/appendix/algorithm.html) | Legal multiple encodings are accepted by design; encoder selection does not escape the same-object union. | `DROP` |
| Avro | [authoritative specification](https://avro.apache.org/docs/++version++/specification/), [Apache upstream](https://github.com/apache/avro) | Writer/reader schema resolution, defaults, union matching and errors are already the native contract/action surface. | `DROP` |
| Lean | [elaboration and compilation reference](https://lean-lang.org/doc/reference/latest/Elaboration-and-Compilation/), [Lean upstream](https://github.com/leanprover/lean4) | Kernel checks elaborator output; a non-generic complete new algorithm was not frozen without changing the object. | `DROP` |
| GNU ld | [current ld manual](https://sourceware.org/binutils/docs/ld/), [linker scripts](https://sourceware.org/binutils/docs/ld/Scripts.html) | Linker-script layout selection is explicit configuration/language action space. | `DROP` |
| CBOR | [RFC 8949](https://www.rfc-editor.org/rfc/rfc8949) | Deterministic encoding is direct canonical construction, excluded by this assignment. | `DROP` |
| FlatBuffers | [official C++ guide](https://flatbuffers.dev/flatbuffers_guide_use_cpp.html), [Google upstream](https://github.com/google/flatbuffers) | Builder/layout changes are ordinary emitter work unless a new full algorithm is specified; none was. | `DROP` |

No old issue, future-work line, or missing-interface premise was used as evidence of a current residual.  No direct paper collision is asserted where no candidate survived to a paper-shaped mechanism.
