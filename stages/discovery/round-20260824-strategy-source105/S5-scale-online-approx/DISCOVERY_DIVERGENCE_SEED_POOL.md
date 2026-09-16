# Discovery Divergence Seed Pool

本表为 Source105 S5 的非证据性创意池；在生成完成前没有外部检索、下载、构建、实验或资源动作。

## Pool metadata

- Assignment / lane: `DISCOVERY-S5-20260824-SOURCE105-PUBLIC-NDP-ROTATION-V1` / `DISCOVERY_S5`
- Frozen profile: `SOURCE105_PUBLIC_NDP_ACCELERATOR_ARTIFACT_ROTATION_V1`
- Seed ceiling / actual: `<=12 / 10`
- RQ candidate ceiling / selected: `<=8 / 7`
- Network-security exclusion: `PASS`
- Generation completed before evidence lookup: `YES`
- Group repository / A3 output: `FORBIDDEN__NOT_READ`

## Seed records

### `S5-105-01`

- Engine / perspective: `PROBLEM_REFRAMING` / `COMPILER_OR_BACKEND_ENGINEER`
- Anchor candidate: PowerInfer public CPU/GPU sparse-neuron execution source, version `TO_BE_FROZEN`.
- Idea: Maintain the source-defined GPU hot-neuron set under online prompt-distribution drift with bounded replacement cost, while retaining the same model, sparse activation predicate and numerical output boundary. The residual must be a specific incremental activation-residency action rather than generic CPU/GPU placement.
- Conclusion-first test: lower complete update plus transfer cost for one public PowerInfer carrier than recomputing its same legal hot-neuron plan.
- Risks / needed evidence: current PowerInfer may already train or update the predictor; need exact predictor/residency state and finite quality oracle.
- Disposition: `KEEP_FOR_CONVERGENCE`

### `S5-105-02`

- Engine / perspective: `CONSTRAINT_MANIPULATION` / `OPERATOR`
- Anchor candidate: PowerInfer public activation predictor and CPU/GPU sparse execution path.
- Idea: Separate an activation prediction miss from a residency miss and ask whether a small online uncertainty set can schedule CPU fallback only for ambiguous neurons, with a fixed exact-output or bounded-error contract. The candidate must charge prediction, synchronization and fallback work, not merely tune a confidence threshold.
- Conclusion-first test: a target-specific online uncertainty mechanism changes a legal fallback decision under a public trace/model family.
- Risks / needed evidence: generic selective-execution controller; source-defined miss/fallback action and comparable baseline.
- Disposition: `KEEP_FOR_CONVERGENCE`

### `S5-105-03`

- Engine / perspective: `BISOCIATION_STRUCTURAL_TRANSFER` / `HARDWARE_ARCHITECT`
- Anchor candidate: PowerInfer heterogeneous CPU/GPU neuron placement plus public LLM layer structure.
- Idea: Transfer dynamic graph vertex-cover recourse to a sparse neuron co-activation graph, but freeze the PowerInfer activation criterion and output contract. An incremental co-residency representation would be valid only if it changes source-defined CPU/GPU communication while avoiding a generic placement-policy restatement.
- Conclusion-first test: an explicitly bounded migration/co-activation action reduces communication under a named sparsity carrier and has a no-gain region.
- Risks / needed evidence: PowerInfer already groups/places neurons; generic graph partitioning kernel.
- Disposition: `KEEP_FOR_CONVERGENCE`

### `S5-105-04`

- Engine / perspective: `ABSTRACTION_LADDER` / `MAINTAINER`
- Anchor candidate: FlexGen public offloading runtime with weight, KV and activation placement.
- Idea: Reframe long-context offload as a runtime-specific state-version problem: preserve a fixed batch/token semantic contract while incrementally reconciling stale CPU/GPU placement metadata after one cache/weight policy change. The action must be native metadata reconciliation, not generic KV placement.
- Conclusion-first test: a public runtime can make a different same-semantic placement-metadata decision at lower full control cost.
- Risks / needed evidence: FlexGen may be static/offline and current work may absorb the state-management action.
- Disposition: `KEEP_FOR_CONVERGENCE`

### `S5-105-05`

- Engine / perspective: `COMPOSE_DECOMPOSE_SIMPLIFY` / `COMPILER_OR_BACKEND_ENGINEER`
- Anchor candidate: PowerInfer public sparse linear operator path.
- Idea: Decompose sparse inference into predictor evaluation, sparse gather, CPU compute, GPU compute and merge; seek a source-defined online batch decomposition that changes only the merge boundary under fixed sparse-selection semantics. It must account for all predictor and synchronization costs.
- Conclusion-first test: a nontrivial batch formation algorithm changes the full-cost throughput/latency decision for a fixed sparse operator carrier.
- Risks / needed evidence: scheduler-only wrapper, existing PowerInfer pipeline or no reproducible operator witness.
- Disposition: `KEEP_FOR_CONVERGENCE`

### `S5-105-06`

