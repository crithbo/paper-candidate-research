# FLATBUFFERS-PROFILED-WHOLE-BUFFER-LAYOUT Stage 0 Revision 1

## 0. Outcome

- Assignment: `STAGE0-P2-20260811-FLATBUFFERS-PROFILED-WHOLE-BUFFER-LAYOUT-REVISION1-V8.7`
- Role: original `PRIMARY`, scientific revision 1
- Atomic gate: `NATIVE_ACTION_COMPLETE__GLOBAL_REUSE_AWARE_FLATBUFFERS_LAYOUT_CERTIFICATE`
- Revision budget: `1/1 CONSUMED`
- Recommendation: `RECOMMEND_STAGE0_PASS_FOR_CLOSING_REVIEW`
- Conditional tier: `TIER_B_Q2_VIABLE`
- Novelty route: `N2`
- Evidence ceiling: `STATIC_NATIVE_ACTION_ALGORITHM_AND_BYTE_CERTIFICATE__NO_IMPLEMENTATION_OR_NATURAL_RESULT`
- Latest collision: `SEARCH_BOUNDED_OPEN`
- Confidence: `0.79`
- Stage A/B: `UNAUTHORIZED_AND_NOT_STARTED`

The unique revision closes a static, same-object proposition. It does not claim a new FlatBuffers action. It defines an exact optimizer over a frozen canonical stock-builder grammar, a FlatBuffers-specific reuse-closure quotient with an auditable certified-frontier guarantee, and a byte-level witness showing that two stock-legal plans for one object have different frozen layout cost. Implementation, native execution, natural benefit, and the paper's main empirical result remain unobserved and are not Stage 0 admission requirements.

## 1. Frozen proposition and failure condition

For a fixed schema, identity-labelled rooted logical table DAG, values/nulls, field-presence policy, vector/key order, root framing, stock C++ reader/verifier, and profile, let `G_FB` be the finite canonical public-builder grammar in Section 3. `FB-RCFDP` enumerates exactly the accepting plans of `G_FB`; its state retains every suffix-observable dependency, alignment, vtable, shared-string, alias, and profile fact. Paths and admitted builder-call plans are bijective. For the declared static cost vector, an unpruned run returns the exact Pareto frontier and a deterministic optimum for any preregistered scalarization.

The paper-shaped residual is the FlatBuffers-specific suffix quotient and safe forgetting rule, not caller-order availability, hot-first ordering, a generic ILP, or an emitter patch. The following remains the preregistered sentinel:

`BELOW_Q2_STOP__NATIVE_ACTION_OR_GENERIC_LAYOUT_SCHEDULING_ABSORPTION`

It triggers at closing only if the clauses below are inconsistent or reduce to local ordering/configuration engineering. It does not trigger merely because the construction has not been implemented or measured.

## 2. Same-object and equality contract

The optimized object is:

`FIXED_SCHEMA__IDENTITY_LABELLED_ROOTED_LOGICAL_TABLE_DAG__FIXED_VALUES_NULLS_AND_PRESENCE__FIXED_VECTOR_KEY_ORDER__FIXED_HEADER_MODE__PINNED_CPP_READER_VERIFIER`

Required equality is the conjunction of:

1. identical schema and root type;
2. identical accessor values, nulls, union tags/payloads, required fields, and default/presence policy;
3. identical logical vector order and schema-key order;
4. identical table/string identity classes and explicit alias relation—equal values may not be merged unless the frozen object declares that identity sharing;
5. identical ordinary versus size-prefixed finish, file identifier, verifier limits, and reader semantics; and
6. a stock verifier acceptance plus an identity-aware reference digest in the later fidelity gate.

Changing schema, reader, codec, root, vector/key order, alias identity, or using arbitrary raw byte injection changes the object or declared action class and is excluded.

## 3. Complete finite canonical native grammar

### 3.1 Fixed arms

The following are fixed by the object contract or represented by a finite, equally available comparator arm: `ForceDefaults`, `DedupVtables`, initial capacity, allocator/ownership, buffer minimum alignment, builder reset/reuse policy, ordinary versus size-prefixed finish, identifier, and verifier limits. Capacity/allocator/reuse affect full cost but are not candidate novelty. A result may not select these after seeing held-out outcomes.

### 3.2 Optimized canonical actions

At a closed builder boundary, a plan may apply only these actions:

