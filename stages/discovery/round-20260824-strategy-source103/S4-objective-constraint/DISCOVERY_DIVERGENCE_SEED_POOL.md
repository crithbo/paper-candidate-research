# Discovery Divergence Seed Pool

本表位于 Research Question Card 之前，只负责扩大创意召回。`SEED` 不是 locator、raw、C0、候选证据或新颖性声明；允许暂时缺少版本、current union 和 falsifier。seed 阶段不得联网、下载、构建或运行实验，必须在原 assignment 的模型与 wall-time 预算内完成。

## Pool metadata

- Assignment / lane: `DISCOVERY-S4-20260824-SOURCE103-LLM-VLA-STRATEGY-V1` / `DISCOVERY_S4`
- Frozen profile: `SOURCE103_USER_LLM_VLA_PUBLIC_SINGLE_GPU_CPU_FIRST_V1`; S4 的目标变化/约束视角。
- Seed ceiling: `<=12`；实际：`12`
- RQ candidate ceiling after seed convergence: `<=8`
- Network-security exclusion check: `PASS`
- Generation completed before evidence lookup: `YES`
- Group repository: `FORBIDDEN__NOT_USED`

## Divergence coverage

引擎数量与覆盖只作 advisory，不设最低数；不得为了凑数制造 seed。

| Engine | Used | Seed IDs |
|---|---:|---|
| `BISOCIATION_STRUCTURAL_TRANSFER` | yes | S4-103-01, S4-103-06 |
| `PROBLEM_REFRAMING` | yes | S4-103-02, S4-103-10 |
| `CONSTRAINT_MANIPULATION` | yes | S4-103-03, S4-103-08 |
| `NEGATION_OR_INVERSION` | yes | S4-103-04 |
| `ABSTRACTION_LADDER` | yes | S4-103-05, S4-103-09 |
| `ADJACENT_POSSIBLE_OR_BOUNDARY` | yes | S4-103-07 |
| `JANUSIAN_TENSION` | yes | S4-103-11 |
| `COMPOSE_DECOMPOSE_SIMPLIFY` | yes | S4-103-12 |

同时记录视角轮换，但不设录取配额：`END_USER / OPERATOR / MAINTAINER / COMPILER_OR_BACKEND_ENGINEER / HARDWARE_ARCHITECT / MEASUREMENT_REVIEWER / THEORIST`。

## Seed records

### `S4-103-01`

- Engine: `BISOCIATION_STRUCTURAL_TRANSFER`
- Perspective role: `OPERATOR`
- Starting anchor or hunch: 单 GPU serving 的预算分配可类比为带启动成本的多阶段生产线，而不是只按 token 吞吐排序。
- Exact public anchor candidate and version/date if already known: 一个公开、版本化的单 GPU LLM serving runtime 与其公开 serving benchmark。
- Intended source role: `ANCHOR`
- Two-sentence idea sketch: 将 admission、prefill、decode、KV 维护和请求取消的端到端成本映射到同一 SLO 预算。若各阶段成本分母不同，常见“更高吞吐”配置的端到端可行域可能与 SLO 可行域不同。
- Conclusion-first test: 若成功，最谨慎的结论只能是：某一同对象 serving 决策需按冻结的端到端 SLO 分母而非 token 吞吐作选择。
- Exact structural mapping, tension or manipulated constraint: 生产线的启动/在制品/交付期限映射到 prefill/KV 占用/TTFT–TPOT；不预设是否存在差异。
- Counterfactual consequence if the idea were true: runtime 配置选择或 benchmark 报告的优先级会改变。
- Likely generic/current-union/changed-object risk: `METRIC_REPACKAGING` 或已有端到端 benchmark 已直接覆盖。
- Evidence needed before it can become a locator: 一个版本化运行时、明确的 SLO 定义和公开计量边界。
- Relation to existing seed/family: `FRESH_SKETCH`
- Generic-shell noun-swap test: `PASS`
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`

### `S4-103-02`

- Engine: `PROBLEM_REFRAMING`
- Perspective role: `MEASUREMENT_REVIEWER`
- Starting anchor or hunch: 单 GPU serving benchmark 的比较单位可以从平均吞吐改为在明确到达过程下的可交付请求集合。
- Exact public anchor candidate and version/date if already known: 公开 LLM serving benchmark suite 或公开 trace-driven serving evaluation。
- Intended source role: `ANCHOR`
- Two-sentence idea sketch: 如果不同系统对 warm-up、排队和 timeout 的处理不同，固定窗口吞吐可能不足以表示哪个系统满足同一服务目标。研究对象是 benchmark 有效性或排序稳定性，而非把已有指标改名。
- Conclusion-first test: 若成功，最谨慎的结论是：在一个冻结 serving workload 类中，现有比较协议无法稳定支持某项部署决策。
- Exact structural mapping, tension or manipulated constraint: 将“测得 token 数”与“在 deadline 内完成的请求”并列为不同 estimand。
- Counterfactual consequence if the idea were true: runtime 或系统选择的排序可能需要更正。
- Likely generic/current-union/changed-object risk: 可能只是常识性 metric 扩展，或 benchmark 已有完整 deadline 语义。
- Evidence needed before it can become a locator: benchmark 的精确协议、系统事件边界和一个可复核决策阈值。
- Relation to existing seed/family: `FRESH_SKETCH`
- Generic-shell noun-swap test: `PASS`
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`

