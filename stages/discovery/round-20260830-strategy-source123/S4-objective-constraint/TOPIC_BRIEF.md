# SOURCE123-S4-VLLM-CUDAGRAPH-CAPTURESET Budgeted CUDA-Graph Capture-Set Selection for Finite-Horizon vLLM Serving

## 中文摘要

- 研究机会：vLLM v0.28.0 对 CUDA Graph capture size 使用固定密集默认集合并允许手工覆盖；dispatcher 会把未命中的 token batch 向上 padding 或退回 eager。候选研究是在相同模型与请求语义下，根据结果无关的校准 trace，在启动时间和 graph 显存预算内选择 capture-size 子集。
- 为什么可能值得做：官方源码和文档明确承认 CUDA Graph 带来的启动、显存与运行性能张力；上游 lazy-capture RFC 也记录默认 67 个 graph 可能有大量未使用。该决定直接影响短生命周期、单 GPU serving 的 full-cost。
- 为什么保留：有 exact current carrier、可执行原子动作、自然/规范 carrier、具名强基线和有限 falsifier；bounded search 未发现 current vLLM 已集成同一预算化 selector。
- 主要风险：lazy RFC 已预见减少/延迟 capture；Foundry 以离线模板恢复几乎消除 capture cold start；数学核容易塌缩为通用 ordered segmentation。只有 target-native cost/constraints 与 held-out frontier 均成立才够 Q2。
- 下一步：独立 Stage 0 重建 exact-tag current union、Foundry/Medusa 与 generic-kernel subtractor，并判断剩余贡献是否足以进入资源受限 Stage A preclaim。

- Status: `PROPOSE_STAGE0`
- Quality tier: `TIER_B_Q2_VIABLE`（条件性，不代表结果已成立）
- Opportunity origins: `O4`
- Domain tags: `LLM_INFERENCE_RUNTIME, COMPILER_TOOL, CUDA_GRAPH, SINGLE_GPU, FULL_COST, COLD_START`
- Contribution route: `N2`，N3 仅可由后续 held-out 稳定规律支持
- Discovery date: `2026-08-30`
- Discovery method revision: `RESEARCH_TOPIC_DISCOVERY_R1_R40_20260815`
- Discovery claim-pack mode: `OFF`
- Discovery RQ frontend mode/revision: `PRODUCTION / RQ_REFINEMENT_STAGED_EVIDENCE_V1`
- Opportunity family ID: `OF-SOURCE123-S4-VLLM-CG-CAPTURESET`
- Contribution type: `COMPILER_TOOL`
- Local audit coordinates: `A3_RQ_AND_ACTION_FROZEN / C2_SEARCH_BOUNDED_OPEN / D2_CONDITIONAL / EB_RESOURCE_BLOCKED`
- Discovery divergence seed: `S4-123-SEED-01 / DISCOVERY_DIVERGENCE_SEED_POOL.md`
- Discovery RQ candidate: `S4-123-RQ01 / DISCOVERY_RQ_CANDIDATE.md`
- Discovery question card: `S4-123-QC01 / DISCOVERY_QUESTION_CARD.md`
- Front-end disposition: `EVIDENCE_QUALIFIED_RAW`
- Carrier kind: `NATURAL` for BurstGPT; otherwise `CANONICAL_BENCHMARK_ONLY`

## Research question

For current vLLM V1 single-GPU serving, can a result-independent, target-native selection of CUDA Graph capture sizes improve the finite-horizon latency-throughput frontier under joint graph-memory and capture/startup-cost constraints, compared with the current default capture-size portfolio, while preserving identical request and output semantics?

## Canonical research claim package