- `MAKE_STRING(i, mode)`: call `CreateString` or, only for a frozen permitted sharing class, `CreateSharedString`; record the returned offset.
- `MAKE_STRUCT(i)`: emit the fixed inline struct value when its containing table/vector action requires it.
- `MAKE_VECTOR(i)`: after every referenced element offset is available, call the generated vector helper or `StartVector`/element writes/`EndVector`. Offset elements are physically pushed in reverse solely to preserve the frozen logical order. A sorted-table helper is legal only when it realizes the already frozen schema-key order.
- `MAKE_TABLE(i, pi)`: after all referenced descendants are available, call `StartTable`, emit every frozen-present field exactly once in a legal permutation `pi` using `AddElement`, `AddOffset`, or `AddStruct`, enforce required/union consistency, then call `EndTable`.
- `REUSE_ALIAS(i,j)`: reuse the already returned `Offset<T>` exactly when `i` and `j` belong to the same frozen identity class; it never duplicates or merges identities.
- `FINISH(root)`: call `Finish` or `FinishSizePrefixed` with the frozen identifier and root offset.

Each action records its exact public builder-call expansion, returned `Offset.o`, buffer-size change, padding, minimum alignment, vtable decision, and shared-string decision. Children are built before a parent, so `NotNested()` remains true at every closed boundary.

### 3.3 Normalization and excluded escape hatches

The grammar is complete for canonical generated/direct-builder construction: each logical node is created once, each frozen-present field is emitted once, and aliases reuse their declared offset. Repeated writes to one slot, unreachable dead objects, `PushBytes`, `PushFlatBuffer`, unchecked uninitialized payload injection, schema mutation, and patched serializers are excluded as noncanonical emitter escape hatches. Generated object-API `Pack` is one distinguished grammar path and a mandatory baseline, not an extra action family.

## 4. Frozen profile, objective, and full-cost boundary

The profile `P` is collected on training objects/traces and frozen before planning. Each event names identity-labelled accessor endpoints, not offsets from a reference serialization. The static vector is

`J_static(plan) = (sum_e w_e * abs(addr_plan(src_e)-addr_plan(dst_e)), final_bytes, emitted_builder_actions, estimated_temporary_bytes)`.

The first component is an exact byte-distance proxy under the emitted buffer; it is not a claim about cache misses or wall-clock time. A preregistered nonnegative scalarization may choose one frontier point, with lexicographic action-ID tie-breaking. The Pareto frontier is always retained so an advantageous weighting cannot hide bytes or construction work.

Later full-cost accounting must separately report profile collection and amortization; planner CPU/wall/RSS/state count/backpointers; builder CPU/wall/RSS/reallocations/temporary bytes; final bytes; verifier; load/mmap; reader latency/throughput; cache/TLB observations; and fallback/end-to-end cost. No runtime dimension is inferred from the static proxy.

## 5. FB-RCFDP: state, transitions, and guarantee

### 5.1 Reuse-closure state

At a closed builder boundary the state is

`sigma = (D, p, mu, A, H_V, H_S, E, C)`.

- `D` is the completed dependency ideal plus the ready frontier in the frozen object DAG.
- `p` is exact current buffer size and `mu` the accumulated minimum alignment; together they determine every stock padding and `ReferTo` computation.
- `A` maps every built identity still referenced by an unbuilt parent to its exact `Offset.o`.
- `H_V` maps each earlier raw vtable byte string that a remaining table can equal to its retained offset. Equality may cross table types because stock `EndTable` compares bytes.
- `H_S` maps each future-relevant permitted shared-string key/content to its earlier offset.
- `E` holds unresolved profile endpoints whose partner has not yet received a final address.
- `C` is the nondominated accumulated static cost label, canonical tie key, and backpointer.

The normalization drops an alias only after its last unbuilt parent is complete, a vtable signature only after no remaining table can emit that signature, a shared-string entry only after no remaining string action can query it, and a profile endpoint only after its last incident event is charged. These are the **reuse-closure forgetting rules**.

### 5.2 Transitions

For every grammar action legal from `D`, replay the pinned builder equations rather than an additive node weight:

1. calculate `Align`/`PreAlign` padding from `p` and the action alignment;
2. for offsets, calculate stock `ReferTo = current_size - Offset.o + sizeof(uoffset_t)` after alignment;
3. for a table, derive raw vtable entries from the final field locations and object size, then either retain it or apply the stock exact-byte earlier-vtable match;
4. for a shared string or alias, use only the permitted frozen history entry;
5. update addresses, charge newly closed profile events exactly once, update `p`, `mu`, histories, and ready nodes; and
6. apply only the proven forgetting rules and within-state Pareto dominance.

