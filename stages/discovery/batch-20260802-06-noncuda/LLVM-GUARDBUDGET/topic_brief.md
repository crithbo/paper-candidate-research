# LLVM-GUARDBUDGET Guard-budgeted loop multi-versioning

- Status: `PROPOSE_STAGE0`
- Primary lane: compiler_runtime_system
- Discovery date: 2026-08-02

## Research question

能否在 LLVM loop vectorization 中，以跨循环共享/合并运行时 guard 的净收益预算选择版本化集合，而不是逐循环独立版本化，从而在真实程序的代码尺寸、guard 开销与 SIMD 收益之间获得非支配点？

## Importance and group fit

LLVM 已生成 alias runtime checks 与 scalar fallback。现有成本模型主要在单 loop 决策；函数内多个候选 loop 的 guard 复用与 cold-path 代价仍是明确、可证伪的编译器对象。

## Exact object

固定 LLVM revision、target CPU、函数内可合法 vectorize 的 loop 群；决策变量为版本化 loop 集、共享 guard placement 与 fallback CFG。必须保持 LLVM 的 alias/overflow 语义，并计入编译时间、IR/代码尺寸、guard 执行和 scalar fallback。

## Strongest fair baseline

原生 LLVM `-O3` Loop Vectorizer（含其 runtime checks/成本模型）、禁用 vectorization、以及“全部候选独立版本化”的实现。

## Mechanism hypothesis

将 guard 表示成 dominance 范围内可复用的谓词 DAG；以 profile/静态频率估计“收益减去 guard 与 I-cache 预算”来选 group，而非独立接受每一个 loop。

## Competing mechanisms

- Mechanism A: 支配树上的 guard hoisting 与公共子表达式共享。
- Mechanism B: 预算化 set selection，只版本化净收益为正的 loop group。
- Optional mechanism C: 多版本专用化，以热 path 的 trip-count 分桶换取 guard 删除。
- Preferred mechanism and why: A+B；可直接隔离共享 guard 是否提供超越逐 loop 版本化的 residual。

## Candidate paper claim

对同一 LLVM legality 结果，guard-budgeted grouping 可在受限代码尺寸下提高净动态收益；若去掉共享后等价或收益不能覆盖 guard 成本，该 claim 失败。

## Current collision subtraction

`DIRECT_SUBTRACT`：LLVM 已有 loop versioning、runtime alias checks、VF/UF cost model。残差是**函数内跨 loop guard 共享的集合决策与完整净成本**，不主张发明 runtime check。

## Decisive falsifier

在 LLVM test-suite/SPEC-like 开放工作负载中，共享 guard 不减少动态检查或代码尺寸，且所有性能差异均被原生 `-O3` 或独立版本化支配。

## Executable evidence path

LLVM/Clang 源码、Vectorizers 文档、LLVM test-suite 和公开 C/C++ kernels；可实现一个 opt pass 与检查 IR/汇编、正确性测试、基准统计。

### 72-hour first evidence

提取 20 个有 runtime check 的 loop，构造 guard DAG，比较 `-O3`、独立版本化与共享方案的 IR guard 数、文本大小和微基准净时间。

### AI core fraction and critical path

`82%`, `AI_CORE_EXECUTABLE`：AI 可实现 pass、编译基线、跑回归和分类失败案例；研究者负责对最终机制泛化的审查。

### Semantics-preserving open alternatives

以 x86-64 CPU 为固定首证据；不同 ISA 的结果仅作后续敏感性，不能替代相同语义的正确性检查。

## Dual-axis score

- Academic value: `52/70`
- AI executability bonus: `26/30`
- Total: `78/100`

## AI and researcher boundary

只能在 LLVM IR/机器码与可重放 benchmark 层陈述结果；不能把 microbenchmark 改善直接泛化为所有应用吞吐。
