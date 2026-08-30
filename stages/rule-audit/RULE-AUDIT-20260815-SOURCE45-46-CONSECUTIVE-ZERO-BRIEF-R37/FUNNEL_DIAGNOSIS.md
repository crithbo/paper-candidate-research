# Source45–46 漏斗诊断

## 合并漏斗

| 位置 | Source45 | Source46 | 合计与含义 |
|---|---:|---:|---|
| 完整 lane | 6 | 6 | 12/12 已完成 |
| evidence-qualified raw | 3 | 3 | 6，全部来自 S2 |
| C0/deep | 0 | 0 | 六项均被立即 contract/current-action subtractor 终止 |
| clean brief | 0 | 0 | 两周期连续零 |
| concrete open closure | 1 | 0 | 仅 Source45 S4 MLPerf；是资源/来源闭合，不是候选负证据 |

## 六个 raw 是否是漏审

不是。六项均有相同的结构：把一个成熟产品/编译器/运行时已经公开的 API、DSL、command buffer、copy、binding 或 constructor 表面作为载体，再设想“联合构造”；决定性来源随后显示，候选要么已经在 current action union 内，要么只剩通用 packing、scheduling、binding、copy 或 wrapper。

- Source45：Vulkan sparse binding、OpenMP rectangular transfer、Kokkos mirror/deep-copy。
- Source46：TVM TIRx TMA descriptor/issue、MSCCL++ channel/DSL、IREE HAL transfer/update。

这些 structural drop 是健康 abstention：没有因为缺实现、缺结果、AI readiness、硬件或资源而判死，也没有把 `SEARCH_BOUNDED_OPEN` 偷换成新颖性证明。由于六项在 C0/deep 前即结束，直接计算浪费不大。

但它们共同暴露一个上游质量问题：连续两个周期的全部 raw 都来自同一类“成熟产品表面 × constructor/composition”问题。raw 数量看似为 6，实际没有一个具备独立 target-state transition、形式保证、测量 estimand 或自然规律后果。当前瓶颈不是 raw 到 Stage 0 的审查速度，而是 selected RQ portfolio 的贡献类型和机制残差过于集中。

## 各 lane 的失效类型

| Lane | 重复表现 | 审计分类 |
|---|---|---|
| S1 | current primitive、ABI caller-saved、generic placement/lowering/joint scheduling | 多数为健康 current-union/generic abstention |
| S2 | 两轮各 3 raw，全部成熟 product/API/DSL constructor 后结构坍缩 | 主要瓶颈：题源/机制残差组合失衡；不是 Stage 0 过严 |
| S3 | 两轮均 4 locator、0 RQ/raw | 前端执行/题源具体化缺口：自然载体、同对象端点和可利用动作未形成 |
| S4 | Source45 一条 exact MLPerf closure；Source46 6 个 RQ 仍无 exact carrier/estimand/falsifier | measurement 入口方向正确但供给稀少；queue 诚实，来源闭合尚未完成 |
| S5 | 两轮各有 RQ variants，但 0 raw/queue | 规模/在线/近似问题仍停留在抽象算法壳或缺 exact carrier |
| S6 | 现有编译器 pass/native action 吸收，另有 locator-only | 健康 subtractor 为主；未形成新的 target-specific action grammar |

## Identity、queue 与类型路由

- **Identity 不是已识别主瓶颈。** 两轮均保留 `RELATED_ONLY` 非排除语义，也没有复活 Source43/44/45 bounded、active 或 terminal identities。没有 late identity reconciliation 证据。
- **Queue 规则工作正常。** MLPerf 路线冻结了单一项目选择规则、三种 source role、预调用计数与 `OPEN_BOUNDED__NO_SCIENTIFIC_INFERENCE`；它没有被错误写成 exhausted。其在途 prebrief closure 应独立完成，不得作为 Source47/后续周期的结果感知补位。
- **类型路由失衡。** 两轮所有 raw 都是 `COMPILER_TOOL/SYSTEM` 风格的 constructor/composition；measurement、N3、formal/theory 没有形成 raw。问题不是这些类型应获配额，而是当前 source portfolio 没有给它们形成 exact carrier/estimand 的同等机会。
- **Stage 0 职责没有被证明过严。** Source44 bridge 将完整 current union、最强碰撞、两计划 witness 与 Q2 交给独立 Stage 0；PRIMARY 与 confirmation 都认为存在有限、同对象的 revision 门，而非立即 STOP。Stage 0 对 generic four-state dataflow 的攻击正是其职责，不应前移到 Discovery 证明完整 target-specific theorem。

## 最强反方

“Source45/46 的六个 raw 都快速淘汰，说明系统精度很高；改变题源只会人为避开真实负面并降低可比性。”

这个反方成立一半：六个 drop 应保留为健康负例，不能为提高 yield 而救活。但两个完整周期的 raw 全部集中在同一成熟产品构造类型，且 S3–S5 连续未形成精确入口，已经足以支持一次可撤销的 source-portfolio 调度实验。该实验不改变任何录取门，也不要求产出 brief；它只检验换一种预先冻结的来源/贡献类型组合能否提高“可行动 residual”的覆盖。

## 限制

- Source44 只有一个 clean brief，RVV revision1 尚未终裁；不能宣称 ownership bridge 已提高 Stage A yield。
- MLPerf closure 在途；不能用未知结果支持或反对 measurement 入口。
- Source45/46 不是随机配对样本；模型、日期和历史饱和共同作用，不能做严格因果归因。

