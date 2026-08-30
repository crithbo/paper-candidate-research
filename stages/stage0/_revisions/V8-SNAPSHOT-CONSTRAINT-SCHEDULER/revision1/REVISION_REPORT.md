# V8-SNAPSHOT-CONSTRAINT-SCHEDULER — Stage 0 revision 1

## Disposition

`RECOMMEND_STAGE0_PASS_FOR_CLOSING_REVIEW` — conditional `TIER_B_Q2_VIABLE`, with revision **1/1 consumed** by this gate-bearing static certificate.  This is not an implementation, snapshot, compression, startup, or locality result.  Stage A and Stage B are not authorized.

## One integrated proposition and its falsifier

**V8 native deferral scheduler proposition.**  On one pinned matching V8 startup-snapshot contract, the existing native operations `defer`, `select`, `serialize`, `register/resolve pending forward reference`, `back-reference`, `hot-object`, allocation/alignment and partition transition induce a finite, target-specific event algebra.  `V8-DSP` exactly computes the Pareto frontier for the declared native raw-stream/page-allocation objective on bounded live-interface width `w`, or returns a certified width-cap failure.  It is not a heap-order score, an arbitrary container ordering, or an ILP wrapper.

**Falsifier.**  The certificate fails if a typed action needs a new bytecode/reader/profile/object/partition; if its state merge loses a legal future native action or exact declared cost; if `w` hides identities; if the algorithm reduces to a single local score/generic scheduler; or if the current union reproduces every action/guarantee.  The required scientific outcome is then `BELOW_Q2_STOP__GENERIC_HEAP_ORDERING_OR_LOCAL_SCORE_WRAPPER`.

## Structural potential vs evidence readiness

| Axis | Finding |
|---|---|
| Structural potential if successful | Conditional `TIER_B_Q2_VIABLE` via N2: an exact, V8-format-specific constrained serialization scheduler over known native actions. |
| Current readiness | Low but finite.  No modified V8 build, natural carrier result, complete proof, or performance measurement exists.  Those are Stage-A work, not a Stage-0 stop basis. |
| Current claim ceiling | Static same-object action/algorithm/fidelity route only.  No raw/compressed byte, startup, RSS, page-locality, convergence, or natural-benefit claim. |
| zlib boundary | Fixed compressed size is explicitly **not** part of the exact DP guarantee: zlib state is global and unmodeled.  It is a measured Stage-A outcome with full cost. |

## Pinned native contract and complete action grammar

Pin V8 `c635f0d160b6e988b5ea5a907511a2929beb5d5e`, one target architecture/configuration, builtins, roots, partitions, heap graph and matching stock deserializer.  The output must preserve roots, logical object identities/aliases, snapshot partitioning and JavaScript-observable behavior.  The candidate changes only the constructor's choice among already valid serialization actions; it does not change snapshot bytecodes, reader, object graph, profile information, format, external codec, builtins policy or compression semantics.

At each event the complete candidate catalog is:

1. mandatory native root/cache/partition/map action;
2. serialize an available object now through the current prologue/content path;
3. intentionally defer an eligible ordinary object by the existing pending-registration, pending-forward-reference and deferred-container protocol;
4. select one member of the eligible deferred frontier instead of the current LIFO pop;
5. resolve pending-forward-reference IDs when its target allocation is reached;
6. emit the stock pending, root, back-reference, eight-hot-object, raw-data, alignment and synchronization forms chosen by the current serializer; and
7. perform the fixed phase/partition transition or terminate only with no unresolved native obligations.

Eligibility is not asserted abstractly.  Current `CanBeDeferred` forbids map slots, internalized strings, JS objects with embedder fields, `ByteArray`, `JSArrayBuffer`, `JSTypedArray`, and non-empty `EmbedderDataArray`; it permits the ordinary `FixedArray` values used below when reached via `SlotType::kAnySlot`.  Current `Serializer::ObjectSerializer::Serialize` defers only on recursion overflow or `MustBeDeferred`; its deferred container is LIFO.  The candidate's contribution is an explicit, deterministic native selection/intentional-defer policy inside this same grammar.  Existing root/cache phases, read-only/shared references, map-first serialization, code/partition rules and all nondeferrable slots remain hard preconditions.

## Typed static R/A/B/C witness

The witness is a same-format test heap, not a claimed natural workload.  `R`, `A`, `B`, and `C` are actual V8 `FixedArray` objects in `SnapshotSpace::kOld`; their `FixedArray` maps are already available through the native map/reference path.  No object is a map, internalized string, typed array, array buffer, byte array, or JS object with embedder fields.

- `R` is an ordinary old-space `FixedArray` reached through a normal `kAnySlot` root/anchor path; its ordered tagged slots are `[A, B]`.
- `A` is a one-element `FixedArray` with ordinary strong slot `[C]`.
- `B` is a two-element `FixedArray` with ordinary strong slots `[C, C]`.
- `C` is an old-space `FixedArray` with no non-map outgoing object slots.

