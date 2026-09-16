# Source122 S6 Exact Carrier Portfolio

Frozen before lookup; no replacement/backfill.

1. llama.cpp `tests/test-backend-ops.cpp`
2. llama.cpp `tests/test-quantize-fns.cpp`
3. Triton `python/test/regression/test_transitive_reduction.py`
4. Triton `python/test/unit/runtime/test_jit.py`
5. PyTorch `test/inductor/test_triton_kernels.py`
6. PyTorch `test/inductor/test_combo_kernels.py`
7. LLVM `llvm/test/CodeGen/NVPTX/atomicrmw.ll`
8. LLVM `llvm/test/CodeGen/NVPTX/tma.ll`

Each carrier must expose a target-specific action/endpoint before RQ convergence; missing paths remain unresolved.
