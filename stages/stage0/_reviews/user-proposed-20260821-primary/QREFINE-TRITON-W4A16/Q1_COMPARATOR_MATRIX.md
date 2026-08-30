# Q1/Q2 Comparator Matrix — QREFINE-TRITON-W4A16

| 校准对象 | 同对象维度 | 已覆盖的主张 | 未覆盖的残差 | 用途 |
|---|---|---|---|---|
| Wang et al. 2022, SMT-based TV for MLIR | MLIR TV 与 FP/reduction；非 Triton target snapshot | MLIR lowering 的 SMT TV、FP 抽象/refinement | exact W4A16 packed trace、target-aware pre-`llvm.to_module` snapshot、双 GPU lowering | 最强方法基线 |
| TVOC / Necula TV | 每次编译实例的验证思想 | translation-validation 与 VC construction | GPU MLIR、mixed BV/IEEE、target operational trace | 谱系与理论基线 |
| LLVM AArch64 TV（2025） | 后端 validation | 现实 LLVM 后端的 TV 规模与工程门槛 | GPU targets、冻结算子/边界及 MLIR semantics | 近一区工程形状校准 |
| Triton tests / native verifier | 同一 compiler object | parse/type/IR/test 约束 | relational semantic proof 与局部 counterexample | 必跑 native baseline |

## Q1/Q2 形状判断

Q2 可由一个可复现的、target-aware mixed-semantics TV 系统、真实 lowering 反例/通过率、
与公平 native comparison 形成。Q1 需要超出单一 W4A16 内核：例如一组同语义 family 的
generalization、多个真实缺陷或更强的组合/复杂度结果。本题不得把这项未来扩展写成现有
主张。

## 参考

- Wang et al. (2022), [SMT-Based Translation Validation for Machine Learning Compiler](https://link.springer.com/chapter/10.1007/978-3-031-13188-2_19).
- Barrett et al. (2005), [TVOC](https://theory.stanford.edu/~barrett/pubs/BFG%2B05-abstract.html).
- Necula (2000), [Translation validation for an optimizing compiler](https://doi.org/10.1145/349299.349314).
- Berger et al. (2025), [Translation Validation for LLVM’s AArch64 Backend](https://doi.org/10.1145/3763147).
