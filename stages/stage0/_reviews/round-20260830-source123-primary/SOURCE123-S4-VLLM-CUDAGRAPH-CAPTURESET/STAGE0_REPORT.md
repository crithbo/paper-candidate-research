# SOURCE123-S4-VLLM-CUDAGRAPH-CAPTURESET Stage 0 Report

## 中文摘要

- 结论：`PASS_RECOMMENDED`，质量档为 `TIER_B_Q2_VIABLE`，不是 Q1。这里的 PASS 是“若冻结假设成立，则论文形状值得进入下一门”，不是性能结论。
- 为什么：vLLM v0.28.0 已提供固定/手工 capture-size portfolio、`performance_mode=interactivity` 的首方细粒度 heuristic、native upward-padding/eager fallback dispatcher、LoRA/spec-decode/mode legality；Lazy RFC、Medusa、Foundry 与 TensorRT-LLM 已覆盖 unused-graph 动机、延迟 capture、graph materialization 及 batch-size/memory/startup tradeoff，通用数学核也接近一维 facility location/ordered segmentation。它们没有在同一 vLLM V1 exact object 上，用结果无关 calibration trace 在 startup+graph-memory 双预算下自动选择 portfolio，并以 held-out finite-horizon full cost 验证，因此未形成八谓词 `DIRECT_FATAL`。
- 下一道门：MAINLINE 机械验收后交独立 SENTRY；若确认 PASS，再单独冻结 Linux/CUDA Stage A 资源与 fidelity 合同。不得直接运行候选实现。
- 是否需要用户操作：当前 SENTRY 不需要；若之后进入 Stage A，现有 Windows/no-WSL 边界无法运行原生 vLLM CUDA，需要兼容 Linux/CUDA 环境或新的精确授权。这是资源门，不是科学负结论。

- Lane id: `STAGE0_PRIMARY`
- Assignment id: `STAGE0-PRIMARY-20260830-VLLM-CUDAGRAPH-CAPTURESET`
- Input freeze SHA-256: `149135C8F92E7FF76926BE9A5DC519C4D07C3880A840D19CBB95EAA1DA55D64B`
- Cross-assignment contamination declaration: `false`
- Scientific verdict: `PASS_RECOMMENDED`
- Operational disposition: `NONE` for Stage 0→SENTRY; future Stage A classification is `BLOCKED_USER_ACTION_REQUIRED`
- Quality tier: `TIER_B_Q2_VIABLE`
- Confidence: `0.83`
- Evidence ceiling: `CURRENT_OFFICIAL_SOURCE_AND_PRIMARY_PAPERS__ZERO_CANDIDATE_RESULT`
- Novelty route: `N2`
- Candidate Q1 venue family: LLM serving/runtime and systems performance; current shape is Q2 only.
- Stage semantics: conditional paper-potential screen; this report does not establish the main claim.

## Structural paper potential vs current readiness

- Structural paper potential if successful: an integrated target-native profiler/selector that changes the startup-memory-service frontier on held-out streams can be a credible compiler/runtime tool contribution.
- Current evidence-acquisition readiness/risk: exact source/config/dispatcher and public workload carriers exist. The current environment cannot execute native vLLM CUDA under the frozen no-WSL policy.
- Why missing implementation/results/proof/hardware is or is not structurally fatal: Stage 0 does not require a positive result. The finite exact-source route exists; missing Linux/CUDA is operational, while generic collapse and current-baseline domination are scientific falsifiers reserved for the killer.

## Discovery provenance

