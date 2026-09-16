# Source103 S5 Question Cards and Ordinary Source Closure

## Scope and method

- Assignment: `DISCOVERY-S5-20260824-SOURCE103-LLM-VLA-STRATEGY-V1`
- Lane / viewpoint: `DISCOVERY_S5` / fixed-object scale, online, approximation and data-structure failure
- Closure mode: `DISCOVERY_RQ_FRONTEND_MODE=PRODUCTION`; ordinary `TERRA_HIGH_ORDINARY`; selective depth `OFF`
- Claim-pack / quality mode: `OFF / OFF`
- Search date: `2026-08-24`
- Group repository: `FORBIDDEN__NOT_READ`
- Resource actions: none; no download, copy, build, environment creation, cache or temporary project resource was made.
- Global identity preflight: `registry.yaml` was queried for `EXECUTORCH`, `OPENVLA`, `VLA-CACHE`, `MLPERF TINY`, and `KV CACHE`. It contains no five-field `EXACT` or `TERMINAL_CONTAINS` match for these Source103 sketches; a historical ExecuTorch entry is explicitly `RESIDUAL_UNCLOSED`, so it is not inherited as a terminal decision.

The following primary/current and contrary sources were checked after the seed pool and RQ cards were frozen. URLs are evidence locators; their role is stated per card.

- ExecuTorch current architecture and export/delegation: https://github.com/pytorch/executorch and https://github.com/pytorch/executorch/blob/main/docs/source/getting-started-architecture.md
- ExecuTorch current lowering tutorial: https://github.com/pytorch/executorch/blob/main/docs/source/llm/export-custom-llm.md
- vLLM current KV offload: https://github.com/vllm-project/vllm/blob/main/docs/features/kv_offloading_usage.md
- vLLM current quantized KV cache: https://github.com/vllm-project/vllm/blob/main/docs/features/quantization/quantized_kvcache.md
- vLLM current hybrid KV cache manager: https://github.com/vllm-project/vllm/blob/main/docs/design/hybrid_kv_cache_manager.md
- MLPerf Tiny current repository and rules: https://github.com/mlcommons/tiny and https://github.com/mlcommons/tiny/blob/master/benchmark/MLPerfTiny_Rules.adoc
- OpenVLA current source: https://github.com/openvla/openvla and https://github.com/openvla/openvla/blob/main/prismatic/models/vlas/openvla.py
- Current/recent contrary VLA routes: https://arxiv.org/abs/2502.02175, https://arxiv.org/abs/2507.22424, https://arxiv.org/abs/2608.15636
- Current/recent contrary KV routes: https://arxiv.org/abs/2604.04722, https://arxiv.org/abs/2502.15075, https://arxiv.org/abs/2508.13231

## `S5-103-QC01` — ExecuTorch online partition repair

- RQ candidate: `S5-103-RQ01`
- Exact public identity: `pytorch/executorch` current AOT export, partition and serialized `.pte` program path.
- Carrier kind: `IMPLEMENTATION_CARRIER_ONLY`
- Research contract proposed before closure: same runtime graph/fallback semantics; local online partition repair after a feasibility change.
- Current-source loci: ExecuTorch’s repository describes an `Export → Compile → Execute` AOT sequence; the architecture documentation places backend delegation during Edge-to-Backend lowering, then serializes a program for the minimal runtime. The current tutorial uses `to_edge_transform_and_lower` with a backend partitioner during export/lowering.
- Contrary/current reality: a current project discussion states that CPU fallback cannot be added at runtime after export because the model has already been converted to delegate-specific IR. This is consistent with the documented AOT carrier.
- Global identity relation: `NO_MATCH` (not a novelty claim).
- Minimum falsifier: a native runtime API that repairs a partition or fallback boundary after deployment while retaining the same `.pte` object.
- Closure result: `EARLY_FATAL`.
- Front-end disposition: `EXCLUDED_BEFORE_RAW`.
- Reason: the seed’s proposed online runtime action is not part of the frozen native object; replacing AOT lowering with deployment-time repartition would change the object and evidence carrier. This is a same-object/action failure, not a resource conclusion.

## `S5-103-QC02` — dynamic legal heterogeneous-cut frontier

- RQ candidate: `S5-103-RQ02`
- Exact public identity: same ExecuTorch AOT delegate-partition carrier.
- Carrier kind: `IMPLEMENTATION_CARRIER_ONLY`
- Research contract proposed before closure: maintain a dynamic frontier of legal CPU/accelerator cuts under a local availability update, without changing fallback or quantization semantics.
- Current-source loci: current ExecuTorch material defines partitioners as graph-lowering components that tag/lower export-time subgraphs to delegates, while the runtime executes the already serialized program.
- Strongest contrary explanation: the purported frontier is either export-time partitioner output or an external device scheduler; neither is the requested online native runtime action.
- Global identity relation: `NO_MATCH` (not a novelty claim).
- Minimum falsifier: two or more source-defined deployment-time legal-cut states plus a native transition action.
- Closure result: `EARLY_FATAL`.
- Front-end disposition: `EXCLUDED_BEFORE_RAW`.
- Reason: the finite closure packet fixed the object to an already AOT-lowered program; no same-object deployment-time cut-maintenance action survived. Generalizing to an external scheduler would violate the object contract.

