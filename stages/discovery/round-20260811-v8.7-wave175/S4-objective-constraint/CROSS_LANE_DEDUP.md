# Cross-lane deduplication

This package is a depth-redteam continuation of Wave169 R06 only. It does not reopen the active AMDGPU register/occupancy topic and does not claim AMD equivalence for an NVIDIA NVGPU/NVVM object.

| exact object | boundary |
|---|---|
| fixed MLIR `gpu`/`nvgpu` kernel lowered through NVVM to a matching NVIDIA backend | fixed MLIR program semantics, matching NVIDIA target, fixed numerical/bounds behavior, and explicit async dependence only |

`gfx1250 != CDNA5`; AMD Tensor DMA/TDM is not NVIDIA TMA. Neither appears in this target contract.