- Opportunity origins: `O4`, objective/constraint lane.
- Domain tags: vLLM V1, CUDA Graphs, single-GPU LLM serving, cold start, full cost.
- Paper genealogy: vLLM/PagedAttention → vLLM CUDA Graph capture/dispatcher → lazy-capture RFC → Medusa materialization → Foundry context materialization → current TensorRT-LLM capture-size tradeoff study.
- Discovery method revision: `RESEARCH_TOPIC_DISCOVERY_R1_R40_20260815`
- Discovery claim-pack mode: `OFF`
- Opportunity family ID: `OF-SOURCE123-S4-VLLM-CG-CAPTURESET`
- Contribution type and type-contract verdict: `COMPILER_TOOL`; conditionally complete because action, native interface, full-cost endpoint and finite falsifier are concrete.
- Independently audited A/C/D/E coordinates: `A3 / C2_SEARCH_BOUNDED_OPEN / D2_CONDITIONAL / EB_RESOURCE_BLOCKED` confirmed with a materially broader current-union baseline.
- Backtest reference and status: method calibration only; not candidate evidence.

## Frozen object and claim

Exact object is vLLM `v0.28.0`, one V1 single-GPU serving configuration, `CompilationConfig.cudagraph_capture_sizes`, and the native `CudagraphDispatcher`. The action outputs one legal ordered capture-size subset before serving. It does not alter model/request/sampling/output semantics, scheduling policy, CUDA Graph mode, LoRA/speculation configuration or dispatcher logic.

Primary conditional claim: compared with the full native/manual baseline union, a selector using only a frozen calibration trace and target-native per-size costs can improve the held-out finite-horizon Pareto frontier under fixed startup and graph-memory budgets. The horizon begins before profiling/capture and ends after a predeclared held-out service window; all selector/profiling/capture/failure costs are charged.

## Claim-package completeness audit

- Atomic action and mechanism: choose a subset of legal capture keys; native dispatch maps each descriptor to the smallest captured size or eager. Fewer keys reduce capture and graph metadata/residency; placement controls padding and fallback loss.
- Information/assumption contract: calibration trace only; held-out requests, results and descriptor frequencies are hidden at selection time.
- Effect target/output/guarantee: TTFT/TPOT/ITL/P99, throughput, startup and graph-memory/KV-capacity frontier with identical outputs and native request semantics.
- Boundary/failure region/competing explanation: long horizons, unconstrained memory, stable distributions, Foundry/Medusa archives, dense native heuristics, distribution shift or graph metadata/KV interaction can remove gains.
- Minimum falsifier: complete native/simple baseline union is Pareto-undominated; gains disappear on chronological held-out windows; or target-specific terms add no value beyond generic ordered facility location/segmentation.
- Dependencies and evidence ceiling: native Linux/CUDA execution is necessary only after SENTRY; current report has no candidate result.
- Opportunity-family relation audit: distinct from graph materialization and lazy capture; it selects the eager portfolio once before serving.
- Independent search identity/scope: exact tag/current official source, official docs/issues, primary Medusa/Foundry/BurstGPT papers, TensorRT-LLM current technical study, and generic ordered-location literature; `32/32` search/open items.
- Evidence-ledger integrity and contradiction disclosure: Discovery's exact-tag dispatcher transport debt is closed. Discovery omitted v0.28.0 `performance_mode=interactivity`, current multimodal budget-based capture on a different object, and the TensorRT-LLM capture-size study; all are subtracted here.

## Positive opportunity map

