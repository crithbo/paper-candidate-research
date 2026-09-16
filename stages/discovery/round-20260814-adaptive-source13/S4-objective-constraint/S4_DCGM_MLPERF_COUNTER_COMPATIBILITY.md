# S4_DCGM_MLPERF_COUNTER_COMPATIBILITY — Counter-Compatible Full-Cost GPU Utilization Characterization

## 中文摘要

- 研究机会：DCGM 当前实现按 GPU 架构暴露不同的可并发 profiling counter groups；冲突组会被自动 multiplex，较高频率下可返回零值。MLPerf Inference 则冻结模型质量、场景和系统级 wall-power 的自然比较对象。
- 为什么可能值得做：若相同 MLPerf workload 在 native compatible groups 与 multiplexed collection 下得到不同的 utilization bottleneck 或 design ranking，现有“单流 utilization 解释”将不是可比证据。贡献是可复现的 measurement-characterization 合同，而不是控制器、参数扫描或新优化器。
- 为什么保留：同对象、同质量、同 SUT 的重复窗口协议、估计量、full-cost 与 held-out falsifier 已可冻结；最新 bounded subtractor CounterPoint 处理广义 counter-noise，但没有在本次有界检索中覆盖 DCGM-native group contract + MLPerf wall-power/tail contract。Stage 0 必须独立复核该差异。
- 下一步：Stage A 先在公开 MLPerf carrier 的小型合法 SUT/witness 上验证 native group enumeration、same-output/quality、raw counter schema和 full-cost ledger；随后在预登记 hold-out model-scenario/GPU strata 上执行 killer。

- Status: `PROPOSE_STAGE0`
- Quality tier: `TIER_B_Q2_VIABLE`
- Opportunity origins: `O4`
- Domain tags: GPU, accelerator, MLPerf Inference, DCGM, measurement validity, energy, tail latency
- Contribution route: `N3`
- Discovery date: 2026-08-14
- Discovery method revision: `V8_7_POTENTIAL_READINESS_SEPARATED`
- Discovery claim-pack mode: `OFF`
- Opportunity family ID: `S4_DCGM_MLPERF_COUNTER_COMPATIBILITY`
- Contribution type: `MEASUREMENT_CHARACTERIZATION`

## Research question

For fixed MLPerf Inference releases, scenario/quality, SUT and GPU/driver, does a DCGM-native counter-compatible repeated-window protocol produce a stable, held-out-valid utilization/bottleneck conclusion that differs from the conclusion supported by a single automatically multiplexed counter stream, once system wall energy, throughput/tail and measurement overhead are all charged?

## Canonical research claim package

- Exact object and contract: a fixed MLPerf Inference release and closed-division workload/scenario/quality; identical model outputs, SUT, GPU/driver and workload request stream across compared collection plans.
- Natural carrier: public MLPerf Inference release artifacts, reference/vendor-compliant submission metadata and result/log structure; initial finite carrier uses a small fixed set of published datacenter or edge model-scenario strata.
- Opportunity: DCGM docs state counter groups can conflict on Ampere-and-older GPUs, multiplexing is used, and fast multiplexing can return zeroes; therefore unqualified utilization evidence can be incomparable across plans.
- Atomic action: query native supported groups; partition incompatible groups; schedule randomized, repeated equal workload windows for each group; attach power/throughput/tail and collection-overhead records; estimate conclusion stability and ranking sensitivity from paired windows.
- Information/fairness: every arm uses only DCGM's public per-GPU group catalogue and MLPerf public interfaces; no special source instrumentation, altered model, altered quality threshold or privileged counter mapping.
- Comparator: DCGM default/native multiplexed profiling stream plus the official MLPerf performance/power contract; CounterPoint is a methodological adjacent paper-level subtractor.
- Expected guarantee: conditional and falsifiable—if the protocol finds an interval-separated conclusion that replicates on a held-out model-scenario/GPU stratum, it establishes the boundary of valid utilization comparisons; otherwise it reports no useful ranking effect under the stated boundary.
- Full cost: workload and SUT energy at wall, latency/throughput, DCGM collection delay and field groups, host-engine CPU/RSS, number and duration of repeat windows, power-server cost, preprocessing and statistical-analysis cost.
- No-gain / failure: Hopper-and-newer GPM can have no corresponding group restriction; workloads with compatible requested fields or a held-out stratum with stable unchanged conclusion are no-gain conditions.
- Minimum falsifier: preregistered held-out model-scenario/GPU stratum has no material difference between multiplexed and compatibility-stratified conclusion under the full-cost interval criterion.

## Competing mechanisms

