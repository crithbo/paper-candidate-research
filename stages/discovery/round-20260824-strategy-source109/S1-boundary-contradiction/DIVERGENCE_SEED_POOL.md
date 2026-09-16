# Source109 S1 divergence seed pool

## Pool metadata

- Assignment / lane: `DISCOVERY-S1-20260824-SOURCE109-EXPLICIT-DENYLIST-ALTERNATE-RUNTIME-V1` / `DISCOVERY_S1`
- Frozen profile: `SOURCE109_EXPLICIT_DENYLIST_ALTERNATE_RUNTIME_FAMILY_ROTATION_V1`
- Seed ceiling: `<=12`; generated: `8`
- RQ candidate ceiling after convergence: `<=8`
- Network-security exclusion check: `PASS` — public TensorRT-LLM and ONNX Runtime/GenAI artifacts only.
- Generation completed before evidence lookup: `YES`
- Mandatory denylist: `PREDECESSOR_IDENTITY_DENYLIST.yaml`, SHA256 `1AC56E95A1859818EFB3E4DB853B1B4DF13D081F3AB7C780E381CA553A0FFB01`.

## Divergence coverage

| Engine | Used | Seed IDs |
|---|---:|---|
| `BISOCIATION_STRUCTURAL_TRANSFER` | yes | S109-01, S109-05 |
| `PROBLEM_REFRAMING` | yes | S109-02 |
| `CONSTRAINT_MANIPULATION` | yes | S109-03, S109-06 |
| `NEGATION_OR_INVERSION` | yes | S109-04 |
| `ABSTRACTION_LADDER` | yes | S109-07 |
| `JANUSIAN_TENSION` | yes | S109-08 |

### S109-01

- Denylist check before lookup: `DISTINCT` — TensorRT-LLM paged-context attention plugin semantics; object/action/endpoint differ from every listed predecessor identity.
- Engine / perspective: `BISOCIATION_STRUCTURAL_TRANSFER` / `COMPILER_OR_BACKEND_ENGINEER`
- Starting anchor: TensorRT-LLM attention plugins compile a network with configuration-time constraints but execute requests with runtime cache and position metadata.
- Intended source role: `ANCHOR`.
- Idea sketch: Test whether an explicit plugin build-time constraint is stronger than the run-time semantic requirement for a public paged-context attention path, leaving a same-output lowering action. The action must be target-plugin specific and include engine build, conversion and execution cost.
- Conclusion-first test: A compiler contribution could safely enlarge one exact TensorRT-LLM plugin contract without changing attention/KV semantics.
- Counterfactual / risk: It may be a generic dynamic-shape/fallback formulation or a documented supported option.
- Evidence needed: versioned plugin config/source locus, exact runtime contract, native LLM carrier and contrary current option.
- Relation / noun-swap / disposition: `FRESH_SKETCH` / `PASS` / `KEEP_FOR_CONVERGENCE`.

### S109-02

- Denylist check before lookup: `DISTINCT` — ONNX Runtime GenAI provider-level attention representation and artifact semantic endpoint are not a listed predecessor identity.
- Engine / perspective: `PROBLEM_REFRAMING` / `MAINTAINER`
- Starting anchor: ONNX Runtime GenAI may split model-level generation semantics between graph export, provider kernels and the generator API.
- Intended source role: `ANCHOR`.
- Idea sketch: Define a semantic coverage boundary for a named generation feature (past/present cache, position or attention-mask convention) as it crosses a public ONNX graph and a provider execution path. A replication-negative route is valid only if a documented same-object feature claim and finite graph/reference oracle exist.
- Conclusion-first test: The cautious result would delimit a public artifact's export-to-generation contract, not add a generic ONNX checker.
- Counterfactual / risk: Existing conformance tests may cover it or the question may become a broad exporter defect.
- Evidence needed: current GenAI API/version, graph/runtime test locus, model carrier and current reference.
- Relation / noun-swap / disposition: `FRESH_SKETCH` / `PASS` / `KEEP_FOR_CONVERGENCE`.

### S109-03

