# QREFINE-TRITON-W4A16 — decisive source log

| Source | Read scope | Independent finding | Classification |
|---|---|---|---|
| Frozen NVIDIA backend `triton_nvidia_compiler_f797708.py`, SHA256 `D012F2A7...9658` | `make_llir`, pass run, conversion adjacency | `pm.run(...,'make_llir')` precedes `llvm.to_module` | exact-object positive evidence |
| Frozen AMD backend `triton_amd_compiler_f797708.py`, SHA256 `8DF3EF9D...B5865F4` | same symbols | same adjacent boundary | exact-object positive evidence |
| [Current Triton NVIDIA backend](https://github.com/triton-lang/triton/blob/main/third_party/nvidia/backend/compiler.py) and [AMD backend](https://github.com/triton-lang/triton/blob/main/third_party/amd/backend/compiler.py) | current `make_llir` boundary | boundary persists; no validator-absence inference | current-reality evidence |
| [Triton FpSan documentation](https://triton-lang.org/main/programming-guide/chapter-3/fpsan.html) | model, supported properties, exclusions, AMD support | structural payload checker; explicitly not IEEE semantics | strong native subtractor, not fatal |
| [Wang et al., SMT-Based Translation Validation for Machine Learning Compiler](https://link.springer.com/chapter/10.1007/978-3-031-13188-2_19) | semantics/FP encoding/validation endpoint | high-level MLIR TV with FP abstraction/refinement | strongest method comparator, partial |
| [Verified Lifting of Deep Learning Operators](https://arxiv.org/abs/2412.20992) | abstract and method boundary | verifies synthesized high-level formulas from Triton implementations | close operator-verification subtractor, different endpoint |
| [Formal pointer safety verifier for Triton kernels](https://discourse.llvm.org/t/formal-pointer-safety-verifier-for-triton-gpu-kernels-feedback-on-integration-approach/91008) | RFC scope | Z3 pointer/OOB safety only | current adjacent tool, not full relation |
| [Translation Validation for LLVM's AArch64 Backend](https://doi.org/10.1145/3763147) | publication identity and backend-TV scope | per-compilation backend TV on a different target/IR endpoint | engineering-shape comparator |

Search cutoff: 2026-08-21. Direct-collision status remains `SEARCH_BOUNDED_OPEN`; no
zero-result or transport event is used as absence evidence. Browser/network responses were
transient and were not persisted as project resources.
