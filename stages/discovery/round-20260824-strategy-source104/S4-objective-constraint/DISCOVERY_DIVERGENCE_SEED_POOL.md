# Discovery Divergence Seed Pool

本表只负责离线创意召回；`SEED` 不是 locator、raw、候选证据或新颖性结论。未进行网络查询、下载、资源动作或实验。

## Pool metadata

- Assignment / lane: `DISCOVERY-S4-20260824-SOURCE104-PUBLIC-CARRIER-DIVERSIFIED-V1` / `DISCOVERY_S4`
- Frozen profile: `SOURCE104_PUBLIC_CARRIER_FIRST_DIVERSIFIED_LLM_VLA_V1`
- Seed ceiling: `<=12`; actual: `12`
- RQ candidate ceiling after seed convergence: `<=8`
- Network-security exclusion check: `PASS`
- Generation completed before evidence lookup: `YES`
- Group repository / Rule Audit: `FORBIDDEN__NOT_USED`

## Seed records

### `S4-104-01`

- Engine / perspective: `CONSTRAINT_MANIPULATION` / `MEASUREMENT_REVIEWER`
- Starting anchor candidate: versioned public online-serving benchmark with request timestamps and success/failure accounting.
- Idea sketch: 固定同一 workload 与 output contract，检验 deadline-attainment 的分母是否必须包含取消、超时或重试请求。若只改变报表而不改变可复核 deployment decision，则淘汰。
- Conclusion-first test: 一个明确 benchmark protocol 的 completion accounting 是否足以改变同对象 SLO 判断。
- Risk: generic goodput metric repackaging.
- Needed before locator: native result schema、failure semantics、one decision threshold.
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`

### `S4-104-02`

- Engine / perspective: `ABSTRACTION_LADDER` / `COMPILER_OR_BACKEND_ENGINEER`
- Starting anchor candidate: public vLLM startup benchmark/API and compile-cache documentation.
- Idea sketch: 将 cold boot 分解为 weight/load、profiling、compile/capture 与 ready-to-serve 边界，问哪个版本化 startup contract 能预测首次可用服务的决策阈值。它不是将 GPU power 误作总成本。
- Conclusion-first test: 一个同对象 cold-start boundary 能否改变预热、缓存或 deployment 选择。
- Risk: current startup harness already has equivalent phase accounting.
- Needed before locator: exact benchmark source and native readiness predicate.
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`

### `S4-104-03`

- Engine / perspective: `NEGATION_OR_INVERSION` / `OPERATOR`
- Starting anchor candidate: public rate-ramp or timed-trace serving benchmark.
- Idea sketch: 若固定并发 sweep 被换为 versioned arrival-rate ramp，SLO cliff 的位置是否能被稳定复现并解释为 queue state，而不是单点 p99 波动。潜在贡献是可反证的 measurement mechanism，不是更换图表。
- Conclusion-first test: 一个公开 trace/ramp carrier 是否可使配置选择从无稳定决定变为可稳定决定。
- Risk: harness already encodes equivalent ramp and overload semantics.
- Needed before locator: arrival process、warmup、deadline and failure definitions.
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`

### `S4-104-04`

- Engine / perspective: `BISOCIATION_STRUCTURAL_TRANSFER` / `THEORIST`
- Starting anchor candidate: MLPerf-style power measurement protocol plus a public serving workload carrier.
- Idea sketch: 把 power-window alignment 看作测量系统的 sampling theorem：请求完成边界与能源计数窗口错位时，配置排序可能不可辨识。只有能形成公开可复核 estimator、混杂路线和 decision threshold 才保留。
- Conclusion-first test: 一个明确 window-alignment estimator 是否改变同对象能耗/延迟 Pareto 选择。
- Risk: public protocol already directly specifies the same alignment; GPU-only scope may lack full-cost ceiling.
- Needed before locator: official power protocol、public counter semantics and serving timestamps.
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`

### `S4-104-05`

- Engine / perspective: `PROBLEM_REFRAMING` / `END_USER`
- Starting anchor candidate: public interactive serving benchmark exposing TTFT, ITL and E2E.
- Idea sketch: 将 interactive SLO 定义为一个可审计的 first-response plus continuity contract，而非任意 UX 聚合；检验 native metrics 的 joint constraint 是否在同一 workload 下有不可替代的 decision consequence。
- Conclusion-first test: 一个公开 session/request carrier 是否让联合约束产生不同于单指标的可证伪系统选择。
- Risk: generic TTFT/TPOT goodput repackaging.
- Needed before locator: exact carrier、metric algebra and strongest goodput subtractor.
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`

### `S4-104-06`

- Engine / perspective: `ADJACENT_POSSIBLE_OR_BOUNDARY` / `MAINTAINER`
- Starting anchor candidate: public benchmark with prefix cache and cache-reset controls.
- Idea sketch: 不提出新的 cache lifecycle policy；只问基准中 cache reset/warmup 语义是否会改变同一 policy 的可重复 ranking。潜在贡献必须是 benchmark validity/correction，而非 runtime wrapper。
- Conclusion-first test: reset policy 是否在固定 public carrier 上造成可复核而且决策相关的 ranking instability。
- Risk: Source103 的 generic prefix-cache lifecycle terminal identity.
- Needed before locator: native reset control、workload/carrier、current benchmark protocol.
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`

### `S4-104-07`

