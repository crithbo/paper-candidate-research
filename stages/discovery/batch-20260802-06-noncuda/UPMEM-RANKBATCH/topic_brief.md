# UPMEM-RANKBATCH Transfer-accounted rank co-batching for PrIM workloads

- Status: `PROPOSE_STAGE0`
- Primary lane: pim_runtime_system
- Discovery date: 2026-08-02

## Research question

在 UPMEM/PrIM 的真实 benchmark workload 中，能否通过 rank 内多作业的 cohort 形成与 DPU 配额选择，在 host–DPU 传输、barrier 和不均衡成本完整计入后降低 tail completion time，而非仅改善 kernel time？

## Importance and group fit

PrIM 提供跨线性代数、数据库、图、神经网络和生信的公开 PIM workloads。PIM 运行时通常按单作业静态分配 DPU；共享 rank 时的 transfer/barrier 与 straggler 共同决定系统级完成时间，且不需要假设不存在的 PIM 内部归约层。

## Exact object

固定 UPMEM DPU/rank 抽象和至少两类 PrIM 作业的到达序列；决策变量为 cohort、每作业 DPU 配额和 host 传输批次。指标为 job P50/P99 completion time、吞吐与 host↔DPU byte/command/barrier 账本。

## Strongest fair baseline

FIFO exclusive-rank、静态等分 DPU、多作业但不考虑 transfer/barrier 的 work-conserving allocation，以及单作业 PrIM 原生配置。

## Mechanism hypothesis

由每个 job 的 compute/transfer/barrier phase vector 预测可互补 cohort，使用 rank reservation 防止短 job 被长 tail 和同步点吞没。

## Competing mechanisms

- Mechanism A: phase-vector complementary pairing/cohorting。
- Mechanism B: deadline/slack-aware DPU quota with bounded reallocation。
- Optional mechanism C: host transfer coalescing with explicit queue-delay cap。
- Preferred mechanism and why: A；它先验证自然 phase 互补是否存在，避免无依据的通用调度包装。

## Candidate paper claim

在公开 PrIM 组合中，transfer-accounted phase cohorting 可降低 tail completion time，且不会以增加 host–DPU traffic 或牺牲单作业正确性为代价；否则 claim 失败。

## Current collision subtraction

`DEPLOYMENT_BASELINE`：PrIM 与 UPMEM characterization 是对象和强基线来源。该题不重提已停止的 PIM reduce hierarchy，也不调度 PRAC/security credit；残差是面向真实 workload phase 的 rank-level co-batching 与完整系统账本。`SEARCH_BOUNDED_OPEN`。

## Decisive falsifier

真实 PrIM workload pair 没有可重复 phase 互补，或任何 P99 降低都被额外 host traffic/barrier 和 FIFO/等分配抵消。

## Executable evidence path

PrIM 源码、UPMEM SDK（若可获得）或明确标为分析模型的 microbenchmark 参数。无实机时只能验证机制模型和可执行 host-side policy，不能声称实际 PIM speedup。

### 72-hour first evidence

从至少四个 PrIM workloads 收集/重放 phase 和数据移动记录，构造两个到达序列，比较 FIFO、等分、phase cohort policy 的 complete-time 与 byte/command ledger。

### AI core fraction and critical path

`65%`, `AI_CORE_CONDITIONAL`：AI 可实现 replay/optimizer 与账本；可得 SDK/合法模拟环境决定是否能闭合真实执行证据。若无法取得，应转人工研究储备而非 STOP。

### Semantics-preserving open alternatives

公开 PrIM + 可审计 phase model 是最小替代；模型与实机 SDK/硬件必须分开报告。

## Dual-axis score

- Academic value: `51/70`
- AI executability bonus: `21/30`
- Total: `72/100`

## AI and researcher boundary

AI 可做第一性账本和 policy；是否拥有合规 SDK/硬件、以及最终实机结论须由研究者授权与验证。