- Exact object: vLLM `v0.28.0` (`2cf0a69` short release commit), `CompilationConfig.cudagraph_capture_sizes` and native `CudagraphDispatcher` on one GPU.
- Natural/canonical scenario: held-out BurstGPT timed trace; ShareGPT/deterministic random official benchmark as bounded canonical panels.
- Observed problem anchor: current source uses a fixed dense pattern and warns that large graph sets increase startup time and memory; official memory docs recommend fewer sizes.
- Intervention and atomic action: before serving, use a frozen calibration trace and native per-size costs to select an ordered capture-size subset under fixed startup and graph-memory budgets; do not alter runtime dispatch or model semantics.
- Mechanism: fewer keys reduce eager capture and graph memory, while strategically placed sizes bound upward-padding and eager-fallback service cost. vLLM mode/LoRA/speculation constraints determine which keys are legal and how costs multiply.
- Information condition: calibration trace only; held-out requests and results unavailable at selection time.
- Fair comparator: exact upstream default, official small manual set, eager mode, equal-budget frequency/top-k, faithful lazy baseline if implementable, Foundry under separately matched assumptions, and exhaustive small oracle ceiling.
- Expected effect: a non-dominated finite-horizon frontier in startup time, graph memory, TTFT/TPOT/P99 and throughput; no numerical gain is claimed in Discovery.
- Full-cost: profiler/selector overhead, capture/warmup/server-ready wall, peak/resident graph memory, graph count, request metrics, padding/fallback counts, failures/OOM and exact amortization horizon.
- Boundary/no-gain region: long-lived saturated services may amortize the default capture cost; Foundry-enabled deployments may remove startup pressure; highly variable traces may favor dense/lazy sets; small sets may lose on padding/fallback.
- Minimum falsifier: current default/manual baseline is Pareto-undominated on the frozen held-out panel, or all residual benefit collapses to generic tuning/segmentation.
- Dependencies/claim ceiling: exact-tag current-union audit and a Linux/CUDA vLLM environment are unresolved; ceiling is a conditional Tier-B tool hypothesis.
- Contribution-type closure: the action and source locus are clear; target-specific non-generic residual and empirical frontier remain decisive Stage 0/A gates.

## Paper genealogy and current collision

- Current anchor/source: https://github.com/vllm-project/vllm/blob/v0.28.0/vllm/config/compilation.py
- Current dispatcher: https://github.com/vllm-project/vllm/blob/main/vllm/v1/cudagraph_dispatcher.py
- Official design/memory docs: https://github.com/vllm-project/vllm/blob/main/docs/design/cuda_graphs.md and https://github.com/vllm-project/vllm/blob/main/docs/configuration/conserving_memory.md
- Direct subtractor: vLLM lazy-capture RFC #20098, https://github.com/vllm-project/vllm/issues/20098
- Strong subtractor: Foundry, https://arxiv.org/abs/2604.06664
- Method adjacent: CUDA Graph batching cost modeling, https://arxiv.org/abs/2501.09398
- Canonical carrier: https://docs.vllm.ai/en/stable/benchmarking/cli/
- Search boundary: 24 official-source search/open calls; `SEARCH_BOUNDED_OPEN`, never a global-first claim.

### Collision classification

- `DIRECT_FATAL`: none found within the frozen bound.
- `DIRECT_SUBTRACT`: lazy RFC removes the broad “unused eager graphs” novelty; Foundry removes broad “CUDA Graph capture dominates cold start” novelty and is a conditional stronger baseline.
- `METHODOLOGICAL_ADJACENT`: generic ordered facility/segmentation, graph batching models, manual capture-set tuning.
- `DEPLOYMENT_BASELINE`: vLLM default/manual/eager; Foundry when its offline archive assumptions are available.
- `SEARCH_BOUNDED_OPEN`: exact current integrated budgeted selector not found within 24 calls.

## Named fair baselines

1. vLLM v0.28.0 exact default.
2. Official `[1,2,4,8,16]` manual memory-saving set.
3. `enforce_eager`.
4. Equal-budget frequency/top-k selector.
5. Faithful lazy capture if frozen before results.
6. Foundry under matched offline/storage assumptions or as a conditional ceiling.
7. Exhaustive subset oracle for the small witness.

## Mechanism, alternative explanation and signature

- Preferred mechanism: key-set sparsification reduces capture and memory cost while an ordered target-aware placement controls padding/fallback loss.
- Strongest alternative: the default heuristic is already near-optimal, and any gain is trace-specific knob tuning; Foundry makes the startup term irrelevant.
- Signature: benefits must increase when finite horizons are shorter or memory budgets tighter, while padding/fallback loss follows held-out descriptor mass between selected sizes. Gains that do not track these quantities falsify the mechanism.

