# FLATBUFFERS-PROFILED-WHOLE-BUFFER-LAYOUT Stage A Report

- Lane id: `CANDIDATE_EXECUTION_LANE_3`
- Assignment id: `STAGEA-L3-20260811-FLATBUFFERS-PROFILED-WHOLE-BUFFER-LAYOUT-INITIAL-V8.7`
- Input freeze SHA-256: closing handoff `EF1CB0403019D6EE7F44AF4529896CBBDFDFBB55D54AA738A123DBF184BFD016`; closing manifest `A6D6C04EF9A0CF7FCC34E225AAB3057486C6933830DDD82EBEF4C5E5A1F36BA3` (`2/2` independently recomputed)
- Cross-assignment contamination declaration: `NONE`
- Decision: `STOP_RECOMMENDED__OWNER_NONFINAL`
- Quality tier: `BELOW_Q2_STOP`
- Evidence ceiling: `BOUNDED_NATURAL_NATIVE_STAGEA_NEGATIVE__OWNER_NONFINAL`
- Novelty route: `N2`
- Stage semantics: real bounded pilot of the highest-risk premise; the recommendation must go to independent Stage A gate and mainline.

## Pre-claim contract fidelity gate

- Gate status: `PASS`
- Frozen atomic actions mapped to implementation paths: complete pinned generated/direct public-builder mapping in `NATIVE_ACTION_CATALOG.md`; candidate transition emits stock string/vector/table/alias/finish calls only.
- Comparator implementation/parameter/semantic audit: `Q1_COMPARATOR_MATRIX.md`; individually realizable generated/default, stable, hot-first, config, local, generic and exact-tiny arms.
- Native codec/solver/trainer/checker/reader/format parity: FlatBuffers commit `7e163021e59cca4f8e1e35a7c828b5c6b7915953`, flatc 25.12.19, ordinary raw `TFL3`/`FBLT`, unmodified stock verifier and generated reader.
- Metric denominator and unit parity: one frozen identity DAG/profile per model; raw bytes, weighted byte-distance, micro/nanoseconds, bytes of RSS/temp and explicit fallback.
- Full-cost dimensions and collection paths: profile extraction, planner wall/CPU/RSS/states/transitions/temp, fresh-builder wall/RSS/calls, verify, warm/cold reader, bytes, cache proxy and fallback.
- Small legality/equivalence/object-identity witness: native 56-byte plans at profile distance 20 vs 36; 1,136-path tiny exhaustive suite with exact candidate frontier equality and all native checks passing.
- Non-claim-bearing proxy/control outputs retained: initial dynamic-link witness failure, tiny implementation-debug runs, and the first equality-ineligible natural harness debug row are documented and excluded.
- Claim-bearing run started only after PASS: `true`

## Frozen contract

Input is a version-pinned schema plus identity-labelled rooted logical table DAG, exact values/nulls/presence, vector/key order, ordinary header and a frozen logical-access profile. Output is one ordinary raw native FlatBuffer accepted by the pinned stock reader/verifier with an identical canonical object/identity digest. Schema/object/header/reader mutation, external compression, Offset64 for TFLite, raw byte injection and postprocessing are forbidden.

## Headroom or theoretical gap

Stage 0 left a narrow algorithmic residual: the current builder exposes all legal actions but no audited global exact planner over current position, vtable/string reuse histories, aliases and profile endpoints. The exact tiny quotient and safe forgetting lemmas were executable and correct. The empirical question was whether this quotient creates useful natural-object frontier residual under bounded full cost.

## Minimal mechanism and strongest baselines

FB-RCFDP is exact and unpruned on tiny instances. On natural inputs it is an 8-label global beam over ready node and legal table-field actions, with exact native prefix replay, reuse-closure normalization, a 20,000-transition cap and deterministic stable fallback. B2 uses the same beam width, transition cap, native replay cost and action variants but does not merge by the FlatBuffers-specific quotient.

The full current union additionally includes generated object-API Pack/direct default, stable legal topo, hot-first ready, DedupVtables on/off, default/size-matched capacity and local field-order planning.

## Natural workload and mechanism-specific prediction

The corpus froze 24 official TFLite Micro models before outcomes: 11 training models from quantize/leaky-relu/pad/add and 13 held-out models from sub/strided-slice/conv/transpose-conv/hello-world. The fixed schema-derived access profile weights interpreter-initialization-relevant Model/SubGraph/Operator/Tensor edges and is named by logical endpoints, never by reference-buffer offsets.

Prediction: vtable/current-position history and independent ready subgraphs should create strict quotient states and allow the candidate to select at least one raw-byte or reader-access residual that survives held-out p50 and p90 after full cost.

## Highest-risk probe result

- Risk-bearing premise: natural strict reuse-closure compression yields useful full-union residual.
- Probe/counterexample-search scope: 24 version-pinned public models, 8 executable arms, 192 all-valid outputs, tiny exact ceiling and full cost.
- Negative-result meaning: the quotient exists (886 distinct-raw merges, active on 22/24 models) but did not deliver the registered held-out benefit; candidate bytes, distance, warm/cold reader and build cost were all worse at p50 and p90.
- Positive-result ceiling: not applicable; result is `NEGATIVE_KILL`.

## Directional increment

