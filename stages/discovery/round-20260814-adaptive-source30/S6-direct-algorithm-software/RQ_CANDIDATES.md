# Source30 RQ Candidates

## RQ30-01 — MVE multiblock tail-predicated loop constructor

- Seed: S30-01; `COMPILER_TOOL`, N2.
- RQ-A: For a fixed MVE vector loop with low-overhead branch semantics, can a legal multiblock region be constructed into tail-predicated and fallback subregions with a certified cost frontier?
- RQ-B: Can a bounded VPT/LOB/control-flow interface yield an FPT constructor that preserves the same active-lane and loop-result semantics beyond current single-block handling?
- Selected: RQ-B. Boundary: fixed LLVM IR/MachineFunction, Armv8.1-M MVE+LOB features, loop results, exceptions and branch semantics.
- Primary route: official LLVM current MVE tail-predication/low-overhead-loop sources and LLVM tests; fallback official LLVM release source only.
- FINER-lite: feasible `CLEAR`; interesting `CLEAR`; novelty threat `HIGH`; scope `PASS`; relevant `CLEAR`.
- Disposition: `RQ_READY_FOR_EVIDENCE_LOOKUP`.

## RQ30-02 — AArch64 MOPS expansion

- Selected question: can fixed MOPS memory semantics admit a non-generic, target-specific joint expansion guarantee? The identical object must preserve fault/observable memory behavior.
- Disposition: `RQ_READY_FOR_EVIDENCE_LOOKUP`; expected generic-instruction-selection risk is pre-registered.

## RQ30-03 — LoongArch address materialization

- Selected question: can fixed LoongArch relocatable code admit a target-specific constructor outside linker-layout and generic instruction-selection kernels?
- Disposition: `RQ_READY_FOR_EVIDENCE_LOOKUP`; linker-family collision risk is pre-registered.

## RQ30-04 — cooperative matrix region lowering

- Selected question: does one fixed target extension define a distinct stock oracle and finite joint fragment-state action? No assertion of a residual.
- Disposition: `RQ_READY_FOR_EVIDENCE_LOOKUP`.

All selected questions and their primary routes were frozen before evidence results.
