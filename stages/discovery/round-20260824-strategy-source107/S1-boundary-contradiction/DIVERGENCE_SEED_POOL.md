# Source107 S1 divergence seed pool

## Pool metadata

- Assignment / lane: `DISCOVERY-S1-20260824-SOURCE107-SINGLE-GPU-LLM-SOFTWARE-V1` / `DISCOVERY_S1`
- Frozen profile: `SOURCE107_SINGLE_GPU_LLM_SOFTWARE_ROTATION_V1`
- Seed ceiling: `<=12`; generated: `8`
- RQ candidate ceiling after convergence: `<=8`
- Network-security exclusion check: `PASS` — public single-GPU/CPU inference compiler/runtime artifacts only.
- Generation completed before evidence lookup: `YES`
- Terminal/repeat exclusion applied: Source106 terminal hold and the declared BitNet/MXFP/Marlin/AWQ, IREE/TVM-tuning, and other exact failures are not candidate identities.

## Divergence coverage

| Engine | Used | Seed IDs |
|---|---:|---|
| `BISOCIATION_STRUCTURAL_TRANSFER` | yes | S107-01, S107-06 |
| `PROBLEM_REFRAMING` | yes | S107-02 |
| `CONSTRAINT_MANIPULATION` | yes | S107-03, S107-05 |
| `NEGATION_OR_INVERSION` | yes | S107-04 |
| `ABSTRACTION_LADDER` | yes | S107-07 |
| `JANUSIAN_TENSION` | yes | S107-08 |

### S107-01

- Engine / perspective: `BISOCIATION_STRUCTURAL_TRANSFER` / `COMPILER_OR_BACKEND_ENGINEER`
- Starting anchor: A dynamic-shape compiler's specialization guard is analogous to a type refinement; low-bit kernel legality can depend on more than tensor shape.
- Intended source role: `ANCHOR`.
- Idea sketch: Represent quantization-layout invariants (group size, packing axis, alignment, scale granularity) as compiler-visible symbolic constraints so a valid low-bit path survives shape polymorphism instead of falling back. The intervention must preserve numerics and public API semantics; it cannot be a new packing format or a cache key tweak.
- Conclusion-first test: A compiler could soundly retain target-native low-bit lowering for a larger set of dynamically shaped, already-supported LLM calls; it matters only if current guards demonstrably discard a legal same-semantics region.
- Counterfactual / risk: Existing TorchInductor/TorchAO guards or kernel selection may already encode the invariants, making this a generic specialization/cache proposal.
- Evidence needed: current guard/lowering locus, exact public low-bit operator carrier, and a counterexample where fallback occurs despite legal target kernel conditions.
- Relation / noun-swap / disposition: `FRESH_SKETCH` / `PASS` / `KEEP_FOR_CONVERGENCE`.

### S107-02

- Engine / perspective: `PROBLEM_REFRAMING` / `END_USER`
- Starting anchor: “dynamic shape support” may be an endpoint property rather than a boolean operator capability.
- Intended source role: `ANCHOR`.
- Idea sketch: Define an end-to-end semantic coverage frontier for LLM decode shapes: compiled low-bit path, graph break/fallback, and numerical contract are all jointly observed. This is a measurement candidate only if existing compiler reporting cannot already answer the same frontier and the carrier uses native LLM requests rather than hand-authored tensor cases.
- Conclusion-first test: The cautious conclusion would be a reproducible boundary map that changes deployment decisions, not a dashboard of compile counters.
- Counterfactual / risk: It collapses to generic benchmarking or instrumentation if public compiler logs already expose the same estimand.
- Evidence needed: current diagnostics, public LLM inference carrier, and a decision threshold beyond “more graphs compile”.
- Relation / noun-swap / disposition: `FRESH_SKETCH` / `PASS` / `KEEP_FOR_CONVERGENCE`.

### S107-03

