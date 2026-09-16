# Current action and guarantee audit

## Frozen source observations

Pinned source: V8 `c635f0d160b6e988b5ea5a907511a2929beb5d5e`.

| Official source | Verified observation | Revision consequence |
|---|---|---|
| `src/snapshot/serializer-deserializer.cc` | `CanBeDeferred` rejects map slots, internalized strings, JS objects with embedder fields, `ByteArray`, `JSArrayBuffer`, `JSTypedArray` and non-empty `EmbedderDataArray`. | The witness uses old-space `FixedArray` through `kAnySlot`; no abstract/illegal object action is assumed. |
| `src/snapshot/serializer.cc` | `ObjectSerializer::Serialize` registers pending objects and queues them only under current deferral predicates; `SerializeDeferredObjects` pops the deferred container; pending reference IDs are resolved on allocation. | Candidate may alter deterministic selection/intentional-defer only while using the same native pending/resolve bytecodes and terminal obligation. |
| `src/snapshot/serializer.h` | Current deferred container is a global-handle vector; `QueueDeferredObject` asserts no existing reference; hot list is an eight-entry circular list; pending map has explicit identity keys/IDs. | Any legal state must retain deferred/pending/reference/hot identity interfaces; no scalar order is sufficient. |
| `src/snapshot/startup-serializer.cc` | Startup serializer preserves roots, cache/weak phase and invokes deferred serialization at the designated native phase. | Candidate cannot cross phases/partitions or replace root/cache rules. |

## Completeness and boundary audit

`V8-DSP` models all candidate freedom after current mandatory source actions: defer, select, immediate serialize, pending registration/resolution, backref/hot emission, allocation/alignment, partition/phase transitions and terminate.  The constructor still uses the stock bytecode writer and stock deserializer.  It does not model profile-guided object reordering, cross-build matching, custom compression, a reader change or a postprocessor.

The exact guaranteed vector is `(raw native stream bytes, declared allocation-page proxy, scheduler work)`.  zlib's global state is **not** in the state; compressed size is consequently not advertised as exact and is recorded only in the Stage-A full-cost ledger.

## Competitor map

| Comparator | Same object/action information | Why not the candidate method |
|---|---|---|
| Stock V8 | Yes | Fixed traversal and LIFO container; direct baseline |
| Snapshot flags/partitions/zlib/reorder_builtins | Same object where applicable | Finite native controls; builtin reordering is code/profile scoped and not generic heap scheduling |
| Stable queue + scalar score grid | Same static graph/action surface | Required strong local-policy union; no joint pending/hot/reference state |
| Tiny exhaustive legal oracle | Same only on witness | Validator, not deployment method |
| CAHPs / Native Image | Different VM, image format and profile/cross-build information | Broad subtractor; sets narrow V8 claim ceiling |

`SEARCH_BOUNDED_OPEN` remains for direct source/literature collisions.  No claim of global absence is made; any closing reviewer must test whether current source already exposes the exact complete action/guarantee claimed here.

## Adversarial checks

- A generic heap orderer that carries only ready-set order, or a weighted byte/page/hot score, fails because future pending-ID resolution and reference-map/hot state distinguish equal local orders.
- A CP/ILP solver may validate a small witness but cannot be substituted for the target-specific recurrence.
- A state that hides remaining object identity/history is invalid.  `w` explicitly counts every future-distinguishable boundary identity.
- The R/A/B/C fixture proves only action divergence; it does not preclaim that the candidate wins raw bytes, zlib, startup or locality.
