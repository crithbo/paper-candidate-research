# Evidence-qualified question cards

## RQ01 — strict x86 floating-point environment

- **Exact identity:** a fixed x86-64 C/C++ program whose observable result includes strict floating-point value, exceptions, and dynamic rounding environment across a call boundary.
- **Question:** can a target-specific interprocedural construction jointly choose MXCSR transitions and x86 embedded-rounding forms while preserving that complete endpoint, rather than using the current constrained-FP representation and ordinary lowering?
- **Counterfactual / non-generic discriminator:** a surviving contribution would need a target-specific state transition rule or guarantee that is not merely generic liveness, instruction scheduling, or a cost-table choice.
- **Current-source loci:** LLVM Language Reference, *Floating-Point Environment* and constrained-FP intrinsics; Clang Language Extensions, `#pragma clang fp exceptions`.
- **Minimal falsifier:** LLVM already represents `round.dynamic`, explicit rounding modes, and strict exception behavior; if the remaining decision is just placing existing state transitions/forms, it is generic scheduling and fails the contribution discriminator.
- **Finite closure route:** source-only: pin LLVM frontend/lowering entrypoints and x86 embedded-rounding forms, then ask whether any target-specific state algorithm remains. No build or experiment is required for this assignment.
- **Result:** `KNOWN_FATAL_BEFORE_RAW`. The official LLVM semantics already encode the dynamic environment and its strict exception contract; no distinct target-specific algorithm/guarantee was identified. It is not admitted as an opportunity family.

## RQ03 — AArch64 SVE FFR across a call

- **Exact identity:** a fixed AArch64 SVE program where the first-fault observation must remain usable after a call, under the same AAPCS64 calling convention and observable result.
- **Question:** can a target-specific call-graph construction preserve/consume FFR more efficiently than stock caller preservation, without changing the ABI or first-fault endpoint?
- **Counterfactual / non-generic discriminator:** a survivor would require an SVE-FFR-specific correctness or approximation theorem beyond generic caller-save liveness/shrink-wrapping.
- **Current-source loci:** Arm `abi-aa` current `aapcs64.rst` §6.1.5; current release indicates 2025Q4/2026 issue and states FFR is caller-saved.
- **Minimal falsifier:** if preserving an FFR observation across a call is simply caller save/restore (or moving use before the call), the candidate is an ordinary ABI-preservation placement problem rather than a new N2.
- **Finite closure route:** source-only LLVM AArch64 register/call-lowering map plus Arm ABI, were it to survive the discriminator.
- **Result:** `KNOWN_FATAL_BEFORE_RAW`. The governing ABI makes FFR caller-saved, so the proposed boundary action reduces to ordinary caller preservation/consumption; no target-specific non-generic algorithm or guarantee is presently specified.
