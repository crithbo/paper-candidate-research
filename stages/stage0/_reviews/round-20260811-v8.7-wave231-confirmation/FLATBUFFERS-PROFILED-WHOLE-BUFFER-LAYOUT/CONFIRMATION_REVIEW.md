# FLATBUFFERS-PROFILED-WHOLE-BUFFER-LAYOUT Stage 0 Confirmation Review

- Lane: `STAGE0-BATCH-GATE / PRIMARY reused as independent confirmation`
- Mode: `SENTRY`
- Assignment: `STAGE0-C1-20260811-FLATBUFFERS-PROFILED-WHOLE-BUFFER-LAYOUT-CONFIRM-V8.7`
- PRIMARY task: `019feaf7-dba0-7752-a840-db1fea688d69`
- Decision: `CONFIRM_REVISE_ONCE`
- Mechanical SENTRY verdict: `CONFIRM`
- PRIMARY decision reviewed: `REVISE_ONCE`
- Quality tier if the one gate closes: `TIER_B_Q2_VIABLE`
- Quality tier if the gate fails: `BELOW_Q2_STOP`
- Confidence: `0.92`
- Evidence ceiling: `STAGE0_FIRST_PARTY_CURRENT_SOURCE_AND_STATIC_PROPOSITION_AUDIT__NO_CANDIDATE_RESULT`
- Latest-collision disposition: `SEARCH_BOUNDED_OPEN__NO_DIRECT_FATAL_FOUND`
- Scientific revision: `PERMITTED_UNCONSUMED__UNIQUE_1_OF_1`
- Stage A/B authorized: `false / false`
- Cross-assignment contamination: none. This reviewer did not participate in PRIMARY and inherited no score, result, or absence claim from another topic.

## Outcome first

The PRIMARY `REVISE_ONCE` is confirmed. Current C++ `FlatBufferBuilder` already permits a caller to serialize independent descendants in either legal backwards-topological order. The two-child example therefore does not expose a missing native action. It only demonstrates that native construction order can change padding, vtable reuse, offsets, and consequently a layout objective.

That subtraction does not structurally absorb the whole candidate. The checked first-party source supplies legal construction actions and local emission rules, but it does not supply a profile-indexed whole-buffer optimizer or an exact/FPT/approximation guarantee over the complete legal action family. A known-action N2 remains conditionally paper-shaped if one revision defines an action-complete, globally reuse-aware finite-state algorithm and a non-generic FlatBuffers-specific guarantee.

The present candidate cannot PASS. Its local `O(n 2^d poly(d))` sketch does not model the builder's global vtable history, shared-string history, explicit alias availability, current-position alignment state, or fixed vector/key order. The old two-order witness has no byte image, offset map, objective arithmetic, or exhaustive native-composition comparison. These are defects in the algorithmic proposition, not missing Stage A results.

## Frozen package integrity

The frozen PRIMARY package was independently hashed and all `4/4` manifest entries match:

| Artifact | SHA-256 | Result |
|---|---|---|
| `STAGE0_REPORT.md` | `07D77C8A05C8E8C20078360F7A7003494031932C6DB58366D92CD6D1EB60CB56` | PASS |
| `Q1_COMPARATOR_MATRIX.md` | `DA7EE4463E5EEB94FC3C9F6EB81349F85A5F0D526AD2119FFAF39821720D3C6D` | PASS |
| `SOURCE_AUDIT.md` | `2272E570652CFAA20F7896356B6A9FF4ED2A1115B7D08DF69206F2280D96958C` | PASS |
| `handoff.yaml` | `69D44D1EA949EEBBA5AD285D5F8C09E6C9FBC5D4544A97D0808EB17C7B4266A1` | PASS |

PRIMARY manifest self SHA-256 is `0812CDFE89C2B5ADDFB3E538A8079F106F35E424331D02A004C5D25AFE91FFDE`.

Frozen control hashes also match the assignment:

