# Source103 S1 — 离线非证据 Seed Pool

本池在公开检索、下载、构建或实验之前冻结。课题组仓库 allowlist 只提供定位与资源对齐线索；下列条目不主张任何当前缺口、新颖性、性能或论文质量。

## Pool metadata

- Assignment / lane: `DISCOVERY-S1-20260824-SOURCE103-LLM-VLA-STRATEGY-V1` / `DISCOVERY_S1`
- Frozen profile: `SOURCE103_USER_LLM_VLA_PUBLIC_SINGLE_GPU_CPU_FIRST_V1`
- Seed ceiling: `<=12`；本池：`8`
- RQ candidate ceiling after seed convergence: `<=8`
- Network-security exclusion check: `PASS`
- Generation completed before evidence lookup: `YES`
- Group-repository role: `LOCATOR_AND_RESOURCE_ALIGNMENT_ONLY__NOT_CANDIDATE_EVIDENCE`

## Divergence coverage

| Engine | Used | Seed IDs |
|---|---:|---|
| `BISOCIATION_STRUCTURAL_TRANSFER` | yes | S1-103-03, S1-103-07 |
| `PROBLEM_REFRAMING` | yes | S1-103-01, S1-103-06 |
| `CONSTRAINT_MANIPULATION` | yes | S1-103-02, S1-103-04 |
| `NEGATION_OR_INVERSION` | yes | S1-103-05 |
| `ABSTRACTION_LADDER` | yes | S1-103-08 |
| `ADJACENT_POSSIBLE_OR_BOUNDARY` | no | — |
| `JANUSIAN_TENSION` | no | — |
| `COMPOSE_DECOMPOSE_SIMPLIFY` | yes | S1-103-04, S1-103-06 |

## Seed records

### `S1-103-01`

- Engine: `PROBLEM_REFRAMING`
- Perspective role: `COMPILER_OR_BACKEND_ENGINEER`
- Starting anchor or hunch: a low-bit weight format can be represented in an IR while target lowering chooses a different dequantization or accumulation boundary.
- Exact public anchor candidate and version/date if already known: MLIR quantization representations plus a public W4A16 inference runtime/backend source locus, version to be frozen later.
- Intended source role: `ANCHOR`
- Two-sentence idea sketch: Treat the object as a compiler-level contract from packed W4 weights and activation type to an operator-boundary result, not as a kernel speedup. Ask whether a target-aware lowering action preserves that contract while changing the legal placement of unpack, scale, zero-point, and accumulation.
- Conclusion-first test: The cautious conclusion would be a bounded semantics-preserving lowering action with an explicit cost boundary, not generic W4A16 support.
- Exact structural mapping, tension or manipulated constraint: high-level quantized IR contract versus backend native operand/accumulator constraints.
- Counterfactual consequence if the idea were true: compiler authors could choose a legal lowering plan instead of treating format conversion as opaque backend detail.
- Likely generic/current-union/changed-object risk: current quantization legalization or kernel-selection passes may already cover the same action.
- Evidence needed before it can become a locator: one exact public IR contract, one current backend locus, and a falsifier separating lowering action from wrapper conversion.
- Relation to existing seed/family: `FRESH_SKETCH`
- Generic-shell noun-swap test: `PASS`
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`

### `S1-103-02`

- Engine: `CONSTRAINT_MANIPULATION`
- Perspective role: `HARDWARE_ARCHITECT`
- Starting anchor or hunch: K-dimension tiling can alter where partial sums are widened, merged, or requantized when a low-bit operator is mapped to GPU/NDP tiles.
- Exact public anchor candidate and version/date if already known: a public W4A16 GEMM/GEMV operator specification and one target-lowering implementation.
- Intended source role: `ANCHOR`
- Two-sentence idea sketch: Freeze same input/output semantics and vary only the legal K-tile partition and partial-sum merge action. The question is whether a target-specific merge construction avoids semantic drift and has a nontrivial full-cost trade-off, not whether more tiling is faster.
- Conclusion-first test: The narrow claim would be a correctness-constrained tile/merge algorithm for a fixed quantized operator and target model.
- Exact structural mapping, tension or manipulated constraint: finite accumulator range and rounding boundary versus independent GPU/NDP tile scheduling.
- Counterfactual consequence if the idea were true: lowering could select tile schedules without silently changing saturation or rounding outcomes.
- Likely generic/current-union/changed-object risk: conventional split-K reductions, mixed-precision accumulation, or existing quantized kernels may absorb it.
- Evidence needed before it can become a locator: exact arithmetic contract, native target constraint, and a smallest counterexample to naive split-K equivalence.
- Relation to existing seed/family: `FRESH_SKETCH`
- Generic-shell noun-swap test: `PASS`
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`

