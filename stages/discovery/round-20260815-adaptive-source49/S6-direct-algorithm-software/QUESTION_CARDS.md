# Question cards — Source49 S6

No evidence-qualified Question Card is present.  The pre-evidence portfolio rule requires a target-specific state transition **external to the current action grammar** before a same-object RQ can be formed.  The candidate most likely to meet the broad topic label, LLVM RISC-V compressed-ISA register choice, fails instead for positive identity and collision reasons:

- exact object: fixed RISC-V program, ABI and C-extension semantics;
- apparent action: choose low-register assignments, compressed forms, copies and spills;
- stock endpoint: identical executable semantics with text-size and allocation-cost denominator;
- contrary current union: current LLVM's `RISCVMakeCompressibleOpt` is explicitly a size pass; it analyzes compressible uses, emits a copy/base adjustment, and updates affected operands to compressed-register/offset forms.  CC'23 directly adapts allocation priority, register choice, spilling and copy-versus-compression weighting;
- label-stripped kernel: register selection/copying, not an independently identified grammar-external target state transition.

This is recorded as frozen direct current-collision containment rather than an absence claim.  The other seeds were excluded by exact identity or terminal containment prior to RQ.
