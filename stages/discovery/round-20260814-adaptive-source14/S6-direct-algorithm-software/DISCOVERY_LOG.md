# Discovery log — Source14 accelerator-heavy compiler/architecture screen

## Scope and result

`DISCOVERY-S6-20260814-ADAPTIVE-SOURCE14` is canonical v8.7 with V9 OFF.
Six fresh non-security compiler/architecture families were screened with a 4:2
accelerator/CPU source mix. Hexagon, PRIVATE_TOOLCHAIN LLVMGPU, active AMDGPU occupancy,
generic scheduling/layout, paper-owned complete constructors, and all network
security/vulnerability/exploit categories were excluded before admission.

**Result: COMPLETE_ZERO_PROPOSALS.** Two candidate-grade reviews found no
target-specific exact/FPT/certified residual. This does not infer anything from
missing hardware, implementation, results, resources, or AI readiness.

## Current-source evidence

LLVM's current NVPTX source directory exposes native lowering, instruction
selection, parameter-forwarding, frame-lowering and address-folding passes [S1].
The current NVPTX guide fixes target triple, kernel calling convention and
address-space semantics [S2]. LLVM's code-generator guide states that instruction
selection is target-specific but uses SelectionDAG automatic techniques, including
dynamic-programming optimal pattern matching [S3]. Arm Ethos-U Vela documents its
fixed target, inputs, command streams, system/memory modes and optimization
strategy controls [S4].

These sources support current-union subtraction. They do not support an absence
assertion merely because a broader planner API is not exposed.

## Funnel

| Stage | Count | Detail |
|---|---:|---|
| Unique raw families | 6 | Four accelerator and two CPU backend. |
| Candidate-grade deep reviews | 2 | NVPTX address/parameter lowering; Ethos-U Vela command stream. |
| Briefs | 0 | No Q2-shaped target-specific residual survives. |
| Structural drops | 5 | Generic instruction selection, layout/memory-mode configuration, or clause/scheduling kernel. |
| Not admitted | 1 | LoongArch immediate construction lacks a closed target-specific guarantee. |

## Candidate-grade reviews

### D1 — LLVM NVPTX address/parameter lowering

* **Object:** fixed LLVM IR, NVPTX triple, CUDA driver interface, kernel/device
  calling convention, address-space semantics and emitted PTX behavior.
* **Two-plan outline:** an equivalent pointer/value remains in generic space or
  is legally folded/forwarded to a target address-space sequence.
* **Union:** `NVPTXGenericToNVVM`, address folding, parameter forwarding,
  argument lowering, SelectionDAG ISel, target lowering and relevant flags.
* **Subtraction:** the whole-module choice is instruction-selection/addressing
  costing. No NVPTX-specific bounded state and non-generic guarantee was frozen;
  any solver is generic ISel/DP or a pass selector.
* **Disposition:** `STRUCTURAL_DROP__GENERIC_INSTRUCTION_SELECTION_OR_PASS_COMPOSITION`.

### D2 — Arm Ethos-U Vela command-stream / SRAM construction

* **Object:** fixed quantized TFLite/TOSA network, Ethos-U system/memory contract,
  command-stream semantics and output tensors.
* **Two-plan outline:** two legal tensor-placement/subgraph choices have
  different SRAM placement or command stream but identical numerical output.
* **Union:** accelerator config, system config, memory mode, time-versus-runtime
  memory strategy, and stock compiler planning.
* **Subtraction:** the remainder is generic packing/scheduling or an optimization
  mode selector; no target-specific exact/FPT/certified frontier was frozen.
* **Disposition:** `STRUCTURAL_DROP__MEMORY_MODE_CONFIGURATION_OR_GENERIC_PACKING`.

## Natural routes, full cost and killers

No program was built or run. NVPTX closure would pin public LLVM GPU kernels,
PTX verification and fixed resource constraints. Cost includes compile CPU/wall/
RSS/temp, PTX bytes, host launch overhead and target register/local/shared memory.
Its killer is a same-IR same-PTX-semantics two-plan witness with an NVPTX-specific
guarantee irreducible to ISel or generic DP.

Vela closure would pin public versioned TFLite/TOSA models and the stock output
checker. Cost includes compile CPU/wall/RSS/temp, command-stream bytes, host
invocation and on-chip memory/latency. Its killer is a non-selector target-specific
certified constructor under an unchanged Vela system/memory contract.

## Sources

* [S1] LLVM current NVPTX backend directory:
  https://llvm.org/doxygen/dir_fe493ff4c29aeb7f930cb534e2b86d17.html
* [S2] LLVM current NVPTX backend user guide:
  https://llvm.org/docs/NVPTXUsage.html
* [S3] LLVM current code-generator guide:
  https://www.llvm.org/docs/CodeGenerator.html
* [S4] Arm Ethos-U Vela upstream source/documentation:
  https://github.com/nxp-imx/ethos-u-vela