- Engine / perspective: `CONSTRAINT_MANIPULATION` / `COMPILER_OR_BACKEND_ENGINEER`
- Starting anchor: Inductor lowering may impose alignment and divisibility constraints that are sufficient but not necessary for a quantized kernel's semantics.
- Intended source role: `CURRENT`.
- Idea sketch: Prove and implement a remainder decomposition that executes the aligned low-bit core plus a semantics-identical tail, preserving a single compiled graph and full fallback cost accounting. This only qualifies if a target-native public kernel has the required core/tail interface and current fallback is caused by an overly strong compiler-side condition.
- Conclusion-first test: The result would enlarge legal dynamic-shape coverage without changing quantization or model output, not simply choose a different block size.
- Counterfactual / risk: Existing generated kernels already mask tails, or a tail uses a different precision/semantic path and violates same-object comparison.
- Evidence needed: current compiler emitted-condition source, kernel contract, and exact LLM shape carrier.
- Relation / noun-swap / disposition: `FRESH_SKETCH` / `PASS` / `KEEP_FOR_CONVERGENCE`.

### S107-04

- Engine / perspective: `NEGATION_OR_INVERSION` / `MAINTAINER`
- Starting anchor: A fallback may be correct but its choice could silently invalidate a low-bit deployment cost claim.
- Intended source role: `CONTRARY`.
- Idea sketch: Construct a compiler-level contract checker that establishes whether a graph-break fallback preserves the declared quantized operator semantics, including scale/zero-point/layout and host synchronization cost. It is a tool contribution only if current validation cannot express this contract and a public native model path exposes a nontrivial mismatch class.
- Conclusion-first test: At most, it produces a falsifiable audit of fallback correctness/cost boundaries for a named compiler-runtime path.
- Counterfactual / risk: A generic graph-break logger, ordinary unit tests, or a custom reference checker are insufficient.
- Evidence needed: official fallback semantics, public lowerings, and actual carrier-level mismatch/ambiguity evidence.
- Relation / noun-swap / disposition: `FRESH_SKETCH` / `PASS` / `KEEP_FOR_CONVERGENCE`.

### S107-05

- Engine / perspective: `CONSTRAINT_MANIPULATION` / `HARDWARE_ARCHITECT`
- Starting anchor: CUDA graph capture requires stable launch and memory conditions while dynamic decode changes token/sequence metadata.
- Intended source role: `ESCAPE`.
- Idea sketch: Derive a compiler partition that preserves capture for the quantized compute island while retaining dynamic metadata outside the graph, with explicit synchronization and memory cost. It survives only if current upstream has a concrete all-or-nothing capture/fallback boundary not already addressed by `torch.compile` or inference runtimes.
- Conclusion-first test: A specific execution partition may retain capture under fixed output and SLO semantics; it must not just be a cache toggle or a generic CUDA graph recipe.
- Counterfactual / risk: The object shifts to runtime scheduling/KV management (other lane) or existing graph-break partitioning covers it.
- Evidence needed: current capture guards/source flags, low-bit LLM carrier, and same-object baseline.
- Relation / noun-swap / disposition: `FRESH_SKETCH` / `PASS` / `KEEP_FOR_CONVERGENCE`.

### S107-06

- Engine / perspective: `BISOCIATION_STRUCTURAL_TRANSFER` / `THEORIST`
- Starting anchor: Quantized layout validity behaves like a proof-carrying tensor property, whereas compiler guards are run-time predicates.
- Intended source role: `ANCHOR`.
- Idea sketch: Formulate a compact proof-carrying layout certificate consumed by lowering so that dynamic guards are discharged statically for a family of LLM linear calls. It is viable only if certificate generation has a public producer, checking has bounded overhead, and the approach is not equivalent to an existing dtype/layout dispatch key.
- Conclusion-first test: The modest claim is a sound reduction of redundant dynamic checks for a fixed target protocol, not a universal quantization representation.
- Counterfactual / risk: It becomes a generic metadata/cache-key wrapper or repackaging, especially if it introduces a new packed representation.
- Evidence needed: public layout metadata path, current guard semantics, and a counterexample to current dispatch.
- Relation / noun-swap / disposition: `FRESH_SKETCH` / `PASS` / `KEEP_FOR_CONVERGENCE`.

### S107-07

