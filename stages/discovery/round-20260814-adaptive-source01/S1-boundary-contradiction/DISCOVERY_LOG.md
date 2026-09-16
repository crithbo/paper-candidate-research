# Discovery log — adaptive source 01

## 结论

本轮采用重配后的编译器/运行时/ABI/ISA/协议语义题源，完成 7 条 raw 筛查、5 个去重后 family 和 2 项 candidate-grade 深审；没有形成足以诚实建议 Stage0 的 clean brief，因此交付 `COMPLETE_ZERO_PROPOSALS`。

## 原因

- LLVM coroutine 的跨 ramp/resume/destroy/异常清理布局是唯一具有清晰同对象和有限闭合路线的近门槛方向，但当前尚未冻结完整源代码 action union，也未命名相对该 union 的非泛化算法/保证；它是 `FINITE_FIDELITY_GAP`，不是失败或 STOP。
- Wasm 异常标签跨验证器/运行时方向有正式语义和官方测试入口，却未冻结单一目标 engine 的 current union，不能把跨引擎概念包装成同对象机制。
- EH 表压缩、GCS 调试支持、futex waitv 排序分别退化为泛化压缩、wrapper 或调度/策略，故为结构淘汰，与实现/资源无关。

## 下一步

若主线希望继续深攻，可单独冻结 LLVM coroutine 的 revision、CoroSplit/Elide 源码及 direct-paper 检索，先执行 D01 的小 witness/source-union killer；否则下一轮应继续寻找不同的语义 seam，避免将该未冻结线索当成已保留候选。

## 计数与边界

- raw: 7；accepted unique: 5；deep: 2；brief: 0。
- `DISCOVERY_QUALITY_MODE=OFF`、`DISCOVERY_CLAIM_PACK_MODE=OFF`；没有 V9 输出。
- 未运行实验、benchmark、E2、build、安装或大下载；没有共享控制写入。
