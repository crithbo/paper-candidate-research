# DEX-DELTA-PARETODP — Revision 1 static construction

- Assignment: `STAGE0-P2-20260811-DEX-DELTA-PARETODP-REVISION1-V8.7`
- Role/lane: original Stage 0 PRIMARY revision owner; this is **not** closing.
- Decision: `RECOMMEND_STAGE0_PASS_FOR_CLOSING_REVIEW`
- Revision budget: `1/1 CONSUMED` by the integrated construction below.
- Atomic gate: `CURRENT_NATIVE_WRITER_ACTION_COMPLETE__BOUNDED_DELTA_TRANSDUCER_BIJECTION_CERTIFICATE`
- Evidence ceiling: `STATIC_ACTION_AND_EXACT_DECLARED_BOUNDED_COST_CERTIFICATE_ONLY__NO_NATIVE_RUN__NO_NATURAL_EFFECT`
- Collision status: `SEARCH_BOUNDED_OPEN`; no transport or search failure is used as absence evidence.

## Finding

The gate closes, with a deliberately narrow theorem.  The contribution is an exact, DEX-writer-realizable Pareto construction for a pinned bounded delta transducer, not an assertion of unrestricted VCDIFF optimality, a current R8 feature, or an observed mobile-update gain.  It consumes the one permitted revision and must now be sent to an independent Stage 0 closing lane.

The residual is not input ordering.  The fixed input is a post-producer logical DEX IR `I`, fixed ordinary DEX version/min-API, one predecessor `D0`, and one ordered startup profile `P`.  The solver chooses only a legal physical order of the already-materialized mixed-section identities.  It neither changes `I`, profiles, ID-table order, names, code, class partition, reader, nor patcher after the fact.

## 1. Frozen object and native action grammar

### Pins and exclusions

`R8=2346f2d6f9c170defb3802a9426935512e8acd05` is the writer-source pin.  Its `MixedSectionLayoutStrategy.create()` selects default layout for an empty writing startup profile and `StartupMixedSectionLayoutStrategy` otherwise; it also exposes the existing testing strategy-inspector seam.  The source declares exactly these ordered mixed-section collections:

`annotation`, `annotation_directory`, `annotation_set`, `annotation_set_ref_list`, `class_data`, `code`, `encoded_array`, `string_data`, and `type_list`.

The plan is supplied as a `MixedSectionLayoutStrategy` at that existing seam; `FileWriter`, its offset computation, alignment, map/header construction, signature and checksum remain the pinned native path.  This is a plan-to-native-writer adapter, not a custom DEX writer or reader.  A later product-facing CLI is explicitly out of scope and cannot be claimed as an action.

The object is a non-compact, non-container, single `classes.dex`; fixed are logical indexed items, ID-table sorting, class-definition dependency order, code/debug/annotation/static-value content, vector/key order, dedup/alias identity, and the PI/latch equivalent here: the public DEX/API/reader contract.  D8/R8 shrinking, minification, optimization, desugaring, input class reordering, multidex, v041 containers, ReDex transformations, custom readers, external compression semantics, and signing identity are excluded.  Stock ART parse/verification/runtime/reflection is the semantic oracle; physical offsets, padding, map, signature and checksum may differ.

### Complete plan map `A_emit`

For each mixed identity `x`, let `b(x)` be its canonical writer byte bundle and let `dep(x)` include only the format/writer-required predecessors (including a same-identity alias representative).  A plan is a tuple of nine total orders `pi_f`, one per family `f`, each a linear extension of `dep` and canonicalized within byte-identical alias classes.  The map is:

| Writer collection | Plan projection | Immutable / regenerated native consequence |
|---|---|---|
| annotations, directories, sets, set-ref lists | `pi_annotation*` | mandated annotation-element/key order stays inside each item; offsets and padding regenerate |
| class data | `pi_class_data` | class-def table order and member order stay fixed; `class_data_off` regenerates |
| code | `pi_code` | instructions, tries, debug payload and method IDs fixed; `code_off` and alignment regenerate |
| encoded arrays | `pi_encoded_array` | static-value/call-site identity fixed; offsets regenerate |
| string data | `pi_string_data` | string-id lexical order fixed; `string_data_off` fields regenerate |
| type lists | `pi_type_list` | type-id/proto order fixed; alignment and offsets regenerate |

`FileWriter` receives precisely these collections and emits the canonical physical consequences.  The map is total because every native mixed item occurs once in its family collection; it is injective after alias canonicalization because the ordered identity tuple is recoverable from the plan.  It is therefore not a caller-order trick: the post-producer IR is held fixed before planning and the native writer, not a separately authored emitter, serializes the result.

## 2. Current same-object union and its residual

