# Discovery Divergence Seed Pool

`SEED` 只用于离线创意召回，不是 locator、raw、候选证据或新颖性结论。本阶段未检索、下载、构建、实验或读取 A3/课题组仓库。

## Pool metadata

- Assignment / lane: `DISCOVERY-S4-20260824-SOURCE105-PUBLIC-NDP-ROTATION-V1` / `DISCOVERY_S4`
- Frozen profile: `SOURCE105_PUBLIC_NDP_ACCELERATOR_ARTIFACT_ROTATION_V1`
- Seed ceiling: `<=12`; actual: `12`
- RQ candidate ceiling: `<=8`
- Network-security exclusion: `PASS`
- Generation completed before evidence lookup: `YES`
- Forbidden inputs used: `NONE`

## Seed records

### `S4-105-01`

- Engine / perspective: `ABSTRACTION_LADDER` / `MEASUREMENT_REVIEWER`
- Anchor candidate: versioned Timeloop/Accelergy mapping-and-energy artifact.
- Sketch: 将模型误差从绝对 energy 误差提升为 mapping choice 是否错误的 decision-regret；只有同一 workload、同一 mapping space 和可反证阈值均可冻结时才保留。
- Conservative conclusion: 一个公开 cost model 的可用性应按同对象 mapping decision 而非单点误差评价。
- Risk: existing Timeloop/Accelergy validation or generic estimator dashboard.
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`

### `S4-105-02`

- Engine / perspective: `CONSTRAINT_MANIPULATION` / `HARDWARE_ARCHITECT`
- Anchor candidate: public NDP/PIM simulator with a CPU-runnable command/timing model.
- Sketch: 固定 memory command semantics，检验“内部带宽”与可完成 host-visible work 的分母之间是否有版本化、可测的 cost-model boundary。不能以没有硬件为由推断收益或停止。
- Conservative conclusion: 某个公开 simulator 的 bandwidth metric 只有在明确 command/contention contract 下才支持一项 host-visible decision。
- Risk: generic “theoretical bandwidth is not real bandwidth” warning.
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`

### `S4-105-03`

- Engine / perspective: `PROBLEM_REFRAMING` / `OPERATOR`
- Anchor candidate: MLPerf inference or another canonical public accelerator benchmark with explicit scenario/QoS.
- Sketch: 将 benchmark score 重述为可行集证书，问不同 scenario/latency contract 是否会使同一 accelerator mapping 的 ranking 失稳。只在有明确 carrier、decision threshold 与 correction action时保留。
- Conservative conclusion: 一个 canonical scenario 的 ranking 是否足以支持明确 deployment/mapping choice。
- Risk: MLPerf replay/sanitization repackaging.
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`

### `S4-105-04`

- Engine / perspective: `BISOCIATION_STRUCTURAL_TRANSFER` / `THEORIST`
- Anchor candidate: public accelerator mapping search and a canonical layer/shape suite.
- Sketch: 将 mapping search 的 cost model 看作带不确定性约束的 optimizer，考察是否可形成“在何种 prediction interval 下禁止改变 mapping”的可证伪 policy。若只是另一个 selector，不准入。
- Conservative conclusion: 一个公开 mapping search 的 confidence/uncertainty boundary能否改变同一 mapping decision。
- Risk: generic search wrapper, absence of native action.
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`

### `S4-105-05`

- Engine / perspective: `NEGATION_OR_INVERSION` / `MAINTAINER`
- Anchor candidate: public open accelerator model separating compute and data-movement energy.
- Sketch: 若最优 mapping 在 compute-only 与 full-cost 模型下不同，能否定位一个冻结的 metadata/control/data-movement term 并给出 decision threshold，而不是笼统补全成本表。
- Conservative conclusion: 一项明确成本项是否可判定地改变一个 canonical mapping choice。
- Risk: existing full-cost accounting already includes it or costs cannot be independently observed.
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`

### `S4-105-06`

- Engine / perspective: `ADJACENT_POSSIBLE_OR_BOUNDARY` / `COMPILER_OR_BACKEND_ENGINEER`
- Anchor candidate: public accelerator compiler IR/mapping artifact.
- Sketch: 以 compilation time、mapping quality 与 energy estimate 三重约束检查 automatic mapper 的 Pareto report 是否有可复核的 validity gap。不是新增 generic kernel selector。
- Conservative conclusion: 一个公开 mapper 的 reported Pareto 是否可支持一个限定的 compiler decision。
- Risk: dashboard/plot only.
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`

### `S4-105-07`

