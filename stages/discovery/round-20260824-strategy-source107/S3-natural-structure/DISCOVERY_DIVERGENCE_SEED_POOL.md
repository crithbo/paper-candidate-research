# Source107 S3 离线发散 Seed Pool

本池在一切外部检索、下载、资源动作和科学判断之前冻结；所有条目均为非证据性假设。

## Pool metadata

- Assignment / lane: `DISCOVERY-S3-20260824-SOURCE107-SINGLE-GPU-LLM-SOFTWARE-V1` / `DISCOVERY_S3`
- Seed ceiling: `<=12`; 本池: `6`
- Generation completed before evidence lookup: `YES`
- CRFEPOCH Stage0/chat and group repository: not read.

## Seed records

### `S3-107-01`

- Engine / perspective: `BISOCIATION_STRUCTURAL_TRANSFER` / `RUNTIME_OR_MEMORY_ENGINEER`
- Hunch: A public MoE model may exhibit a stable within-sequence expert-transition structure that supports a target runtime prefetch/placement construction with fixed router semantics.
- Anchor candidate: Versioned open MoE model plus public router-log/trace or reproducible routing carrier.
- Action boundary: Preserve exact router top-k, fallback, output and all transfer/prefetch costs; do not propose generic expert caching.
- Falsifier: Current runtime/prefetch mechanism already expresses the same transition-aware action, or no public routing carrier exists.
- Generic-shell test / disposition: `PASS` / `KEEP_FOR_CONVERGENCE`

### `S3-107-02`

- Engine / perspective: `CONSTRAINT_MANIPULATION` / `COMPILER_OR_BACKEND_ENGINEER`
- Hunch: Expert-batch shape sequences may create nonuniform tile occupancy that a target-specific grouped-GEMM construction can exploit without changing routing semantics.
- Anchor candidate: Open MoE model graph, current grouped-MoE kernel, and public routing/shape trace.
- Action boundary: Fixed grouped-GEMM tile/layout construction with exact expert output and full padding/metadata cost; not a generic kernel selector.
- Falsifier: Current kernel already covers the tile action or natural trace does not reveal the shape structure.
- Generic-shell test / disposition: `PASS` / `KEEP_FOR_CONVERGENCE`

### `S3-107-03`

- Engine / perspective: `JANUSIAN_TENSION` / `MEASUREMENT_REVIEWER`
- Hunch: Aggregate expert-load balance may hide a transition/run-length law that changes one single-GPU offload or residency conclusion.
- Anchor candidate: Public MoE routing trace and an open single-GPU offload/runtime artifact.
- Action boundary: A measurement or estimator must change a declared residency/memory decision, include transfer and prediction costs, and avoid generic cache policy.
- Falsifier: Existing trace-aware MoE systems already measure the same law or the law does not change the endpoint.
- Generic-shell test / disposition: `PASS` / `KEEP_FOR_CONVERGENCE`

### `S3-107-04`

- Engine / perspective: `ABSTRACTION_LADDER` / `SYSTEM_ARCHITECT`
- Hunch: A public MoE's shared-expert versus routed-expert structure may enable a target memory layout that reduces command/metadata pressure under the native model contract.
- Anchor candidate: Versioned open MoE configuration plus public kernel/runtime source.
- Action boundary: Same shared/routed expert semantics and complete routing/layout costs; no renamed expert placement heuristic.
- Falsifier: Current fused-MoE path already maps the structure or action is ordinary packing.
- Generic-shell test / disposition: `PASS` / `KEEP_FOR_CONVERGENCE`

### `S3-107-05`

- Engine / perspective: `NEGATION_OR_INVERSION` / `MEASUREMENT_REVIEWER`
- Hunch: A public MoE benchmark may preserve average expert load but omit sequence-level routing structure, changing a fixed runtime ranking.
- Anchor candidate: Public MoE benchmark/specification with trace or replay mechanism.
- Action boundary: Must identify an exact omitted structural panel and a held-out conclusion-changing test; not a broad “more realistic MoE benchmark” claim.
- Falsifier: Benchmark already records/reruns routing sequence or ranking is unchanged.
- Generic-shell test / disposition: `PASS` / `KEEP_FOR_CONVERGENCE`

### `S3-107-06`

- Engine / perspective: `COMPOSE_DECOMPOSE_SIMPLIFY` / `THEORIST`
- Hunch: Expert routing history might define a bounded canonical state for a target mapping guarantee, if an explicit information contract excludes unobservable future routes.
- Anchor candidate: Public router trace/model artifact and an open target runtime interface.
- Action boundary: Needs a formal non-product construction/checker and fixed guarantee; cannot be a generic predictor.
- Falsifier: No public trace reveals the needed state, or existing routing/prefetch formulation contains it.
- Generic-shell test / disposition: `PASS` / `KEEP_FOR_CONVERGENCE`

## Coverage-constrained convergence

Selection was frozen before evidence lookup.

| Selected seed | Intended action family | RQ Candidate ID |
|---|---|---|
| S3-107-01 | transition-aware target prefetch/placement | S3-107-RQ01 |
| S3-107-02 | expert-batch tile/layout construction | S3-107-RQ02 |
| S3-107-05 | routing-sequence benchmark validity | S3-107-RQ03 |

## Advisory

- Engines used: 6
- `DIVERGENCE_COVERAGE_ADVISORY`: `PASS`
- Plain-Chinese note: 核心问题不是“缓存专家”，而是公开 route sequence 是否能支持可反驳的 target action；缺少 routing carrier 时只会停在 locator，不伪造自然结构。
