# Claim / source matrix — S5-OCCUPANCY-CLIFF-JOINTCODEGEN

| Claim under confirmation | Primary/authoritative source independently checked | Sentry assessment |
|---|---|---|
| Current LLVM AMDGPU scheduling accounts for occupancy/register pressure | [LLVM GCNSchedStrategy](https://llvm.org/doxygen/classllvm_1_1GCNSchedStrategy.html); [AMDGPU guide](https://llvm.org/docs/AMDGPUUsage.html) | Supported; commit/target pinning is mandatory. |
| Generic joint RA/scheduling absorbs the object | [Unison](https://arxiv.org/abs/1804.02452) and PRIMARY comparator matrix | Methodological, not direct; fixed-stack gap must be measured. |
| A CP-SAT optimum is a fair baseline | PRIMARY scope rule | Rejected; it is a bounded ceiling, not a production baseline. |
| Natural occupancy-cliff headroom exists | No source-bound two-input corpus yet | Unproven; gate is correctly kill-first. |
