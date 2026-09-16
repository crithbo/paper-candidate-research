# Source123 S6 Frozen Seed Portfolio

- Frozen before first source call: `YES`
- Timestamp: `2026-08-30T04:10:00+08:00`
- Non-evidence seeds: 8; result-aware replacement forbidden.

| Seed | Exact carrier candidate | Target-specific hunch | Primary RQ |
|---|---|---|---|
| S01 | Triton `python/test/unit/language/test_block_pointer.py` | block-pointer boundary/layout legality data structure | Can a target-native block-pointer legality certificate remove redundant masks while preserving exact address semantics? |
| S02 | Triton `python/test/unit/language/test_gather_scatter.py` | indexed memory transaction coalescing under exact indices | Can index-shape structure drive a non-tuning gather/scatter transaction planner with identical memory semantics? |
| S03 | PyTorch `test/inductor/test_pad_mm.py` | padding-aware GEMM layout action | Can padding be represented as a zero-copy layout action rather than materialization under identical GEMM results? |
| S04 | PyTorch `test/inductor/test_unbacked_symints.py` | symbolic-bound propagation data structure | Can unbacked-symbol constraints be incrementally maintained to reduce recompilation without weakening guards? |
| S05 | LLVM `llvm/test/CodeGen/NVPTX/mma.py` | generated MMA lowering coverage | Does the generator cover the current feature/type/layout decision matrix, or is a finite target-specific coverage construction needed? |
| S06 | MLIR `mlir/test/Conversion/NVGPUToNVVM/nvgpu-to-nvvm.mlir` | NVGPU lowering legality/action | Can a target-specific conversion certificate select lowerings beyond pattern ordering while preserving NVVM semantics? |
| S07 | LLVM `llvm/test/CodeGen/NVPTX/tma.py` | TMA descriptor/codegen coverage | Can descriptor invariants drive a non-generic lowering action or rigorous negative replication endpoint? |
| S08 | Triton `test/Conversion/tritongpu-to-llvm.mlir` | TritonGPU→LLVM conversion regression | Can a target-specific layout-conversion graph eliminate redundant conversions under exact output/layout semantics? |

Every RQ is conditional on exact merged carrier closure; missing paths yield abstention, not replacement.