- Natural workloads: chronological held-out BurstGPT arrival windows; BurstGPT contains millions of real request records and vLLM's benchmark CLI directly supports the dataset ([BurstGPT paper](https://arxiv.org/abs/2401.17644), [vLLM benchmark datasets](https://docs.vllm.ai/en/stable/benchmarking/cli/)).
- Canonical fallback: pre-registered ShareGPT and deterministic random/request-rate panels in `vllm bench serve`, clearly labeled canonical rather than natural.
- Observed or expected cost/headroom: first-party vLLM source deliberately caps graph sizes because large portfolios increase startup and memory; Lazy RFC reports 67 default graphs and >10 s capture in some settings; Medusa measured CUDA-graph capture at 32% of loading and 35 sizes at about 30% of loading; TensorRT-LLM measured per-graph memory, startup and padding-throughput tradeoffs. These establish opportunity plausibility, not candidate gain ([v0.28 config](https://raw.githubusercontent.com/vllm-project/vllm/v0.28.0/vllm/config/compilation.py), [Lazy RFC #20098](https://github.com/vllm-project/vllm/issues/20098), [Medusa](https://minhui-xie.github.io/papers/asplos25-medusa.pdf), [TensorRT-LLM study](https://nvidia.github.io/TensorRT-LLM/1.3.0rc14/blogs/tech_blog/blog20_Tuning_CUDA_Graph_Batch_Sizes_for_Higher_Output_Throughput.html)).
- Mechanism-specific prediction: gains should grow at shorter horizons/tighter graph-memory budgets and track held-out mass in padding intervals; they should shrink when Foundry makes capture startup negligible or when the native portfolio already matches descriptor mass.

## Independent current upstream reality check

- Frozen upstream identity: tag `v0.28.0`; Discovery declares short commit `2cf0a69`. Exact tag source URLs resolved and were read. A final GitHub tag-ref API attempt failed transport/safety validation, so the short commit must be mechanically re-pinned before any Stage A run.
- Exact source paths/symbols checked:
  - [`vllm/config/compilation.py`](https://raw.githubusercontent.com/vllm-project/vllm/v0.28.0/vllm/config/compilation.py): CUDA Graph modes, warmups, capture sizes, max size, input copying, LoRA specialization, graph partitioning and spec-decode rounding.
  - [`vllm/config/vllm.py`](https://raw.githubusercontent.com/vllm-project/vllm/v0.28.0/vllm/config/vllm.py): `_set_cudagraph_sizes`, `performance_mode`, optimization levels, max-size legality and manual override.
  - [`vllm/v1/cudagraph_dispatcher.py`](https://raw.githubusercontent.com/vllm-project/vllm/v0.28.0/vllm/v1/cudagraph_dispatcher.py): padding map, FULL/PIECEWISE keys, LoRA multiplicity, eager fallback and explicit future-lazy note.
- Native dispatch semantics: sizes below a key pad upward; above max or unsupported mode falls back to `NONE`/eager. FULL keys also depend on request count/uniform decode; PIECEWISE relaxes those fields; attention capability, LoRA and speculative decode alter legal key multiplicity.
- Default/current flags: `cudagraph_mode`, `cudagraph_capture_sizes`, `max_cudagraph_capture_size`, `cudagraph_num_of_warmups`, `cudagraph_copy_inputs`, `cudagraph_specialize_lora`, `compile_sizes`, `use_inductor_graph_partition`, `performance_mode`, `optimization_level`, `enforce_eager`, speculative-token and sequence-parallel size rounding.
- Material contradiction to Discovery: v0.28.0 already has `performance_mode=interactivity`, which captures every size through 32 before returning to the standard grid. It is a mandatory native baseline, not the proposed trace-aware dual-budget selector.
- Adjacent current first-party mechanism: multimodal encoder CUDA Graphs use automatically inferred token-budget levels and greedy packing, but that is a different encoder/multimodal object and does not directly cover the text-backbone V1 dispatcher action.
- Current absence classification: `SEARCH_BOUNDED_OPEN`. No current integrated calibration-trace budgeted selector was found; no global-first claim is made.

## Named baselines and fairness contract

Primary deployable baselines:

1. vLLM v0.28.0 `balanced` default, exact final capture-size list recorded.
2. vLLM v0.28.0 `performance_mode=interactivity` and `throughput`, with every other option frozen.
3. Official manual memory-saving set `[1,2,4,8,16]` and an equal-cardinality/equal-measured-memory uniform-step set ([vLLM conserving-memory guidance](https://docs.vllm.ai/en/v0.11.1/configuration/conserving_memory/)).
4. `enforce_eager`; equal-budget frequency/top-k; exact lazy-capture RFC implementation if a source-pinned faithful version exists.

Strong conditional/ceiling baselines:

5. TensorRT-LLM-style x2/+64/+8 grids translated only where the vLLM legality contract is identical; its automatic log-based tuner is explicitly future work, not an implemented baseline.
6. Medusa and Foundry under their required offline capture/archive/deterministic-address assumptions. They retain broad graph coverage and attack reconstruction, not subset selection; when available, they remove or reduce the startup term and are a conditional stronger system baseline.
7. Exhaustive subset oracle on the frozen `1..64` witness; it is a ceiling, never a deployable online comparator.

Every policy receives the same model, CUDA Graph mode, LoRA/speculation settings, request order, sampling, outputs, cache temperature and horizon. Profiling/selection/storage/archive overhead, failures and OOM remain in the denominator. Offline oracle or Foundry cannot be combined into an unrealizable universal baseline.

## Collision analysis

### Eight-predicate direct-coverage audit

Closest aggregate union: vLLM v0.28.0 native configuration/dispatcher + lazy RFC + Medusa/Foundry + TensorRT-LLM capture-size study + generic one-dimensional facility location.

| Predicate | Independent evidence/locator | PASS / FAIL / UNKNOWN |
|---|---|---|
| Same object/function/protocol | Native v0.28.0 config/dispatcher is exact; external systems are different objects | PASS for native, partial aggregate |
| Same scenario/workload | All address CUDA Graph serving startup/replay; no identical frozen calibration/held-out finite horizon | PARTIAL / FAIL |
| Same or weaker information | Candidate uses calibration history; native heuristics use config, lazy uses online first-seen, Foundry uses offline archive | FAIL as one union |
| Atomic action covered | Native permits manual sets; no inspected source automatically solves the dual-budget trace-conditioned subset action | FAIL |
| Same/stronger legality, quality and guarantee | Native semantics are exact; external restoration/lazy assumptions differ | PARTIAL / FAIL |
| Same non-worse full-cost boundary | TensorRT study covers padding/memory/startup/throughput, but not the exact vLLM held-out finite-horizon action; Foundry changes assumptions | FAIL |
| Comparable scale/platform/version/config | Exact v0.28.0 is available; papers use stronger datacenter hardware/different versions | PARTIAL |
| Sufficient full-text/implementation/reproduction depth | Exact source, full Medusa/Foundry texts and official technical study were read | PASS |

`DIRECT_FATAL=false`: four decisive predicates remain unsatisfied.

### Nearest-prior facet matrix

| Source/mechanism | What is already covered | Residual after subtraction |
|---|---|---|
| vLLM v0.28.0 | fixed grids, manual override, interactivity heuristic, native legality/dispatch | trace-conditioned dual-budget selector and held-out full-cost evidence |
| Lazy RFC #20098 | avoid unused eager graphs through first-use capture | pre-serving portfolio selection with predictable runtime |
| Medusa (ASPLOS 2025) | CUDA Graph/KV materialization; 10 models; ShareGPT; reduced cold start | graph-memory-aware subset selection without offline materialization |
| Foundry (2026 preprint/artifact) | near-instant graph context reconstruction, broad batch-size templates | subset selection under no-archive deployments and memory budgets |
| TensorRT-LLM study | exact padding/startup/memory/throughput tradeoff across fixed sets; proposes automatic tuning as future work | implemented vLLM-specific trace-conditioned selector with held-out validation |
| Generic 1-D facility location/segmentation | ordered subset/opening-plus-assignment optimization via DP | vLLM legality/multiplicity, finite horizon, KV-capacity interaction, profiler/tool integration |

### Seed-distance and method-name deletion test

Deleting the name leaves “open ordered service points with setup/memory costs and assign each demand upward to its next point,” a classical one-dimensional location/segmentation form; one-dimensional facility allocation and sequential clustering are long-known dynamic-programming problems ([Management Science note](https://ideas.repec.org/a/inm/ormnsc/v22y1976i5p614-617.html), [sequential 1-D DP](https://journal.r-project.org/articles/RJ-2016-022/)). Therefore a plain DP or knapsack wrapper is below Q2. The paper kernel survives only if vLLM-specific legal-key multiplicity, dispatcher loss, graph-memory→KV-capacity interaction, finite-horizon amortization and held-out stability materially change the frontier.

## Competing mechanism decision

- Selected mechanism: target-native cost/legality model plus ordered subset selection.
- Registered backup: none; materialization/lazy capture are baselines, not pivots.
- Pivot boundary: changing to generic segmentation, TensorRT-LLM, encoder graph budgets, graph serialization/materialization or scheduler redesign is a new object.

## Residual paper kernel

The publishable residual is not “find a smaller list.” It is a source-pinned vLLM tool that observes native descriptor/capture/memory costs on a result-independent calibration window, computes a legal portfolio under two explicit budgets, leaves the dispatcher untouched, and predicts when the portfolio remains non-dominated on chronological held-out finite horizons.

## Evidence route

- `PERFORMANCE / PARETO_APPROXIMATION`

## Performance-optimization admissibility

- Same-function contract: identical vLLM model, request/sampling semantics, scheduler, backend, outputs and native dispatcher.
- Algorithmic delta: target-native legality/cost construction plus robust held-out selector; plain DP is insufficient.
- Full-cost ledger: profiler/selector, warmup/capture, server-ready wall, graph count, metadata/resident memory, KV capacity loss, padding/fallback, TTFT/TPOT/ITL/P99, throughput, failures/OOM and exact horizon.
- Strong-implementation fairness: all native flags and cache temperature frozen; comparator overhead charged.
- Generality and failure boundary: at least three architecture families, positive/negative trace regimes and multiple budgets/horizons; no cross-GPU claim from one 4070.
- Why not routine tuning: it must beat native heuristics and equal-budget frequency on held-out traces, explain the boundary and ship a reproducible integrated tool.

## Q1/Q2 paper shape

- Problem: CUDA Graph portfolios trade capture/startup and graph/KV memory against padding/fallback service cost, especially for short-lived single-GPU serving.
- Contribution: vLLM-native cost/legality abstraction, result-independent budgeted selector, integrated observer and held-out full-cost benchmark.
- Minimum Q2 evidence: at least 8 public models across 3 model/architecture families; BurstGPT plus one official canonical carrier; at least 3 predeclared horizons and 3 budget regimes; balanced/interactivity/manual/eager/frequency/lazy/conditional materialization/oracle baselines; chronological model/trace holdout; repeated raw metrics and artifact.
- Expected paper narrative: generic DP is known, but target-specific coupling and finite-horizon regime produce a reproducible rule/tool; negative regimes are part of the result.
- Q1 path: second CUDA architecture, broader production traces, stronger robustness/online guarantee and upstream-quality integration; not currently supported.

## Q1/Q2 shape calibration

- Comparator file: `q1_calibration.md`
- Reference set: vLLM/PagedAttention (SOSP 2023), Medusa (ASPLOS 2025), Foundry (2026 preprint/artifact), TensorRT-LLM current technical study.
- Status: `PARITY_CONDITIONAL_WITH_EXECUTABLE_GAP`
- Contribution-shape gap: target-native residual must outperform generic and current heuristics.
- Evidence-shape gap: no candidate results, no public Linux/CUDA run, no held-out frontier or artifact.
- Stage A closure plan: one high-information native killer before broad panel.

## Non-relaxable quality audit

- Same-object: closed in contract and exact source.
- Latest collision: closed to bounded-open depth; native interactivity and TensorRT study newly added.
- Strong fair baselines: complete plan above; materialization remains conditional on assumptions/artifact compatibility.
- Natural input/evidence: BurstGPT supported; request trace must be converted through native vLLM scheduling/dispatcher, not treated as a direct batch-size trace.
- Full-cost: startup, service, memory/KV and observer costs jointly required.
- Reproducibility: exact tag/commit, model hashes, traces/splits, config, descriptor logs, commands and raw metrics required.
- Evidence/claim honesty: zero candidate output; no absence, novelty or performance claim.

## Evidence path and AI completion

- E1/E2 execution-readiness audit; scientific inference explicitly excluded: static E1 source/interface route is closed. E2/native smoke is not authorized and cannot run natively on current Windows under no-WSL policy.
- AI executability class: `AI_CORE_CONDITIONAL`
- Estimated ai_core_fraction: `0.78` once a compatible Linux/CUDA environment is authorized.
- 72-hour first evidence: exact-source instrumentation contract, `1..64` exhaustive witness, then one small public model and chronological held-out window.
- Human-only items and why they are non-decisive: user/environment action is needed only to supply or authorize Linux/CUDA; scientific design, implementation and analysis remain AI-auditable.

## Fidelity closure plan audit

- Discovery status: `RESOURCE_BLOCKED_FIDELITY_GAP`
- Complete action and native semantics are finite and same-object: yes.
- Comparator, denominator, full-cost and small-witness plan: finite and source-pinned.
- Why an unimplemented interface/format/checker is or is not structurally fatal: candidate output is already a native config list; instrumentation and legality checker are finite. Missing implementation is not a Stage 0 hard failure.
- Reminder: Stage A must close `PRE_CLAIM_CONTRACT_FIDELITY_GATE` before its first claim-bearing run.

## Stage A highest-risk probe plan

- Risk-bearing premise: after charging every native cost and adding `performance_mode=interactivity`, a target-native selector still has nontrivial held-out advantage over frequency and fixed grids.
- Cheap discriminating probe: one small public model on one approved Linux/CUDA GPU; exact v0.28.0 source; descriptor domain `1..64`; two predeclared startup/memory budgets; chronological calibration/held-out split; native default, interactivity, manual `[1,2,4,8,16]`, eager, equal-budget frequency and exhaustive subset oracle. Run hook-off and hook-on process controls with identical outputs and request order.
- Negative result that kills the direction:
  1. candidate has no ≥5% cumulative full-cost advantage over every deployable baseline in any frozen budget/horizon;
  2. native/interactivity/frequency stays within 5% of exhaustive frontier in all cells;
  3. gains reverse on held-out windows or require result-dependent trace selection;
  4. full-cost gains vanish after graph memory→KV-capacity, profiling or server-ready time;
  5. any output/request/native-dispatch semantic changes occur;
  6. vLLM-specific features do not outperform the same generic DP with only descriptor frequencies and opening costs.
- Positive-result ceiling: preliminary support/non-falsification only; not main-claim proof.

## Stop conditions

1. SENTRY finds a current same-object integrated selector satisfying all eight direct-coverage predicates.
2. Exact-tag current source cannot support an unchanged native portfolio action.
3. Generic ordered segmentation/facility-location baseline matches the target-native policy.
4. Native/performance-mode/frequency baselines are Pareto-undominated on all held-out cells.
5. Full-cost accounting reverses all apparent gains.
6. Q2 breadth cannot be reached without changing object or requiring unavailable private traces/hardware.

## Discovery repair vector

- Codes: `[OMITTED_CURRENT_SAME_OBJECT, OMITTED_FIRST_PARTY_FEATURE, OMITTED_GENERIC_KERNEL, FULL_COST_GAP, Q2_SHAPE_GAP]`
- Materiality: v0.28.0 exact dispatcher became readable; `performance_mode=interactivity`, TensorRT-LLM capture-size evidence and generic DP materially raise the bar while leaving a narrower residual.
- Was the missing information available before the frozen cutoff?: `yes`
- Does this feedback alter the independent scientific decision?: `NO`

## Dual-axis score

- Academic value: `47/70`
- AI executability bonus: `24/30`
- Total: `71/100`

## User-action blocker classification

- Claim-bearing observation obtained before failure: `no`
- Evidence ceiling: `RESOURCE_FAILURE_ONLY__NO_SCIENTIFIC_INFERENCE` for future execution only
- Scientific revision consumed: `no`
- Exact blocker: official vLLM GPU requirements specify Linux and no native Windows support; current project policy disallows assuming WSL ([official installation requirements](https://docs.vllm.ai/en/latest/getting_started/installation/gpu/)).
- Minimum future action: after independent SENTRY confirms the scientific PASS, MAINLINE must freeze a compatible Linux/CUDA v0.28.0 environment on the available GPU or obtain a user-authorized equivalent remote Linux/CUDA route. No action is requested before SENTRY.

