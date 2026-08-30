# S4-V8-SNAPSHOT-CSS — constraint-aware native V8 snapshot scheduling

## Proposed Stage 0 admission

`PROPOSE_STAGE0` — conditional on independent literature/collision review.

### Exact object and same function

The object is a matching-version V8 startup snapshot blob over fixed builtins, roots and heap graph. The function is unchanged: stock V8 deserializes it, reconstructs the same required graph/partition, and exposes identical observable JavaScript behavior. Code cache, an alternate reader, changed heap contents, external compression, and profile-driven runtime dispatch are outside the object.

### N2 contribution

CSS is a deterministic, constrained generic-object serialization algorithm. Unlike V8’s existing root/deferred traversal and the separate builtins-only `reorder_builtins` path, it jointly chooses a legal order for ready non-root objects to trade byte-token locality and allocation/page locality under the same serializer bytecode and stock deserializer.

### Fair strongest baseline union

Pinned V8 `c635f0d160b6e988b5ea5a907511a2929beb5d5e`: current root/deferred/backref/forward-ref/hot-object protocol; read-only/shared/startup partitions; all relevant snapshot/mksnapshot flags; fixed built-in zlib compression; and profile builtins sorting. Comparator information is static snapshot graph + build configuration; CSS receives no profile unavailable to the union.

### Action-gap certificate

The stock code explicitly implements an 8-object hot list and required traversal protocol, while the current profile reordering applies to builtins only. The proposed schedule changes eligible non-code object emission while retaining all required dependencies and native bytecode. The frozen `R,A,B,C` witness distinguishes the action before any performance claim.

### Cost, natural route, and falsifier

Full denominator: mksnapshot CPU/RSS/temp; raw and compressed bytes; decompression/deserialization and cold startup; process RSS/locality. Natural route: 20–50 official V8/Node fixtures. The 72-hour killer is the native regenerated snapshot witness followed by the fixed corpus; stop for a reader/semantic mismatch, union absorption, or full-cost dominance.

### Evidence ceiling

No implementation or result exists in this Discovery package. `TIER_B_Q2_VIABLE` is structural potential only. AI readiness is not used for admission; Stage A must pass the pre-claim fidelity gate before any claim-bearing run.

