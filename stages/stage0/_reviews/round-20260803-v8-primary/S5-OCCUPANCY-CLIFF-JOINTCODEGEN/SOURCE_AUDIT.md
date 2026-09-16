# Source / collision audit — S5-OCCUPANCY-CLIFF-JOINTCODEGEN

| Source | Grade | Finding |
|---|---|---|
| [LLVM GCNSchedStrategy](https://llvm.org/doxygen/classllvm_1_1GCNSchedStrategy.html) | current official source | current scheduler tracks target occupancy and register pressure |
| [LLVM AMDGPU guide](https://llvm.org/docs/AMDGPUUsage.html) | official documentation | resource/tier semantics require exact target pinning |
| [Unison](https://arxiv.org/abs/1804.02452) | TOPLAS publication/preprint | generic joint RA/scheduling subtractor |
| [GPU min-reg](https://arxiv.org/abs/2303.06855) | preprint only | supporting baseline, not a venue-strength claim |

**Collision:** no `DIRECT_FATAL`; direct subtract invalidates generic/learned/ordinary scheduler framing. Natural residual is unmeasured, so revision is scientific rather than resource-driven.