- Engine / perspective: `NEGATION_OR_INVERSION` / `MEASUREMENT_REVIEWER`
- Anchor candidate: PowerInfer current benchmark/artifact and one public CPU/GPU offload baseline.
- Idea: Invert the sparse-activation benefit claim: measure when predictor overhead, activation false positives and CPU-GPU synchronization erase the sparse execution gain, using a fixed trace/model layer estimand. This is a measurement mechanism only if it yields a stable decision threshold and not a dashboard.
- Conclusion-first test: a reproducible no-gain boundary changes whether a maintainer enables sparse heterogeneous execution.
- Risks / needed evidence: benchmark-only repackaging or missing public trace and full-cost denominator.
- Disposition: `KEEP_FOR_CONVERGENCE`

### `S5-105-07`

- Engine / perspective: `ADJACENT_POSSIBLE_OR_BOUNDARY` / `END_USER`
- Anchor candidate: public CPU/GPU LLM offload artifact with a pinned-memory transfer path.
- Idea: At a bounded PCIe/DRAM pressure event, choose source-defined sparse recomputation versus transfer for a specific activation state while preserving a frozen token/quality contract. The candidate must be different from generic KV placement and must expose a finite small witness.
- Conclusion-first test: a public carrier selects a distinct legal sparse state action at a measurable bandwidth breakpoint.
- Risks / needed evidence: resource-only carrier or broad I/O-aware recomputation literature absorbs the action.
- Disposition: `KEEP_FOR_CONVERGENCE`

### `S5-105-08`

- Engine / perspective: `JANUSIAN_TENSION` / `HARDWARE_ARCHITECT`
- Anchor candidate: public PowerInfer-2 or related heterogeneous sparse LLM implementation.
- Idea: Keep both high sparsity and conservative quality by representing a bounded set of uncertain neuron groups whose exact fallback is triggered only when source-defined predictor evidence is insufficient. The mechanism must be a group-state action, not a renamed confidence threshold.
- Conclusion-first test: the public sparse carrier obtains a quantifiable accuracy/latency Pareto condition with explicit uncertainty/fallback cost.
- Risks / needed evidence: current predictor already solves this or only a generic abstention controller remains.
- Disposition: `KEEP_FOR_CONVERGENCE`

### `S5-105-09`

- Engine / perspective: `BISOCIATION_STRUCTURAL_TRANSFER` / `OPERATOR`
- Anchor candidate: public heterogeneous-memory LLM serving artifact with CPU/GPU activation cache.
- Idea: Transfer online lossy-caching certificates to activation state: a state can be compressed/offloaded only with a carrier-specific certificate that guarantees a fixed downstream error/fallback condition. This requires a real artifact-level numerical boundary, not a theoretical cache policy.
- Conclusion-first test: a public runtime takes a different legal compression/offload action with all conversion and reconstruction costs charged.
- Risks / needed evidence: no native certificate/oracle and generic adaptive KV quantization collision.
- Disposition: `KEEP_FOR_CONVERGENCE`

### `S5-105-10`

- Engine / perspective: `CONSTRAINT_MANIPULATION` / `MAINTAINER`
- Anchor candidate: public sparse LLM inference artifact supporting CPU-only and CPU/GPU execution.
- Idea: Freeze a model and sparse execution predicate, then study whether an online state migration algorithm can preserve the same predicate under host-memory contention without changing model weights or approximation semantics. This is viable only with a source-defined mutable state action and public contention witness.
- Conclusion-first test: a bounded recourse action changes one reproducible runtime decision and exposes its no-gain region.
- Risks / needed evidence: generic placement and unavailable contention event.
- Disposition: `KEEP_FOR_CONVERGENCE`

## Convergence

| Cluster | Seeds | Representative | Selection |
|---|---|---|---|
| PowerInfer online sparse residency/fallback | 01, 02, 03, 05, 08 | S5-105-01 | 01, 02, 03, 05, 06 selected |
| heterogeneous memory reconciliation | 04, 07, 09, 10 | S5-105-07 | 04, 07 selected |

| Selected seed | Intended exact object / boundary | RQ candidate ID |
|---|---|---|
| S5-105-01 | PowerInfer hot-neuron residency update | S5-105-RQ01 |
| S5-105-02 | PowerInfer predictor/fallback action | S5-105-RQ02 |
| S5-105-03 | PowerInfer co-activation residency graph | S5-105-RQ03 |
| S5-105-04 | FlexGen placement metadata action | S5-105-RQ04 |
| S5-105-05 | PowerInfer sparse merge/batch action | S5-105-RQ05 |
| S5-105-06 | PowerInfer no-gain measurement estimand | S5-105-RQ06 |
| S5-105-07 | public sparse transfer/recompute action | S5-105-RQ07 |

## Append-only backlog

S5-105-08 (uncertain group may be generic controller), S5-105-09 (certificate/oracle unanchored), S5-105-10 (contention witness unanchored). These are not substituted after evidence lookup.

## Advisory

- `DIVERGENCE_COVERAGE_ADVISORY`: `PASS`; eight engines and six perspectives used.
- Plain-Chinese note: 本轮只把公开 PowerInfer/heterogeneous-memory artifact 作为潜在 carrier；任何既有 sparse execution、通用 placement 或 KV policy 都不会因改名重新进入。