### `S1-103-03`

- Engine: `BISOCIATION_STRUCTURAL_TRANSFER`
- Perspective role: `COMPILER_OR_BACKEND_ENGINEER`
- Starting anchor or hunch: layout/address remapping can be viewed as typed ownership transfer for quantization groups rather than as byte-address arithmetic alone.
- Exact public anchor candidate and version/date if already known: public packed-quantization layout definitions and a public target memory-layout/lowering source locus.
- Intended source role: `ANCHOR`
- Two-sentence idea sketch: A groupwise scale/zero-point record owns a precise set of packed weights; a layout remap that splits or joins tiles may invalidate that ownership mapping even if element addresses remain legal. The candidate action is a compiler-side quantization-group remap construction coupled to layout transformation, with no claim that the frozen group repository has a bug.
- Conclusion-first test: At most, this could yield a typed legality construction for preserving groupwise quantization semantics across a target layout change.
- Exact structural mapping, tension or manipulated constraint: group metadata ownership versus physical tile/address remapping.
- Counterfactual consequence if the idea were true: a backend could reject or repair only remaps that cross frozen quantization-group boundaries.
- Likely generic/current-union/changed-object risk: standard layout propagation, format packing, or generic metadata remapping may already express the action.
- Evidence needed before it can become a locator: one exact groupwise format, one target layout action, and a counterexample where address legality does not imply quantization-group legality.
- Relation to existing seed/family: `FRESH_SKETCH`
- Generic-shell noun-swap test: `PASS`
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`

### `S1-103-04`

- Engine: `COMPOSE_DECOMPOSE_SIMPLIFY`
- Perspective role: `OPERATOR`
- Starting anchor or hunch: a backend may combine unpack, dequantization, matrix product, bias/residual, and requantization across a fusion boundary with a different observable rounding contract.
- Exact public anchor candidate and version/date if already known: a public compiler fusion pass and public quantized operator semantics.
- Intended source role: `ANCHOR`
- Two-sentence idea sketch: Decompose a fused low-bit path into the minimal operations that determine rounding, saturation, and output type, then ask which fusions are legal under the original contract. The potential contribution must change a target-native fusion decision, not become a generic checker.
- Conclusion-first test: A successful result would only establish a semantics-preserving fusion decision with a bounded no-gain region and explicit metadata/launch cost.
- Exact structural mapping, tension or manipulated constraint: performance motivation for fusion versus an observable intermediate quantization boundary.
- Counterfactual consequence if the idea were true: compilers could avoid target-specific fusions whose mathematical reassociation changes the fixed endpoint.
- Likely generic/current-union/changed-object risk: quantization-aware fusion, graph rewrite legality, or a prescribed operator spec can make the residual empty.
- Evidence needed before it can become a locator: one public fusion action, exact endpoint semantics, and a smallest witness separating it from ordinary pattern matching.
- Relation to existing seed/family: `FRESH_SKETCH`
- Generic-shell noun-swap test: `PASS`
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`

### `S1-103-05`

