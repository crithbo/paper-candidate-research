# Source and collision matrix — Wave231 FlatBuffers closure

| Facet | Frozen current source / primary source | Strongest union or subtractor | Candidate residual |
|---|---|---|---|
| Format constraints | [Internals](https://flatbuffers.dev/internals/), upstream tag `282dcb1c3266b45600510da4810092f6ec4c85f2` | offsets, alignment, backwards construction, root/vtable semantics | DP only searches legal constructions; no format/reader change. |
| Local reuse | [Rust builder docs](https://flatbuffers.dev/languages/rust/), `flatbuffer_builder.h` | vtable dedup and `CreateSharedString` are included in every baseline | Candidate schedules the complete graph around those atoms, not a new dedup primitive. |
| Verifier/reader | [C++ guide](https://flatbuffers.dev/languages/cpp/), `verifier.h` | stock verifier/generated reader accepts both buffers | Equal stock observations are hard constraints. |
| Natural carrier | [TFLite converter](https://www.tensorflow.org/lite/convert?hl=es-419) | TFLite emits FlatBuffers; exact corpus hashes deferred to finite Stage A closure | Natural route is finite; no trace/result is claimed yet. |
| Academic collision | [serialization survey](https://arxiv.org/abs/2201.02089), [benchmark](https://arxiv.org/abs/2201.03051), official/primary query boundary | No decisive same-object profile-guided whole-buffer constructor identified | `SEARCH_BOUNDED_OPEN`; not a novelty claim. |

**Direct absorption:** none established. **Direct-subtract condition:** any current source or paper that implements the same profile-indexed constrained whole-buffer planner under stock FlatBuffers semantics. **Claim ceiling:** conditional Stage 0 proposal only.