- Engine / perspective: `JANUSIAN_TENSION` / `MEASUREMENT_REVIEWER`
- Anchor candidate: public NDP model with bank/row buffer and host synchronization parameters.
- Sketch: 同一 near-memory action 可减少 one data path 但增加 command/synchronization cost；寻找可被 model oracle 反驳的 crossover condition，而不是提出新 NDP action。
- Conservative conclusion: 一个公开 NDP cost model 是否能识别某 action 的可用/不可用边界。
- Risk: generic roofline crossover.
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`

### `S4-105-08`

- Engine / perspective: `COMPOSE_DECOMPOSE_SIMPLIFY` / `HARDWARE_ARCHITECT`
- Anchor candidate: canonical operator benchmark plus open cost model.
- Sketch: 拆分 shape、layout、sparsity metadata、data movement 和 mapper overhead，测试哪一个最小 state bundle 对 ranking 充分。若没有 target decision，不做数据表工作。
- Conservative conclusion: 一个 minimal state bundle是否足以判定 canonical benchmark 的 mapping ranking。
- Risk: ordinary feature ablation.
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`

### `S4-105-09`

- Engine / perspective: `CONSTRAINT_MANIPULATION` / `OPERATOR`
- Anchor candidate: public LLM operator-shape benchmark and open accelerator model.
- Sketch: 固定 bit-exact operator semantics，问 dynamic shape policy是否使 static cost-model ranking失效；只有能提出同一 artifact 的 correction action 才保留。
- Conservative conclusion: 一个公开 accelerator estimator 是否在明确定义的 LLM shape regime 中保持 mapping decision 一致。
- Risk: low-bit layout/packing rename or generic dynamic-shape analysis.
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`

### `S4-105-10`

- Engine / perspective: `ABSTRACTION_LADDER` / `THEORIST`
- Anchor candidate: public accelerator energy model with reproducible component tables.
- Sketch: 把 component-level energy model上升为 workload-level ranking，寻找可验证的 aggregation invariance 或反例条件。若只剩单位换算，淘汰。
- Conservative conclusion: 哪些公开 model aggregation assumptions 支持或不支持一个 workload choice。
- Risk: existing Accelergy accounting semantics.
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`

### `S4-105-11`

- Engine / perspective: `BISOCIATION_STRUCTURAL_TRANSFER` / `MAINTAINER`
- Anchor candidate: public mapping sweep with feasible/infeasible output.
- Sketch: 将 mapper infeasibility作为 measurement censoring 而非缺数据，检查 feasibility frontier是否在 model version/constraint setting下可复现并影响实际 candidate selection。
- Conservative conclusion: 一个 canonical mapping benchmark 的 infeasible points是否必须以明确方式进入 Pareto decision。
- Risk: existing search tool already treats infeasibility identically.
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`

### `S4-105-12`

- Engine / perspective: `PROBLEM_REFRAMING` / `END_USER`
- Anchor candidate: public CPU-runnable NDP/accelerator performance model.
- Sketch: 不以最高性能为 endpoint，而是冻结一个可部署的成本/延迟 budget，问模型选择的 optimum是否对单个未建模 cost term稳定。必须有明确公共 carrier和最小 falsifier。
- Conservative conclusion: 一个公开 performance model的配置建议在明确 full-cost budget下是否稳健。
- Risk: generic goodput/cost model repackaging.
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`

## Clustering and convergence

| Cluster | Seeds | Distinct surface | Selected |
|---|---|---|---|
| A | 01, 04, 06, 11 | mapping/search decision validity | S4-105-01 |
| B | 02, 05, 07, 10 | NDP/accelerator cost-accounting boundary | S4-105-05 |
| C | 03, 08 | canonical benchmark/ranking validity | S4-105-03 |
| D | 09, 12 | LLM-shape/cost-model robustness | S4-105-09 |

| Selected seed | Coverage reason | Intended carrier | RQ ID |
|---|---|---|---|
| S4-105-01 | mapping decision endpoint | Timeloop/Accelergy public artifact | S4-105-RQ01 |
| S4-105-03 | canonical benchmark endpoint | MLPerf/public accelerator benchmark | S4-105-RQ02 |
| S4-105-05 | full-cost term endpoint | open accelerator energy/data-movement model | S4-105-RQ03 |
| S4-105-09 | LLM shape endpoint | public LLM operator shape + model artifact | S4-105-RQ04 |
| S4-105-11 | feasibility endpoint | public mapping sweep artifact | S4-105-RQ05 |

## Append-only backlog

S4-105-02、04、06、07、08、10、12 保留为非证据 backlog；不计入 raw、候选或 precision 分母。

## Advisory

- Engines used: 8/8; perspectives: 7/7; `DIVERGENCE_COVERAGE_ADVISORY=PASS`.
- 本轮保留的是可版本化公开 artifact 可能产生的同对象决策问题，而不是将 NDP/PIM、能耗或 benchmark 名称本身当成论文贡献。