- Engine: `NEGATION_OR_INVERSION`
- Perspective role: `MAINTAINER`
- Starting anchor or hunch: shape-tail or alignment fallback can be treated as the normal path whose semantic contract must equal the fast path.
- Exact public anchor candidate and version/date if already known: a public W4A16 kernel/runtime with documented alignment or shape fallbacks.
- Intended source role: `CURRENT`
- Two-sentence idea sketch: Freeze the operator result and force shapes that select fallback or mixed fast/slow execution. The candidate is a target-aware lowering/fallback selection action preserving the same packed-weight and quantization-group semantics across the boundary.
- Conclusion-first test: The cautious result would be a verified fallback-selection residual only if current implementations do not already guarantee it.
- Exact structural mapping, tension or manipulated constraint: fast-path alignment assumptions versus general-shape endpoint equivalence.
- Counterfactual consequence if the idea were true: a compiler/runtime could make a different decision for tail tiles while maintaining the fixed output contract.
- Likely generic/current-union/changed-object risk: current kernels may handle tails correctly, or any residual may reduce to configuration testing.
- Evidence needed before it can become a locator: current source/default-and-nondefault flag check, one exact tail shape, and a native comparator.
- Relation to existing seed/family: `FRESH_SKETCH`
- Generic-shell noun-swap test: `PASS`
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`

### `S1-103-06`

- Engine: `PROBLEM_REFRAMING`
- Perspective role: `OPERATOR`
- Starting anchor or hunch: decode GEMV and prefill GEMM may share packed weights but expose different legal information and reduction structure.
- Exact public anchor candidate and version/date if already known: a public LLM runtime with separate decode and prefill low-bit paths.
- Intended source role: `ANCHOR`
- Two-sentence idea sketch: Treat common packed weights as a shared object and ask whether one compiler representation can select different target actions for GEMV and GEMM without silently changing quantization semantics. The contribution must survive subtraction of ordinary kernel specialization.
- Conclusion-first test: A positive outcome would be a same-format, different-information lowering construction with an explicit semantic witness.
- Exact structural mapping, tension or manipulated constraint: shared W4 metadata versus distinct reduction/parallelism structures for decode and prefill.
- Counterfactual consequence if the idea were true: runtime/compiler plans could preserve one logical format contract while using different legal implementation routes.
- Likely generic/current-union/changed-object risk: separate GEMV/GEMM kernels or existing format abstraction may fully cover it.
- Evidence needed before it can become a locator: one public runtime anchor exposing both paths, exact shared-format semantics, and a non-generic decision consequence.
- Relation to existing seed/family: `FRESH_SKETCH`
- Generic-shell noun-swap test: `PASS`
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`

### `S1-103-07`

