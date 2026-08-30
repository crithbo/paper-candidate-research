# Discovery Divergence Seed Pool

本表位于 Research Question Card 之前，只负责扩大创意召回。`SEED` 不是 locator、raw、C0、候选证据或新颖性声明；允许暂时缺少版本、current union 和 falsifier。seed 阶段不得联网、下载、构建或运行实验，必须在原 assignment 的模型与 wall-time 预算内完成。

## Pool metadata

- Assignment / lane: `DISCOVERY-S5-20260824-SOURCE103-LLM-VLA-STRATEGY-V1` / `DISCOVERY_S5`
- Frozen profile: `SOURCE103_USER_LLM_VLA_PUBLIC_SINGLE_GPU_CPU_FIRST_V1`
- Seed ceiling: `<=12`; actual: `10`
- RQ candidate ceiling after seed convergence: `<=8`; selected: `7`
- Network-security exclusion check: `PASS`
- Generation completed before evidence lookup: `YES`
- Group repository access: `FORBIDDEN__NOT_READ`

## Divergence coverage

引擎数量与覆盖只作 advisory，不设最低数；不得为了凑数制造 seed。

| Engine | Used | Seed IDs |
|---|---:|---|
| `BISOCIATION_STRUCTURAL_TRANSFER` | yes | S5-103-04, S5-103-10 |
| `PROBLEM_REFRAMING` | yes | S5-103-01, S5-103-07 |
| `CONSTRAINT_MANIPULATION` | yes | S5-103-02, S5-103-06 |
| `NEGATION_OR_INVERSION` | yes | S5-103-08 |
| `ABSTRACTION_LADDER` | yes | S5-103-03 |
| `ADJACENT_POSSIBLE_OR_BOUNDARY` | yes | S5-103-05 |
| `JANUSIAN_TENSION` | yes | S5-103-09 |
| `COMPOSE_DECOMPOSE_SIMPLIFY` | yes | S5-103-02, S5-103-06 |

## Seed records

### `S5-103-01`

- Engine: `PROBLEM_REFRAMING`
- Perspective role: `COMPILER_OR_BACKEND_ENGINEER`
- Starting anchor or hunch: public edge inference runtime with delegate/back-end partitioning, such as ExecuTorch.
- Exact public anchor candidate and version/date if already known: ExecuTorch backend/delegate partitioning documentation and current source; version `TO_BE_FROZEN`.
- Intended source role: `ANCHOR`
- Two-sentence idea sketch: Treat an edge graph partition as an online recourse problem after a delegated segment becomes infeasible under a changing thermal/latency envelope, while preserving the same graph-level fallback semantics. The candidate contribution is not a new backend selection heuristic but a bounded-recourse partition repair that limits recompilation, host-device transfers and fallback boundary churn.
- Conclusion-first test: If successful, the cautious claim is that a specified public runtime can preserve its existing fallback semantics while meeting a stated online envelope with lower complete recourse cost than full repartitioning; this matters to edge deployment operators.
- Exact structural mapping, tension or manipulated constraint: Replace offline whole-graph partitioning with repeated, small admissible edits under fixed operator coverage and fallback rules.
- Counterfactual consequence if the idea were true: a runtime would choose a different legal partition/fallback plan after a constraint change.
- Likely generic/current-union/changed-object risk: existing partitioner cache, profile-guided delegate selection, or a controller-only restatement.
- Evidence needed before it can become a locator: exact runtime ownership of partition repair, current delegate/fallback semantics, and a finite output-equivalence oracle.
- Relation to existing seed/family: `FRESH_SKETCH`
- Generic-shell noun-swap test: `PASS`
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`

### `S5-103-02`

- Engine: `CONSTRAINT_MANIPULATION`
- Perspective role: `OPERATOR`
- Starting anchor or hunch: public mobile/edge runtime executing a quantized LLM or VLM over CPU plus accelerator fallback.
- Exact public anchor candidate and version/date if already known: ExecuTorch or MLC LLM public heterogeneous backend path; version `TO_BE_FROZEN`.
- Intended source role: `ANCHOR`
- Two-sentence idea sketch: A fixed quantized graph can offer several semantically valid backend cuts, but the best cut changes as accelerator availability, memory pressure and decode length change. Search for a data structure that maintains a small Pareto frontier of legal cuts and updates it incrementally instead of re-solving a whole placement problem or silently changing numeric semantics.
- Conclusion-first test: If successful, the cautious claim is a lower-cost online maintenance algorithm for a fixed set of legal heterogeneous inference cuts, with explicit no-gain regions; this matters where backend fallback is frequent.
- Exact structural mapping, tension or manipulated constraint: Maintain a dynamic feasible-cut frontier under local capacity/availability edits, while holding quantization and fallback contracts fixed.
- Counterfactual consequence if the idea were true: a deployment would switch legal cut points with less control and data-movement cost.
- Likely generic/current-union/changed-object risk: generic dynamic shortest path, ordinary device scheduler, or backend API composition.
- Evidence needed before it can become a locator: exact cut semantics, current runtime placement representation, and a defined full-cost denominator.
- Relation to existing seed/family: `FRESH_SKETCH`
- Generic-shell noun-swap test: `PASS`
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`

