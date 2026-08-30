# Pre-evidence RQ Candidates

## RQ-S01 — RISC-V Zicond conditional form

Shared exact object: fixed RISC-V program/MachineIR, psABI, observable values/exceptions, and Zicond target.

1. Whole-function conditional-form choice preserving instruction-level semantics.
2. Joint Zicond-form, register-pressure, and scheduling construction with code-size/front-end cost.
3. Canonical no-gain boundary for branch versus conditional-form paths.

Selected before evidence: 2, conditional on a target-specific mechanism rather than ordinary instruction selection/RA/scheduling.

## RQ-S02 — Vulkan shader-object layout commitment

Shared exact object: fixed Vulkan shader-object workload, shader/interface output contract, and pipeline-layout-visible resources.

1. Compiler/runtime representation placement preserving shader/resource semantics.
2. Whole-constructor placement of layout and binary commitments preserving runtime-visible behavior.
3. Canonical workload condition where early versus late commitment is full-cost equivalent.

Selected before evidence: 2, conditional on a pinned public compiler/runtime and non-generic action. Pipeline selector/configuration changes are excluded.