### `S4-103-03`

- Engine: `CONSTRAINT_MANIPULATION`
- Perspective role: `MAINTAINER`
- Starting anchor or hunch: 请求容量限制通常被抽象为 KV cache 容量，但单 GPU 真实可用容量还受权重、临时 buffer、allocator fragmentation 与 graph/workspace 约束共同影响。
- Exact public anchor candidate and version/date if already known: 公开支持 paged/pooled KV 的单 GPU serving runtime。
- Intended source role: `CURRENT`
- Two-sentence idea sketch: 冻结同一模型、精度和服务语义后，比较“名义 KV token 容量”与可持续 SLO 容量是否形成可测的决策偏差。潜在贡献必须是可解释的容量模型或机制，而不是又一个内存统计面板。
- Conclusion-first test: 若成功，最谨慎的结论是：一个明确的容量估计量能减少同对象 single-GPU serving 的错误准入或过度保守准入。
- Exact structural mapping, tension or manipulated constraint: 释放“KV 独占显存”的简化假设，同时固定模型、精度、SLO 与端到端成本边界。
- Counterfactual consequence if the idea were true: capacity planning 或 admission policy 的输入会改变。
- Likely generic/current-union/changed-object risk: 当前 runtime 已有同语义 memory planner；或仅是工程 telemetry。
- Evidence needed before it can become a locator: 当前 memory accounting source locus、计量对象与最小 falsifier。
- Relation to existing seed/family: `FRESH_SKETCH`
- Generic-shell noun-swap test: `PASS`
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`

### `S4-103-04`

- Engine: `NEGATION_OR_INVERSION`
- Perspective role: `END_USER`
- Starting anchor or hunch: 若性能目标不再是最大化稳态吞吐，而是最小化首个交互回合的风险，batching 或 cache 优化的公平比较器可能变化。
- Exact public anchor candidate and version/date if already known: 公开 interactive LLM serving runtime 与其 TTFT/TPOT 指标定义。
- Intended source role: `ANCHOR`
- Two-sentence idea sketch: 固定相同模型输出语义和请求集，考察低 TTFT 配置是否通过不可见地牺牲后续 TPOT、内存驻留或能耗而获得 headline。潜在机会是一个 Pareto 机制或测量有效性问题，不预设任何系统存在该现象。
- Conclusion-first test: 若成功，最谨慎的结论是：同一 interactive serving 选择必须在显式 TTFT–TPOT–memory/energy 合同下比较。
- Exact structural mapping, tension or manipulated constraint: 将优化目标由稳态 throughput 翻转为首次交互风险，其他语义保持固定。
- Counterfactual consequence if the idea were true: benchmark 报告或系统调参的 Pareto 前沿会改变。
- Likely generic/current-union/changed-object risk: 多目标报告可能已是已有工作的直接组成部分。
- Evidence needed before it can become a locator: 明确的 current metric definition、配置入口与全成本边界。
- Relation to existing seed/family: `FRESH_SKETCH`
- Generic-shell noun-swap test: `PASS`
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`

### `S4-103-05`

