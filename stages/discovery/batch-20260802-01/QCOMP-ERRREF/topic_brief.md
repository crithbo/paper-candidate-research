# QCOMP-ERRREF Compositional error-contract refinement for quantized compiler lowerings

- Status: `PROPOSE_STAGE0`
- Primary lane: 量化编译器；验证与调试
- Discovery date: 2026-08-02
- Novelty state: `SEARCH_BOUNDED_OPEN`

## Research question

能否为 TOSA/MLIR 量化 lowering 建立可组合的 error-contract refinement，使编译器既能证明 bit-exact 变换，也能证明“有意非 bit-exact、但误差/溢出仍在冻结预算内”的 fusion、rescale、reassociation 与 accumulator rewrite？

## Importance and group fit

[TOSA 1.0.1](https://www.mlplatform.org/tosa/tosa_spec_1_0_1.html) 和 [MLIR Quant dialect](https://mlir.llvm.org/docs/Dialects/QuantDialect/)明确涉及 scale、zero-point、rounding、saturation、整数范围和 quantized type；这些细节跨多个 pass 后容易被普通输出测试掩盖。PLDI 2025 的 [First-Class Verification Dialects for MLIR](https://pldi25.sigplan.org/details/pldi-2025-papers/60/First-Class-Verification-Dialects-for-MLIR)证明 translation validation 在 MLIR 中有真实价值，但通用“等价/精化”框架是否有效承载逐 pass 数值误差预算仍是可检验 residual。

该题与 `AQ-02` 不同：`AQ-02` 是 CertiSAR-CIM 静态闭包；本题 exact object 是编译变换前后整数/量化语义的 relational refinement，不涉及 CIM 可靠性闭包。

课题组边界仅能依据当前 registry 的活跃对象冻结；工作区未提供完整公开论文表或未公开题目清单，升级前须由主线/研究者确认更广的所有权边界。

## Exact object

- 输入：一个 source TOSA/Quant/Arith 子图、一个 lower/fused target 子图，以及显式数值契约。
- 冻结语义：signedness、scale、zero-point、rounding/tie mode、saturation/clamp、overflow、accumulator width、requantization order。
- 决策：target 是否对所有有界整数输入满足 source contract；允许误差可按 tensor element/范数/ULP-like integer envelope 或无溢出条件表达。
- 输出：组合 proof/certificate，或包含输入、intermediate 和违反预算位置的 witness。
- 首批子集：RESCALE、ADD/MUL、CONV/FULLY_CONNECTED accumulator、clamp 与其合法 fusion；不做通用 ML 模型 verifier。

## Opportunity map

- 技术变化：低比特量化和跨 dialect lowering 让“完全等价”过强，而只跑 reference tests 又过弱。
- strongest baseline 边界：通用 MLIR verification dialect/SMT translation validation 擅长语义等价/精化；TOSA reference/conformance 提供例子测试。机会在于误差 budget 的 pass-local 可组合证明与 solver scaling。
- 自然 workload：TOSA conformance cases、MLIR quantization tests、ExecuTorch Arm/TOSA backend 的量化子图。
- 72 小时观察：锁定 4–5 个 op 的 bit-vector 语义，判断通用 monolithic SMT 是否已能以相当成本验证非零误差契约；若是，则没有独立 headroom。

## Strongest fair baseline

1. [First-Class Verification Dialects for MLIR paper](https://users.cs.utah.edu/~regehr/papers/pldi25.pdf) 及 [artifact](https://zenodo.org/records/15367030)；
2. [MLIR-TV](https://link.springer.com/chapter/10.1007/978-3-031-13188-2_19) 的 SMT translation validation；
3. [Practical Formal Verification for MLIR Programs](https://arxiv.org/abs/2605.01124) 的混合 concrete-symbolic 等价路线；
4. TOSA reference/conformance tests 和直接 bit-vector SMT encoding。

比较冻结相同 op 语义、输入域、solver、timeout、contract 和 witness oracle；必须分别报告 exact、bounded-error、unknown 和 solver cost。

## Mechanism hypothesis

首选假设：为每个 quantized op 生成“中心值关系 + 最坏 rounding/saturation/overflow residual”的局部 summary，并用 scale/zero-point-aware composition law 合成路径预算，可以避免把整个 fused graph 全量 bit-blast；只在 summary 无法判定的局部回退到 bit-vector SMT。

## Competing mechanisms

- Mechanism A — compositional contract algebra：决策变量是 summary 域、error composition、overflow side condition 和局部 fallback；预期结果是比 monolithic SMT 更小的 query，强反例是 saturation/rounding correlation 让 summary 过松；最小成本是 4–5 op 的 Python/MLIR prototype。
- Mechanism B — relational bit-vector translation validation：直接把 source/target 与 `|error|<=ε` 编成 SMT，配合 slicing/CEGAR；预期结果是精确 witness，强反例是规模随 tensor/accumulator 爆炸；最小成本最低，可作为 pivot 和 oracle。
- Mechanism C — proof-carrying rewrite rules：每个 compiler rewrite 附带机器检查的 contract transformer；预期结果是线性组合与增量验证，强反例是只能覆盖手工列举 pattern；成本是 MLIR pass annotation + small checker。
- Preferred mechanism and why: A。它能形成不只是 checker 的数值摘要/组合算法；B 是最强 baseline 也是 A 失败后的同问题 pivot；C 适合后续把已验证规则部署进 compiler。

## Candidate paper claim

对冻结的 TOSA/MLIR 量化子集，error-contract algebra 能机器检查有意非 bit-exact 的 lowering/fusion，保证给定 error/overflow budget，并相对 monolithic relational SMT 和 conformance tests 在更长 op chain 上降低求解成本，同时对 rounding、zero-point、clamp order、overflow 和 double-rounding fault 产生精确 witness。

当前只有问题/机制假设；没有正确性、bug 数量或加速结果。

## Current collision subtraction

- First-Class Verification Dialects：`DIRECT_SUBTRACT`，提供通用 MLIR 语义与 translation validation 框架；候选 residual 必须是 quantitative contract algebra 与可扩展组合，而不是新 dialect 包装。
- MLIR-TV/Practical FV：`METHODOLOGICAL_ADJACENT` 到强基线；若已直接支持同等非零误差 contract、局部组合和成本，则升级为 fatal。
- TOSA reference tests：`DEPLOYMENT_BASELINE`，有精确规范但覆盖是样例而非全称证明。
- 当前检索未定位到同对象、同 error-contract 机制和同成本边界的直接工作，故 `SEARCH_BOUNDED_OPEN`。

## Decisive falsifier

若通用 verification dialect/monolithic SMT 在相同语义、同一 contract 和相当成本下已能验证相同变换并生成同等 witness；或 A 的 summary 在真实量化 op chain 上必然过松而 B 又规模不可行，则题目停止。A 失败后允许保持 exact object/指标使用一次 `MECHANISM_PIVOT` 到 B；若 B 只得到小例 checker 而无算法/可推广 insight，也停止。

## Executable evidence path

公开 artifact 包括 MLIR/TOSA 源码与测试、PLDI verification artifact、SMT solver、TOSA reference model/ExecuTorch Arm backend。AI 可实现语义抽取、fault seeding、A/B、oracle cross-check、日志与 hash；不需要 GPU、私有模型或人工标注。

### 72-hour first evidence

1. 冻结 RESCALE、ADD、CONV accumulator、clamp 的整数语义和 5 类 fault operators。
2. 用 bit-vector B 为 10–20 个短 op chain 建立正确性 oracle，复现 safe/unsafe witness。
3. 实现 A 的局部 summary/composition，在同一 chain 上比较 proof/unknown/query size。
4. 运行 PLDI artifact 或最小通用 baseline，核查非零误差 contract 是否已原生覆盖。

决定性观察：A 对至少一种多 pass 非 bit-exact rewrite 给出可组合 proof，而通用 baseline 需要全图 encoding 或无法直接表达；否则 pivot/停止。

### AI core fraction and critical path

- 估计 `ai_core_fraction`: 90%
- Class: `AI_CORE_EXECUTABLE`
- AI 可完成：规范冻结、A/B 算法、MLIR/TOSA corpus、fault injection、SMT oracle、baseline comparison、消融、proof/witness 重放。
- 核心 claim 可在 CPU/开源 solver 与公开 dialect 上完全判定。
- 人工只决定未公开组内边界、最终贡献定位和投稿责任。

### Semantics-preserving open alternatives

- 不依赖特定 NPU：整数 TOSA/MLIR 语义即是研究对象；硬件只影响后续部署，不决定 proof。
- 若 ExecuTorch backend 难以构建，可用 TOSA conformance/MLIR tests 生成自然子图，但不得只用同一 oracle 生成的 mutation 作为独立证据。
- solver 可选 Z3/cvc5，必须冻结 bit-vector 语义和 timeout。

## Dual-axis score

- Academic value: `60/70`（重要性 13/15；headroom 13/15；机制深度 17/20；推广性 10/12；独立边界 7/8）
- AI executability bonus: `28/30`（artifact 6/7；核心比例 8/8；开源路径 7/7；速度 4/5；重放 3/3）
- Total: `88/100`

## AI and researcher boundary

AI 可以完成决定主要 claim 的形式语义、算法、强基线和可复现实验证据。研究者必须确认课题组未公开边界，并审核允许误差 contract 是否对应有意义的部署要求；不能把 solver `unknown` 写成验证通过。
