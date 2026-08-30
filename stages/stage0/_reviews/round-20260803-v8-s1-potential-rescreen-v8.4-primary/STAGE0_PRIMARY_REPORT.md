# Stage 0 PRIMARY potential rescreen — S1-O6-MOBILE-TRAFFIC-CRITICALITY

## 结论

- Assignment: `STAGE0-P1-20260809-S1-O6-MOBILE-TRAFFIC-CRITICALITY-POTENTIAL-RESCREEN-V8.4`
- PRIMARY recommendation: `RESERVE_RECOMMENDED`, `PENDING_CONFIRMATION`
- Structural paper potential: `TIER_B_Q2_VIABLE` (条件性；非 Q1 推荐)
- Current evidence readiness: `LOW_BUT_FINITE_ROUTE`
- Stage A/B authorization: `false / false`
- Prior `BELOW_Q2_STOP`: **不继承且不构成学术 STOP**。`SCOPE_CORRECTION.md` 已将其唯一依据（非原子旧门）改正为 `NONATOMIC_GATE_NOT_SUFFICIENT_FOR_ACADEMIC_STOP`。

这不是因缺 trace、实现、手机硬件或下载而保留。该建议的原因是：若研究成功，论文核心需要研究者主导地冻结跨层 QoS 因果契约、微体系结构和自然请求映射；AI 可完成资料、模型、仿真/账本辅助，但不主导该核心研究判断。故其学术潜力达到 Q2 最低线，AI 适配性建议进入 `HUMAN_RESEARCH_RESERVE`，仍须 confirmation sentry 复核。

## 两轴判定

| 轴 | 判定 | 依据与边界 |
|---|---|---|
| STRUCTURAL_PAPER_POTENTIAL | `TIER_B_Q2_VIABLE` | 同一 mobile XPU 共享 NoC/DRAM 的**首个共享仲裁点**，从请求来源、workload-criticality、deadline/budget 到仲裁动作、带宽/饥饿/公平的可验证契约，若能在等质量、全成本账本中产生非支配点，是可辨认的 N1（可附 N2 policy）。现有资料没有证明这一因果契约必然被同对象基线全覆盖。 |
| CURRENT_EVIDENCE_READINESS | `LOW_BUT_FINITE_ROUTE` | 目前没有 source-bound mobile request→first-arbiter trace、确切 SoC contract 或同对象结果；但 Sereno 的商业手机自然工作负载和公开 XSched/AXI 机制给出有限、可复现的后续取得路线。此状态不推出 STOP、reserve 或 archive。 |

## 单一条件性论文命题与反证

**命题 P（不拆成名义子 gate）**：在冻结的 mobile UI/LLM（或 camera/ISP+LLM）自然请求映射及其第一个共享 NoC/DRAM 仲裁点上，存在一个以请求来源和 workload-criticality 约束、并同时计入 tag/path、队列、仲裁、带宽、DRAM、功耗和 starvation/fairness 的因果 QoS contract；相较于信息预算相同的 native per-transaction QoS，它能得到至少一个等质量的非支配 QoS 点。

P 若成功，是 N1：不是增加一个 QoS 数字，而是把应用语义的来源/预算/截止约束保持到真正决定竞争的请求级仲裁动作，并规定公平与退化行为。P 可以被一个有限的对照证伪：在同一 source-bound trace、相同请求信息预算与全成本 ledger 下，native transaction-QoS 对照已经复现每一个候选 QoS 点，或候选只是在设置既有 `AxQOS` 值而没有独立的 contract-preserving action，则 N1 被吸收，应 STOP；此反证尚不存在。

## Exact object 与公平边界

冻结对象没有改为泛化“QoS”。它是：共享 NoC/DRAM 的 mobile XPU 情景中，背景 LLM 与前台 deadline/quality-sensitive traffic 的竞争；对象在**第一个共有仲裁点**以 request-level class/budget 参与仲裁，保持相同应用质量、热/功耗约束和 starvation/fairness。论文不能宣称厂商 API 已普遍暴露；Arm AXI 的 4-bit `ARQOS/AWQOS` 与 AMD Versal 的 transaction QoS 证明了直接 subtractor，亦因此必须成为基线，而不是候选的新颖性证据。

有限公平基线（不是万能 union）：

