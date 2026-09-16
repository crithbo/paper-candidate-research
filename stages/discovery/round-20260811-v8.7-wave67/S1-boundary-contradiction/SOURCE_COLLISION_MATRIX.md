# Source and collision matrix

All cited materials are official standards, project documentation, or upstream documentation/source entry points checked on 2026-08-11.  “Current” means the official live documentation at that date; no dated paper, issue, or future-work statement is used to establish an absence.

| Object | Primary current source | Collision / action-space finding | Result |
|---|---|---|---|
| LLVM FP environment | [LLVM LangRef](https://llvm.org/docs/LangRef.html) | Constrained operations and strict environment are already explicitly separated from fast-math permissions. | No union-external strict action frozen. |
| MLIR arith | [MLIR Arith dialect](https://mlir.llvm.org/docs/Dialects/ArithOps/) | Fast-math is an explicit semantic attribute; using it violates the frozen strict object. | Drop. |
| GCC FP | [GCC optimize options](https://gcc.gnu.org/onlinedocs/gcc/Optimize-Options.html), [FP implementation](https://gcc.gnu.org/onlinedocs/gcc/Floating-point-implementation.html) | Rounding, traps, signaling NaNs, contraction, and unsafe math are exposed controls with stated semantic effects. | Drop. |
| Java FP | [Java SE 21 JLS §15](https://docs.oracle.com/javase/specs/jls/se21/html/jls-15.html) | No independently specifiable current-union-external algorithmic action obtained. | Drop. |
| CUDA FP | [nvcc manual](https://docs.nvidia.com/cuda/cuda-compiler-driver-nvcc/contents.html), [CUDA FP guide](https://docs.nvidia.com/cuda/cuda-programming-guide/05-appendices/mathematical-functions.html) | FTZ, approximate div/sqrt, and contraction are documented policy choices; “fast” alters the contract. | Drop. |
| PyTorch determinism | [deterministic API](https://docs.pytorch.org/docs/stable/generated/torch.use_deterministic_algorithms.html), [reproducibility note](https://docs.pytorch.org/docs/stable/notes/randomness.html) | Native deterministic selection/fail-closed behavior occupies the proposed dispatch space. | Drop. |
