# SOURCE / COLLISION MATRIX — WAVE17

## Current-upstream reality record

Audit date: `2026-08-09`.  The candidate routes below make no claim that a current implementation lacks a feature.  Therefore no mutable `main` commit SHA is invented.  Current official documentation/source loci and all relevant exposed configuration categories were inspected; the prior local `git ls-remote` Schannel failure is recorded only as a transport limitation.

| Source / frozen fact | Official current evidence checked | Default and non-default controls considered | Contrary evidence / collision outcome |
|---|---|---|---|
| ROCm LLVM `22.0.0git` AMDGPU documentation, checked 2026-08-09 | AMDGPU Code Object V3+ notes use `NT_AMDGPU_METADATA` MsgPack; target IDs represent processor plus optional target features. | `-mcpu` / `--offload-arch`, target-ID feature settings, compiler `-mattr` propagation and related code-object target choices. | Current ABI and producer/loader path already own the representation.  Altering it changes object/ABI; sidecar construction is a wrapper. |
| MLIR current Transform/Pass/SMT documentation, checked 2026-08-09 | `transform.alternatives`, `transform.tune.alternatives`, `transform.tune.knob`, `transform.smt.constrain_params`, `transform.verify`, typed handles and execution-time failure; `-transform-dialect-check-uses`. | Alternative regions, selected region parameters, tune knobs, transform scope, TransformOptions, and SMT constraints. | Current union already exposes legal construction and checking.  A residual only selects/scores these actions, forbidden as controller/selector. |
| gem5 official release `v25.1.0.0` commit `7a2b0e4` and current documentation, checked 2026-08-09 | TraceCPU replays dependency/timing annotated elastic traces for hierarchy/interconnect/DRAM exploration. Release notes list MI300X real firmware, page-table-walker cache, dispatch-scheduler rework and MFMA timings. | Trace file/replay settings, CPU/model extensions, hierarchy and GPU configuration, statistics/debug controls. | A trace-conditioned choice is native configuration control; changing model behavior is a simulator-model study, not the same runtime/compiler object. |

## Action-gap and fidelity assessment

| Route | Exact object / function | Proposed union-external atomic action | FIDELITY_CLOSURE_PLAN possible? | Finite Stage A killer possible? | Outcome |
|---|---|---|---|---|---|
| Code object | Native AMDGPU code object accepted by native loader with unchanged ABI semantics | None: new metadata changes ABI; post-hoc rewriter changes object | No | No | Drop |
| MLIR transform | Same payload IR and semantics under native Transform execution | None: legal sequence/verification/alternatives already native; selection forbidden | No | No | Drop |
| gem5 trace/model | Same official trace replay/model configuration semantics | None: configuration policy/controller or a distinct modeling question | No | No | Drop |

## Primary sources

- AMDGPU backend/code-object documentation: https://rocm.docs.amd.com/projects/llvm-project/en/latest/LLVM/llvm/html/AMDGPUUsage.html
- ROCm compiler target-feature reference: https://rocm.docs.amd.com/projects/llvm-project/en/latest/reference/rocmcc.html
- MLIR Transform dialect: https://mlir.llvm.org/docs/Dialects/Transform/
- MLIR Transform passes: https://mlir.llvm.org/docs/Passes/
- MLIR SMT dialect: https://mlir.llvm.org/docs/Dialects/SMT/
- gem5 official releases and TraceCPU documentation: https://github.com/gem5/gem5/releases and https://www.gem5.org/documentation/general_docs/cpu_models/TraceCPU
