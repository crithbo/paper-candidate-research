# Source43 RQ convergence

## RQ01 — PowerPC CTR-loop construction

For fixed PowerPC MachineIR, loop semantics, target mode and final machine-code behavior, can a whole-loop constructor choose legal CTR versus normal loop lowering with a target-specific guarantee beyond LLVM's existing PPC CTR-loop construction?

Pre-evidence variants: (A) choose CTR eligibility; (B) construct CTR setup/dec actions; (C) jointly construct all legal CTR/normal loop forms. C was selected because A/B would be local eligibility or emitter questions.

## RQ02 — MIPS delay-slot construction

For fixed MIPS MachineIR, subtarget and behavior, can a target-specific whole constructor select a legal delay-slot filler and branch form with a non-generic guarantee beyond the current filler?

Pre-evidence variants: (A) backward-only filler; (B) cross-block filler; (C) all native legal search modes plus hazard constraints. C was selected; A/B are incomplete parts of the same object.

## RQ03 — x86 execution-domain construction

For fixed x86 SSE machine code behavior and subtarget, can a whole constructor assign equivalent operand-domain encodings with a target-specific latency/transition guarantee beyond the current execution-domain fix pass?

Pre-evidence variants: (A) individual opcode replacement; (B) local chain choice; (C) full MachineFunction domain assignment. C was selected; A/B are emitter-local.

All RQs are `RQ_READY_FOR_EVIDENCE_LOOKUP` only. Evidence, not the formulation, determines their dispositions.