- Engine: `ABSTRACTION_LADDER`
- Perspective role: `COMPILER_OR_BACKEND_ENGINEER`
- Starting anchor or hunch: 同一 kernel-level speedup 在 serving 层可能因 batch shape、KV pressure 或 queue state 而不改变 SLO 决策。
- Exact public anchor candidate and version/date if already known: 公共低比特/attention kernel 路径与其上层 serving runtime。
- Intended source role: `ESCAPE`
- Two-sentence idea sketch: 从 kernel 层向上抽象，定义何时某类 local latency reduction 能跨越 serving 层的决策阈值。若可形成可证伪的 threshold model，贡献应是跨层决策条件而不是把 kernel benchmark 搬到 serving 图表。
- Conclusion-first test: 若成功，最谨慎的结论是：在固定 serving 合同下，一个可计算阈值可预测哪类 backend 改动值得部署。
- Exact structural mapping, tension or manipulated constraint: local operator latency 映射到端到端 deadline slack；保持同一输出/精度语义。
- Counterfactual consequence if the idea were true: compiler/kernel 选择的优先级会改变。
- Likely generic/current-union/changed-object risk: 退化为普通 roofline 或无可验证阈值的 profiling。
- Evidence needed before it can become a locator: 公开 backend–runtime 接口、current measurement locus 与可反证 threshold。
- Relation to existing seed/family: `FRESH_SKETCH`
- Generic-shell noun-swap test: `PASS`
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`

### `S4-103-06`

- Engine: `BISOCIATION_STRUCTURAL_TRANSFER`
- Perspective role: `THEORIST`
- Starting anchor or hunch: 有限显存 serving 可类比为带保留区间与 deadline 的在线资源分配，而不是静态 bin packing。
- Exact public anchor candidate and version/date if already known: 公开单 GPU KV/session cache 管理实现或 specification。
- Intended source role: `ANCHOR`
- Two-sentence idea sketch: 固定 runtime 的 native cache/action interface，问是否存在可审计的在线约束构造，能在同一 information contract 下改善某个明确的 SLO–capacity Pareto。该 seed 只提出机制空间，不声称已有 runtime 缺少该动作。
- Conclusion-first test: 若成功，最谨慎的结论是：一个在线资源决策在特定自然请求结构下改变可接受的 SLO/capacity 前沿。
- Exact structural mapping, tension or manipulated constraint: reservation interval 映射到 KV 生命周期，deadline 映射到 request completion contract。
- Counterfactual consequence if the idea were true: cache/admission 动作或理论保证会改变。
- Likely generic/current-union/changed-object risk: 容易退化为通用 online scheduling，或已被 native scheduler 吸收。
- Evidence needed before it can become a locator: native action interface、information boundary 与非通用判别点。
- Relation to existing seed/family: `FRESH_SKETCH`
- Generic-shell noun-swap test: `PASS`
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`

### `S4-103-07`

- Engine: `ADJACENT_POSSIBLE_OR_BOUNDARY`
- Perspective role: `HARDWARE_ARCHITECT`
- Starting anchor or hunch: 单 GPU serving 的 energy estimate 往往跨越 GPU、CPU、memory、cold/warm state 与 request completion，但可获得公开观测面可能只覆盖其中一部分。
- Exact public anchor candidate and version/date if already known: 公开 serving benchmark 与公开 GPU/host telemetry interface。
- Intended source role: `ANCHOR`
- Two-sentence idea sketch: 候选不是“补一个能耗列”，而是验证一个能否改变 system choice 的 energy/cost measurement boundary。若能显示某一可访问估计量在固定条件下误导 Pareto 决策，贡献需包括机制与可复核的 correction/falsifier。
- Conclusion-first test: 若成功，最谨慎的结论是：一个具体可访问的 energy/cost protocol 是某类 single-GPU deployment 比较的必要条件。
- Exact structural mapping, tension or manipulated constraint: 将 device power sample、host work 和 completion-time denominator 的边界显式化。
- Counterfactual consequence if the idea were true: runtime/硬件配置的能效排序会改变。
- Likely generic/current-union/changed-object risk: 因缺传感器资源而不能闭合，或只是 measurement hygiene。
- Evidence needed before it can become a locator: 公开可重放 telemetry、明确 estimand、混杂路线和 decision threshold。
- Relation to existing seed/family: `FRESH_SKETCH`
- Generic-shell noun-swap test: `PASS`
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`

### `S4-103-08`

- Engine: `CONSTRAINT_MANIPULATION`
- Perspective role: `OPERATOR`
- Starting anchor or hunch: cold-start、模型装载、graph capture 与 warm serving 在公开 benchmark 中可能被不同方式计入。
- Exact public anchor candidate and version/date if already known: 公开 runtime 的 startup/capture documentation 和 benchmark harness。
- Intended source role: `CURRENT`
- Two-sentence idea sketch: 在固定服务场景下，改变“首次请求是否必须包含 setup”这一合同，可能产生不同的系统选择。研究机会只有在能形成自然 deployment regime、稳定结论和 correction action 时才成立。
- Conclusion-first test: 若成功，最谨慎的结论是：某个明确 deployment regime 需使用区分 cold/warm 的 serving decision rule。
- Exact structural mapping, tension or manipulated constraint: 仅操纵 setup 的合同边界，不改模型输出、请求或系统对象。
- Counterfactual consequence if the idea were true: 选择预热、并发策略或 runtime 配置的判断会改变。
- Likely generic/current-union/changed-object risk: 只是 benchmark 报告建议，或已由当前 harness 明确控制。
- Evidence needed before it can become a locator: current harness/source locus、regime definition、可反证 ranking/decision threshold。
- Relation to existing seed/family: `FRESH_SKETCH`
- Generic-shell noun-swap test: `PASS`
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`