## `S5-103-QC03` — online hierarchical KV representation

- RQ candidate: `S5-103-RQ03`
- Exact public identity: `vllm-project/vllm` current paged/hybrid KV-cache and FP8 KV configuration surfaces.
- Carrier kind: `IMPLEMENTATION_CARRIER_ONLY`
- Research contract proposed before closure: dynamic block-level representation changes under a fixed numerical-error/full-cost contract.
- Current-source loci: current vLLM documents per-tensor and per-head FP8 KV schemes, dataset/no-calibration pathways and layer-level skip configuration. Its cache configuration is selected through runtime configuration; the hybrid manager documents native block allocation, cache-hit intersection and LRU eviction for cache groups.
- Contrary/current and literature evidence: recent work already supplies adaptive/mixed-precision KV quantization routes, including dynamic token-level bit allocation and adaptive key/value precision. These sources do not prove exact vLLM integration, but remove any claim that precision adaptation itself is a non-generic discriminator.
- Global identity relation: `NO_MATCH` (not a novelty claim).
- Minimum falsifier: a source-defined vLLM block-representation transition action and one immutable numerical error oracle that distinguish a runtime-specific residual from adaptive KV quantization generally.
- Closure result: `UNRESOLVED_BACKLOG`.
- Front-end disposition: `LOCATOR_ONLY`.
- Reason: the exact representation-update action and fixed error interface were not established; the remaining story is currently generic adaptive KV quantization rather than a source-supported vLLM-specific atomic action. No scientific DROP/STOP is inferred.

## `S5-103-QC04` — temporal visual-token delta reuse for OpenVLA

- RQ candidate: `S5-103-RQ04`
- Exact public identity: `openvla/openvla` current `OpenVLA.predict_action(image, instruction, ...)` path, which encodes an image and generates/de-tokenizes action tokens.
- Carrier kind: `NATURAL`
- Research contract proposed before closure: use a temporal visual-token delta representation with a validity predicate to reduce repeated visual-prefix computation without changing the OpenVLA action-quality contract.
- Current-source loci: current OpenVLA source exposes the image-to-action method and action-token decode boundary. The repository supplies public inference and simulation evaluation material, but no source-defined state reuse action was assumed before closure.
- Direct contrary coverage: VLA-Cache explicitly compares each visual input with the preceding one, selects minimally changed visual tokens and reuses their KV computations to accelerate VLA action prediction. It reports OpenVLA evaluation. FlashVLA similarly couples visual-token selection with action reuse, while current Spec-VLA/SpecVLA give further direct VLA inference acceleration baselines.
- Five-field relation to VLA-Cache: object `EXACT` (OpenVLA VLA inference carrier); action `EXACT` (cross-frame visual-token/KV reuse); endpoint `EXACT` (lower inference work/latency with action-quality boundary); semantic guarantee `RELATED_ONLY` (different stated predicate); full-cost `RELATED_ONLY`.
- Minimum falsifier: a non-token-reuse native action that still uses the same carrier and action contract.
- Closure result: `EARLY_FATAL`.
- Front-end disposition: `EXCLUDED_BEFORE_RAW`.
- Reason: the seed’s claimed mechanism is directly covered at its core action. Adding a certificate label without a different source-supported action would be a wrapper/refinement, not a new opportunity family.

## `S5-103-QC07` — robust prefix-cache admission and recourse

- RQ candidate: `S5-103-RQ07`
- Exact public identity: vLLM current automatic prefix caching and hybrid KV-cache manager.
- Carrier kind: `NATURAL`
- Research contract proposed before closure: a target-native admission/revocation action with full memory-transfer cost and a public workload route.
- Current-source loci: the current cache manager maps full blocks by hash/group, computes cache-hit prefixes and uses an LRU queue for cache groups. vLLM’s current offload guide exposes built-in LRU/ARC policies and custom `CachePolicy` injection for offload tiers.
- Contrary/current evidence: current design already exposes eviction behavior; a current RFC proposes waiting-queue-informed LRU, and Marconi supplies a direct admission-policy line. These do not make every new policy fatal, but they make a generic “robust admission” label insufficient.
- Global identity relation: `NO_MATCH` (not a novelty claim).
- Minimum falsifier: one source-defined prefix admission/retention action, a target-specific non-generic mechanism beyond cache-policy replacement, and a public workload whose decision changes under the full-cost denominator.
- Closure result: `UNRESOLVED_BACKLOG`.
- Front-end disposition: `LOCATOR_ONLY`.
- Reason: current sources establish cache matching and eviction but not the frozen target-native admission action or a non-generic residual. The candidate cannot enter raw yet; this is neither a scientific STOP nor a resource blocker.

