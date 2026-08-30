# Source104 S6 Divergence Seed Pool

冻结 assignment `DISCOVERY-S6-20260824-SOURCE104-PUBLIC-CARRIER-DIVERSIFIED-V1` 的离线非证据性 seed pool。该池不构成 locator、raw、候选证据或新颖性/current-absence 声明；未读取并行 Rule Audit、Source103 临时判断或课题组仓库。

## Pool metadata

- Lane / profile: `DISCOVERY_S6` / `SOURCE104_PUBLIC_CARRIER_FIRST_DIVERSIFIED_LLM_VLA_V1`
- Seed ceiling: `8 / 12`; RQ candidate ceiling: `<=8`
- Network-security exclusion: `PASS`
- Exact public carrier frozen before any future optional group-repository access: `REQUIRED`
- Generation completed before evidence lookup: `YES`

## Seed records

### `S6-104-01`

- Engine / perspective: `PROBLEM_REFRAMING` / `COMPILER_OR_BACKEND_ENGINEER`
- Public carrier candidate: FlashInfer current ragged/paged attention implementation.
- Sketch: Treat an irregular request batch as a finite segment-partition action over a native ragged descriptor, not as a generic kernel selector. A valid residual must preserve attention semantics and account for descriptor, index, page, launch, and fallback costs.
- Conclusion-first test: A target-native segmentation algorithm changes a fixed public ragged kernel construction with a defined no-gain region.
- Risk: current FlashInfer scheduling/descriptors may already express the same action.
- Disposition: `KEEP_FOR_CONVERGENCE`

### `S6-104-02`

- Engine / perspective: `CONSTRAINT_MANIPULATION` / `OPERATOR`
- Public carrier candidate: CUTLASS grouped or mixed-input GEMM interfaces.
- Sketch: Hold grouped-GEMM output semantics fixed and vary only the irregular problem-size grouping constraint; test whether a bounded grouping/order construction has a target-specific complexity or full-cost delta. It is invalid if it becomes a generic batching heuristic.
- Conclusion-first test: One public grouped-GEMM carrier admits a nontrivial schedule construction under exact problem-array semantics.
- Risk: CUTLASS grouped GEMM already owns the atomic grouping/scheduling action.
- Disposition: `KEEP_FOR_CONVERGENCE`

### `S6-104-03`

- Engine / perspective: `JANUSIAN_TENSION` / `HARDWARE_ARCHITECT`
- Public carrier candidate: TorchAO current low-bit packing and kernel path.
- Sketch: A low-bit carrier may trade canonical packed format compatibility against tail-safe layout without changing quantization semantics. The contribution would require a new native remap action with metadata/full-cost accounting, not a renamed format or packing conversion.
- Conclusion-first test: A frozen TorchAO low-bit operator has a semantics-preserving tail representation whose benefit survives conversion and fallback costs.
- Risk: Source103 terminal QPack/QGroup/SegmentedScale identities may contain a format-only version.
- Disposition: `KEEP_FOR_CONVERGENCE`

### `S6-104-04`

- Engine / perspective: `BISOCIATION_STRUCTURAL_TRANSFER` / `THEORIST`
- Public carrier candidate: Triton current matmul/grouped program-id mapping.
- Sketch: Search for a compiler-native irregular tile-cover construction with a bounded guarantee for one generated kernel family. It must expose legality, information, and full-cost differences beyond standard tile grouping/autotuning.
- Conclusion-first test: A fixed Triton carrier admits an algorithmic action that is not a generic selector wrapper.
- Risk: standard `GROUP_M`/autotuning already absorbs it.
- Disposition: `KEEP_FOR_CONVERGENCE`

### `S6-104-05`

- Engine / perspective: `NEGATION_OR_INVERSION` / `MEASUREMENT_REVIEWER`
- Public carrier candidate: FlashInfer or TorchAO low-bit kernel dispatch.
- Sketch: Ask for a constructive *do-not-specialize* boundary that changes a native irregular-kernel decision while preserving semantics. A viable result must be a target-native decision algorithm with full-cost observables, not a threshold dashboard.
- Conclusion-first test: A falsifiable no-gain boundary improves one native decision and names the cases where it must defer.
- Risk: forbidden exact repeat of generic kernel selector.
- Disposition: `KEEP_FOR_CONVERGENCE`

### `S6-104-06`

- Engine / perspective: `COMPOSE_DECOMPOSE_SIMPLIFY` / `MAINTAINER`
- Public carrier candidate: FlashInfer JIT/runtime kernel composition.
- Sketch: Decompose a public irregular attention or GEMM path into semantic fragments, then compose only fragments with a shared native layout invariant. It is admissible only if the invariant changes the compiler construction problem rather than merely fusing known kernels.
- Conclusion-first test: A fixed carrier exposes an invariant-guided construction with a small legality witness.
- Risk: tool-first code generation or ordinary fusion.
- Disposition: `KEEP_FOR_CONVERGENCE`

### `S6-104-07`

- Engine / perspective: `ADJACENT_POSSIBLE_OR_BOUNDARY` / `END_USER`
- Public carrier candidate: FlashInfer prefill/decode transition with ragged sequence lengths.
- Sketch: Freeze a same-runtime transition and ask whether a compact state handoff can eliminate a representation rebuild without changing attention/linear output semantics. The object must include retention, invalidation, memory occupancy and fallback costs.
- Conclusion-first test: A target-native state-transition action is distinct from prefix/KV cache lifecycle policy.
- Risk: existing prefix/cache mechanisms or generic runtime reuse.
- Disposition: `KEEP_FOR_CONVERGENCE`

### `S6-104-08`

- Engine / perspective: `ABSTRACTION_LADDER` / `COMPILER_OR_BACKEND_ENGINEER`
- Public carrier candidate: CUTLASS + framework generated low-bit layout interface.
- Sketch: Move from a single kernel to a fixed framework-to-library contract, seeking an algorithm that selects a legal representation only when it can be consumed without hidden transposes/repacking. It must retain exact operator semantics and count cross-boundary conversions.
- Conclusion-first test: A compiler/library contract algorithm changes a defined representation decision with explicit full-cost boundaries.
- Risk: it may reduce to low-bit format renaming or existing layout propagation.
- Disposition: `KEEP_FOR_CONVERGENCE`

## Coverage-constrained convergence

| Selected seed | Carrier class | Primary RQ ID |
|---|---|---|
| S6-104-01 | FlashInfer ragged attention | S6-104-RQ01 |
| S6-104-02 | CUTLASS grouped GEMM | S6-104-RQ02 |
| S6-104-03 | TorchAO low-bit semantics | S6-104-RQ03 |
| S6-104-04 | Triton generated kernel mapping | S6-104-RQ04 |
| S6-104-08 | framework/library layout contract | S6-104-RQ05 |

S6-104-05/06/07 remain append-only non-evidence backlog and cannot replace a selected seed after evidence outcomes.
