# Search scope and query log

## 时间与方法

- 检索日期：2026-08-02
- 检索面：官方规范/文档、作者或会议论文页、DOI/出版社页、arXiv、官方代码仓库与 artifact
- 核验方式：先用宽查询发现对象，再打开一手页面核对题名、对象、机制、证据形态和 artifact；对厂商材料只提取规范事实
- 分配：CUDA/GPU 查询族约 6 组，非 CUDA 查询族约 14 组，约为 30:70
- 截止声明：这是定向 Discovery 检索，不是系统综述；“未发现”只表示下列查询与来源范围内未定位

## CUDA/GPU 查询族

1. `CUDA TMA mbarrier static verification phase deadlock race`
2. `PTX mbarrier expect_tx phase token formal verification`
3. `Compute Sanitizer racecheck mbarrier async copy deadlock detection`
4. `GPUVerify GPURepair weak memory model checker CUDA barriers`
5. `automatic warp specialization compiler TMA Hopper Triton`
6. `Tawa Twill warp specialization software pipelining`

主要来源域：`docs.nvidia.com`、`github.com/NVIDIA`、`arxiv.org`、作者主页、`pytorch.org`、`triton-lang.org`、SIGPLAN/会议页。

## 非 CUDA 查询族

1. `PRAC RFM PIM activation scheduling RowHammer`
2. `PRAC backoff PIM in-memory computation`
3. `CPU PIM co-scheduling Ramulator2`
4. `QPRAC MOAT secure PRAC RowHammer`
5. `P-PIM RowHammer processing in memory`
6. `Ramulator2 PIM simulator GDDR6 AiM`
7. `MLIR quantization translation validation error bound`
8. `TOSA quantization numerical semantics RESCALE rounding saturation`
9. `MLIR verification dialect translation validation artifact`
10. `SMT equivalence MLIR quantized compiler`
11. `I/O lower bound quantized GEMM scale metadata`
12. `communication lower bound block quantized matrix multiplication`
13. `block-scaled GEMM scale tensor layout CUTLASS Triton`
14. `accumulator-aware quantization overflow multi-stage accumulation`

主要来源域：JEDEC 相关论文作者页、`dramsec.ethz.ch`、`github.com/CMU-SAFARI`、DATE/DOI、`mlir.llvm.org`、`mlplatform.org`、PLDI/SIGPLAN、作者论文页、OCP、NVIDIA/CUTLASS、Triton、CVF、arXiv。

## 经宽搜后未进入 brief 的方向

- speculative decoding 的动态调度：近期系统工作拥挤，未冻结出不依赖普通调参/排队策略的独立机制。
- ragged tensor 的 NPU/TPU 执行：已存在大量 padding-elimination、sparse/ragged runtime 与专用编译工作；本轮没有找到足够窄且可证伪的 residual。
- 通用 PIM 映射搜索：容易退化为组件直积或普通 cost-model tuning。
- 单纯 scale-layout 优化：若不含理论下界或新系统约束，属于现有 CUTLASS/Triton 布局工程。

## 检索局限

- 部分 2025–2026 工作只有预印本或作者稿；venue 状态不据此推断。
- 没有查询付费数据库的完整引文网络，也没有执行向后/向前全量追踪。
- 没有可核验的课题组公开论文清单；只对当前 registry 对象做了语义去重。
- 未访问商业硬件、闭源编译器或 JEDEC 付费规范全文；涉及 PRAC/PIM 内部 activation 的候选因此设置了先决 falsifier。