| Control | SHA-256 |
|---|---|
| `registry.yaml` | `2C4E0E4303C95210C67A4B7B0D27C094A18BB263EC15ACAF35ECD3F6313D33DB` |
| `plan.md` | `207DA61FF4231F14C4D104508C62DAEC7905FC110ECDE9D3880377DB45BEC8E3` |
| `rules/ROLE_STAGE0_REVIEW.md` | `741EC3544797FF8A5BF337E1E3448B5F683823E5229F818F162834400581626E` |
| `AGENTS.md` | `66231F71EF6AB250A1AD9FF576D5840978F09EFC03BF5D2F0527D47F4D82B063` |

No provenance failure blocks the scientific decision.

## Independent current-upstream reality check

### Pins and exact source boundary

- Repository: [`google/flatbuffers`](https://github.com/google/flatbuffers).
- Peeled source commit: [`7e163021e59cca4f8e1e35a7c828b5c6b7915953`](https://github.com/google/flatbuffers/commit/7e163021e59cca4f8e1e35a7c828b5c6b7915953).
- Current observed master commit: [`81edeb17d9118143f2c81caf27edfb0df401279e`](https://github.com/google/flatbuffers/commit/81edeb17d9118143f2c81caf27edfb0df401279e).
- Decisive C++ builder path: [`include/flatbuffers/flatbuffer_builder.h`](https://github.com/google/flatbuffers/blob/81edeb17d9118143f2c81caf27edfb0df401279e/include/flatbuffers/flatbuffer_builder.h), Git blob `636d3776bae8d70115cdb2b047d3cc9b029f42a8` at both checked commits.
- Verifier path: [`include/flatbuffers/verifier.h`](https://github.com/google/flatbuffers/blob/81edeb17d9118143f2c81caf27edfb0df401279e/include/flatbuffers/verifier.h), Git blob `a0b793597c80c364485463d0f91bb6d84564586f` at current master.
- Official format documentation: [FlatBuffers Internals](https://flatbuffers.dev/internals/), [C++ documentation](https://flatbuffers.dev/languages/cpp/), and [schema documentation](https://flatbuffers.dev/schema/).

### What the current native union already expresses

1. The builder constructs backwards and rejects constructing a nested child while a parent table/vector is open. Independent children can therefore be built in either dependency-respecting caller order before their parent. The format does not prescribe one canonical order.
2. `EndTable` compares each newly generated vtable against every earlier vtable retained in the builder scratch history and reuses an exact byte match. The effect is global: even unrelated table types may share a binary-equal vtable.
3. `CreateSharedString` maintains a buffer-relative global set and returns an existing offset for equal earlier content. A schedule that changes which string is first changes the live history and offsets.
4. The caller can reuse one already-built `Offset<T>` in multiple fields. Duplicating an equal-valued object is not equivalent when the frozen logical graph records alias identity; C++ accessors expose stable in-buffer addresses, so the revision must preserve the alias relation rather than only a value digest.
5. `Align`, `PreAlign`, `ReferTo`, and `Finish` depend on current buffer size and accumulated minimum alignment. Thus alignment/padding and address distance are schedule-dependent state, not a local child weight.
6. Vector elements have fixed logical order. Builder loops write offsets in reverse only to realize that fixed forward order. Keyed-vector helpers additionally sort by the declared key. Neither is permission to reorder logical elements for the objective.
7. Current configuration actions include initial capacity/allocator/minimum alignment, default serialization, vtable deduplication, ordinary versus shared strings, explicit alias reuse, vector alignment, file identifier, and size-prefixed finish. They belong in fixed arms or a finite fair grid; they are not candidate novelty.

The first-party issue [`#4827`](https://github.com/google/flatbuffers/issues/4827) independently reinforces the decisive boundary: maintainer discussion states that different serialization orders can change size because of alignment, that implementations allow different/arbitrary orders, and that exact vtable accounting requires emulating the earlier-vtable history. The issue proposes sizing/allocation work; it does not provide the candidate's profile-aware global constructor or guarantee.

Disposition: `DISCOVERY_NEW_ACTION_CLAIM_FAILS__KNOWN_NATIVE_ACTION_OPTIMIZATION_RESIDUAL_REMAINS_CONDITIONAL`.

## Same-object contract

The defensible same object is:

`FIXED_SCHEMA__IDENTITY_LABELLED_ROOTED_LOGICAL_TABLE_DAG__VALUES_AND_NULLS__FIXED_VECTOR_AND_KEY_ORDER__FIXED_FILE_HEADER_MODE__PINNED_CPP_READER_AND_VERIFIER`

The optimizer may choose only a finite grammar of generated/direct-builder actions that serialize that object. It may choose legal backwards-topological order among ready independent nodes and choose predeclared native reuse/configuration arms. It may not use arbitrary `PushBytes`, change schema/default semantics, duplicate or merge identity-labelled nodes, change vector order, alter key order, change codec/reader, insert indirection, or optimize a different root.

This restriction is necessary for action completeness to be finite. It is not an object pivot: it formalizes the intended generated/direct-builder construction surface and excludes raw escape hatches that would make any same-object optimizer ill-posed.

## Strongest fair baseline union

The fair current union must use the same schema, object graph, access profile, admissible native actions, and planning budget:

1. generated `Pack`/default generated creation order;
2. direct current builder with all legal independent-child orders represented, vtable dedup on/off, ordinary/shared string arms, exact alias reuse, `ForceDefaults`, vector alignment, initial-size/allocator, identifier and prefix settings;
3. stable and profile-hot-first legal topological heuristics on the same action catalog;
4. exhaustive native-composition enumeration on a small frozen instance as an oracle/ceiling, not as the deployable method;
5. the proposed bounded solver.

Generic structure-layout and precedence scheduling are subtractors. They prevent a paper claim based only on topological scheduling or a scalar hotness heuristic, but they do not automatically implement FlatBuffers vtable-equivalence history, reverse-offset legality, alias reuse, and exact reader/verifier preservation.

## Why the unique gate is atomic and appropriate

### Gate

`NATIVE_ACTION_COMPLETE__GLOBAL_REUSE_AWARE_FLATBUFFERS_LAYOUT_CERTIFICATE`

### Single proposition

For the frozen object and a finite admissible native construction grammar, there exists a sufficient global state and a non-generic FlatBuffers-specific exact/FPT/approximation or certified-frontier algorithm that maps every returned plan to a stock-builder byte buffer, preserves alias/vector/header/verifier semantics, and is checked against an action-complete small-instance oracle under a frozen profile-weighted layout/bytes/full-cost objective.

The gate is one proposition about sufficiency and guarantee. Its source pin, action catalog, recurrence, witness, and oracle are clauses of one certificate; they are not multiple unrelated experiments.

### Static clauses required in the one revision

1. **Finite action grammar.** Partition current APIs/configurations into fixed arms, optimized actions, and excluded raw escape hatches. Give a plan-to-current-builder call mapping.
2. **Exact object/equality.** Freeze alias identity, logical vector/key order, defaults, file identifier/size prefix, schema/root, generated accessors, verifier options, and the profile observation points.
3. **Objective and full-cost ledger.** Define address/cache-line/profile cost, bytes and deterministic tie-breaking. Separate static objective from later measured cache/runtime effects; charge profile collection, planning, building, allocation/RSS, verification, loading, read latency and fallback.
4. **Sufficient state and transitions.** Include ready dependency frontier; buffer-position residues needed by alignment; exact earlier-vtable equivalence/history information and offsets; shared-string availability/offsets; reusable alias offsets; and legal vector/key constraints. State complexity in graph size, maximum ready width/arity, alignment modulus, reuse-class width and history parameters.
5. **Nontrivial guarantee.** Supply exactness/FPT, a bounded approximation, or a certified Pareto frontier. Merely invoking ILP, beam search, generic subset scheduling, or an emitter patch fails.
6. **Native-realizable action-divergence certificate.** Give byte images or reproducible byte/offset maps for a minimal object with at least two native legal orders; both must pass the unmodified verifier/reader and preserve alias/order semantics. Compute the frozen objective exactly and identify the state distinction used by the algorithm.
7. **Complete small oracle and degeneration map.** Enumerate every admissible native composition on the small instance. Map generated order, all legal current orders/config arms, stable/hot-first heuristics, and candidate output. The candidate may match the oracle; it cannot claim a value better than it.
8. **Natural and finite later falsifier.** Freeze an official TFLite/LiteRT or equally first-party schema/corpus route plus a second natural corpus. Existing binaries alone are insufficient if unpacking loses alias provenance; use source builders or a separately audited identity map. Kill later on fidelity failure, oracle mismatch, baseline absorption, or no full-cost Pareto residual.

Acceptance requires these clauses to be mutually consistent at the design/certificate level. Stage 0 does not require implementation, completed proof, natural positive results, or a performance claim.

Failure after the one revision is mechanical if the result is only caller-order enumeration, local subtree DP, hot-first ordering, configuration tuning, generic solver invocation, builder/emitter engineering, or a recurrence whose sufficient state omits global reuse/alignment/alias history. The corresponding scientific disposition is `BELOW_Q2_STOP__NATIVE_ACTION_OR_GENERIC_LAYOUT_SCHEDULING_ABSORPTION`.

## Independent attacks requested by mainline

| Attack | Finding | Disposition |
|---|---|---|
| Peeled/current source completeness | Decisive C++ builder blob is identical at the peeled and observed current commits; defaults and non-default actions above are present. | PRIMARY correction confirmed. |
| Two child orders | Both are native caller-expressible dependency-respecting orders. | No N1 action novelty; useful only as a legal witness. |
| Vtable/shared-string history | Both are global, builder-relative histories; vtable equality can cross table types. | Local subtree DP is unsound/incomplete without compressed sufficient state. |
| Alias identity | Reusing an offset and duplicating equal values can produce the same decoded values but a different identity-labelled graph/address relation. | Must be frozen and checked, not optimized away. |
| Alignment state | Padding depends on current buffer size and accumulated alignment. | State must include relevant residues/position information. |
| Vector order | Physical backwards writing is not logical reorder permission; keyed vectors impose sorting. | Fixed in same-object contract. |
| Native union absorption | Union absorbs the actions and any simple heuristic/grid, but no checked source supplies a global profile optimizer/guarantee. | Conditional N2 survives one revision. |

## Collision and paper-shape disposition

The bounded search over official FlatBuffers source/docs/issues and original paper venues found no exact same-object paper or current upstream component that jointly covers the fixed FlatBuffers object, complete native construction family, profile-weighted objective, global reuse-aware algorithm, formal guarantee, and full-cost result. This remains `SEARCH_BOUNDED_OPEN`, not an absence proof. No transport failure was used as evidence.

The PRIMARY paper-shape calibration is directionally sound. Cache-conscious structure layout is a contribution-shape subtractor; EverParse calibrates format-faithful correctness and implementation evidence; Zerializer is a different-object zero-copy neighbor. None supplies the narrowed algorithm. At the present scope, Q1 parity is not established. A focused Q2 algorithm/data-format paper is credible only if the revision closes the certificate and later Stage A/B obtain same-object natural full-cost evidence.

- Structural paper potential: `CONDITIONAL_TIER_B_Q2_VIABLE`.
- Current evidence readiness: `FINITE_STATIC_ALGORITHM_CERTIFICATE_GAP`.
- Q1 calibration: `PARITY_NOT_YET_PLAUSIBLE`.
- AI route: `AI_CORE_EXECUTABLE`, estimated claim-critical fraction `0.85` if the static gate closes.
- Academic value: `42/70` conditional.
- AI executability bonus: `26/30`.
- Total priority score: `68/100`; score does not override hard gates.

## Final mechanical instruction to mainline

1. Record SENTRY verdict `CONFIRM` for PRIMARY decision `REVISE_ONCE`.
2. Permit exactly one unconsumed Stage 0 scientific revision under `NATIVE_ACTION_COMPLETE__GLOBAL_REUSE_AWARE_FLATBUFFERS_LAYOUT_CERTIFICATE`.
3. Do not route to Stage A/B and do not treat either child order as a new native action.
4. Do not require implementation, proof completion, natural positive results, or performance results in the revision; require the static proposition and finite fidelity/falsifier route above.
5. If the unique gate closes, retain conditional `TIER_B_Q2_VIABLE` for closing review. If it collapses to native action selection, generic scheduling/solver work, or incomplete global state, use `BELOW_Q2_STOP__NATIVE_ACTION_OR_GENERIC_LAYOUT_SCHEDULING_ABSORPTION`.

Lane disposition after delivery: `IDLE_REUSABLE_AWAITING_MAINLINE`.
