# Devil's-advocate review

## `GPU-TMAPHASE`

- 最强反方：Tawa 通过安全 IR 阻止协议构造错误，Compute Sanitizer 在运行时覆盖 race/sync/deadlock，GPUVerify/GPUMC 覆盖静态或弱内存；新工具只是把三者包装起来。
- 致命点：任意 lower 后 PTX 的 phase、participant mask 和 transaction count 会导致状态爆炸；若只能报告“可能死锁”或同一批 sanitizer 错误，就没有论文级机制。
- 保留条件：必须提出可描述、可证明 soundness 边界的 phase-indexed/credit abstraction，并展示至少 3 类基线组合在同等输入上漏掉的可达错误类别。

## `GPU-AUTOWS`

- 最强反方：不是反方而是直接命中。Tawa 自动构造 warp-specialized 实现；Twill 联合优化 software pipelining 与 warp specialization；Triton 已公开自动化设计。
- 结论：没有独立 residual；`DROP`。

## `PIM-PRACCREDIT`

- 最强反方：PRAC 在标准接口只观察外部 ACT；PIM 内部 row 操作可能不可见、实现相关或被器件内部机制固定处理。若如此，“PIM activation credit”不是可执行对象。
- 次强反方：把 COSM 的空闲感知调度与 QPRAC/MOAT 的安全控制器组合，可能已经做出相同决策；新增项只是 cost function。
- 保留条件：先冻结一个公开、同语义的 PIM command model，证明 PIM 操作对 PRAC/RFM 状态有可核验影响，并构造基线组合不能表达的跨命令约束。

## `QCOMP-ERRREF`

- 最强反方：First-Class Verification Dialects 的通用语义加 SMT 已足以编码所有量化关系；所谓 error contract 只是新增 dialect op。
- 致命点：若每个 fusion 都要全程序 bit-blast，既无可扩展性也无独立算法增量。
- 保留条件：需要可组合的局部 refinement rule/摘要代数，且在锁定子集上比通用等价检查得到更低求解规模或能验证通用框架不直接支持的“允许非零误差”变换。

## `THEORY-MXIO`

- 最强反方：scale tensor 是低阶附加输入，给经典 GEMM 下界简单加上 compulsory scale bytes 就完了。
- 致命点：若 scale granularity 固定时 metadata 项始终被 payload/经典运算下界支配，则没有新理论区间。
- 保留条件：必须找到由 scale fanout、布局或动态 scale production 引起的独立瓶颈区间，并给出匹配上界；否则立即停止。

## `AQ-ACCUMSTAGE`

- 最强反方：A2Q 已对 accumulator overflow 给出保证，AXE 已把 accumulator-aware quantization 推进到 multi-stage accumulation，后续 BFP 工作又直接研究 accumulation chunk/precision。
- 结论：exact object 直接碰撞，`DROP`。

