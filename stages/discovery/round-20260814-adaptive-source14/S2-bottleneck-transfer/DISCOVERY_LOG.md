# Discovery log — Source14

assignment: DISCOVERY-S2-20260814-ADAPTIVE-SOURCE14  
method: V8_7_POTENTIAL_READINESS_SEPARATED; V9 OFF; cutoff: 2026-08-14.

## Funnel

| raw family | outcome | basis |
|---|---|---|
| OpenXLA GPU buffer assignment + latency-hiding schedule | DEEP_DIVE_REQUIRED | fixed HLO, output and memory budget can be named |
| PRIVATE_TOOLCHAIN AMDGPU async-DMA pipeline + resource use | DEEP_DIVE_REQUIRED | fixed executable and pipeline lowering can be named |
| NVIDIA PTX cluster shared-memory mapping + CTA partition | EXCLUDED | overlaps Source13 data-movement/TMA action boundary |
| Blackwell tcgen05 TMEM/SMEM placement | NOT_ADMITTED_UNFROZEN | bounded two-plan, public stock-oracle route not closed |
| OpenXLA TPU collective / memory schedule | DROP | native scheduler and flags already expose the sketched policy space |
| GPU compiler library-selection + fusion | DROP | selector/library choice, not a target-specific joint algorithm |

## Deep review

### OpenXLA GPU buffer assignment + schedule

Fixed attempted object: version-pinned HLO module, target GPU, executable output and numerical contract. OpenXLA's current architecture says its scheduler considers peak memory and its flags expose multiple memory schedulers plus latency-hiding/analytical overlap mechanisms. The proposed action was a jointly chosen buffer schedule and overlap policy. No union-external atomic action with an exact/FPT/certified-frontier guarantee was frozen: the remaining construction is either an existing scheduler choice or generic resource-constrained scheduling. DROP.

### PRIVATE_TOOLCHAIN AMDGPU async-DMA lowering

Fixed attempted object: PRIVATE_TOOLCHAIN GPU executable, target, program output and ABI. The current CodegenCommonGPU reference exposes AMDGPU async-DMA lowering, resource-usage constraints and pipeline depth. The putative residual changes pipeline depth and DMA staging, i.e. prohibited configuration/selector behavior, unless a target-specific non-generic action/guarantee is named. None was frozen from the bounded primary-source review. DROP.

## Integrity boundary

All network-security, protocol-security, vulnerability, exploit and traffic-security families were excluded before screening. No experiment, build, installation, download, or readiness-based negative conclusion occurred.

## Final

COMPLETE_ZERO_PROPOSALS. The two deep reviews fail only because their concrete action sketches are current-union/configuration expressions or generic scheduling; the Blackwell direction remains NOT_ADMITTED_UNFROZEN rather than a scientific negative result.