### `S5-103-03`

- Engine: `ABSTRACTION_LADDER`
- Perspective role: `MAINTAINER`
- Starting anchor or hunch: public long-context inference runtime with paged KV-cache blocks.
- Exact public anchor candidate and version/date if already known: vLLM paged-attention/KV-cache implementation and current configuration surface; version `TO_BE_FROZEN`.
- Intended source role: `ANCHOR`
- Two-sentence idea sketch: Reframe eviction from a token-ranking controller into an online representation-maintenance problem: when a cache block changes precision or residency, preserve a fixed per-block attention-error contract and update only dependent metadata. The mechanism would be a bounded-error hierarchical block representation with explicit conversion, metadata and transfer accounting.
- Conclusion-first test: If successful, the cautious claim is an online cache-state maintenance structure that attains a stated memory/error/recourse trade-off for a concrete KV-cache implementation, not a general claim about all long-context models.
- Exact structural mapping, tension or manipulated constraint: Replace static precision tiers with bounded local representation changes as context grows.
- Counterfactual consequence if the idea were true: a serving runtime could retain a different legal cache representation under the same error budget.
- Likely generic/current-union/changed-object risk: existing KV quantization, cache eviction policy, or a changed attention approximation contract.
- Evidence needed before it can become a locator: exact cache block invariants, numeric error interface, current quantized-KV union and a local witness.
- Relation to existing seed/family: `FRESH_SKETCH`
- Generic-shell noun-swap test: `PASS`
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`

### `S5-103-04`

- Engine: `BISOCIATION_STRUCTURAL_TRANSFER`
- Perspective role: `HARDWARE_ARCHITECT`
- Starting anchor or hunch: public VLA inference stack with temporally adjacent visual observations and action decoding.
- Exact public anchor candidate and version/date if already known: an open VLA runtime/model implementation, candidate `OpenVLA`; version `TO_BE_FROZEN`.
- Intended source role: `ANCHOR`
- Two-sentence idea sketch: Borrow incremental view-maintenance structure rather than generic frame skipping: maintain a bounded set of visual-token state deltas whose reuse is allowed only when a frozen action-interface error predicate holds. The work would ask whether an online hierarchical reuse representation can reduce repeated vision-prefix work while retaining a stated action-quality contract and accounting for change-detection cost.
- Conclusion-first test: If successful, the cautious claim is a concrete VLA-state reuse mechanism for one public carrier with an explicit failure detector and no-gain motion region; this matters for edge latency and power.
- Exact structural mapping, tension or manipulated constraint: Database delta propagation maps to visual-token state deltas; VLA action safety/quality supplies the immutable validity predicate.
- Counterfactual consequence if the idea were true: the same VLA carrier would perform fewer full visual-prefix computations on eligible adjacent observations.
- Likely generic/current-union/changed-object risk: direct coverage by SpecVLA-like speculation, ordinary feature caching, or non-equivalent action outputs.
- Evidence needed before it can become a locator: exact public carrier, direct-comparison map against speculative VLA work, and a fixed validity/error oracle.
- Relation to existing seed/family: `FRESH_SKETCH`
- Generic-shell noun-swap test: `PASS`
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`