1. **Counter-group mechanism:** incompatible hardware counters and automatic multiplexing alter the observed utilization vector, especially at rapid sampling.
2. **True workload mechanism:** different model/scenario phase mixture genuinely changes bottleneck behavior even under compatible measurement.
3. **Measurement overhead mechanism:** collection/power-server/host-engine overhead causes an apparent shift rather than the counter plan.

The protocol distinguishes them by holding workload semantics and request stream fixed, randomizing collection-window order, recording host-engine cost, separating compatible group plans, and using held-out workload/GPU strata.  It is not a runtime policy or an online selector.

## Current collision classification

- `DIRECT_SUBTRACT`: [CounterPoint](https://arxiv.org/abs/2601.01265) addresses noisy/multiplexed hardware counter interpretation.  It narrows novelty; the residual must remain the DCGM-current per-architecture native group contract combined with MLPerf same-quality wall-energy/tail measurement.
- `DEPLOYMENT_BASELINE`: current DCGM `dcgmi profile`/profiling API with group discovery and automatic multiplexing; MLPerf Inference LoadGen, accuracy and power measurement.
- `METHODOLOGICAL_ADJACENT`: generic performance-counter multiplexing tools and profiling studies.
- `SEARCH_BOUNDED_OPEN`: no exact full-cost DCGM/MLPerf protocol collision located within stated primary-source boundary; this is not a first-ever claim.

## Current upstream reality check

- Checked source date: 2026-08-14; NVIDIA DCGM current documentation and API pages cited in the discovery log.
- Current source/documented symbols: `dcgmProfGetSupportedMetricGroups`, `dcgmi profile --list`, `dcgmi dmon`, DCGM profiling/GPM modules, and DCGM Introspection.
- Default/nondefault controls: default 1 Hz profiling sample; configurable delay; requested fields/groups; automatic multiplexing; `--pause/--resume`; architecture-specific supported groups.  These controls are all included in the fair baseline union.
- Contrary evidence: Hopper-and-newer GPM groups do not have the older concurrency restrictions.  The proposed characterization explicitly stratifies this as a no-gain boundary rather than generalizing an older-GPU claim.

## Fidelity closure plan

- Status: `FINITE_FIDELITY_GAP`
- Small witness: one MLPerf model-scenario with fixed input request stream; run it unchanged under (a) native multiplexed set and (b) enumerated compatible groups in repeated windows; compare accuracy/output checks, LoadGen logs, wall-energy window, counter schema and host-engine cost.
- Finite closure: freeze MLPerf release/SUT/GPU-driver/DCGM version; enumerate group catalogue; predeclare metric partitions, window count/order, estimand and materiality interval; verify identical quality and scenario; then expose held-out workload/GPU stratum.
- Required resources: public MLPerf artifacts plus access to a supported physical GPU and MLPerf-valid power path.  Their current absence only limits readiness; it is not a scientific negative.
- Structural failure: action is unclosable only if same-workload/native DCGM collection cannot preserve an identical quality/LoadGen contract, or if Stage 0 finds a direct same-object protocol collision.

## 72-hour first evidence / killer

On the frozen small witness, the decisive negative is: multiplexed and group-compatible plans yield the same pre-registered utilization/bottleneck ranking within interval after charging all collection and measurement costs; or the group-compatible plan cannot preserve same output, quality or scenario.  Either result removes the proposed N3 usefulness claim for that scope.

## Execution readiness

- E1 static preflight: `NOT_RUN_NOT_REQUIRED_FOR_STAGE0`; source-only discovery confirmed public documentation/interfaces.
- E2: `NOT_RUN_NOT_AUTHORIZED`.
- AI boundary: `AI_CORE_CONDITIONAL`; source/schema/log processing is automatable, while valid GPU/power instrumentation requires resource access and careful physical setup.

## Q2 sufficiency hypothesis

If a stable held-out law is found, the paper would contribute a reproducible benchmark-validity protocol plus a natural, versioned dataset showing when accelerator utilization conclusions/rankings are valid or invalid under a matched quality and full-cost contract.  It is Tier B because effect size, breadth and latest paper collision remain unverified; it is not claimed Q1 before Stage 0/A evidence.

## Non-relaxable quality audit

- Same object: fixed MLPerf workload/quality/SUT and request stream across arms.
- Latest collision: current NVIDIA/MLCommons source audit plus CounterPoint bounded subtractor; Stage 0 must independently repeat it.
- Strong baseline: current native DCGM group discovery/multiplexing and official MLPerf power/performance contract.
- Natural carrier: MLPerf releases, workloads, logs and public submission metadata.
- Full cost: energy, performance/tail, collection, host-engine, power-server and analysis are in the denominator.
- Reproducibility: version pins, group catalogue, randomized plan, raw logs/schema, held-out falsifier and artifact route are frozen before claim-bearing measurement.
- Evidence honesty: no ranking reversal or stable law is claimed at Discovery.
