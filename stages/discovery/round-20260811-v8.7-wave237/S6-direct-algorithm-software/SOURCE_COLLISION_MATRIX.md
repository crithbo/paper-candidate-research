# Source and collision matrix

| Role | Primary source | Support / collision impact |
|---|---|---|
| Current BOLT route | [LLVM BOLT README](https://github.com/llvm/llvm-project/blob/main/bolt/README.md) | Explicit combined block reorder, function reorder, split, cold/EH split, profile and debug options; establishes strong composition. |
| Reorder implementation | [LLVM BOLT ReorderAlgorithm header](https://llvm.googlesource.com/llvm-project/%2B/refs/tags/llvmorg-20.1.3/bolt/include/bolt/Passes/ReorderAlgorithm.h) | Native BOLT reorder algorithm family, including ext-tsp. |
| Relaxation mechanism | [LLVM BranchRelaxation source](https://llvm.org/doxygen/BranchRelaxation_8cpp_source.html) | Target branch relaxation/trampoline insertion is an existing native mechanism. |
| BOLT paper | [BOLT: A Practical Binary Optimizer](https://arxiv.org/abs/1807.06735) | Direct profile-driven post-link layout subtractor. |
| Block-layout collision | [Improved Basic Block Reordering](https://arxiv.org/abs/1809.04676) | ext-tsp/BOLT direct block-order comparator. |
| Interprocedural collision | [Codestitcher](https://arxiv.org/abs/1810.00905) | Direct interprocedural basic-block layout comparator. |

No collision-free or current-union-complete conclusion is claimed. A later review must use a pinned current LLVM source snapshot and explicitly subtract the above mechanisms before proposing a new joint guarantee.
