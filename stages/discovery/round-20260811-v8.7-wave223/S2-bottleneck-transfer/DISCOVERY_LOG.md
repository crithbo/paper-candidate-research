# Discovery log — S2 FlatBuffers vtable/object-layout planner depth

**Assignment:** `DISCOVERY-S2-20260811-V8.7-WAVE223-FLATBUFFERS-VTABLE-OBJECTLAYOUT-PLANNER-DEPTH`  
**Cutoff:** 2026-08-11  
**Result:** `COMPLETE_ZERO_PROPOSALS`

Frozen method: `production_v2_v8.1 + v8.6 fidelity-closure-plan + v8.7 CURRENT_UPSTREAM_REALITY_CHECK`; `DISCOVERY_QUALITY_MODE=OFF`. Dispatch hashes matched disk: plan `1B5D0FB240D89A78EA1D100FC878CF668CA767279053BE7970F0037AF7BC0B0E`, registry `A70F9E669CCDB4362B63C76C1A61858CD7EA39CD93D921D1DA7AED66E5A774A2`, ROLE `FCB9BD73C39F39D31F6C8154E6B48EA23187FF28BDF2BB3D9C59E3D28FA518A3`.

## Exact object and current union

**Same object:** a fixed `.fbs` schema, logical table/vector/string object graph and values, root type, file identifier/size-prefix choice where already required by the deployment contract, verifier limits, and stock FlatBuffers verifier/generated-reader observations. A changed schema, root, compatibility contract, reader, buffer compression or external postprocessor is excluded.

[FlatBuffers internals](https://flatbuffers.dev/internals/) says current buffers are constructed backwards; tables use vtables of offsets, vtables are shared when their entries match, offsets are `uint32_t`, and child/field construction order has flexibility. It also fixes alignment, offset direction, vtable and reader semantics. The [current upstream release](https://github.com/google/flatbuffers) is `v25.12.19-2026-02-06-03fffb2` as observed 2026-08-11. Current documented builder surfaces include vtable deduplication, shared-string interning and internal-capacity preallocation ([Rust builder documentation](https://flatbuffers.dev/languages/rust/)); the C++ guide documents stock read-only access and default verification on its gRPC message path ([C++ guide](https://flatbuffers.dev/languages/cpp/)).

The fair current producer+verifier union is: backwards construction; legal child/field order; object, string, vector and vtable placement; vtable reuse/deduplication; shared-string reuse; builder capacity/allocation policy; alignment/padding; root/size-prefix/file-identifier configuration; generated object API; stock `Verifier`/generated reader. This is an action catalog, not an assertion that it already implements an optimal global planner.

## Candidate action and divergence attack

The only admissible N2 would be a whole-buffer planner that, for the same object graph, jointly chooses backwards construction order, legal string/vtable reuse and object placement to optimize a stated full-cost objective (bytes plus builder working-set and stock verifier/read locality), while preserving verifier/reader acceptance. It must expose a nontrivial algorithmic/approximation or recourse guarantee—generic packing, compression, postprocessing and schema reordering are prohibited.

The minimal witness would be two buffers from the same graph/schema/root: both pass the stock verifier and reconstruct equal generated-reader values, but the planner's chosen construction/reuse sequence is not expressible by the frozen baseline sequence/union and has a declared objective/guarantee. This was not frozen. The internals expressly acknowledge construction-order flexibility, while native vtable dedup and string sharing already cover key atoms; the review did not pin the current C++ `FlatBufferBuilder` source symbols and all defaults/non-default builder flags to a single immutable upstream commit, nor identify which full legal action is outside that union. There is therefore no current-action absence claim.

## Natural carrier, cost shift and 72-hour killer

The only plausible public carrier identified is versioned TensorFlow Lite model conversion: TensorFlow documents that its converter produces a `.tflite` FlatBuffer ([official converter documentation](https://www.tensorflow.org/lite/convert?hl=es-419)). This supplies a route to versioned schemas/models only after exact official model/revision and stock TFLite-reader/verifier boundary are frozen. It does not establish a current natural mutation trace or that verifier/readback becomes dominant after any payload optimization.

Finite falsifier (not run): pin FlatBuffers tag/commit and C++ source paths, all builder/verifier defaults and non-defaults, an official versioned model/message corpus and the stock reader; generate two same-object buffers; require verifier acceptance and equal root traversal; charge build CPU/wall/RSS, verifier/read latency/cache behavior, output bytes and temporary storage. Stop if the candidate is merely an existing builder sequence/configuration, changes schema/reader/contract, requires repacking, lacks natural corpus closure, or has no residual under the full denominator.

## Outcome

`NOT_ADMITTED_UNFROZEN`; `PROPOSE_STAGE0: []`. The decision is not due to missing implementation, results, resource availability or AI readiness. It reflects the unclosed current source/action union and the absence of a minimal legal whole-action witness/natural bottleneck-transfer trace. No experiment, benchmark, download, automation, Stage0/A/B or shared-control change occurred. State: `IDLE_REUSABLE_AWAITING_MAINLINE`.