1. 现有 accelerator-wide priority + FR-FCFS/weighted arbiter；
2. Sereno 的软件 yield / speculative-decoding intervention；
3. XSched 的 command-level preemption/priority；
4. **native per-transaction QoS encoding**：使用与候选等宽 class/budget 信息的 `AxQOS`/本机可实现等价优先级策略。

EDF 仅作资源无穷、约束相同的 offline ceiling，不能替代部署基线。四者分别覆盖静态仲裁、软件让出、命令队列和事务级 QoS；它们没有自动构成“union STOP”。

## 碰撞、N1/N2/N3 与 claim ceiling

- `DIRECT_FATAL`: 否。AXI/Versal 的事务 QoS 是当前直接 subtractor；XSched 是 command-level；Sereno 是软件 yield。冻结材料和本轮一手核验均未显示一个同时覆盖 mobile first-arbiter 的 provenance+deadline/budget contract、相同 full-cost、同一自然目标及候选 N1 主张的工作。
- `N1`: 条件性通过。请求来源—criticality—budget 到首仲裁点的可检查 contract；成功后可声明该 abstraction 与 protocol。
- `N2`: 仅辅助。contract 下 bounded-starvation / bandwidth policy 的算法；不能以普通 priority reweighting 单独成文。
- `N3`: 不作为核心主张；Sereno 提供自然干扰存在的锚点，不证明该题的 request-level residual。
- Claim ceiling（当前）：只能称为“候选性同对象机制与可证伪研究设计”；不得称自然 trace gain、硬件可部署、QoS theorem、厂商 API 可得或性能改进。

## 72 小时最小 killer（未执行）

`FIRST_ARBITER_CAUSAL_DELTA_VS_NATIVE_TRANSACTION_QOS`：先固定一个公开可审计的 mobile UI/LLM 请求映射、具体 first-arbiter contract、相同 3-level 信息预算和 cold/steady 全成本 ledger；再比较候选 contract 与 native transaction-QoS。若 native baseline 覆盖候选的全部质量—jank/latency—LLM throughput—公平点，或候选行动可化约为 `AxQOS` 写值，即停止。它同时检验 P 的因果增量、same-object 公平性和全成本，而非旧的语义/映射/Pareto 三个拼接门。

获取路线有限且可复核：使用 Sereno 已公开的商业手机问题定义与工作负载协议作为自然锚点，收集一个可授权的 request-to-first-arbiter trace/contract，再在硬件中性模型中复现四个基线；不得补造 trace 或以无 trace 的合成输入宣称自然优势。尚未请求任何用户资源，故 `user_blocker_required: false`。

## 学术与 AI 评分（本轮独立、仅作排序）

| 项 | 分数 | 说明 |
|---|---:|---|
| Academic | 51 / 70 | 自然问题和 N1 形状成立；native QoS subtractor 使 residual 风险高，尚不足以推荐 Q1。 |
| AI execution | 4 / 30 | 可辅助信息流追踪、模型和 ledger；核心因果契约、微体系结构与自然解释需要人主导。 |
| Total | 55 / 100 | 不替代 tier 裁定。 |

## 通过/停止门

- `TIER_B_Q2_VIABLE` 的条件性通过门：P 的机制若成立，仍有清晰 N1、有限公平基线、自然对象与全成本路线；本审已满足。
- 未来科学停止门：相同 source-bound object 上，基线 4 完整吸收候选全部点，或 P 退化为普通 transaction-QoS 设置；届时才可 STOP。
- readiness 风险：trace 与具体 arbiter contract 尚待获取，且必须保持所列对象。它不是本轮 STOP 或资源 blocker。

## 来源核验

本轮仅核验冻结谱系与直接 subtractor，未做新 Discovery。USENIX OSDI'26 的 Sereno 页面确认了 mobile LLM/foreground 干扰、软件 yield 与商业手机评测；OSDI'25 XSched 页面确认其是 preemptible command queue abstraction；Arm AXI 规范与 AMD Versal TRM 确认每事务 QoS 标识/信号。这些来源支撑基线范围和问题自然性，不支撑候选效果。

详见 [SOURCE_AUDIT.md](SOURCE_AUDIT.md) 与 [Q1_Q2_COMPARATOR_MATRIX.md](Q1_Q2_COMPARATOR_MATRIX.md)。