## `S5-103-QC08` — transition-cost ranking reversal in MLPerf Tiny

- RQ candidate: `S5-103-RQ08`
- Exact public identity: `mlcommons/tiny` current MLPerf Tiny benchmark and rules.
- Carrier kind: `CANONICAL_BENCHMARK_ONLY`
- Research contract proposed before closure: a pre-registered transition-cost estimand producing a reproducible ranking reversal that changes backend choice.
- Current-source loci: MLPerf Tiny is a microcontroller-oriented suite with versioned releases and rules defining a system under test, performance and quality. Its tutorial/rules cover performance, accuracy and energy execution, not a fixed accelerator availability, thermal transition or fallback event.
- Strongest contrary explanation: adding arbitrary cold-start/fallback columns would be benchmark extension/reporting, not a measurement mechanism with a fixed causal carrier and held-out falsifier.
- Global identity relation: `NO_MATCH` (not a novelty claim).
- Minimum falsifier: one benchmark-defined transition event plus a frozen ranking function and independent held-out condition.
- Closure result: `UNRESOLVED_BACKLOG`.
- Front-end disposition: `LOCATOR_ONLY`.
- Reason: a canonical benchmark is available, but the proposed estimand and decision threshold are not anchored in its current semantics. No natural deployment conclusion is claimed.

## `S5-103-QC10` — runtime-constrained multi-tier KV placement

- RQ candidate: `S5-103-RQ10`
- Exact public identity: vLLM current CPU/tiered KV offload connector.
- Carrier kind: `NATURAL`
- Research contract proposed before closure: CPU/single-GPU placement/migration under context growth with explicit transfer and metadata cost.
- Current-source loci: the current vLLM offload guide supports CPU offload and `TieringOffloadingSpec`, with a CPU primary tier, secondary tiers, ordered lookup, configurable block/chunk size, built-in LRU/ARC and custom cache policies. GPU↔secondary transfers are explicitly staged through the CPU primary tier.
- Direct contrary/current and literature evidence: current vLLM already exposes multi-tier placement and policy extension; published work covers multi-tier dynamic KV storage and dynamic KV placement. The seed’s proposed “bin packing with recourse” had no additional runtime-specific action or guarantee beyond this union.
- Five-field relation: object `EXACT`; action `RELATED_ONLY` at best because no tighter new action was defined; endpoint `RELATED_ONLY`; semantic guarantee `RELATED_ONLY`; full-cost `RELATED_ONLY`.
- Minimum falsifier: a vLLM-specific non-policy action that cannot be expressed by the current tiering configuration/custom policy interface.
- Closure result: `EARLY_FATAL`.
- Front-end disposition: `EXCLUDED_BEFORE_RAW`.
- Reason: the only stated residual is a generic placement/policy kernel atop a current multi-tier, policy-extensible carrier. The seed has no non-generic discriminator and cannot be repaired without changing the claim package.

## Funnel and source-role telemetry

| Funnel unit | Count | Notes |
|---|---:|---|
| Non-evidence seed | 10 | complete before lookup |
| RQ candidate | 7 | all selected from frozen seed convergence |
| PRE_RQ closure packet | 7 | ordinary closure only; selective depth OFF |
| `EVIDENCE_QUALIFIED_RAW` | 0 | no card met all raw fields |
| Deep review | 0 | none eligible |
| Clean Stage 0 brief | 0 | zero is valid |
| `EXCLUDED_BEFORE_RAW` | 4 | QC01, QC02, QC04, QC10 |
| `LOCATOR_ONLY` | 3 | QC03, QC07, QC08 |

| Source role | Core result |
|---|---|
| `ANCHOR` | public current runtime/benchmark/VLA carriers were found for all seven selected RQs |
| `CURRENT` | ExecuTorch AOT semantics, vLLM current KV union and OpenVLA action source were checked |
| `CONTRARY` | VLA-Cache, current Spec-VLA/SpecVLA, vLLM policy/tiering and adaptive-KV routes closed or narrowed the candidates |
| `ESCAPE` | dynamic KV quantization/placement and VLA acceleration searches found adjacent/direct mechanisms; no new family was created from them |

## Closure conclusion

`COMPLETE_ZERO_PROPOSALS__FOUR_EARLY_FATAL_OR_GENERIC_CURRENT_UNION__THREE_LOCATOR_ONLY_UNFROZEN`.

No resource or transport failure occurred, and no scientific inference is made from the absence of a clean brief. The three `LOCATOR_ONLY` items may only re-enter under a future frozen assignment with a different, explicit same-object atomic action and finite closure route; this assignment must not backfill them after observing results.