- Denylist check before lookup: `RELATED_ONLY` — shares low-bit runtime surface with `BITNET_MXFP_MARLIN_AWQ_CURRENT_ACTION_REPACKAGING`, but distinct object=`TensorRT-LLM plugin configuration`, action=`semantic eligibility proof for a named plugin`, endpoint=`plugin contract coverage`, not format repackaging.
- Engine / perspective: `CONSTRAINT_MANIPULATION` / `HARDWARE_ARCHITECT`
- Starting anchor: TensorRT-LLM exposes FP8/low-bit attention and KV/cache plugin configuration that may bind scale/layout choices at engine construction.
- Intended source role: `CURRENT`.
- Idea sketch: Determine whether a source-visible low-bit plugin eligibility condition prevents a configuration that has the same documented numerical and cache semantics, rather than merely selecting another quantization format. A surviving candidate must have a public native LLM carrier and prove full build/scale/conversion cost.
- Conclusion-first test: A valid result would be a target-native semantic eligibility refinement, not a low-bit kernel/packing speedup.
- Counterfactual / risk: It is likely a current plugin support matrix or a prohibited low-bit repackaging relative.
- Evidence needed: exact current plugin support table/source, quantization contract, feature test and contrary deployment path.
- Relation / noun-swap / disposition: `FRESH_SKETCH` / `PASS` / `KEEP_FOR_CONVERGENCE`.

### S109-04

- Denylist check before lookup: `DISTINCT` — TensorRT-LLM build/runtime artifact phase boundary is distinct from prior compile-cache/cudagraph cold/warm identity.
- Engine / perspective: `NEGATION_OR_INVERSION` / `MEASUREMENT_REVIEWER`
- Starting anchor: TensorRT-LLM engine build is conventionally outside steady-state serving, but a public artifact may make configuration choices that alter both build and execution semantics.
- Intended source role: `CONTRARY`.
- Idea sketch: Ask whether a published TensorRT-LLM plugin comparison uses a cost boundary that makes a claimed semantic-capability ranking non-identifiable, with one fixed estimator and a held-out correctness condition. This can proceed only with an exact artifact claim; a generic first-versus-steady benchmark is forbidden.
- Conclusion-first test: A benchmark correction could alter a named plugin deployment decision under the artifact's own stated boundary.
- Counterfactual / risk: It becomes the denylisted generic cold/warm dashboard, or no ranking claim exists.
- Evidence needed: versioned benchmark config/claim, build and runtime logs/schema, public carrier and contrary protocol.
- Relation / noun-swap / disposition: `FRESH_SKETCH` / `PASS` / `KEEP_FOR_CONVERGENCE`.

### S109-05

- Denylist check before lookup: `DISTINCT` — ORT GenAI graph/provider semantic contract differs from prior `PRIVATE_TOOLCHAIN_STREAM_ASYNC_PARTITION_SCHEDULING` and `TVM_METASCHEDULE` identities.
- Engine / perspective: `BISOCIATION_STRUCTURAL_TRANSFER` / `THEORIST`
- Starting anchor: A provider capability flag resembles a proof obligation: the exporter must establish exact graph properties before a fused kernel is legal.
- Intended source role: `ANCHOR`.
- Idea sketch: Formulate a finite certificate over an exported public attention subgraph that shows a named ORT provider optimization preserves cache/mask semantics in a case current feature detection rejects. This is viable only if the certificate is not an existing shape/type capability query and a public checker/oracle exists.
- Conclusion-first test: The result would be a sound graph-property certificate for one provider action, not generic graph optimization.
- Counterfactual / risk: Existing partitioner/capability checks already encode the property or certificate is metadata plumbing.
- Evidence needed: provider predicate/source, ONNX graph contract, current test oracle and a public LLM model.
- Relation / noun-swap / disposition: `FRESH_SKETCH` / `PASS` / `KEEP_FOR_CONVERGENCE`.

### S109-06

- Denylist check before lookup: `DISTINCT` — TensorRT-LLM attention-plugin feature interaction is distinct from `FLASHINFER_PAGED_KV_ATTENTION_SEMANTIC_REFERENCE_TESTS` by exact implementation, action and endpoint.
- Engine / perspective: `CONSTRAINT_MANIPULATION` / `COMPILER_OR_BACKEND_ENGINEER`
- Starting anchor: A plugin may permit features separately (causal mask, RoPE, paged cache, GQA) but their conjunction can have a tighter semantic contract.
- Intended source role: `CURRENT`.
- Idea sketch: Find whether a documented conjunction rule is an implementation-only limitation that can be lowered through an already-supported TensorRT-LLM attention backend while preserving all feature semantics. This cannot be a generic attention test or a backend selector.
- Conclusion-first test: The claim would be a fixed-feature semantic lowering residual in one plugin contract.
- Counterfactual / risk: Current support matrix explicitly rejects it for semantic reasons, or no carrier makes the conjunction natural.
- Evidence needed: current feature matrix/source, exact alternative backend contract, native carrier and minimal oracle.
- Relation / noun-swap / disposition: `FRESH_SKETCH` / `PASS` / `KEEP_FOR_CONVERGENCE`.

### S109-07