## Seed-distance and software admissibility

- Relative to upstream: replaces fixed/manual size lists with a frozen, budgeted selection action, not a new CUDA Graph mode.
- Relative to lazy RFC: chooses a full eager portfolio under explicit full-cost budgets rather than lazily capturing first-seen shapes.
- Relative to Foundry: uses no offline graph archive or deterministic-address restoration; it reduces the set rather than reconstructing all sizes.
- Method-name deletion test: “Choose a finite set of executable shape specializations under setup/memory budgets and asymmetric fallback loss for a finite service horizon.” This is clear but generic-looking; target-specific constraints and held-out evidence are mandatory.
- Same-function contract: identical model outputs, request semantics and native dispatch.
- Algorithmic delta: target-native cost model plus ordered subset selection; ordinary DP alone is insufficient.
- No-gain region: long horizons, unconstrained memory, stable high utilization, or materialized graph restoration.

## Decisive falsifier and 72-hour first evidence

1. Static Stage 0 audit the exact v0.28.0 dispatcher/tag and all related flags/PRs for an equivalent optimizer.
2. Freeze a `1..64` native descriptor witness and per-size cost schema; verify candidate selection against exhaustive subsets under two budgets without running natural claims.
3. If authorized resources exist, run one held-out canonical panel with exact default/manual/eager/frequency/candidate/oracle contracts. Any denominator drift invalidates the panel.

## Current upstream reality check

- Commit/tag/date: `v0.28.0`, release short commit `2cf0a69`, checked 2026-08-30.
- Official docs/source: `vllm/config/compilation.py`, `vllm/v1/cudagraph_dispatcher.py`, CUDA Graph design and conserving-memory docs.
- Flags/config checked: `cudagraph_capture_sizes`, `max_cudagraph_capture_size`, `cudagraph_mode`, `cudagraph_num_of_warmups`, `cudagraph_specialize_lora`, `enforce_eager`, plus default/manual paths.
- Supporting absence-within-bound: fixed heuristic and manual override found; no integrated constrained selector found.
- Contrary evidence: lazy RFC, manual reduction guidance, Foundry and method-adjacent optimization; all subtract broad claims.
- Exact-tag caveat: the v0.28.0 dispatcher open suffered a connector error, while main-current dispatcher was read. Stage 0 must close this exact-tag source debt.

## Fidelity closure plan

- Status: `RESOURCE_BLOCKED_FIDELITY_GAP`.
- Complete atomic action: produce one capture-size list from frozen calibration input and budgets, then pass it unchanged to native vLLM.
- Real comparator/native semantics: exact v0.28.0 server, dispatcher, benchmark and output checks.
- Common denominator: same model/device/backend/trace/sampling and complete startup-memory-service costs.
- Small witness: token-batch sizes 1–64 with exact upward-padding/fallback mapping and exhaustive subset oracle.
- Finite closure: exact-tag audit → instrumentation/control producer → oracle equivalence → held-out canonical/natural panel.
- Structural failure: equivalent current optimizer, changed semantics, missing same-object baseline, generic-only residual or full-cost reversal.
- Resource boundary: current policy does not authorize assuming Linux/WSL vLLM CUDA execution; Stage A requires a separately frozen compatible environment or honest blocker/reserve routing.

## Q1/Q2 sufficiency hypothesis

- Q2: possible if the integrated profiler/selector survives generic and current-union subtraction and yields reproducible held-out frontier gains across multiple models/budgets.
- Q1: not yet supported; would require a stable cross-platform law, stronger baselines, broader panels and upstream-quality integration.
- Stage B needs: broader GPUs/models/traces, Foundry/lazy comparison where feasible, robustness/statistics and artifact release.

## Non-relaxable quality audit

- Same-object: frozen.
- Latest collision: bounded current source plus 2026 Foundry; exact tag dispatcher debt explicit.
- Strong fair baselines: named, including current default and strongest conditional system.
- Natural/canonical evidence: BurstGPT/official benchmark route; no result claimed.
- Full-cost: complete initial ledger specified.
- Reproducibility: exact versions, hashes, splits, commands and raw metrics required downstream.
- Evidence honesty: no build, experiment, performance result, global novelty or Stage 0 self-verdict.