The finite policy union is `U_current = {R8_DEFAULT, R8_STARTUP(P, enabled/disabled), ReDex_InterDex_FDO_same_object}`.  R8's current startup implementation builds linked collections from the supplied profile, then appends the default collection.  It can prioritize profile-reachable code, associated strings/type lists and selected class/annotation/encoded-array items.  All startup-layout controls, including the default-enabled startup-layout switch, are included.  The strategy-inspector is recorded as an **embedding interface**: it exposes legal writer actions but contains no existing optimization policy, objective, quotient, or guarantee, so it is not counted as a baseline oracle.

ReDex is confined to the InterDex/FDO writer-layout subset that preserves the same logical object.  Any pass that renames, removes, rewrites, changes metadata or moves classes across DEX files is outside the object and is not an admissible comparator action.  Historical ART `dexlayout` is an oracle/direct historical subtractor only; current ART no longer provides it.  `dex2oat`, dexpreopt and ART compiler filters are matched deployment costs, not DEX-emission moves.

Fair information is `(I,D0,P)`.  A baseline may use the same supplied `P`, but may not fabricate extra startup rules from `D0`: that would change the declared profile input rather than choose a layout under the same information.  For every item tied by `P` and default policy, `U_current` has only the default tail order; it has no predecessor-cost objective or exact search over the nine writer collections.  The candidate's legal strategy space is available through the existing writer seam, but its **N2** is the complete action quotient and exact Pareto optimizer over that space, not the seam itself.

## 3. Exact bounded-transducer quotient

The declared theorem cost is `C_E`, the exact serialized size of `E_B(D0,D)` under the following pinned deterministic bounded source-copy transducer contract (its later implementation may emit RFC-3284/VCDIFF, but the theorem does **not** claim byte identity with every VCDIFF implementation):

1. a fixed source file `D0`; fixed target-window schedule of at most `B` target bytes, reset only at declared DEX section boundaries;
2. source-copy matching only, minimum match 3, longest match then lowest source offset; no target-copy, no secondary compressor, no adaptive parameter search;
3. fixed SELF address mode, canonical maximal ADD run, fixed window/header/checksum choices; and
4. every byte of the patch, including window headers, instruction/address/data sections, is counted.

For mechanical reproducibility, `E_B` uses one fixed byte grammar: `FRAME(s,t)=F0|U(s)|U(t)|instructions|00`; `COPY(l,a)=C1|U(l)|U(a)`; `ADD(l,x)=A1|U(l)|x`, where `U` is unsigned LEB128 and `s,t` are the declared source/target-window offsets.  Its source-only longest-match rule and instruction rules above select a unique trace.  Thus `C_E` is an exact serialized-byte objective even before an implementation exists.  This is a declared bounded encoder, not a claim about every VCDIFF implementation.  The Stage A killer must replay a pinned xdelta3 trace and the strongest mobile-patcher portfolio separately; it must not silently replace `C_E` with either.

An exact DP state is

`q = (f, J, r, a, L, h, o, z)`

where `f` is the current family/section; `J` is the ideal of already placed canonical bundles; `r` is the current alignment residue; `a` is the vector of unresolved boundary-live offset slots; `L` is the at-most-`B-1` deferred target suffix; `h` is the exact fixed-source match/encoder state (window position, pending maximal-match decision, SELF address state and byte counters); `o` is the profile-locality accumulator; and `z` is the final-size accumulator.  `D0`, the source match index and fixed code table are constants, not untracked state.

The transition for a currently minimal bundle appends its native-writer byte contribution, applies the required alignment, resolves all now-determined offset slots, and feeds only bytes whose match decision is no longer pending to `h`.  At a target-window/section boundary it flushes the remaining suffix with the specified end rule.  Thus equality of `q` implies (i) the same legal remaining writer actions, because `J`, alias and boundary obligations agree; and (ii) identical incremental and final `C_E`, because every encoder datum that can affect a future match or emitted byte is in `L,h` and every later offset effect is in `a`.  Conversely, a merge that drops a live offset slot, deferred suffix, or encoder field is forbidden.

The Pareto label is exactly `(z,C_E,o)` with a predecessor pointer.  `a` makes the theorem honest: a DEX with many simultaneously unresolved ID/class offset fields can have a large state.  This is not a claim of practical polynomial behavior on all DEX files.

## 4. Bijection and complexity

Let `W(pi)` be the bytes generated by the pinned `FileWriter` from canonical plan `pi`.  Induction over the nine ordered collections gives a bijection

`canonical legal DP paths  <->  canonical A_emit plans  <->  { W(pi) | pi legal }`.

The first arrow holds because each transition selects exactly one currently legal canonical bundle and every linear extension has that sequence.  The second holds because the strategy returns exactly the nine orders consumed by the native writer; native offset/map/signature/checksum regeneration is deterministic.  Byte-identical aliases are quotient-canonicalized before the first arrow, so two names for the same native item do not create a spurious duplicate output.

For `n` bundles, max frontier width `w`, at most `k` boundary-live unresolved offset slots, alignment modulus `m`, profile state count `p`, and `Q_B` exact encoder states, the label-setting DP is exact with

