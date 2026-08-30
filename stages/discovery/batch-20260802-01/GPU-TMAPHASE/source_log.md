# GPU-TMAPHASE source log

## Search coverage

查询族：`CUDA TMA mbarrier static verification phase deadlock race`、`PTX mbarrier expect_tx formal verification`、`Compute Sanitizer async copy deadlock`、`GPUVerify GPURepair GPUMC barriers`、`Tawa asynchronous references`。检索于 2026-08-02；优先官方规范、官方代码、作者论文。

## Verified sources

| 来源 | 类型/核验 | 本 brief 中只支持的事实 | 质量与限制 |
|---|---|---|---|
| [CUDA Programming Guide: Async Barriers](https://docs.nvidia.com/cuda/archive/13.2.1/cuda-programming-guide/04-special-topics/async-barriers.html) | NVIDIA 官方规范，已打开核对 | barrier phase、arrival token、异步 transaction 同步语义 | 规范事实 Grade A；厂商 COI，不支持效果优越性 |
| [PTX ISA](https://docs.nvidia.com/cuda/parallel-thread-execution/index.html) | NVIDIA 官方 ISA，已打开核对 | `mbarrier`/async operation 的指令级语义 | 规范事实 Grade A；版本相关 |
| [Compute Sanitizer](https://docs.nvidia.com/compute-sanitizer/ComputeSanitizer/index.html) | NVIDIA 官方工具文档，已打开核对 | racecheck/synccheck、async copy 和 barrier/deadlock 能力边界 | 产品能力 Grade A；未在本批执行，不支持效果数字 |
| [GPUVerify](https://github.com/mc-imperial/gpuverify) / [OOPSLA paper](https://nchong.github.io/papers/oopsla12.pdf) | 官方 repo + 作者稿 | CUDA/OpenCL race/divergence 静态验证对象 | 同行评审方法 Grade A/B；年代较早、对象不含现代 TMA |
| [GPURepair](https://arxiv.org/abs/2011.08373) | arXiv 作者稿 | 基于 GPUVerify 的 race/barrier-divergence repair | 预印本/作者证据 Grade B；作为相邻方法 |
| [GPUMC](https://arxiv.org/abs/2505.20207) | arXiv 预印本 | GPU 弱内存并发模型检查 | 预印本 Grade B；venue/完整复现未在本批闭合 |
| [Tawa](https://arxiv.org/abs/2510.14719) / [作者 PDF](https://www.csl.cornell.edu/~zhiruz/pdfs/tawa-cgo2026.pdf) | 作者稿/预印本，已打开核对 | `aref`、warp specialization、TMA/`mbarrier` lowering 和安全语义 | 方法证据 Grade B；与候选有直接减法，需 Stage 0 深读 artifact |
| [CUTLASS](https://github.com/NVIDIA/cutlass) | NVIDIA 官方 repo | 自然 TMA/warp-specialized kernel 来源 | Artifact Grade A；不代表候选机制有效 |

## Source verification notes

- 未使用博客或 issue 作为结果证据；CUTLASS issue 只曾用于发现关键词，未支撑 claim。
- 2025–2026 预印本的同行评审状态未从 arXiv 推断。
- 没有发现“任意 lower 后 TMA 协议的 phase/credit 静态 verifier”只代表本查询范围内未定位。
- Stage 0 必须继续做 Tawa/GPUMC 的全文与 artifact-level subtraction，特别核验它们是否已有同等 fault class 与成本边界。

