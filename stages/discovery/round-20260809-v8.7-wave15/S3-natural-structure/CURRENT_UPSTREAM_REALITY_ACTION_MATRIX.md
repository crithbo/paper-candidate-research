# CURRENT UPSTREAM REALITY / ACTION MATRIX — WAVE15

## Audit protocol and version boundary

Audit date: `2026-08-09`.  This wave makes no implementation-absence claim.  Hence it does not turn a mutable branch into an invented full SHA.  The current official pages, current source locus, and visible options/configuration were checked to prevent false residuals.  The prior local `git ls-remote` TLS/Schannel failure remains a transport limitation only, not evidence that any feature is absent.

| Upstream / frozen version fact | Current source, documentation, and configuration checked | Action-union implication / contrary evidence |
|---|---|---|
| LLVM current documentation (Command Guide last updated `2026-07-28`; Doxygen source crawled within the preceding week) | MachineScheduler implementation, `llc` target and code-generation controls (`-mcpu`, `-mtune`, `-mattr`, `--regalloc`, optimization level), and current `llvm-mca` resource/register-file/dispatch model. | The baseline must include target model, resource/dependency scheduling, and register pressure/allocation actions.  MachineScheduler is currently limited to single blocks, but proposing arbitrary cross-block scheduling changes the current target/legality boundary and lacks a frozen natural AMD carrier; it is not evidence of a currently missing action. |
| MLIR current docs (crawled within two weeks) | Transform-dialect source semantics: typed handles and runtime verification; `alternatives`, `tune.alternatives`, `tune.knob`, SMT constraints; structured tiling/unrolling/splitting/conversion operations; dialect interfaces for legality/cost modelling. | The same payload transformation action space already contains legal composition and tuning.  A chooser over it is a prohibited selector; a replacement representation requires a distinct semantic object. |
| gem5 `v25.1.0.1` latest release (2026-04-21) and current documentation (last edited 2026-07-10) | TraceCPU elastic dependency/timing traces; GPU model release notes: MI300X real firmware, GPU page-table-walker cache, dispatch-scheduler rework, MFMA timings; CPU extension/configuration list and debug controls. | Trace structure is a valid natural carrier, but the remaining ideas are cache/scheduler controllers or simulator-model calibration, not a same-object N2/N3 construction with a native hardware guarantee. |

## Baseline-residual certificate attempt

### A. MachineScheduler / llvm-mca

- Exact object attempted: an LLVM MachineFunction retaining native target legality and output semantics.
- Strongest union: pre-RA MachineScheduler analyses and schedule strategy, target CPU/features/tune attributes, standard register allocators, target scheduling model, and llvm-mca resource/physical-register/ROB/issue model.
- Candidate complete action tested: construct a pressure-and-resource-aware instruction schedule.
- Result: absorbed.  A method that only selects/scores the native actions is a controller; a global action without a frozen native legality model is a change of object.  No finite natural Stage A killer may be truthfully frozen.

### B. MLIR Transform schedule

- Exact object attempted: the same structured payload program and lowering semantics.
- Strongest union: Transform dialect’s verified handles, alternatives, knobs, constraint and conversion actions.
- Candidate complete action tested: construct a globally legal schedule from repeated tile/layout structure.
- Result: a tuning/controller restatement; no union-external primitive or stronger same-object guarantee.

### C. gem5 trace route

- Exact object attempted: the same trace replay / simulator configuration with correct native simulation semantics.
- Strongest union: trace dependency/timing input, memory hierarchy and CPU/GPU configuration, maintained scheduler/models and debug/configuration actions.
- Candidate complete action tested: construct an execution/memory action from recurring trace locality.
- Result: cache/controller/model-calibration direction or changed hardware object; no legal N2/N3 residual.

## Terminology boundary

This independent scan does not use the excluded gfx1250/TDM/WMMA routes.  The standing boundary is preserved: `gfx1250` is not treated as unverified CDNA5, and AMD Tensor Data Mover/Tensor DMA is not NVIDIA TMA.