### `S5-103-05`

- Engine: `ADJACENT_POSSIBLE_OR_BOUNDARY`
- Perspective role: `END_USER`
- Starting anchor or hunch: public edge VLM/VLA execution where cold start and thermal throttling create a transition boundary.
- Exact public anchor candidate and version/date if already known: open runtime deployment of a compact VLM/VLA model on public mobile GPU/CPU backend; carrier `TO_BE_FROZEN`.
- Intended source role: `ANCHOR`
- Two-sentence idea sketch: Instead of optimizing steady-state latency, model cold-to-warm transition as an online mode-change problem with a limited number of model-state, backend and cache actions. Seek a fixed-quality policy class whose mechanism is reuse of legally warmed artifacts without treating warmed state as free.
- Conclusion-first test: If successful, the cautious claim is a full-cost transition model and online recourse action for a concrete edge carrier, showing when warm-state reuse changes a real deployment decision.
- Exact structural mapping, tension or manipulated constraint: Cold-start state is a scarce, expiring resource rather than an omitted benchmark precondition.
- Counterfactual consequence if the idea were true: a deployment would choose a different admissible warmup or fallback action before a request.
- Likely generic/current-union/changed-object risk: standard caching/prefetching, unmeasurable thermal claims, or lack of a natural carrier.
- Evidence needed before it can become a locator: an open carrier with documented warm-state semantics and public reproducible trace or simulator route.
- Relation to existing seed/family: `FRESH_SKETCH`
- Generic-shell noun-swap test: `PASS`
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`

### `S5-103-06`

- Engine: `COMPOSE_DECOMPOSE_SIMPLIFY`
- Perspective role: `COMPILER_OR_BACKEND_ENGINEER`
- Starting anchor or hunch: public graph compiler/runtime with mixed CPU/GPU/NPU partitions and shape-specialized plans.
- Exact public anchor candidate and version/date if already known: Apache TVM or ExecuTorch graph partition/cache subsystem; version `TO_BE_FROZEN`.
- Intended source role: `ANCHOR`
- Two-sentence idea sketch: Decompose plan-cache invalidation into shape-class changes versus backend-feasibility changes, and investigate an incremental certificate for reusing the legal part of a compiled heterogeneous plan. The proposed residual is a particular incremental compilation/dispatch action, not a generic cache key.
- Conclusion-first test: If successful, the cautious claim is that a public heterogeneous compiler can preserve a specified compilation and semantic contract while avoiding recomputation after one class of local invalidation.
- Exact structural mapping, tension or manipulated constraint: Separate invalidation causes that current systems may collapse into whole-plan invalidation.
- Counterfactual consequence if the idea were true: an executor/compiler would reuse a larger legally valid subplan after a known update.
- Likely generic/current-union/changed-object risk: existing compilation cache, generic incremental build, or no native plan identity.
- Evidence needed before it can become a locator: current cache key/invalidation symbols, compiler plan identity and a finite semantic equivalence check.
- Relation to existing seed/family: `FRESH_SKETCH`
- Generic-shell noun-swap test: `PASS`
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`

### `S5-103-07`