`FINISH` accepts only after all reachable nodes are complete, the root offset exists, all equality obligations hold, and all profile events are charged.

### 5.3 Three static lemmas

**Path–plan bijection.** Expanding an accepting path yields one canonical public builder-call plan. Conversely, scanning any admitted plan at its closed boundaries yields exactly one path, because the action identifier includes its node, field permutation, sharing choice, and fixed arm.

**Suffix congruence.** Two prefixes with the same normalized `(D,p,mu,A,H_V,H_S,E)` have the same future legal actions. Every future action produces the same padding, offset, vtable/shared-string result, equality result, and incremental static cost. Therefore retaining only nondominated `C` labels within that state is exact.

**Safe forgetting.** A history item removed by the reuse-closure rule cannot be queried by a future legal action or profile event. Its earlier bytes affect the suffix only through retained `p`, `mu`, offsets, and accumulated cost. Removal therefore preserves suffix congruence.

Together with shortest-path/Bellman optimality on the finite acyclic action graph, these lemmas give the exact Pareto frontier and exact scalar optimum over `G_FB`.

### 5.4 Honest certified-frontier complexity

Let `R` be the number of reachable normalized states and nondominated labels, `g` the maximum number of legal next grammar actions, `n` the number of logical nodes/fields, and `B` the maximum legal buffer bytes for the frozen instance. Then an unpruned implementation takes `O(R * g * poly(n))` time and `O(R * poly(n))` space. A conservative finite bound is exponential: the completed ideal can contribute `2^n`, and each of at most `kappa` future-observable alias/vtable/string/profile records can contribute an identity/signature and an offset in `0..B`. Thus worst-case `R` can approach the explicit Cartesian-product oracle.

The guarantee is deliberately **not** “polynomial”, a general FPT theorem, or an approximation ratio. It is an exact FlatBuffers-specific certified frontier: every merge carries a suffix-congruence certificate; reported `R`, pre-merge prefix count, and oracle equality on small instances quantify compression. The N2 residual is the format-specific state quotient and reuse-closure theorem. If natural instances show no strict, reproducible quotient compression beyond complete enumeration, the route is killed rather than relabelled as generic scheduling.

## 6. Mechanical 56-byte stock-builder witness

Use the fixed schema:

```text
table Child { x:int; }
table Root { left:Child; right:Child; }
root_type Root;
```

Use little-endian standard binary FlatBuffers, no identifier, no size prefix, `ForceDefaults(false)`, `DedupVtables(true)`, `left.x=1`, `right.x=2`, and root field-call order `right` then `left`. Plan A builds `left` then `right`; Plan B builds `right` then `left`. Both are dependency-respecting stock direct-builder plans for the same identity-labelled object.

The first child built from size zero has a 6-byte vtable and 8-byte table. The second starts at size 14, incurs two alignment bytes, and has a 6-byte vtable and 10-byte table. Their raw vtables differ in object-size entry, so no vtable match is taken. The root starts at size 30, incurs two bytes before the first root offset, has an 8-byte vtable and 14-byte table; `Finish` adds four bytes. Both buffers are 56 bytes.

Plan A bytes:

`0C00000008000E000400080008000000200000000C000000000006000A000400060000000200000000000600080004000600000001000000`

Plan B bytes:

`0C00000008000E000400080008000000100000001C000000000006000A000400060000000100000000000600080004000600000002000000`

| Quantity | Plan A | Plan B |
|---|---:|---:|
| root table address | 12 | 12 |
| left table address | 48 | 32 |
| right table address | 32 | 48 |
| root.left stored uoffset at byte 16 | 32 | 16 |
| root.right stored uoffset at byte 20 | 12 | 28 |
| final bytes | 56 | 56 |

The vtables are `[8,14,4,8]` for Root, `[6,10,4]` for the second-built Child, and `[6,8,4]` for the first-built Child. Every table soffset is positive to its preceding vtable, and every field uoffset lands on the stated child table. The accessor values and identities are therefore the same by the pinned format equations.

For the frozen one-event profile `w(root,right)=1`, `w(root,left)=0`, byte distance is 20 in Plan A and 36 in Plan B; bytes tie at 56. Plan A strictly dominates Plan B for the static pair `(weighted_distance, final_bytes)`. This proves only native-realizable action and objective divergence. It does not prove natural benefit, outperform the exhaustive native union, or substitute for later execution of the unmodified verifier/reader.

## 7. Complete small oracle and degeneration map

