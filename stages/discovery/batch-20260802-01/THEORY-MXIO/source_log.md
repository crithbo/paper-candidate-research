# THEORY-MXIO source log

## Search coverage

查询族：`I/O lower bound quantized GEMM scale metadata`、`communication lower bound block quantized matrix multiplication`、`roofline block-scaled GEMM scale factors metadata traffic`、`CUTLASS Triton block scaled layout`。日期 2026-08-02。

## Verified sources

| 来源 | 类型/核验 | 支持事实 | 质量与限制 |
|---|---|---|---|
| [OCP Microscaling Formats MX 1.0](https://www.opencompute.org/documents/ocp-microscaling-formats-mx-v1-0-spec-final-pdf) | OCP 官方规范 PDF | block scale 与 elements 的格式关系 | 规范 Grade A；不规定所有 scale 生成算法 |
| [CUTLASS block-scaled GEMM tutorial](https://docs.nvidia.com/cutlass/latest/media/docs/operators/tutorials/006_block_scaled_gemm.html) / [Blackwell functionality](https://docs.nvidia.com/cutlass/latest/media/docs/cpp/blackwell_functionality.html) | NVIDIA 官方文档 | scale tensors 是显式 operands，存在硬件相关布局 | 能力事实 Grade A；厂商 COI，不支持性能优越性 |
| [Triton block-scaled matmul tutorial](https://triton-lang.org/main/getting-started/tutorials/gluon/tcgen05-mma-scaled.html) | 官方项目教程 | payload 与 scales 的 global-to-SM loading/使用 | Artifact/能力 Grade A；特定实现不等于 lower bound |
| [Transformer Engine NVFP4](https://docs.nvidia.com/deeplearning/transformer-engine-releases/release-2.14/user-guide/features/low_precision_training/nvfp4/nvfp4.html) | NVIDIA 官方文档 | hierarchical block/per-tensor scale 与 layout/padding 对象 | Grade A for specification；产品 COI |
| [Tight I/O lower bound for matrix multiplication](https://arxiv.org/abs/1702.02017) | arXiv 作者稿 | 经典/tight matrix multiplication I/O lower-bound 基线 | 方法 Grade B；Stage 0 应追引用与定理假设 |
| [Minimizing Communication in Linear Algebra](https://epubs.siam.org/doi/10.1137/090769156) | SIAM DOI/出版社 | 通信规避线性代数基线 | 同行评审 Grade A |

## Verification conclusion

- 本批没有找到直接的 block-scale metadata-aware tight I/O bound；该结论严格限定在记录查询，不是首次声明。
- 官方 GPU 文档只证明 scale/layout 是真实 operand 和成本项，不证明它产生新渐近区间。
- 最大反例“经典 bound + compulsory scale bytes 已经足够”已被设为 72 小时首 gate。

