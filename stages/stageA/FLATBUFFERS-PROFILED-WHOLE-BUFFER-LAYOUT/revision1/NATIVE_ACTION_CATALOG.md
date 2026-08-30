# Source-pinned native action catalog

Status: pre-claim gate artifact; this document contains no natural-corpus outcome.

Pin: FlatBuffers `7e163021e59cca4f8e1e35a7c828b5c6b7915953` / release `v25.12.19`. The decisive files and their hashes are frozen in `SOURCE_PROVENANCE.yaml`.

## Atomic-action mapping

The candidate and every executable comparator emit only the following stock C++ public-builder operations. One candidate logical transition expands atomically to the indicated native calls; candidate state is observed only at a closed builder boundary where `NotNested()` holds.

| Logical action | Canonical native expansion | Fixed semantic obligations |
|---|---|---|
| `MAKE_STRING(i, direct)` | `FlatBufferBuilder::CreateString` | fixed bytes and terminator; one declared identity node |
| `MAKE_STRING(i, shared)` | `FlatBufferBuilder::CreateSharedString` | legal only for a preregistered permitted identity-sharing class; exact content lookup/history is state |
| `REUSE_ALIAS(i,j)` | reuse the already returned typed `Offset<T>` | legal only for the same frozen identity class; never merges distinct identities |
| `MAKE_SCALAR_VECTOR(i)` | applicable generated helper, or `ForceVectorAlignment` followed by `CreateVector` | frozen logical order, element type/count/value and applicable schema alignment |
| `MAKE_OFFSET_VECTOR(i)` | generated vector helper or `CreateVector` over already available offsets | frozen logical order; reverse physical pushes are merely the native expansion |
| `MAKE_KEYED_VECTOR(i)` | generated sorted helper or direct `CreateVector` only when the input is already in the same frozen key order | same keys and logical order; sorting may not change the object |
| `MAKE_STRUCT(i)` | generated inline struct construction / `AddStruct` at its frozen parent position | exact scalar bytes and native alignment; no independent alias identity |
| `MAKE_TABLE(i,pi)` | `StartTable`; exactly one `AddElement`, `AddOffset`, or `AddStruct` for every frozen-present field in legal permutation `pi`; `EndTable`; generated required checks | fixed values, presence, union pairing, children and aliases |
| `FINISH(root)` | `Finish(root, identifier)` | ordinary non-size-prefixed buffer and frozen identifier |

For every action, the implementation records current `GetSize()`, `GetBufferMinAlignment()`, returned `Offset.o`, native padding, raw vtable bytes/offset decision, shared-string decision, logical action count, and the affected profile endpoints. Offset cost is recomputed at the position where stock `ReferTo` runs; it is not treated as a node-local additive weight.

## Generated/direct builder completeness

The admitted grammar covers canonical reachable-object construction through generated helpers and their public direct-builder expansions:

- each declared reachable string, vector, table and struct is constructed exactly once, except an explicit identity alias reuses an existing offset;
- all descendants needed by an offset field exist before the parent table or offset vector;
- a table action enumerates every once-per-present-field permutation admitted by `StartTable`/`Add*`/`EndTable`;
- a vector action preserves its fixed logical order; a keyed helper is admitted only when its result equals that same fixed key order;
- generated object-API `Pack` is retained as a distinguished current-native baseline path, not credited as a candidate action;
- exact earlier-vtable deduplication, shared-string lookup and ordinary direct offset reuse are current-native mechanisms and are state/history, not novelty.

Excluded public escape hatches are `PushBytes`, `PushFlatBuffer`, unchecked/uninitialized payload creation, repeated writes to one slot, dead unreachable objects, schema mutation, a patched emitter, and any non-native postprocessor. They are not canonical generated/direct construction of the frozen object.

## Presence and `ForceDefaults`

Presence is part of the exact object. A present scalar is emitted exactly once even when equal to the schema default; an absent optional/default field is not created merely to alter layout. `ForceDefaults` is therefore a frozen/comparator configuration consistent across candidate and comparators for each object, never a candidate action and never selected from held-out outcomes. The tiny gate contains non-default present scalars and checks both `ForceDefaults(false)` and `ForceDefaults(true)` parity; the natural identity digest separately audits presence.

## Vtable and reuse configuration

`DedupVtables(true/false)` is a complete current configuration arm. With deduplication enabled, `EndTable` compares exact raw vtable byte strings against earlier remembered vtables in native insertion order; candidate state retains every future-queryable signature and native offset. With it disabled, no future vtable match is possible, but the arm remains in the full-cost comparator grid.

