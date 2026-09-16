# Same-object RQ candidates

## RQ-01 — X86 LEA repair plan

For a fixed x86 MachineFunction, ABI and subtarget, can a target-specific constructor choose legal address-generation instruction repairs with a formal code-quality/cost guarantee not already expressed by LLVM's current `X86FixupLEAs` pass?

## RQ-02 — AMDGPU operand-fold plan

For a fixed AMDGPU MachineFunction and ISA semantics, can a target-specific whole-function constructor select legal immediate/frame-index/subregister operand folds with a non-generic code-quality or register-pressure guarantee beyond current `SIFoldOperands`?

## RQ-03 — Thumb2 IT-block plan

For a fixed Thumb2 MachineFunction and predication semantics, can a constructor choose legal IT-block formation and instruction movement with a target-specific guarantee beyond the current `Thumb2ITBlock` pass and `-arm-restrict-it` setting?

All candidates fix object, semantics and stock machine-code verification. Their source loci resolve the proposed primitive as a current producer action; no evidence-qualified raw survives.
