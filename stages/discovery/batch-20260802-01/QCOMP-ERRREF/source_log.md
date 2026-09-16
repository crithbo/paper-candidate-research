# QCOMP-ERRREF source log

## Search coverage

查询族：`MLIR quantization translation validation error bound`、`TOSA RESCALE rounding saturation semantics`、`MLIR verification dialect artifact`、`SMT equivalence quantized compiler`。日期 2026-08-02。

## Verified sources

| 来源 | 类型/核验 | 支持事实 | 质量与限制 |
|---|---|---|---|
| [MLIR Quantization](https://mlir.llvm.org/docs/Quantization/) / [Quant dialect](https://mlir.llvm.org/docs/Dialects/QuantDialect/) | LLVM/MLIR 官方文档 | quantized type、scale/zero-point 与 compiler object | 规范/实现 Grade A；不支持新颖性 |
| [MLIR Dialect Conversion](https://mlir.llvm.org/docs/DialectConversion/) | 官方文档 | lowering/conversion 基础对象 | Grade A |
| [TOSA 1.0.1](https://www.mlplatform.org/tosa/tosa_spec_1_0_1.html) / [MLIR TOSA dialect](https://mlir.llvm.org/docs/Dialects/TOSA/) | 官方规范/实现文档 | 整数数值行为、rounding/saturation/range 与 op 语义 | 规范事实 Grade A |
| [First-Class Verification Dialects for MLIR](https://users.cs.utah.edu/~regehr/papers/pldi25.pdf) / [PLDI page](https://pldi25.sigplan.org/details/pldi-2025-papers/60/First-Class-Verification-Dialects-for-MLIR) / [artifact](https://zenodo.org/records/15367030) | 同行评审论文、会议页、公开 artifact | 通用 verification dialect、translation validation 与可执行基线 | Grade A；Stage 0 必须核是否已支持 quantitative refinement |
| [MLIR-TV](https://link.springer.com/chapter/10.1007/978-3-031-13188-2_19) | 出版社章节页 | SMT-based MLIR translation validation | 同行评审 Grade A/B；全文能力需 Stage 0 复核 |
| [Practical Formal Verification for MLIR Programs](https://arxiv.org/abs/2605.01124) | 2026 arXiv 预印本 | hybrid concrete-symbolic equivalence verification | Grade B；最新预印本、不能据此推断 venue |
| [ExecuTorch Arm backend](https://android.googlesource.com/platform/external/executorch/%2B/HEAD/backends/arm/) | 官方源码镜像 | 公开 TOSA/quantized test 与 backend 输入路径 | Artifact Grade A；不支持候选机制效果 |

## Verification conclusion

- 规范层面的 bit-exact 字段已核验；本 brief 没有省略 signedness、scale、zero-point、rounding、saturation、overflow、accumulator 或 requantization。
- PLDI artifact 是最危险 subtraction；`SEARCH_BOUNDED_OPEN` 只表示本批没有核到“同等 quantitative contract algebra”，Stage 0 必须先执行/深读。
- fault injection 只用于验证覆盖，不能作为真实 compiler bug prevalence。