- Performance/quality/Pareto/complexity effect: held-out candidate minus best union was +2.362/+4.180% bytes, +165.980/+283.061% distance, +0.499/+1.154% warm reader, +0.691/+1.711% cold reader and +49.454/+78.125% builder wall at p50/p90, plus 43.683/104.179 ms planner wall.
- Why it is not ordinary tuning or a weak-baseline artifact: the candidate is a genuine global quotient algorithm and passed exact tiny validation; the negative comes from comparison with the complete same-object executable union, not from relabelling a local heuristic.

## Performance evidence chain, if applicable

- Algorithm/data-structure change: global bounded reuse-closure state quotient over exact native prefix replay.
- Intermediate mechanism metric: 886 distinct-raw state merges across 156,163 transitions; strict on 22 models.
- End-to-end effect: no candidate raw-byte or distance win/tie on any model; isolated reader minima did not survive held-out p50/p90.
- Full-cost result: no qualifying residual; planning/build costs were additive and two held-out models fell back.
- Generality region: small public TFLite models spanning nine families under standard raw TFL3.
- No-gain or regression region: all sampled families; train and held-out p50/p90 show the same regression direction.

## Current critical-cost analysis

The decisive cost is not merely planner overhead. Even before adding planner cost, candidate outputs lose raw bytes and weighted locality to at least one eligible current-union plan on every object. Planner wall/CPU and higher build cost then strengthen, but do not create, the negative result.

## AI execution ledger

- AI executability class: `AI_CORE_EXECUTABLE_PUBLIC_CPU`
- Measured ai_core_fraction: `1.0` for the bounded Stage A artifact production and replay; scientific interpretation remains subject to independent human/mainline review.
- Reproducible commands/artifacts: pinned archives, hashes, schema, corpus, C++ witnesses/harness, orchestration and analysis scripts, raw per-model logs and consolidated results are all in this directory.
- Human-only items: independent gate judgment, registry/state transition, venue decision and any exception/pivot authorization.

## Mechanism pivot, if used

Not used. Beam width, transition cap, object, metrics and comparator union were not tuned after the first accepted natural observation. A recursive graph-extractor reference invalidation was corrected as a mechanical same-object implementation defect; the rejected row is documented and no result from it is used.

## Literature collision update

- Current upstream reality check: FlatBuffers `7e163021e59cca4f8e1e35a7c828b5c6b7915953` / v25.12.19, source blobs in `SOURCE_PROVENANCE.yaml`.
- Current actions/configs audited: caller-controlled construction order, table field order, exact vtable dedup, shared strings, alias offsets, force alignment, ForceDefaults, capacity/allocator/reuse and ordinary finish.
- Disposition: candidate makes no new-action claim. Current generated Pack is same-object and strong on all 24 models; the remaining algorithmic residual was executed but empirically killed at Stage A. Latest literature search remains `SEARCH_BOUNDED_OPEN`; no absence claim is upgraded.

## Stage B minimal prototype

Not applicable. Stage B is unauthorized and not recommended because the Stage A killer fired.

## Q1/Q2 evidence-gap review

- Comparator file: `Q1_COMPARATOR_MATRIX.md`
- Updated reference set: frozen Stage0 source audit plus pinned current source/config audit; no claim of closed literature exhaustiveness.
- Status: `PARITY_NOT_PLAUSIBLE`
- Evidence already comparable: native same-object correctness, exact tiny ceiling, public natural models, current strong executable union and full-cost directions.
- Executable Stage B gaps: none authorized; a new mechanism/object would require a new topic/assignment, not Stage B continuation.
- Human/resource-dependent gaps: independent gate only; no resource blocker exists.

## Non-relaxable quality audit

- Same-object: `PASS`, 192/192 natural outputs plus all tiny outputs.
- Latest collision: `SEARCH_BOUNDED_OPEN`; current upstream source/config reality check complete for the frozen claim.
- Strong fair baselines: `PASS`, complete registered executable union.
- Natural input/evidence: `PASS`, 24 official version-pinned models with family-held-out split.
- Full-cost: `PASS`, including profile/planner/builder/verifier/reader/RSS/temp/fallback.
- Reproducibility: `PASS`, pinned sources/assets/corpus, commands, raw rows and manifest.
- Evidence/claim honesty: `PASS`; proxy, debug failures, isolated latency minima and owner/nonfinal scope are explicit.

## Supported and unsupported claims

Supported: native legal plan divergence exists; the exact tiny reuse-closure quotient is correct; strict quotient merges occur on 22/24 natural objects; within this bounded corpus/implementation, no required held-out p50/p90 primary/full-cost residual survives the complete union.

Unsupported: impossibility for all FlatBuffers applications, Q1/Q2 publication potential under a different mechanism, hardware cache-miss claims, closed latest-collision search, or a final STOP before independent gate/mainline acceptance.

## Mandatory user gate before Stage B

- Independent Stage A gate decision: `PENDING`; owner recommends STOP.
- User-facing evidence packet: `USER_REVIEW_PACKET.md`
- `PENDING_USER_STAGEB_REVIEW`: no
- Stage B user approval id/time: `null`
- Stage B authorized: `false`

## Human research reserve, if applicable

Not applicable. This is a scientific negative result, not an AI-executability or resource limitation.

## User-action blocker, if applicable

Not applicable. The initial TLS/runtime route issues were safely bypassed before claim-bearing execution and did not block the study.