- Denylist check before lookup: `DISTINCT` — ORT GenAI cache graph representation is distinct from `VLLM_KV_PREFIX_CACHE_SESSION_LIFECYCLE_METRICS` and `SGLANG_SESSION_RADIX_CACHE_REFERENCE_EVICTION` by runtime, action and endpoint.
- Engine / perspective: `ABSTRACTION_LADDER` / `END_USER`
- Starting anchor: Generator APIs can expose cache sharing as an allocation feature while graph-level past/present state has a semantic ownership contract.
- Intended source role: `NATURAL_CARRIER`.
- Idea sketch: Measure whether a named ORT GenAI cache-sharing option preserves a documented generation correctness property under concurrent/alternating request sequences, using a public reference model and finite oracle. It is retained only if current tests lack the exact ownership scenario and the result changes an API-level decision.
- Conclusion-first test: A negative replication could narrow a public cache API's allowed use, not propose a generic session cache policy.
- Counterfactual / risk: Existing tests cover it, or it requires a distributed/concurrent object outside single-GPU scope.
- Evidence needed: API docs/version, test/source locus, single-GPU native carrier and deterministic oracle.
- Relation / noun-swap / disposition: `FRESH_SKETCH` / `PASS` / `KEEP_FOR_CONVERGENCE`.

### S109-08

- Denylist check before lookup: `RELATED_ONLY` — shares a fallback motif with `PYTORCH_TORCH_COMPILE_DYNAMIC_SHAPE_GUARD_RECOMPILE_FALLBACK`, but distinct object=`ORT GenAI provider attention kernel`, action=`exported-graph semantic fallback classification`, endpoint=`provider contract`, not dynamic-shape recompilation.
- Engine / perspective: `JANUSIAN_TENSION` / `COMPILER_OR_BACKEND_ENGINEER`
- Starting anchor: Provider fallback is safe but may conceal whether a graph is unsupported semantically or only not recognized by the exporter.
- Intended source role: `CONTRARY`.
- Idea sketch: Partition one current ORT GenAI attention fallback condition into semantic versus recognition-only cases, then define a same-function graph transformation only for the latter. The candidate survives only with exact current source, a graph/LLM carrier and full graph-transformation cost.
- Conclusion-first test: The modest result would be a source-grounded provider-recognition repair with fixed output semantics.
- Counterfactual / risk: It is generic graph transformation, current support already handles it, or it repeats a denylisted compile-fallback family.
- Evidence needed: source predicate, graph/test oracle, public LLM carrier and contrary capability route.
- Relation / noun-swap / disposition: `FRESH_SKETCH` / `PASS` / `KEEP_FOR_CONVERGENCE`.

## Clustering and genealogy

| Cluster | Seed IDs | Shared object/mechanism | Material differences | Representative seed |
|---|---|---|---|---|
| TensorRT-LLM plugin contract | S109-01, S109-03, S109-06 | attention plugin eligibility/feature semantics | base eligibility, low-bit support, feature conjunction | S109-06 |
| ORT GenAI graph contract | S109-02, S109-05, S109-07, S109-08 | graph/provider/generator semantics | export test, certificate, ownership, fallback classification | S109-02 |
| artifact estimator | S109-04 | exact plugin claim/cost | benchmark validity only | S109-04 |

## Coverage-constrained convergence

| Selected seed | Why preserved | Intended object/problem boundary | RQ Candidate ID |
|---|---|---|---|
| S109-01 | plugin-specific action route | TensorRT-LLM paged-context eligibility | RQ-S109-01 |
| S109-03 | low-bit semantic eligibility route | TensorRT-LLM low-bit attention/KV configuration | RQ-S109-02 |
| S109-06 | conjunction boundary route | TensorRT-LLM attention feature contract | RQ-S109-03 |
| S109-02 | exact GenAI semantic replication route | ORT GenAI export-to-generation cache/mask | RQ-S109-04 |
| S109-05 | formal alternative | ORT provider graph-property certificate | RQ-S109-05 |
| S109-07 | API ownership negative route | ORT GenAI cache-sharing contract | RQ-S109-06 |
| S109-04 | exact artifact benchmark validity route | TensorRT-LLM stated comparison | RQ-S109-07 |

S109-08 is contained by S109-02/S109-05 and remains backlog. No `EXACT_OR_CONTAINS` seed was generated; no selected seed may be replaced after evidence lookup.

## Advisory

- Engines used: 6
- Perspective roles used: 6
- Largest object/surface share: ORT GenAI graph/provider contract (4/8)
- `DIVERGENCE_COVERAGE_ADVISORY`: `PASS`
- Plain-Chinese note: 所有 seed 在查询前完成 denylist 判定。保留的 related-only 项明确了与旧题不同的 TensorRT-LLM/ORT exact object、原子动作和 endpoint；任何后续 exact/contains 命中直接排除，不作补位。
