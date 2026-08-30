# Stage 0 PRIMARY — QREFINE-TRITON-W4A16

## 裁决

`PASS_RECOMMENDED`，待未参与本题的 confirmation sentry 复审；质量标签为
`TIER_B_Q2_VIABLE`（不是已证实的 Q1 结果）。本结论只表示：若所述验证器和
预注册的 Stage A 反证路线完成，题目仍具有可信二区论文形状。它不声称已经找到
编译器错误、完成证明或获得性能收益。

## 冻结对象与同对象边界

对象是固定的 `w4a16_decode_gemv_m1_g128_uint4b8_fp16`：M=1、K 为 128 的倍数、
N 为 8 的倍数、`uint4b8` 八 nibble 打包、FP16 输入/scale、FP32 累加和 FP16
输出。输入分别是 Triton `f797708c` 在 sm89 与 gfx1100 上、`make_llir` 后且
`llvm.to_module` 前的 LLVM-dialect MLIR 文本。关系为每一 target 独立满足固定的
混合 bit-vector/IEEE trace；不比较二进制、不主张跨设备等价，且不纳入 `tl.dot`、
Tensor Core、WMMA 或 MFMA。

这个边界可重放而非假设：冻结 NVIDIA 源在 `pm.run(mod, 'make_llir')` 后调用
`llvm.to_module`，AMD 亦然；2026-08-21 取得的 current NVIDIA 主线保留同一相邻
边界。故验证器的输入不是人为拼接的 LLVM IR 或 binary，也不会通过改变编译对象
规避难点。

## 独立碰撞与强基线

| 比较器 | 公平角色 | 吸收判断 |
|---|---|---|
| Triton 当前/冻结测试、IR verifier 与类型/shape 检查 | 必须运行的 native baseline；可发现测试覆盖与局部合法性缺口 | 不提供冻结 packed-index、地址/mask、group-scale、约简树及 IEEE trace 的逐编译实例关系证明。 |
| Wang et al., *SMT-Based Translation Validation for Machine Learning Compiler* (2022) | 最强 MLIR TV 学术基线 | 其目标是高层、target-independent MLIR 变换，以 FP 过近似和 refinement 处理；不是两个 Triton target 在 pre-`llvm.to_module` 快照的 exact packed W4A16 relation。 |
| TVOC / 通用 translation validation | 方法谱系基线 | 建立“每次翻译可验证”的思想，但不覆盖当前 GPU MLIR mixed BV/IEEE 操作语义。 |
| LLVM 后端 translation validation（含 AArch64 路线） | 后端 TV subtractor | 接近每次编译验证，但 ISA、输入边界与 GPU W4A16 的抽象不同。 |

在有界的一手与论文检索中，未找到同时覆盖**同一算子、同一 pre-conversion
Triton-MLIR 边界、两套独立 GPU lowering、exact mixed BV/IEEE trace**的直接系统。
这只是 `SEARCH_BOUNDED_OPEN`，并非“全领域不存在”的断言。Wang et al. 是最需在
Stage A 中正面对齐的强 subtractor，而不是可被忽略的泛相关工作。

## 贡献形状、评分与证据上限

N1 是 target-lowering-aware 的操作语义抽象；N2 是对显式 packed/dequant/reduce
trace 的组合式 obligation/refinement。二者共同避免了单纯 test harness 或 checker
封装。可发表主张的最高上限是“冻结语法与边界上的 translation validation、局部
counterexample 与成本”；不能外推为 Triton、CUDA/HIP 或已生成 binary 的一般正确性。

| 维度 | 评分 | 理由 |
|---|---:|---|
| 学术核心（70） | 54 | same-object 残差、N1+N2 与有限可反证路线明确；范围窄，暂不具 Q1 广度。 |
| AI 主导性（30） | 24 | capture、normalization、obligation construction、mutant 与基线可由 AI 审计/实现。 |
| 合计 | 78/100 | 仅作排序，不替代下列硬门。 |

当前 readiness 为 `E1_STATIC_PREFLIGHT`：来源边界已核验，但尚无快照、solver pin、
mutant 结果或合法 schedule 性能证据。缺少这些不是 Stage 0 停止理由。

## 有限 Stage A pre-claim / killer

先完成 capture、operation inventory、solver identity 与同语法 native comparator 的
fidelity gate。随后在每一 target 上跑 12 个预注册 mutant 和小符号组合：少于 10 个
被拒、任一四类 packing/index mutant 不能定位、出现不可建模也不可拒绝的关键操作、
组合无法有限闭合，或语法只剩 scalar schedule，均停止该机制。完整成本必须同时报
capture/normalize/obligation、solver CPU/RSS/wall/proof bytes、compiler CPU/RSS/temp
bytes 与仅对语法内 schedule 的 latency/bandwidth。

## 硬门结论

- same-object：PASS。
- current-source reality：PASS，边界仍存在；不据此推断 validator 缺席。
- 直接碰撞 / 强基线结构吸收：未发现，`SEARCH_BOUNDED_OPEN`。
- N1/N2 与 Q2 形状：PASS（条件性）。
- 自然/规范 carrier、full-cost、有限 killer：PASS（均为 Stage A 前置路线）。

**下一状态建议：仅送独立 confirmation；不授权 Stage A/B。**
