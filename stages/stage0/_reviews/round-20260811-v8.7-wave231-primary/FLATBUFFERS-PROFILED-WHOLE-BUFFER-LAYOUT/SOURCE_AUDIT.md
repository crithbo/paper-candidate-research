# FLATBUFFERS-PROFILED-WHOLE-BUFFER-LAYOUT Source Audit

- Assignment: `STAGE0-P2-20260811-FLATBUFFERS-PROFILED-WHOLE-BUFFER-LAYOUT-PRIMARY-V8.7`
- Role: `PRIMARY`
- Cutoff/check date: `2026-08-11`
- Search disposition: `SEARCH_BOUNDED_OPEN`
- Evidence rule: official/first-party sources and primary papers only; a failed Git transport was not used to infer absence.

## Admitted Discovery packet

| File | SHA-256 | Disposition |
|---|---|---|
| `TOPIC_BRIEF.md` | `1D695A9DA0B032A6960B628B6E74460CEC21B28D9A6792E48A6FD8B038333D68` | read in full |
| `STATIC_ACTION_DIVERGENCE_CERTIFICATE.md` | `B47038EA24C096A32B8CE8AF4559B27836352A9F7E88F36BBB600B2D2C0D04A6` | read in full |
| `SOURCE_COLLISION_MATRIX.md` | `E8A9FC50D81CB4DF1BC28AC7BA4F07841FACCBBCF5A48A71A0CD8D15FA83E3B4` | read in full |
| `DISCOVERY_LOG.md` | `9A899B72D334F811DABBC5D194B8829CD614737C35320720E6B9080155920456` | read in full |
| `handoff.yaml` | `F676A65B20AB1675FD8259D41AAB692FE6EE53398A25A6A728D41202B3179F8A` | read in full |

No other candidate packet was read.

## Control provenance

| Control | User-frozen expected SHA-256 | At-read SHA-256 | Disposition |
|---|---|---|---|
| `registry.yaml` | `B7CCE3A37EFF694746FBA6A6C8D49073E1061C0DF2BCDAF8232AEAE19F9DBF98` | `8041E99A4D11BD614614BB35BE1C768C588DF7639098DC99CD86E8736747A7E3` | concurrent mainline drift; current semantic assignment still matched exactly; not scientific evidence |
| `plan.md` | `C0CCD013B776FF9B8BE396C2E302C995745D16843D47F9E1A762AA0A195C2FAF` | `6CC9C66D866FC5BCEC0F9CFC74395EFAC7C404F62D72B25B7EA9D2618C720EFC` | concurrent mainline drift; assignment/write boundary still matched; not scientific evidence |
| `AGENTS.md` | not supplied | `66231F71EF6AB250A1AD9FF576D5840978F09EFC03BF5D2F0527D47F4D82B063` | read in full |
| `rules/ROLE_STAGE0_REVIEW.md` | not supplied | `741EC3544797FF8A5BF337E1E3448B5F683823E5229F818F162834400581626E` | read in full |

The review follows the user-frozen v8.7 scientific contract and records drift instead of silently substituting a control freeze.

## Upstream identity and release correction

1. Official tag object page: `v25.12.19` is annotated tag object `282dcb1c3266b45600510da4810092f6ec4c85f2`, which peels to source commit `7e163021e59cca4f8e1e35a7c828b5c6b7915953`. Discovery called the tag object a commit; that is corrected here.  
   https://flatbuffers.googlesource.com/flatbuffers/+/282dcb1c3266b45600510da4810092f6ec4c85f2
2. Official releases also show `v25.12.19-2026-02-06-03fffb2` as a later release label.  
   https://github.com/google/flatbuffers/releases
3. Official Git mirror master inspected at `81edeb17d9118143f2c81caf27edfb0df401279e` (2026-06-18).  
   https://flatbuffers.googlesource.com/flatbuffers/+/81edeb17d9118143f2c81caf27edfb0df401279e

The review pins the peeled release commit for the frozen executable contract and audits master as current-upstream collision evidence. It does not infer C++ identity merely from release names.

## Current C++ native action catalog

Primary source:

- https://github.com/google/flatbuffers/blob/7e163021e59cca4f8e1e35a7c828b5c6b7915953/include/flatbuffers/flatbuffer_builder.h
- https://flatbuffers.dev/flatbuffers_guide_use_cpp.html
- https://flatbuffers.dev/flatbuffers_internals.html
- https://flatbuffers.dev/schema/

Audited findings:

- `FlatBufferBuilder` writes backward from descendants to the root; subobjects must be built before a parent table is closed. Independent descendants can therefore be constructed in different legal caller orders.
- Constructor/runtime controls include initial capacity, custom allocator/ownership, buffer minimum alignment, and builder reset/reuse/release paths. These can alter construction cost and sometimes padding/capacity behavior and must be frozen or included fairly.
- `ForceDefaults` changes whether default-valued scalar fields are emitted. It must be fixed because it can change bytes while preserving accessor values.
- `DedupVtables` is a public toggle and vtable dedup is enabled by default. `EndTable` searches previously emitted exact vtables; hence the state is global-history-dependent, not purely local to a subtree boundary.
- `CreateSharedString` uses a builder-wide pool. The schema `shared` attribute makes generated direct/object packing use shared-string creation. Ordinary `CreateString` does not automatically deduplicate.
- General table-value dedup is not a stock automatic atom. Reusing the same already-built `Offset<T>` is explicit alias reuse and is legal only when the frozen identity-labelled graph contains that alias.
- Generated object API `Pack`/`UnPack` is part of the current union. `native_custom_alloc` concerns native object allocation and is not a free wire-layout optimizer.
- Vectors of offsets are emitted according to logical vector order; a planner may schedule construction of element objects when dependencies allow, but may not permute the logical vector. `CreateVectorOfSortedTables` is a distinct schema-keyed action whose semantic ordering must be preserved.
- Alignment/padding and current buffer position affect bytes. Identifier and ordinary versus size-prefixed `Finish` must be fixed.