`CreateSharedString` is enumerated only where the frozen identity contract permits the resulting sharing. Equal text belonging to distinct frozen identities cannot be pooled. Direct reuse of an existing offset is the canonical realization of an explicit alias. The tiny oracle exercises direct strings, shared-string pool insertion/lookup, and exact alias equality.

## Alignment audit

The pinned TFLite schema has exactly four generated force-alignment expansions:

| Schema field | Element type | Required vector alignment |
|---|---:|---:|
| `CustomQuantization.custom` | `ubyte` | 16 |
| `Int32Vector.values` | `ushort` | 4 |
| `Uint16Vector.values` | `ubyte` | 4 |
| `Buffer.data` | `ubyte` | 16 |

The generated header contains the matching `ForceVectorAlignment` calls. These calls are mandatory parts of the corresponding vector action in every arm. No `force_align` string field or generated `ForceStringAlignment` call exists in the pinned schema, so string force alignment is explicitly non-applicable and frozen off. Ordinary scalar/struct/vector/table alignment remains native and is tracked through `GetBufferMinAlignment()` and exact current position.

The tiny oracle has a `[int] (force_align: 16)` field and verifies the actual reader-visible vector data address is 16-byte aligned. Thus alignment is executed by the stock builder, not inferred from a static proxy.

## Offset64 audit

The pinned TFLite schema and its generated header contain no `offset64` field. All admitted natural buffers are standard ordinary `uoffset_t` FlatBuffers with a strict maximum below `2^32` bytes. `FlatBufferBuilder64`, `Offset64`, `CreateVector64`, `ForceVectorAlignment64`, and their required 64-bit-region-before-32-bit-region ordering are therefore non-applicable and frozen off for this exact-object stratum. Enabling them would change the schema/action contract and output format; it is not a hidden candidate arm.

## Finish, header, capacity, allocator and reset

- TFLite: ordinary `Finish` with identifier `TFL3`; no size prefix.
- Tiny gate: ordinary `Finish` with identifier `FBLT`; no size prefix.
- Initial capacity is a current full-cost grid arm (`default` and preregistered size-matched), but does not change the logical object.
- The allocator is stock default and measured. Custom allocators/ownership are frozen off because allocator engineering is not the N2 action.
- Every timed construction uses a fresh builder. A separately reported warm reader repetition may reuse the immutable output buffer; builder reset/reuse is not mixed into the candidate benefit.
- Verifier depth/table limits are fixed identically for every arm.

## Exact same-object checker

An admissible output must pass all of the following:

1. unmodified stock `Verifier` for the pinned generated root and identifier;
2. unmodified generated reader/accessors;
3. canonical identity-aware digest over schema type, field presence, scalar/string values, vector order, key order, table/string identity classes and aliases;
4. identical ordinary/header mode;
5. applicable force-alignment checks on actual native addresses.

Any failure closes the run before a scientific conclusion and fires the same-object killer.

## Candidate residual

The action set itself belongs to the current native union. The only candidate proposition is the global, exact-on-tiny reuse-closure state quotient and its bounded natural-corpus planner: scope/order/record assignment are coupled through current buffer position, live aliases, vtable and shared-string histories, profile endpoints and exact native step costs. Stable order, hot-first ready order, a configuration sweep, local subtree DP, generic enumeration, generated `Pack`, or a static layout model alone cannot be relabelled as the candidate.

## Revision 1 trace-to-action parity addendum

The native action grammar above is unchanged. Revision 1 removes only the invalid hard-coded `ProfileWeight` constants. `trace/profile_weights.tsv` maps every generated-reader accessor event through `trace/logical_endpoint_mapping.tsv` to the exact reflection `Object.field` key consumed by `Graph::AddTable`/`Graph::AddVector`. `FieldOrder`, `NodeHotness`, prefix distance, B0-HOT, B1, B2 and FB-RCFDP therefore read one identical frozen training-only profile. Unobserved schema endpoints receive weight zero; there is no smoothing or offset-derived weight.

The stock reader replay in `scripts/natural_native_harness.cpp::TraceReplayChecksum` uses the same accessor program as `scripts/trace_collector.cpp::ReplayOne`. The revised preclaim check compares their 64-request checksum on the first frozen training model. This is an implementation-parity check, not a natural objective result.

Useful residual actions are counted only when the chosen candidate prefix is a strict distinct-raw quotient state, at least one mapped B0/B1/B2 path reaches the same completion set, and the candidate's next `(node, field-variant)` differs from every such mapped next action. Fallback transitions stay in the denominator and receive zero credit.