- Engine / perspective: `COMPOSE_DECOMPOSE_SIMPLIFY` / `MEASUREMENT_REVIEWER`
- Starting anchor candidate: public single-GPU serving benchmark plus host/device observable counters.
- Idea sketch: 仅在可明确区分 “server-ready → request-complete” 与 process-wide background activity 时，研究可归因的 incremental energy/latency measurement boundary。若无法以公共观察面隔离，保持 evidence ceiling，不将其包装为 end-to-end claim。
- Conclusion-first test: 一个可公开复现的 attribution boundary 是否支持严格较弱但有决策价值的测量结论。
- Risk: no natural carrier or only ordinary instrumentation hygiene.
- Needed before locator: counter scope、baseline idle interval、falsifier.
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`

### `S4-104-08`

- Engine / perspective: `JANUSIAN_TENSION` / `OPERATOR`
- Starting anchor candidate: public serving benchmark with startup and steady-state modes.
- Idea sketch: 相同 runtime configuration 可能在 cold deployment 与 sustained serving 中体现相反的优先级。若 versioned protocol 已经把两种 regime 独立且完整定义，则没有 residual；若未定义，必须有 natural deployment decision 而非任意两套数据。
- Conclusion-first test: cold/warm regime selection是否由一个公开可复核的 deployment condition 决定。
- Risk: existing benchmark mode flags fully cover it.
- Needed before locator: startup/steady-state contract, model/cache state, decision threshold.
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`

### `S4-104-09`

- Engine / perspective: `CONSTRAINT_MANIPULATION` / `HARDWARE_ARCHITECT`
- Starting anchor candidate: public GPU energy counter API coupled to a public inference request harness.
- Idea sketch: 固定 GPU-only evidence ceiling，问低采样率/driver-reset counter 是否会使短请求配置的 device-energy ranking不可辨识。它不外推 host/system energy，也不假设未公开传感器。
- Conclusion-first test: 一个明确的 device-energy observability limit 是否改变哪些请求长度/批量可以公平比较。
- Risk: only a measurement caveat without a correction or decision effect.
- Needed before locator: official counter semantics, request duration carrier, threshold/falsifier.
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`

### `S4-104-10`

- Engine / perspective: `ABSTRACTION_LADDER` / `COMPILER_OR_BACKEND_ENGINEER`
- Starting anchor candidate: public compile-cache/startup artifact for an LLM runtime.
- Idea sketch: 从 compile cache 向 serving readiness 上升，研究 cache hit/miss 是否有稳定、可复核的 cold-start SLO consequence和可操作的 configuration boundary。不能把单次 JIT 时间或一般编译优化当论文。
- Conclusion-first test: cache-state-aware readiness estimator 是否改变一个冻结 deployment decision。
- Risk: source-level knobs already directly express the action.
- Needed before locator: official cache semantics, native startup stage, comparator.
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`

### `S4-104-11`

- Engine / perspective: `BISOCIATION_STRUCTURAL_TRANSFER` / `THEORIST`
- Starting anchor candidate: public trace replay harness.
- Idea sketch: 将 workload replay 的 time scaling 视为 experiment intervention：若 scale factor 改变 queueing regime，benchmark result可能不能代表原 trace 的 deployment choice。保留条件是能冻结 same-trace counterfactual与一个有限 correction/falsifier。
- Conclusion-first test: time scaling semantics 是否会在一个公开 trace 上改变 SLO decision，而不换 object。
- Risk: trace replay implementation already preserves/declares this semantics.
- Needed before locator: versioned trace format, replay transform and native schedule path.
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`

### `S4-104-12`

- Engine / perspective: `PROBLEM_REFRAMING` / `MAINTAINER`
- Starting anchor candidate: public benchmark parameter-sweep output with feasible/infeasible configurations.
- Idea sketch: 把 parameter sweep 的输出从“best point”改为可行集证书：是否有一类明确的 measurement confound 让 sweep 的 Pareto frontier 不可复现。只在能给出同对象 correction action时进入后续。
- Conclusion-first test: 一项公开 benchmark 的 feasibility frontier 是否有可攻击且可修复的 measurement validity gap。
- Risk: generic dashboard/plot enhancement.
- Needed before locator: versioned sweep schema, constraint boundary, current comparator.
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`

## Clustering and coverage-constrained convergence

| Cluster | Seeds | Distinct question surface | Selected representative |
|---|---|---|---|
| A | 01, 03, 05, 11, 12 | serving SLO/trace/sweep measurement validity | S4-104-03 |
| B | 02, 08, 10 | cold/warm/startup/compile readiness | S4-104-02 |
| C | 04, 07, 09 | public energy observability and attribution boundary | S4-104-04 |
| D | 06 | cache-reset benchmark validity | S4-104-06 |

| Selected seed | Coverage reason | Intended object/problem boundary | RQ Candidate ID |
|---|---|---|---|
| S4-104-02 | cold-start carrier | public runtime startup/ready contract | S4-104-RQ01 |
| S4-104-03 | load/ramp carrier | public timed-trace or rate-ramp SLO protocol | S4-104-RQ02 |
| S4-104-04 | measurement-estimator carrier | public power protocol plus serving timestamps | S4-104-RQ03 |
| S4-104-06 | cache-reset benchmark carrier | native reset flag plus public workload | S4-104-RQ04 |
| S4-104-11 | trace-transform carrier | versioned trace replay time semantics | S4-104-RQ05 |

## Append-only backlog

S4-104-01、05、07、08、09、10、12 只保留为非证据 backlog；不得作为候选、raw 或 precision 分母。

## Advisory

- Engines used: 8/8; perspective roles: 7/7.
- `DIVERGENCE_COVERAGE_ADVISORY`: `PASS`.
- Plain-Chinese note: 本轮的唯一投入变化是先找能定义同对象的公开 carrier；这不是把公开 carrier 当作录取门，也不是对 Source103 零产出的事后规则修改。