For each tiny frozen object, `FB-NATIVE-ORACLE` enumerates every fixed config arm, every dependency-respecting node construction order, every legal once-per-present-field table permutation, every admitted ordinary/shared-string choice, every exact alias reuse, every fixed-order vector/key helper choice, and finish mode. It expands public builder calls, deduplicates identical byte images, and records verifier/reader/identity digest plus `J_static`. The oracle is a validation ceiling, not a deployable baseline.

| Method | Action coverage | Guarantee | Required disposition |
|---|---|---|---|
| generated `Pack` / generated default | one native plan | none for profile objective | mandatory baseline |
| stable legal topological order | same frozen information | heuristic | mandatory baseline |
| hot-first ready-node order | same frozen profile | heuristic | mandatory profile baseline |
| local subtree/order DP | omits global reuse closure | local only | subtractor; cannot support the claim |
| complete native composition oracle | all `G_FB` plans on tiny objects | exact | must equal candidate frontier |
| generic ILP/precedence scheduler | only as strong as explicitly encoded builder state | generic exact/heuristic | methodological subtractor |
| `FB-RCFDP` | all `G_FB` plans | exact certified frontier | candidate |

Any oracle mismatch, omitted native plan, reader/equality mismatch, or absence of strict quotient compression fires the sentinel. Merely selecting Plan A, emitting bytes, or invoking an off-the-shelf solver does not close N2.

## 8. Finite Stage A fidelity and killer route

This section freezes a route; it does not start or authorize Stage A.

1. Pin the peeled FlatBuffers source commit `7e163021e59cca4f8e1e35a7c828b5c6b7915953`, compiler/build flags, generated schema code, and every config arm.
2. Before any claim-bearing observation, reproduce the two 56-byte images through stock public calls; run the unmodified verifier, accessor/identity digest, and exact objective calculation.
3. For all generated rooted DAGs up to a preregistered small ceiling (including aliases, equal/different vtables, shared strings, vectors, keyed vectors, defaults, and both finish modes), compare candidate and `FB-NATIVE-ORACLE` frontiers byte-for-byte. Catalog coverage and equality must be 100%.
4. Freeze 20–50 source-builder-backed objects from a version-pinned official TFLite/LiteRT corpus and 20–50 from a second public FlatBuffers application corpus. Binary unpack/repack is inadmissible if it loses alias provenance; source builders or an audited identity map are required. Split profile training and held-out evaluation chronologically or by model family before results.
5. Compare the full union in Section 7 and report the full-cost ledger in Section 4, state/frontier compression, fallbacks, and negative strata.

Kill the route on any stock-reader/verifier/equality failure; any oracle mismatch; incomplete action-catalog coverage; no strict canonical-state reduction on natural instances; frontier explosion that defeats the preregistered finite budget; current native/profile heuristics covering the same frontier; or no held-out full-cost Pareto residual. These are finite Stage A falsifiers, not requirements for the present Stage 0 revision.

## 9. Current-union and collision boundary

The pinned/current first-party source already provides arbitrary legal caller ordering, exact earlier-vtable deduplication, shared-string pooling, explicit offset reuse, field-order freedom, alignment, and finish/config controls. It therefore absorbs any claim of a new action and every simple “hot-first” or configuration-tuning contribution. It does not in the audited material provide the exact profile-aware complete-grammar optimizer, suffix-congruence quotient, or certified frontier above.

Generic profile-guided data/code layout, topological scheduling, packing/ILP, alternative zero-copy formats, and schema/AIG-style rewriting are subtractors, not direct same-object absorbers. The bounded latest-collision search remains open; no transport failure is converted into an absence claim.

## 10. Closing recommendation and claim ceiling

The gate is statically closed and the unique revision is consumed. The candidate now has a narrow same-object N2: exact optimization of a complete declared canonical FlatBuffers builder grammar through a format-specific globally reuse-aware quotient, with a mechanically auditable legal-action witness and finite killer route. This is sufficient for conditional `TIER_B_Q2_VIABLE` review, not for Q1 parity.

Permitted claim now: the proposition, grammar, state sufficiency lemmas, exact certified-frontier guarantee, and hand-derived witness are defined.

Forbidden claim now: implementation exists; the two buffers have already been produced or verified by native execution; the optimizer scales; natural objects benefit; cache/runtime improves; the full collision search is closed; or the paper's main result is positive.

Recommended next action: independent Stage 0 closing only. No second revision, Stage A, or Stage B is created or authorized by this packet.
