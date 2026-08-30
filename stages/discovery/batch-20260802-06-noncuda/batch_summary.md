# 非 CUDA Discovery 第六波：批次总结

日期：2026-08-02  
范围：非 CUDA 的量化运行时、通用编译器、加速器映射与 PIM 系统。检索结论均为 `SEARCH_BOUNDED_OPEN`，不是首次性声明。

| 排名 | 题目 | 决定 | 关键公开工件 | 72 小时首证据 |
|---:|---|---|---|---|
| 1 | `TLOOP-MAPPORT` | `PROPOSE_STAGE0` | Timeloop/Accelergy | 带切换成本的映射组合能否支配单映射 |
| 2 | `ORT-ACTGUARD` | `PROPOSE_STAGE0` | ONNX Runtime + ONNX Model Zoo | 风险受限局部动态量化能否支配纯静态/纯动态 |
| 3 | `LLVM-GUARDBUDGET` | `PROPOSE_STAGE0` | LLVM/Clang + benchmark suites | 合并运行时检查能否在净收益上超过独立版本化 |
| 4 | `UPMEM-RANKBATCH` | `PROPOSE_STAGE0` | PrIM + UPMEM SDK/分析模型 | 共享 rank 的联合批处理是否降低 P99 而不扩大传输账本 |

共同边界：不创建 Stage 0、不改登记表；任何性能结论须计入编译、转换、同步、元数据、回退与 host 成本。`UPMEM-RANKBATCH` 的首轮可只给出可审计分析/SDK 证据，不能声称硬件实现或实机 PPA。