The candidate intentionally defers `A` and `B` while serializing `R`; both calls use exactly the current register-pending/put-pending/queue protocol.  Current LIFO selection yields `B, C, A` after the forced ordering is made available.  The candidate can select `A`, defer `C`, then select `C`, then `B`, yielding `A, C, B`.  In the latter schedule both of `B`'s references to `C` are native back-reference/hot-object eligible after `C` is serialized; in the former sequence they are registered/resolved through the pending path before `C` is allocated.  Both schedules use only stock bytecodes and terminate with no unresolved forward references.  The difference is a real native action divergence, not merely a different heap position.

The witness is intentionally asymmetric: a one-object or one-edge example would collapse to LIFO/stable ordering.  Its type, map condition, slot type, old-space placement and partition are explicit; Stage A must construct it with the stock serializer harness and reject the entire direction if the trace does not match this native transcript.

## V8-DSP sufficient state and exact guarantee

Construct the complete serialization-event graph: object/slot visits, map-before-object edges, mandatory phase/partition edges, candidate defer/select edges, and pending/reference resolution edges.  A fixed nice path decomposition of this graph has live interface width `w`.

At each bag, V8-DSP retains the canonical state:

`(phase, partition, allocation-space/cursor/alignment residue, live typed boundary objects, deferred-frontier order class, pending-ID→boundary-target relation, reference-map boundary relation, ordered eight-hot-object list, current native sink/ULEB residue, remaining event ports, exact raw-stream/page proxy cost)`.

Every live identity that a future action can distinguish is an explicit labelled boundary object; `w` counts it.  This avoids an unbounded identity map hidden inside a purported quotient.  State equality requires a label-preserving isomorphism of all listed fields, including pending IDs and remaining typed ports.  Therefore it preserves every future legal native action and the exact declared cost vector.  Full byte content is not silently discarded: its exact raw length/opcode/varint state is carried; globally compressed output is excluded rather than treated as additive.

The recurrence introduces or forgets an object only when all of its future ports are fixed, applies one native action, updates the eight-entry hot state/pending IDs/reference relation/cursor, and prunes only componentwise dominated equal-interface states.  It returns a trace certificate for each retained frontier point.  For declared width `w`, fixed native hot-list size eight, fixed bytecode alphabet, and bounded partition count, the method is exact with `O(N·f(w))` states/transitions; `f` is exponential in the visible interface parameters.  No general polynomial, unbounded-graph FPT, zlib-size, or arbitrary-permutation guarantee is claimed.  If the complete witness/carrier decomposition exceeds the frozen cap, it returns `WIDTH_CAP_EXCEEDED` with the live-interface transcript rather than a beam approximation.

This differs from generic topological scheduling because the transition relation is defined by V8's map-first/native pending resolution, fixed eight-hot state, back-reference map, object-space allocation/alignment and bytecode grammar.  Removing those terms invalidates the recurrence and reduces it to the explicitly rejected generic kernel.

## Current union and action divergence

The strongest same-object union remains: pinned stock traversal/LIFO deferral; all checked snapshot partitions and flags; fixed zlib/compression route; `reorder_builtins`; stable legal queue; finite raw-byte-only, page-only, hot-recency-only score policies; and a tiny exhaustive oracle only.  CAHPs and Native Image are broad method/claim subtractors: their profile-guided, different-runtime heap ordering blocks broad startup/locality wording but does not implement this V8 same-reader action algebra.

The witness separates the candidate from stock/LIFO and the frozen single-score policies because the selected first object is determined by the joint future relation `A → C ← B` plus the multiplicity of B's native reference ports and pending-ID state, not by any object-local raw byte, page or hot-recency score.  The local policies see only their declared scalar features and use their fixed tie behavior.  V8-DSP's state retains the typed future ports and proves why selecting `A,C,B` is a legal distinct trace.  This establishes action separation only; a Stage-A full-cost union replay decides whether it is a Pareto gain.

## Finite Stage-A fidelity route and killer

Before any claim-bearing observation, Stage A must:

1. regenerate the typed witness in the pinned source/build and replay every legal tiny schedule through the unmodified stock deserializer;
2. compare roots, graph/alias digest, partitions, bytecode legality and JavaScript behavior;
3. verify the complete current union on the same candidate action surface; and
4. run 20–50 frozen V8/Node snapshot carriers with a full ledger: graph construction/scheduler CPU/RSS, mksnapshot CPU/RSS/temp bytes, raw and compressed snapshots, decompression/deserialization/cold start, RSS/page counters, verification, failure and stock fallback.

The pre-registered killer is any witness/fidelity failure, any action reproduced by the complete union with the same guarantee, an empty/cap-only frontier, or no strict p50/p90 full-cost Pareto point on the natural carriers.  This is finite and CPU/build based; missing current implementation or results does not alter the Stage-0 decision.

## Revision conclusion

The one allowed revision has closed a single research-design gate: it supplies a typed native witness, complete constrained action grammar/current union, target-specific future-preserving state, honest exact bounded-width guarantee, and finite fidelity/full-cost falsifier.  Route only to an independent closing reviewer.  Do not create or authorize Stage A/B.