- Engine: `PROBLEM_REFRAMING`
- Perspective role: `OPERATOR`
- Starting anchor or hunch: public long-context serving runtime with prefix/KV cache admission.
- Exact public anchor candidate and version/date if already known: vLLM prefix-cache/KV-cache configuration surface; version `TO_BE_FROZEN`.
- Intended source role: `ANCHOR`
- Two-sentence idea sketch: Make admission explicitly online and revocable: retain a prefix only if a prediction interval for reuse and the complete memory-transfer cost pass a fixed criterion, then permit bounded recourse when the interval fails. The candidate is a robust admission representation with a falsifiable no-reuse region, not a popularity predictor.
- Conclusion-first test: If successful, the cautious claim is a robust online admission/recourse algorithm for a concrete prefix-cache carrier that improves a full-cost SLO criterion under a named workload family.
- Exact structural mapping, tension or manipulated constraint: Prefix hits are uncertain arrivals; cache actions must pay explicit recourse and transfer costs.
- Counterfactual consequence if the idea were true: the runtime would admit, retain or revoke different prefixes under the same capacity.
- Likely generic/current-union/changed-object risk: existing prefix caching, ordinary caching theory, or S4 SLO-controller overlap.
- Evidence needed before it can become a locator: exact current admission mechanics, public trace/carrier, and a target-specific decision consequence.
- Relation to existing seed/family: `FRESH_SKETCH`
- Generic-shell noun-swap test: `PASS`
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`

### `S5-103-08`

- Engine: `NEGATION_OR_INVERSION`
- Perspective role: `MEASUREMENT_REVIEWER`
- Starting anchor or hunch: public edge inference benchmark reporting steady-state throughput but not online fallback cost.
- Exact public anchor candidate and version/date if already known: MLPerf Tiny or an open mobile inference benchmark suite; version `TO_BE_FROZEN`.
- Intended source role: `ANCHOR`
- Two-sentence idea sketch: Invert the usual “average speedup” question: under what online availability/thermal changes does a benchmark ranking reverse once delegate initialization, fallback, conversion and cache reset are charged? The candidate contribution is a stable, reproducible ranking-reversal estimand with a decision threshold, not a benchmark dashboard.
- Conclusion-first test: If successful, the cautious claim is a benchmark-validity or measurement mechanism result for a canonical edge carrier; it would not claim natural fleet-wide deployment behavior.
- Exact structural mapping, tension or manipulated constraint: Treat the omitted transition costs as a causal condition for rank stability.
- Counterfactual consequence if the idea were true: a maintainer would choose a different backend or benchmark interpretation.
- Likely generic/current-union/changed-object risk: unsupported telemetry, an arbitrary metric, or merely adding columns to a benchmark.
- Evidence needed before it can become a locator: fixed estimand, public artifact with transition hooks, and a held-out falsifier.
- Relation to existing seed/family: `FRESH_SKETCH`
- Generic-shell noun-swap test: `PASS`
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`

### `S5-103-09`

- Engine: `JANUSIAN_TENSION`
- Perspective role: `MAINTAINER`
- Starting anchor or hunch: public VLA or multimodal runtime that needs temporal reuse but must surface uncertainty/fallback.
- Exact public anchor candidate and version/date if already known: open multimodal model runtime with public video/image preprocessing path; carrier `TO_BE_FROZEN`.
- Intended source role: `ANCHOR`
- Two-sentence idea sketch: Preserve both reuse and conservatism by making approximation debt explicit: a temporal token may be reused only together with a compact certificate that triggers recomputation before a frozen action/score margin is crossed. The potential mechanism is online certificate maintenance, not a learned confidence threshold alone.
- Conclusion-first test: If successful, the cautious claim is an implementable reuse-and-recompute interface for one public multimodal carrier, exposing a bounded failure region rather than claiming generic VLA safety.
- Exact structural mapping, tension or manipulated constraint: Reuse saves work while a certificate carries the obligation to recompute under uncertainty.
- Counterfactual consequence if the idea were true: the runtime would make an earlier, evidence-auditable recompute decision on some inputs.
- Likely generic/current-union/changed-object risk: a generic uncertainty controller, unavailable action labels, or direct speculative-decoding coverage.
- Evidence needed before it can become a locator: public native state/action boundary, certificate oracle and direct-coverage comparison.
- Relation to existing seed/family: `FRESH_SKETCH`
- Generic-shell noun-swap test: `PASS`
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`

### `S5-103-10`

- Engine: `BISOCIATION_STRUCTURAL_TRANSFER`
- Perspective role: `HARDWARE_ARCHITECT`
- Starting anchor or hunch: public heterogeneous long-context inference stack whose KV blocks may move across memory tiers.
- Exact public anchor candidate and version/date if already known: vLLM or another public long-context runtime with CPU/GPU offload; version `TO_BE_FROZEN`.
- Intended source role: `ANCHOR`
- Two-sentence idea sketch: Transfer online bin-packing with recourse to tiered KV block placement, but retain runtime-specific sequence, attention and DMA legality constraints. The residual would be an incremental placement representation that trades migration count, transfer bytes and a fixed latency/quality contract against an explicitly named no-gain region.
- Conclusion-first test: If successful, the cautious claim is a runtime-specific dynamic KV placement algorithm with full migration and metadata cost, rather than an abstract cache policy result.
- Exact structural mapping, tension or manipulated constraint: Memory-tier placement maps to bins; block migration is bounded recourse; runtime legality constrains which blocks can move.
- Counterfactual consequence if the idea were true: the runtime would choose a different legal tier placement after context growth or capacity change.
- Likely generic/current-union/changed-object risk: current offload manager, ordinary paging, or an unavailable multi-tier hardware assumption.
- Evidence needed before it can become a locator: a single-GPU/CPU carrier, source-defined placement actions and a full-cost local witness.
- Relation to existing seed/family: `FRESH_SKETCH`
- Generic-shell noun-swap test: `PASS`
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`