Official maintainer discussion explicitly notes that FlatBuffers does not mandate one universal builder ordering and implementations/callers may use different orders. This supports action availability, not novelty:  
https://github.com/google/flatbuffers/issues/4827

## Stock reader and verifier contract

Primary sources:

- https://github.com/google/flatbuffers/blob/7e163021e59cca4f8e1e35a7c828b5c6b7915953/include/flatbuffers/verifier.h
- https://flatbuffers.dev/languages/cpp/#access-of-untrusted-buffers
- https://flatbuffers.dev/schema/#file-identification-and-extension

The generated verifier checks buffer structure, offsets, string termination and configured bounds before stock access. Verifier depth and table-count limits are configuration inputs and must be identical. Generated accessors themselves are not a substitute for verification. File identifier and size prefix alter the root framing and are frozen. Reader-value equality alone is insufficient if alias/pointer equality is observable; the revised object therefore freezes alias identity.

## Two-buffer certificate audit

The schema and fixed values admit either `left`-then-`right` or `right`-then-`left` descendant construction before the root. With identical shared string, vtable policy and Finish contract, both are plausibly stock-valid and can place `right.hot` at different physical distances.

However, the supplied certificate gives no exact byte arrays, offsets, alignment trace, verifier result, or objective arithmetic. Its `B1` is described as the output of the proposed optimizer rather than mechanically constructed. More importantly, both orders are already included in the declared current native caller-order union. Therefore:

- it is a valid **feasible-action witness specification**;
- it is not yet a mechanical two-buffer certificate;
- it does not establish action divergence beyond the current union; and
- it does not establish the DP's exactness or performance.

This is a finite static revision gap, not a demand for natural positive output.

## DP/formal audit

The Discovery complexity statement `O(n * 2^d * poly(d))` is not auditable without a recurrence and sufficient state. A state indexed only by local placement/alignment cannot exactly represent all native plans when:

- vtable reuse depends on the set/order of prior exact vtables;
- shared strings and explicit alias offsets have builder-wide availability/history;
- padding depends on current backward buffer position;
- a DAG node can serve multiple parents;
- vector/key ordering constrains when offsets may be assembled; and
- builder flags can alter emitted bytes.

A generic subset DP over sibling orders is known algorithmic machinery. Candidate-specific N2 requires a FlatBuffers-specific decomposition, explicit complexity parameters such as arity/frontier/reuse-class width, and a bijection or certified bound relative to all native-legal plans. Complete tiny enumeration can validate such a solver but cannot by itself be the contribution.

## Natural route and full-cost audit

Official LiteRT documentation states that converted models are stored in an optimized FlatBuffer `.tflite` format, and TensorFlow/LiteRT maintains an official FlatBuffers schema. These are legitimate natural carriers, subject to freezing the exact schema/model commit and preserving all model semantics:

- https://developers.google.com/edge/litert/conversion/tensorflow/overview
- https://github.com/tensorflow/tensorflow/blob/master/tensorflow/compiler/mlir/lite/schema/schema.fbs

Official examples alone are too small for a paper; the route requires a versioned natural model corpus plus a second natural FlatBuffers corpus. Profiles must be collected only from training traces and supplied identically to candidate and profile-aware baselines. Report profile extraction/amortization, planner time/RSS, build time/RSS/reallocations, final bytes/temp space, verifier, load/mmap, reader latency/throughput and cache/TLB behavior.

## Collision ledger

| Source | Object/action relation | Result |
|---|---|---|
| FlatBuffers source/docs/current issues | exact implementation and actions | absorbs the alleged new action; no located profile optimizer |
| Chilimbi et al., Cache-Conscious Structure Layout/Definition | profile/locality-guided in-memory layout | generic methodological neighbor; changes object/layout contract |
| Pettis and Hansen, Profile Guided Code Positioning | profile-guided ordering | generic ordering neighbor; code object differs |
| EverParse | verified zero-copy parser/serializer generation | changed formats/action; formal/evaluation anchor |
| Zerializer | zero-copy serialization via different/offloaded mechanism | changed object/action; domain neighbor |
| Lite² and other alternative serialization proposals encountered | new format/data structure | changed object; not direct absorption |

Bounded queries covered FlatBuffers profile-guided layout, serialization access locality, zero-copy serialization, structure/data layout, code/data positioning, and official/current repositories through the cutoff. No exact direct paper was established. This remains `SEARCH_BOUNDED_OPEN`; an unclosed query or transport failure is not evidence of absence.

Primary paper URLs:

- https://doi.org/10.1145/301618.301633
- https://www.microsoft.com/en-us/research/publication/cache-conscious-structure-definition-2/
- https://www.usenix.org/conference/usenixsecurity19/presentation/delignat-lavaud
- https://doi.org/10.1145/3458336.3465283
- https://www.cs.yale.edu/homes/soule/pubs/hotos2021.pdf

## Audit conclusion

The same-object optimization space is real, but Discovery overstates its certificate in two places: the action witness is already within the current union, and the proposed local DP omits global native state. One atomic, finite, static revision can still define a complete-action optimizer and nontrivial guarantee. This supports `REVISE_ONCE`, not PASS and not scientific STOP.