### `S4-103-09`

- Engine: `ABSTRACTION_LADDER`
- Perspective role: `MEASUREMENT_REVIEWER`
- Starting anchor or hunch: roofline/cost model 的价值取决于它何时正确改变 deployment decision，而非相关系数或拟合误差本身。
- Exact public anchor candidate and version/date if already known: 公开 LLM inference serving cost/roofline model 或同类 profiling artifact。
- Intended source role: `ANCHOR`
- Two-sentence idea sketch: 将 model 从“预测器”下沉为“选择器”，测试其在明确 candidate set 上的 decision regret 和边界条件。若可闭合，候选可能属于 measurement characterization 或 performance model，而非另一个 dashboard。
- Conclusion-first test: 若成功，最谨慎的结论是：一个冻结成本模型在某类 serving decision 上具有或不具有足够的可用性。
- Exact structural mapping, tension or manipulated constraint: 拟合误差映射到选择错误、SLO 违规或容量浪费的决策后果。
- Counterfactual consequence if the idea were true: 是否信任模型指导 deployment 的条件会改变。
- Likely generic/current-union/changed-object risk: 普通 model validation，或缺少自然 carrier/可复核 action。
- Evidence needed before it can become a locator: versioned model、可访问 input/output、candidate decision set 和 minimum falsifier。
- Relation to existing seed/family: `FRESH_SKETCH`
- Generic-shell noun-swap test: `PASS`
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`

### `S4-103-10`

- Engine: `PROBLEM_REFRAMING`
- Perspective role: `END_USER`
- Starting anchor or hunch: interactive session quality 可由首轮与持续回合共同定义，而并非独立比较 TTFT 或 TPOT。
- Exact public anchor candidate and version/date if already known: 公共多轮/长会话 LLM serving workload 或 trace。
- Intended source role: `ANCHOR`
- Two-sentence idea sketch: 在同一会话到达与输出合同下，构造一个可证伪的 session-level utility/constraint，检查独立指标是否会选出错误的 scheduler/cache policy。该想法必须避免把主观 UX 聚合偷换为无锚点指标。
- Conclusion-first test: 若成功，最谨慎的结论是：一个自然 session regime 需要以联合约束而非两个独立均值作 serving 决策。
- Exact structural mapping, tension or manipulated constraint: 用户感知回合映射到请求级 TTFT/TPOT，联合约束必须有公开 workload 锚点。
- Counterfactual consequence if the idea were true: session-serving policy 的比较与选择会改变。
- Likely generic/current-union/changed-object risk: 主观 utility 不可证伪，或现有 SLO 已表达联合语义。
- Evidence needed before it can become a locator: 公开会话 carrier、精确定义的 estimand 与最小反例。
- Relation to existing seed/family: `FRESH_SKETCH`
- Generic-shell noun-swap test: `PASS`
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`

### `S4-103-11`

