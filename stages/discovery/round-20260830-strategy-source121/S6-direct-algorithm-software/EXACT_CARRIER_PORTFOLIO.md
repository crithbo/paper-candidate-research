# Source121 S6 Frozen Exact Carrier Portfolio

- Frozen before external lookup: `YES`
- Timestamp: `2026-08-30T03:00:00+08:00`
- Result-aware replacement: forbidden.

| ID | Official merged carrier candidate | Intended fixed decision surface |
|---|---|---|
| C01 | `pytorch/pytorch test/inductor/test_scheduler.py` | scheduler dependency/fusion ordering |
| C02 | `pytorch/pytorch test/inductor/test_loop_ordering.py` | loop-order cost/action invariants |
| C03 | `pytorch/pytorch test/inductor/test_fusion.py` | fusion legality/profitability action |
| C04 | `triton-lang/triton python/test/unit/runtime/test_autotuner.py` | autotuner cache/key/pruning semantics |
| C05 | `triton-lang/triton python/test/unit/language/test_core.py` | target-language lowering regression fixture |
| C06 | `llvm/llvm-project llvm/test/CodeGen/NVPTX/ldmatrix.ll` | NVPTX ldmatrix lowering legality |
| C07 | `llvm/llvm-project llvm/test/CodeGen/NVPTX/wmma.py` | WMMA intrinsic/lowering coverage |
| C08 | `llvm/llvm-project mlir/test/Dialect/GPU/barrier-elimination.mlir` | GPU barrier elimination legality |

Missing/renamed carriers remain unresolved; adjacent files cannot replace them.