- Engine / perspective: `ABSTRACTION_LADDER` / `OPERATOR`
- Starting anchor: A compiler can select a fast kernel by static eligibility but users care about tail latency including compile and fallback behavior.
- Intended source role: `NATURAL_CARRIER`.
- Idea sketch: Identify a stable LLM serving regime where dynamic-shape compile/fallback events create a measurable tail-latency discontinuity, and formulate a target-native action with an explicit cost model. This is retained only if public trace/workload and current source identify an action beyond changing cache warm-up or batch policy.
- Conclusion-first test: A valid result would expose a stable compiler semantic boundary with a decision-relevant SLO consequence.
- Counterfactual / risk: Cold-start/SLO benchmark validity is assigned to S4; a pure measurement map is cross-lane overlap.
- Evidence needed: public serving carrier, source-level event cause, and a non-measurement atomic action.
- Relation / noun-swap / disposition: `FRESH_SKETCH` / `PASS` / `KEEP_FOR_CONVERGENCE`.

### S107-08

- Engine / perspective: `JANUSIAN_TENSION` / `COMPILER_OR_BACKEND_ENGINEER`
- Starting anchor: Eager fallback is broadly correct, while compiled low-bit kernels are fast but restricted; their coexistence may hide an actionable mixed-semantics boundary.
- Intended source role: `CONTRARY`.
- Idea sketch: For a public LLM linear operator, distinguish semantic restrictions from merely code-generation restrictions, then lower only the latter through a verified alternate path. This must preserve the exact quantization contract and include both compile and runtime cost; otherwise it is an ordinary alternative-kernel selector.
- Conclusion-first test: The contribution would be a source-grounded reclassification of one fallback boundary that unlocks a concrete same-function lowering.
- Counterfactual / risk: Current fallback may be mandated by unsupported semantics, or an alternate kernel changes accumulation/rounding behavior.
- Evidence needed: current source condition, kernel-specific semantics, and a public differential oracle/carrier.
- Relation / noun-swap / disposition: `FRESH_SKETCH` / `PASS` / `KEEP_FOR_CONVERGENCE`.

## Clustering and genealogy

| Cluster | Seed IDs | Shared object/mechanism | Material differences | Representative seed |
|---|---|---|---|---|
| guard legality | S107-01, S107-03, S107-08 | compiler fallback vs legal low-bit lowering | constraint encoding, tail decomposition, semantic reclassification | S107-03 |
| fallback contract | S107-04, S107-06 | dynamic dispatch/refinement semantics | checker vs certificate | S107-04 |
| capture/SLO boundary | S107-05, S107-07 | dynamic execution cost | compiler partition vs measurement/SLO | S107-05 |
| measurement frontier | S107-02 | semantic coverage map | characterization only | S107-02 |

## Coverage-constrained convergence

| Selected seed | Why preserved | Intended object/problem boundary | RQ Candidate ID |
|---|---|---|---|
| S107-03 | only explicit same-function low-bit tail transformation | Inductor/Triton legality guard versus core+tail lowering | RQ-S107-01 |
| S107-08 | distinguishes semantic from codegen restriction | exact public low-bit operator fallback | RQ-S107-02 |
| S107-04 | audit/tool contribution alternative | fallback semantic and full-cost contract | RQ-S107-03 |
| S107-05 | capture-specific compiler boundary | quantized compute island capture partition | RQ-S107-04 |
| S107-02 | measurement alternative, held distinct from action | native LLM dynamic-shape coverage estimand | RQ-S107-05 |
| S107-06 | formal representation alternative | layout certificate and guard discharge | RQ-S107-06 |

S107-01 is contained by S107-03, and S107-07 overlaps S4's frozen SLO/benchmark-validity surface; both stay backlog. No seed is a locator, raw, or novelty conclusion.

## Advisory

- Engines used: 6
- Perspective roles used: 6
- Largest object/surface share: compiler fallback legality (4/8)
- `DIVERGENCE_COVERAGE_ADVISORY`: `PASS`
- Plain-Chinese note: 先只保留“编译器错误地扩大 fallback”的可证伪边界；任何新格式、重打包、调参、通用 selector、纯 SLO 测量或跨 lane 的 KV/runtime 调度均在 RQ 前排除。