`time O(n * 2^w * 2^k * m * p * |Q_B| * Lbar)` and `space O(2^w * 2^k * m * p * |Q_B| * Pfront)`.

`Lbar` is bounded writer-bundle transition work and `Pfront` is retained nondominated-label count.  With byte alphabets explicit, `|Q_B| <= O(B * 256^(B-1) * H_B)` for the fixed matcher/coder state count `H_B`.  This is an exact FPT bound in `(w,k,B,m,p)` and not generic ILP or identity enumeration.  It deliberately degenerates when `k`, `w`, or `B` are large; Stage A must report that degeneration rather than conceal it.

## 5. Mechanical action-divergence witness

Take an ordinary single-DEX one-class logical IR with empty startup profile `P`, fixed class/ID tables and three one-character `string_data_item`s.  At the data-section target window, let old bytes be

`A B X = 01 41 00 | 01 42 00 | 01 58 00`.

The current version changes only `X` to `Y=01 59 00`.  Under a valid default-tail materialization in which the two tied cold string-data identities occur `B,A`, current R8 default/startup-with-empty-`P` and the one-class ReDex InterDex subset emit `B A Y`; the candidate plan returns the legal `A B Y` order through `getStringDataLayout()`.  String IDs remain sorted `A,B,Y`; the two `string_data_off` fields regenerate from `(0x100,0x103)` to `(0x103,0x100)` in the `B,A,Y` arm.  No class, method, code, reader-visible string value, ID ordering, or profile changes.

For the declared source-only encoder (`B >= 9`), in the data window:

| Output | Exact canonical instructions | Variable encoded bytes |
|---|---|---:|
| candidate `A B Y` | `COPY(6,0); ADD(3,Y)` | `3 + 5 = 8` |
| current-tail `B A Y` | `COPY(3,3); COPY(3,0); ADD(3,Y)` | `3 + 3 + 5 = 11` |

Here each short `COPY(len,addr)` occupies its opcode plus one-byte ULEB length and address, and `ADD(len,data)` its opcode plus one-byte ULEB length plus data.  The `FRAME` bytes are common in this target window.  The fixed string-ID window is an additional non-common difference: `A,B` offsets are unchanged for `A,B,Y` and swapped for `B,A,Y`, so it cannot reverse the 3-byte data-window advantage.  This witness is byte-mechanical and writer-realizable, but is **only** an action-divergence witness: it is not a natural gain claim.

## 6. Finite Stage A preclaim fidelity/killer route

Before any claim-bearing run, Stage A must pass all of the following:

1. enumerate every legal plan of a tiny R8/ART fixture; compare DP outputs byte-for-byte with the native strategy-inspector/`FileWriter` output and an independent DEX parser, then ART verification/open and semantic reflection oracle;
2. replay every `U_current` arm on the same fixed `(I,D0,P)`, including startup enabled/disabled and the same-object ReDex subset; fail if it reproduces the certified residual decision;
3. validate the exact `E_B` trace against its frozen encoder implementation and retain its patch bytes; then run pinned xdelta3, bsdiff, HDiffPatch, archive-patcher and reproducible `sdiff`/`MDiffPatch` where available;
4. use two provenance-pinned ordinary single-DEX adjacent pairs, initially `AOSP PermissionController` and `AOSP CellBroadcastReceiver`, each admitted only after product/module/revisions/toolchain/DEX-version/profile/artifact-hash and single-DEX checks pass; otherwise the arm fails closed rather than silently switching object;
5. record planner CPU/wall/RSS/temp, writer, final bytes, patch/reconstruct, verify/open, package recompression/signing separately, and matched deploy/dex2oat/dexpreopt cost.  A natural null, no residual beyond current union, non-equivalence, or full-cost loss is a killer for the performance paper.

## Decision boundary

The gate would have failed if the construction reduced to profile-mask search, input class order, generic ILP, raw permutation enumeration, custom reader/emitter, or an untracked/weak delta proxy.  It does not: all nine current writer collections, fixed-object constraints, exact bounded encoder state, native-output bijection, bounded exact complexity, and a native action witness are explicit.  Stage0 therefore recommends conditional passage to independent closing; no result beyond the stated evidence ceiling is implied.

## Sources used for this static revision

- [Pinned R8 mixed-section strategy](https://r8.googlesource.com/r8/%2B/2346f2d6f9c170defb3802a9426935512e8acd05/src/main/java/com/android/tools/r8/dex/MixedSectionLayoutStrategy.java)
- [Pinned R8 startup mixed-section strategy](https://r8.googlesource.com/r8/%2B/2346f2d6f9c170defb3802a9426935512e8acd05/src/main/java/com/android/tools/r8/dex/StartupMixedSectionLayoutStrategy.java)
- [AOSP DEX format](https://source.android.com/docs/core/runtime/dex-format)
- [RFC 3284 VCDIFF](https://www.rfc-editor.org/info/rfc3284/)
- Frozen PRIMARY `SOURCE_AUDIT.md` and comparator matrix, hashes in `handoff.yaml`.
