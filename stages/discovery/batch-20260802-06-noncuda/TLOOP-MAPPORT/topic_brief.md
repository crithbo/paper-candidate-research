# TLOOP-MAPPORT Reconfiguration-aware mapping portfolios for accelerator deployment

- Status: `PROPOSE_STAGE0`
- Primary lane: accelerator_design_automation
- Discovery date: 2026-08-02

## Research question

对于固定 EDDO/accelerator 架构和具有自然 shape 分布的模型工作负载，能否选择小型 mapping portfolio 与可审计切换策略，在重新配置、编译存储和 metadata 成本计入后支配单一全局 mapping 与逐 shape 最优 mapping？

## Importance and group fit

Timeloop/Accelergy 将 architecture、workload 和 mapping 分离，并可搜索 mapspace；部署时常被迫在一个 mapping、海量 per-shape mapping 与有限存储/切换之间取舍。该问题是部署级 mapping portfolio，不是重跑 mapper 或普通调参。

## Exact object

固定 Timeloop/Accelergy architecture 与 workload family（公开 DNN layer shapes）；决策变量为不超过 K 个合法 mapping、shape-to-mapping assignment 及切换/descriptor 策略。目标为期望延迟/能耗与 tail penalty，成本包括 mapping descriptor、切换与任何外存访问模型。

## Strongest fair baseline

Timeloop mapper 针对每 shape 的 EDP/energy/delay 最优 mapping、单一全局 mapping、以及 K-medoids/按 shape 聚类但不计重配置的 portfolio。

## Mechanism hypothesis

从 mapping 的 resource-slack signature 而非仅 shape 距离构造候选；用 transition-aware objective 避免把频繁切换的 mappings 误判为最优。

## Competing mechanisms

- Mechanism A: 基于资源 slack/访问层次 signature 的 portfolio 列生成。
- Mechanism B: 以 Markov shape 序列加权的切换成本 regularization。
- Optional mechanism C: 保守 robust portfolio，优化分布漂移下的 regret 上界。
- Preferred mechanism and why: A+B；分别检验“mapping 相似性”与“序列切换”是否提供真实 residual。

## Candidate paper claim

在公开 shape trace/模型层序列上，资源签名 + transition accounting 的 K-mapping portfolio 能在固定 K 和完整 descriptor/switch 成本下形成非支配点；没有非支配点即否定。

## Current collision subtraction

`DEPLOYMENT_BASELINE`：Timeloop mapper、各类 design-space/mapping search 提供强端点。未声称新的 accelerator 或 mapper heuristic；残差是**部署时有限 portfolio 的 transition-aware 决策**。`SEARCH_BOUNDED_OPEN`。

## Decisive falsifier

所有 K>1 portfolio 在计入 descriptor/switch 后均被单 mapping 支配，或 K-medoids 不看资源签名即达到同等结果。

## Executable evidence path

Timeloop/Accelergy 公开模型、workload YAML 和 mapper 输出。首轮证据是明确标注的 analytical/model evidence，不称真实硬件性能。

### 72-hour first evidence

在一个公开 accelerator config、两个模型的 layer-shape 序列上，运行 mapper 得到候选集，比较三类 policy 的 EDP/energy/delay、portfolio bytes 和切换账本。

### AI core fraction and critical path

`88%`, `AI_CORE_EXECUTABLE`：AI 可生成实验合同、调用 mapper、实现 portfolio optimizer、复算成本与消融；研究者审核成本模型与外推边界。

### Semantics-preserving open alternatives

Timeloop model 为首证据；后续 RTL/FPGA 只提高 evidence ceiling，不能将模型输出表述为实现 PPA。

## Dual-axis score

- Academic value: `53/70`
- AI executability bonus: `27/30`
- Total: `80/100`

## AI and researcher boundary

AI 可完成核心 artifact；所有结论必须标作 mapping/model 层，并对 transition cost 的真实性做敏感性分析。
