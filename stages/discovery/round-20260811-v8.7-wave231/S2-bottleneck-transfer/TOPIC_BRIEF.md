# S2-FB-LAYOUT-231 Profiled legal whole-buffer layout for FlatBuffers

- Status: `PROPOSE_STAGE0`
- Quality tier: `TIER_B_Q2_VIABLE`
- Opportunity origins: `O2`
- Domain tags: serialization, data layout, zero-copy reader, systems algorithm
- Contribution route: `N2`
- Discovery date: 2026-08-11
- Discovery method revision: `v8.7+R5-P0`
- Structural paper potential: `TIER_B_Q2_VIABLE if the planner improves the complete stock-verifier/read full cost under the frozen contract`
- Current evidence readiness: `FINITE_FIDELITY_GAP` — static action/semantics close; no implementation, corpus replay or performance result is claimed.

## Research question

For one fixed FlatBuffers schema, logical object graph and stock reader/verifier contract, can a profile-guided legal topological constructor jointly choose object construction order and existing exact reuse atoms to reduce complete build + verify + zero-copy access cost, without changing schema, values, root, format, reader or guarantee?

## Paper genealogy and collision boundary

- Anchor artifact/specification: [FlatBuffers internals](https://flatbuffers.dev/internals/) and [current upstream](https://github.com/google/flatbuffers/tree/282dcb1c3266b45600510da4810092f6ec4c85f2).
- Relevant calibration: [FlatBuffers white paper](https://flatbuffers.dev/white_paper/), [JSON-compatible serialization survey](https://arxiv.org/abs/2201.02089), and [serialization benchmark](https://arxiv.org/abs/2201.03051).
- Direct primary collision search: exact queries combining `FlatBuffers`, `vtable`, `layout`, `construction order`, `profile guided`, `zero-copy`, `verifier`, and `dynamic programming`; official upstream/release/source and primary-paper search observed through 2026-08-11.
- Result: no decisive same-object profile-guided whole-buffer constructor was found, but this is `SEARCH_BOUNDED_OPEN`, not a novelty conclusion. Stage 0 must independently extend citation chaining and source review.

## Exact object, strongest union and fair baseline

**Object/function/guarantee:** same `.fbs`, root, logical table/vector/string values, schema evolution compatibility, FlatBuffers offset/alignment constraints, configured identifier/size-prefix contract, stock generated `Verify` and `GetRoot` observations.

**Strongest current executable union:** frozen tag `v25.12.19` / `282dcb1c3266b45600510da4810092f6ec4c85f2`; C++ `FlatBufferBuilder` backwards construction, legal caller-provided child/field order, `EndTable` vtable dedup, `CreateSharedString`, all standard alignment/offset writing, allocator and buffer-min-alignment controls, generated object API, `Finish`/`FinishSizePrefixed`, stock verifier and generated reader. Baseline union must be run with sharing and dedup enabled where legal, not a naive builder.

## N2 mechanism, state and guarantee

`ProfiledTopoLayout(G,W)` receives the fixed object graph `G`, a finite access profile `W` over generated-reader field paths, schema arity bound `d`, and deployment-fixed finalization options. It maintains per-subtree candidate layouts indexed by legal placement boundary/alignment state and selects child order plus exact-reuse references to minimize weighted root-to-first-byte span plus bytes. For tree-shaped graphs it is an exact bounded-arity DP, `O(n·2^d·poly(d))`; for high arity it declares a fallback rather than hiding an opaque solver. Existing sharing/vtable dedup are retained as baseline atoms.

**Action gap certificate:** [STATIC_ACTION_DIVERGENCE_CERTIFICATE.md](STATIC_ACTION_DIVERGENCE_CERTIFICATE.md) supplies two same-object, stock-verifier/reader-equivalent buffers. The divergence is a global profile-indexed legal sequence, not string sharing, vtable dedup, cache, compression, postprocess, schema reorder or changed reader.

## Competing mechanisms and full cost

1. Stock backwards builder with automatic vtable dedup and shared strings.
2. Same stock union plus fixed caller order / a simple hot-first heuristic.
3. Candidate DP; optional offline exhaustive optimum only for tiny legality witnesses, not as a baseline substitute.

Full-cost denominator: profile extraction, planner time/memory, builder CPU/wall/RSS, output bytes, temporary storage, stock verifier CPU/latency, generated-reader latency/cache-miss proxy, and any conversion/materialization necessary to retain the same object. No-gain region: shallow or low-arity graphs; uniform/random access; graphs with little sibling-layout freedom; and workloads where profile extraction/planning outweighs access benefit.

## Natural carrier, oracle and finite Stage A killer

**Natural route:** an official version-pinned TensorFlow Lite model set or official FlatBuffers examples with schema+source model provenance. TensorFlow documents that TFLite conversion emits `.tflite` FlatBuffers. No download is required at Discovery; Stage A must record exact model/revision hashes before use.

**Native oracle:** FlatBuffers generated verifier/root reader, plus fixed TFLite interpreter observable output when TFLite is used. The candidate and baselines must produce identical reader values and application outputs.

**≤72-hour killer:** implement only the bounded-tree constructor; choose 20–50 version-pinned natural models/messages with existing access paths; compare strong union, hot-first heuristic and DP; fail closed if any verifier/read/output mismatch, a needed action is already expressible by the baseline's existing global method, the object must be repacked/format-changed, profile collection changes the contract, or DP fails to improve any complete-cost region after including profile/planner/build/verify/read terms. A pass is limited to validating the frozen mechanism premise, not a paper conclusion.

## Current upstream reality and fidelity plan

- Checked tag/date: `v25.12.19`, commit `282dcb1c3266b45600510da4810092f6ec4c85f2`, queried 2026-08-11.
- Source facets: `include/flatbuffers/flatbuffer_builder.h`, `include/flatbuffers/verifier.h`, generated C++ APIs; official internals and current language docs.
- Defaults/non-defaults considered: backwards builder, vtable dedup, shared vs ordinary string creation, allocation/capacity, alignment/minimum alignment, root finishing vs size-prefixed finishing, verifier limits, generated object API.
- Contrary evidence: the current builder already has local reuse and permits order flexibility. Disposition: these are mandatory baseline actions; they do not by themselves implement the declared profile-indexed DP.
- Fidelity status: `FINITE_FIDELITY_GAP`.
- Failure predicate: direct current/paper absorption; any contract violation; no finite natural corpus; or no legal two-buffer witness.

## Q2 sufficiency and audit

If the bounded algorithm consistently yields a Pareto improvement or explainable trade-off on natural model/message graphs against the strong union and hot-first baseline, the contribution has a credible systems/serialization Q2 shape: new constrained layout algorithm, semantics-preserving guarantee, mechanism analysis and full-cost evaluation. It remains Tier B because direct prior-art collision and generalization across readers/languages still require Stage 0/Stage A evidence.

- Same-object: fixed schema/graph/root/reader/verifier/application result.
- Latest collision: bounded official/primary search; independent Stage 0 required.
- Fair baseline: complete native builder union, not a weak emitter.
- Natural input: finite official TFLite/example route with hash closure.
- Evidence honesty: no performance, implementation, corpus result or novelty conclusion is claimed.
