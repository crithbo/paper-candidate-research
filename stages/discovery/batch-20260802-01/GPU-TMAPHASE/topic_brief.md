# GPU-TMAPHASE Phase-indexed verification of lowered TMA–mbarrier pipelines

- Status: `PROPOSE_STAGE0`
- Primary lane: CUDA/GPU；验证与调试
- Discovery date: 2026-08-02
- Novelty state: `SEARCH_BOUNDED_OPEN`

## Research question

能否对已经 lower 到 CUDA/CuTe/Triton/PTX 的 TMA–`mbarrier` 多阶段流水，静态证明 buffer slot、barrier phase、到达计数和 transaction completion 的一致性，并在失败时给出机制级因果切片，而不是只靠一次动态执行暴露 race 或 deadlock？

## Importance and group fit

NVIDIA 的异步 barrier 语义允许 phase 复用、arrival token 和 transaction count；`cp.async`/bulk async copy 又需要显式 wait/fence 建立可见性。官方规范明确这些不是普通同步屏障的等价替换。[CUDA async barriers](https://docs.nvidia.com/cuda/archive/13.2.1/cuda-programming-guide/04-special-topics/async-barriers.html) 和 [PTX ISA](https://docs.nvidia.com/cuda/parallel-thread-execution/index.html) 因而给出了真实、会随代际增强的协议对象。CUTLASS、Triton 和 Tawa 都在生成这类流水，影响自然 workload 不限于单一 issue。

该题与 `CGPU-RPIV` 的寄存器压力归因、`CGPU-DECSLICE` 的 codegen 决策切片不同：这里的主要指标是协议安全覆盖、误报、因果定位与分析成本，exact object 是同步/异步传输协议。

课题组边界仅能依据当前 `registry.yaml` 的公开活跃对象冻结；工作区未提供完整公开论文表或未公开题目清单，升级前须由主线/研究者确认所有权边界。

## Exact object

- 输入：公开 CUDA/CuTe/Triton 生成或手写的、已 lower 的 TMA/async-copy + `mbarrier` kernel；首批限定单 CTA/cluster 内、有限 pipeline slots、静态可知或区间可知的 participant 集。
- 状态：每个 barrier 的 phase、pending arrival/transaction credit、每个 buffer slot 的生产/消费/复用 epoch、proxy/memory visibility，以及控制流上的参与掩码。
- 主要判断：无过早读取、无未完成写覆盖、无 phase/token 误用、到达/transaction 计数守恒、必要参与者能推进。
- 输出：在声明的抽象边界内的 safety proof，或最短 causal slice/反例候选。
- 不包含：通用 CUDA race checker、性能调优器、仅重放某个 CUTLASS issue。

## Opportunity map

- 技术变化：Hopper/Blackwell 把 TMA、cluster barrier、更多异步流水引入高性能 kernel，协议状态比传统 `__syncthreads()` 更丰富。
- strongest baseline 边界：Compute Sanitizer 是执行覆盖驱动；GPUVerify 面向较早的 CUDA/OpenCL race/divergence；Tawa 在其安全 IR/`aref` 构造范围内规避错误。三者尚未在本批检索中形成“任意 lower 后协议 + phase/credit 抽象 + 因果切片”的同等组合。
- 自然 workload：CUTLASS block-scaled GEMM/attention、Triton warp-specialized kernel、Tawa 示例和公开 TMA tutorial。
- 72 小时观察：在不使用 GPU 的条件下，对公开样例做协议抽取和规范导出的 mutation，判断 phase/credit 抽象是否比简单 CFG/屏障配对产生新的可判定故障类。

## Strongest fair baseline

公平组合基线，而非单工具：

1. [NVIDIA Compute Sanitizer](https://docs.nvidia.com/compute-sanitizer/ComputeSanitizer/index.html) 的 racecheck/synccheck/deadlock reporting；
2. [GPUVerify](https://github.com/mc-imperial/gpuverify) 的静态 race/divergence 分析及 [GPURepair](https://arxiv.org/abs/2011.08373)；
3. [GPUMC](https://arxiv.org/abs/2505.20207) 的 GPU 弱内存模型检查；
4. [Tawa](https://arxiv.org/abs/2510.14719) 的安全异步引用和 lowering 验证。

比较必须冻结相同 kernel/变异、相同超时、相同可观察错误定义，并分别报告静态 proof、动态发现和 unknown；不能把未执行路径当成 sanitizer 漏报证据。

## Mechanism hypothesis

首选假设：将流水建模为“phase-indexed typestate + 守恒 credit”的抽象解释，可把数据值从协议状态中分离；对 barrier 和 slot 做局部摘要，再用支配/后支配与参与掩码约束组合，可以避免对所有线程/指令交错枚举。

## Competing mechanisms

- Mechanism A — phase-indexed typestate abstract interpretation：决策变量是抽象状态域、join/widening 和跨迭代 epoch 摘要；预期结果是对规则化流水给出可证明 safe/unsafe，强反例是 join 后 phase 相关性完全丢失；最小成本是 PTX/CuTe 子集解析器和 CPU 分析器。
- Mechanism B — 有界事件模型 + partial-order reduction：决策变量是展开深度、等价事件类和 symmetry reduction；预期结果是精确反例、较少误报，强反例是 slot/线程数量使状态爆炸；最小成本是把抽取事件送入现有 SMT/模型检查器。
- Mechanism C — proof-carrying lowering：由 Tawa/Triton/CuTe lowering 输出 barrier/slot certificate，再在 PTX 端验证 certificate；预期结果是低成本验证生成代码，强反例是无法覆盖手写或未知 pass 改写；成本是修改一个公开 lowering 和独立 certificate checker。
- Preferred mechanism and why: A。它最可能形成独立的分析算法，同时保持对多种 producer 的适用性。若 A 因关联丢失失败，但 exact object、workload 和指标不变，可在 Stage 0 使用一次 `MECHANISM_PIVOT` 转向 B；C 作为可扩展性备选。

## Candidate paper claim

在明确限定的 TMA–`mbarrier` 流水子集上，phase/credit 抽象能静态验证协议安全，或产生可重放的因果切片；相对动态 sanitizer 与既有静态/安全 IR 组合，它覆盖至少三类由 phase、transaction count、参与掩码或 slot 复用引起的可达错误，同时保持可接受的误报和分析规模。

这是候选 claim，不是当前事实。最终 claim 必须明确 soundness 边界；不能把 mutation detection 等同于真实缺陷 prevalence。

## Current collision subtraction

- Tawa 是 `DIRECT_SUBTRACT`：它直接处理 warp specialization 和异步引用的安全 lowering，但对象主要是从安全 IR 构造，而不是任意 lower 后协议的独立静态核验。
- Compute Sanitizer 是 `DEPLOYMENT_BASELINE`：支持 async-copy race、barrier tracing 和部分 deadlock 检测，但依赖执行覆盖。
- GPUVerify/GPURepair/GPUMC 是 `METHODOLOGICAL_ADJACENT` 或强静态基线。
- 在记录的检索范围内未发现同时覆盖 exact object、phase/credit 机制、保证和因果切片成本边界的工作，因此暂记 `SEARCH_BOUNDED_OPEN`，不声称首次。

## Decisive falsifier

若在 15–30 个公开 TMA/`mbarrier` kernels 和规范导出的 fault operators 上，公平组合基线已能以同等输入、保证和成本覆盖同样的错误；或 A/B 均无法在声明子集内同时做到可检查的 soundness 边界与可接受状态规模，则题目失败。首机制 A 失败只触发同问题的一次 pivot，不自动杀死问题；A、B 都失败或只剩普通 checker 包装时才停止。

## Executable evidence path

公开输入来自 [CUTLASS](https://github.com/NVIDIA/cutlass)、Triton/Tawa 样例、PTX/CUDA 规范；fault corpus 由 phase flip、`expect_tx`、arrival/drop、fence/wait、participant mask、early slot reuse 等语义算子生成。所有输入、抽取事件、solver 版本和结果哈希均可本机记录。

### 72-hour first evidence

1. 冻结 8–12 个自然 kernel 和 6 类语义 mutation，确保不是单 issue replay。
2. 实现只读解析/事件抽取与最小 A 原型，输出 phase/credit trace。
3. 手工按规范核验一个 safe、三个 unsafe 小例；对其余样例测 unknown/误报/状态数。
4. 建立 baseline capability matrix；没有 GPU 时只报告静态可判定性，不伪造 sanitizer 实测。

决定是否进入后续 killer 的观察：至少出现两类不能被简单 barrier pairing 表达、且 A 能局部化的协议错误；否则优先 pivot B 或停止。

### AI core fraction and critical path

- 估计 `ai_core_fraction`: 76%
- Class: `AI_CORE_EXECUTABLE`
- AI 可完成：规范/源码抽取、mutation generator、A/B 原型、公开 baseline 构建、测试编排、SMT 日志、哈希与 claim-to-evidence 表。
- 关键 claim 可在 CPU 静态模型和同语义公开 kernels 上先判定；真实 NVIDIA GPU 只提高动态交叉验证 ceiling，不是核心正证据的唯一来源。
- 研究者保留：未公开组内边界、是否申请 GPU 做最终动态确认、贡献与投稿裁决。

### Semantics-preserving open alternatives

- 无 GPU：使用 PTX/CUDA 正式文本、Tawa/CUTLASS 源码和 CPU 事件模型验证静态 claim。
- 无特定 compiler build：直接消费公开 PTX/SASS 前的 NVVM/CuTe/Triton IR 或规范化事件 IR；必须证明抽取保留 barrier/async-copy 语义。
- 若 Compute Sanitizer 不可执行：仅将其作为能力边界，不把未跑结果写成数据；Stage A 再用有 GPU 的公开/获授权环境交叉验证。

## Dual-axis score

- Academic value: `56/70`（重要性 13/15；headroom 12/15；机制深度 16/20；推广性 9/12；独立边界 6/8）
- AI executability bonus: `24/30`（artifact 5/7；核心比例 6/8；开源路径 6/7；速度 4/5；重放 3/3）
- Total: `80/100`

Discovery 分数用于排序，不替代 `DIRECT_FATAL`、不可证伪或 AI fatal。

## AI and researcher boundary

AI 可以完成决定 claim 的静态分析关键路径、公开输入构建和可复现比较；不得把 mutation 命中包装成真实硬件 bug，也不得声称动态 sanitizer 未覆盖未执行路径。研究者必须确认课题组未公开边界、最终 soundness 声明和是否投入 GPU 验证。