- Engine: `JANUSIAN_TENSION`
- Perspective role: `MAINTAINER`
- Starting anchor or hunch: cache reuse 可降低 prefill 工作，但更长的 cache residency 也可能压缩可接纳请求数；两者不能只用单一 hit rate 表示。
- Exact public anchor candidate and version/date if already known: 公开 prefix/KV cache runtime 与公开长会话或重复前缀 workload。
- Intended source role: `CURRENT`
- Two-sentence idea sketch: 固定 prefix reuse 语义，检验 hit-rate 优化何时跨越 capacity/SLO 临界点并反向损害可完成请求数。潜在机制必须是 target-specific cache residency/action，而不是一般“缓存有权衡”。
- Conclusion-first test: 若成功，最谨慎的结论是：在一个明确 serving regime 中，cache reuse policy 要依据可复核的 occupancy–deadline 条件选择。
- Exact structural mapping, tension or manipulated constraint: 复用收益与驻留成本同时进入完整 SLO/capacity 分母。
- Counterfactual consequence if the idea were true: prefix/KV policy或评估协议会改变。
- Likely generic/current-union/changed-object risk: 直接被 current cache policy 或已有 long-context serving 文献覆盖。
- Evidence needed before it can become a locator: native action source locus、current flags、workload carrier 与强反方。
- Relation to existing seed/family: `FRESH_SKETCH`
- Generic-shell noun-swap test: `PASS`
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`

### `S4-103-12`

- Engine: `COMPOSE_DECOMPOSE_SIMPLIFY`
- Perspective role: `COMPILER_OR_BACKEND_ENGINEER`
- Starting anchor or hunch: 将端到端 serving 的成本拆分为 static model residency、per-request compute、per-session state 和 shared queue overhead，可能暴露“同一吞吐但不同 capacity risk”的可检验构造。
- Exact public anchor candidate and version/date if already known: 可公开复现的单 GPU runtime、模型配置和 benchmark harness。
- Intended source role: `ANCHOR`
- Two-sentence idea sketch: 尝试从完整成本分解中找出能驱动一个新配置或 planner 决策的最小状态变量集合。若只剩报表分解而不能改变同对象决策，则该 seed 必须淘汰。
- Conclusion-first test: 若成功，最谨慎的结论是：一个明确的 full-cost decomposition 足以支持并检验 single-GPU serving 的配置选择。
- Exact structural mapping, tension or manipulated constraint: 拆解状态与共享成本，要求保留 output、precision 和 service semantics。
- Counterfactual consequence if the idea were true: capacity/configuration planner 的输入或优先级会改变。
- Likely generic/current-union/changed-object risk: 通用成本模型或现有 profiler 直接覆盖。
- Evidence needed before it can become a locator: 可重放计量路径、一个决策 action 与完整成本合同。
- Relation to existing seed/family: `FRESH_SKETCH`
- Generic-shell noun-swap test: `PASS`
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`

## Clustering and genealogy

| Cluster | Seed IDs | Shared object/mechanism | Material differences | Representative seed |
|---|---|---|---|---|
| A | 01, 02, 04, 08, 10 | SLO/full-cost measurement and decision validity | request, benchmark, cold/warm, session contracts | S4-103-02 |
| B | 03, 06, 11, 12 | memory/KV/capacity constrained serving | estimator, online action, prefix residency, decomposition | S4-103-03 |
| C | 05, 09 | cross-layer performance-model decision threshold | backend-to-serving versus model-to-selection | S4-103-09 |
| D | 07 | energy/full-cost measurement validity | publicly observable energy boundary | S4-103-07 |

## Coverage-constrained convergence

不得使用可补偿总分或强制 Top-N。先冻结选择，再进入 Research Question 收敛；这里不直接生成 locator，也不得开始外部证据检索。

| Selected seed | Why this preserves portfolio coverage | Intended object/problem boundary | RQ Candidate ID |
|---|---|---|---|
| S4-103-02 | benchmark validity / deployment decision | versioned single-GPU LLM-serving benchmark protocol | S4-103-RQ01 |
| S4-103-03 | capacity-model mechanism | native single-GPU KV/memory accounting and admission | S4-103-RQ02 |
| S4-103-07 | energy/cost estimand | public telemetry and end-to-end serving energy protocol | S4-103-RQ03 |
| S4-103-09 | performance-model decision validity | versioned public serving cost/roofline model | S4-103-RQ04 |
| S4-103-11 | cache residency Pareto | prefix/KV cache action under fixed session contract | S4-103-RQ05 |

## Append-only backlog

S4-103-01、S4-103-04、S4-103-05、S4-103-06、S4-103-08、S4-103-10、S4-103-12 保留为本波非证据 backlog；不得计入机会数、论文机会数或 precision 分母。五个选中 seed 保留了测量有效性、资源容量、能耗边界、决策模型和 cache Pareto 五个不重叠的机会入口；该收敛发生在定向证据结果前。

## Advisory

- Engines used: 8/8
- Perspective roles used: 7/7
- Largest object/surface share: single-GPU interactive LLM serving 的 SLO/full-cost measurement surface。
- `DIVERGENCE_COVERAGE_ADVISORY`: `PASS`
- Plain-Chinese note: 这一池是待核验的单 GPU serving 目标/约束问题集合；没有声称任何 runtime、benchmark 或论文目前缺少相应能力。