## Clustering and genealogy

| Cluster | Seed IDs | Shared object/mechanism | Material differences | Representative seed |
|---|---|---|---|---|
| heterogeneous online plan recourse | S5-103-01, S5-103-02, S5-103-06 | backend partition/plan maintenance | runtime fallback vs feasible-cut frontier vs compiler invalidation | S5-103-01 |
| long-context online memory representation | S5-103-03, S5-103-07, S5-103-10 | KV/prefix state under growth | precision representation vs admission recourse vs tier placement | S5-103-03 |
| VLA edge state reuse | S5-103-04, S5-103-09 | temporal visual-token reuse | delta representation vs certificate-maintained recomputation | S5-103-04 |
| transition-cost measurement | S5-103-05, S5-103-08 | cold/thermal/fallback transition | runtime action vs benchmark validity | S5-103-08 |

## Coverage-constrained convergence

不得使用可补偿总分或强制 Top-N。若可查证 seed 多于 RQ ceiling，先冻结选择，再进入 Research Question 收敛；优先保留在对象、机制、贡献类型、证据载体和反证路线中至少一项非支配的组合。这里不直接生成 locator，也不得开始外部证据检索。

| Selected seed | Why this preserves portfolio coverage | Intended object/problem boundary | RQ Candidate ID |
|---|---|---|---|
| S5-103-01 | public edge runtime; online partition repair | one runtime's delegate/fallback semantics | S5-103-RQ01 |
| S5-103-02 | dynamic data-structure route distinct from compiler-cache route | fixed legal heterogeneous cuts | S5-103-RQ02 |
| S5-103-03 | long-context representation/approximation route | one public paged KV cache | S5-103-RQ03 |
| S5-103-04 | VLA temporal-state reuse route | one public VLA action interface | S5-103-RQ04 |
| S5-103-07 | online cache-admission decision route | one public prefix-cache carrier | S5-103-RQ07 |
| S5-103-08 | measurement-characterization route | canonical edge benchmark transition estimand | S5-103-RQ08 |
| S5-103-10 | CPU/single-GPU tier-placement route | source-defined KV placement action | S5-103-RQ10 |

## Append-only backlog

未被选 seed 保留为非证据性 backlog；只有出现新的公开证据、对象变化或后续 assignment 明确重开时，才可再次进入 convergence。不能把 backlog 数量当召回率、论文机会数或 precision 分母。

| Seed | Backlog reason |
|---|---|
| S5-103-05 | Carrier and natural reproducible transition route are less concrete than selected measurement seed. |
| S5-103-06 | Overlaps selected S5-103-01/02 until a source-defined plan identity distinguishes it. |
| S5-103-09 | Overlaps S5-103-04 and has higher direct-coverage risk. |

## Advisory

- Engines used: `8/8`
- Perspective roles used: `END_USER / OPERATOR / MAINTAINER / COMPILER_OR_BACKEND_ENGINEER / HARDWARE_ARCHITECT / MEASUREMENT_REVIEWER`
- Largest object/surface share: public edge/long-context runtime, `3/10` KV/prefix seeds
- `DIVERGENCE_COVERAGE_ADVISORY`: `PASS`
- Plain-Chinese note: 本轮先保留不同对象、机制和可反证路线；所有 seed 均只是待核验草图，尚未形成新颖性或论文质量结论。
