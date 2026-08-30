# Source and collision matrix — Wave223 FlatBuffers depth

| Facet | Official current evidence | Baseline union / contrary evidence | Candidate disposition |
|---|---|---|---|
| Backwards construction and legal ordering | [FlatBuffers internals](https://flatbuffers.dev/internals/) | Current implementation constructs backwards; child and field writing order has flexibility. | Flexibility is not itself a new N2; planner action must still be named. |
| Vtable layout/reuse | [Internals](https://flatbuffers.dev/internals/), [current release](https://github.com/google/flatbuffers/releases) | Reader uses vtables; matching vtables may be shared; upstream release history includes vtable-dedup fixes. | Existing dedup is a direct strong baseline atom, not automatic proof against a new algorithm. |
| String reuse and allocation | [Rust builder docs](https://flatbuffers.dev/languages/rust/) | `strings_pool`, `written_vtable_revpos`, backing buffer and capacity preallocation are exposed current builder mechanisms. | A proposal must jointly outperform these under a fixed object, not rename preallocation/sharing. |
| Verifier/reader contract | [C++ guide](https://flatbuffers.dev/languages/cpp/), [internals](https://flatbuffers.dev/internals/) | Generated readers traverse offsets in-place; verifier/reader acceptance fixes semantic boundary. | Schema/order/reader changes and postprocess are object changes. |
| Natural route | [TensorFlow Lite converter](https://www.tensorflow.org/lite/convert?hl=es-419) | Converter emits `.tflite` FlatBuffers, but exact versioned mutation trace and native verifier boundary were not frozen. | Natural carrier remains unfrozen. |
| Latest collision | Official documentation/upstream release only; no primary-paper collision is asserted closed | No claimed absence is based on literature search failure. | Claim ceiling is zero proposal pending a complete source/action and literature audit. |

**Decision:** `NOT_ADMITTED_UNFROZEN`. No generic packing, buffer compression, postprocessor, schema reorder, cache/controller or format change is treated as a retained action.