- Engine: `BISOCIATION_STRUCTURAL_TRANSFER`
- Perspective role: `HARDWARE_ARCHITECT`
- Starting anchor or hunch: cross-slice reduction can be modeled as a distributed numeric type conversion, not only a communication schedule.
- Exact public anchor candidate and version/date if already known: a public NDP/PIM execution model or simulator plus an exact quantized reduction contract.
- Intended source role: `ANCHOR`
- Two-sentence idea sketch: Each slice locally produces partial values with a known precision and inter-slice transport/reduction chooses a representation boundary. The candidate mechanism jointly decides transport representation and final quantization while charging metadata/control traffic.
- Conclusion-first test: The narrow outcome would be a same-object cross-slice numeric/transport action with an explicit approximation or bit-exact guarantee.
- Exact structural mapping, tension or manipulated constraint: local accumulator precision versus inter-slice bandwidth and final quantized endpoint.
- Counterfactual consequence if the idea were true: a mapping system could choose when to quantize or widen based on a semantics-bearing communication contract.
- Likely generic/current-union/changed-object risk: collective algorithms, quantized all-reduce, or simulator-specific controls may absorb it.
- Evidence needed before it can become a locator: one public NDP carrier, a defined reduction endpoint, a fairness baseline, and a small legality witness.
- Relation to existing seed/family: `FRESH_SKETCH`
- Generic-shell noun-swap test: `PASS`
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`

### `S1-103-08`

- Engine: `ABSTRACTION_LADDER`
- Perspective role: `THEORIST`
- Starting anchor or hunch: low-bit compiler lowering can be abstracted as choosing a representation-transition graph with semantic and full-cost labels.
- Exact public anchor candidate and version/date if already known: a public compiler IR/lowering framework and a public low-bit operator specification.
- Intended source role: `ESCAPE`
- Two-sentence idea sketch: Move above individual kernels and ask whether representation transitions (packed weights, expanded fragments, widened accumulators, requantized outputs) admit a finite target-constrained Pareto construction. Descend again only when a transition has a concrete target action and a bit-exact or bounded-error contract.
- Conclusion-first test: A viable result would be a non-generic target-constrained optimization formulation, not a generic format-conversion wrapper.
- Exact structural mapping, tension or manipulated constraint: representation-state legality and exact endpoint guarantee versus conversion/memory/launch cost.
- Counterfactual consequence if the idea were true: a compiler could explain and optimize legal representation transitions instead of applying fixed lowering recipes.
- Likely generic/current-union/changed-object risk: existing e-graph, instruction selection, cost-model, or conversion-graph methods may fully absorb it.
- Evidence needed before it can become a locator: a target-specific state/action definition and a minimal instance where generic selection cannot express guarantee/cost coupling.
- Relation to existing seed/family: `FRESH_SKETCH`
- Generic-shell noun-swap test: `PASS`
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`

## Clustering and genealogy

| Cluster | Seed IDs | Shared object/mechanism | Material differences | Representative seed |
|---|---|---|---|---|
| A | 01, 02, 04 | quantized operator contract across compiler lowering | lowering boundary, K merge, fusion | 01 |
| B | 03, 07, 08 | representation/metadata ownership across layout and transport | layout group map, distributed reduction, transition optimization | 03 |
| C | 05, 06 | runtime path boundary | tail fallback, decode/prefill information distinction | 06 |

## Coverage-constrained convergence

No seed is yet a locator. Each is retained because it differs in atomic action, carrier, or endpoint; evidence results may not be used to add replacement seeds.

| Selected seed | Why this preserves portfolio coverage | Intended object/problem boundary | RQ Candidate ID |
|---|---|---|---|
| S1-103-01 | compiler semantic-contract action | fixed W4A16 contract to backend lowering | RQ-S1-103-01 |
| S1-103-02 | K-tile numeric-merge action | fixed quantized GEMM/GEMV operator | RQ-S1-103-02 |
| S1-103-03 | layout/group-ownership action | groupwise metadata under target layout transform | RQ-S1-103-03 |
| S1-103-04 | fusion-legality action | quantized fusion endpoint semantics | RQ-S1-103-04 |
| S1-103-05 | fallback-equivalence action | tail/alignment runtime path | RQ-S1-103-05 |
| S1-103-06 | decode/prefill information distinction | one packed format across GEMV/GEMM | RQ-S1-103-06 |
| S1-103-07 | NDP reduction-representation action | cross-slice quantized reduction | RQ-S1-103-07 |
| S1-103-08 | representation-transition optimization | target-constrained lowering graph | RQ-S1-103-08 |

## Append-only backlog

None. Eight non-dominated seeds equal the frozen RQ candidate ceiling.

## Advisory

- Engines used: `6/8`; coverage is advisory, not a quota.
- Perspective roles used: compiler/backend engineer, hardware architect, operator, maintainer, theorist.
- Largest object/surface share: quantized LLM operator semantics across lowering and target mapping.
- `DIVERGENCE_COVERAGE_ADVISORY`: `PASS`
- Plain-Chinese note: 每个 seed 都保留“可能只是已有 kernel、通用 layout、普通 fallback 或 checker”的反例风险；后续核验优先尝试淘汰这些故事。
