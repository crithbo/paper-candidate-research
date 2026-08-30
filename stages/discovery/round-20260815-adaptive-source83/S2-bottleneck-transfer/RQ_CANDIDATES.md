# RQ candidates

## Primary RQ — S83-RQ-01

For a fixed LLVM program/module set, target, ABI, executable behavior, and code-size objective, is there a new target-specific joint planner of interprocedural outlining and linker identical-code folding (ICF), with a formal size/locality guarantee, beyond the current LLVM composition?

Current first-party evidence directly answers the candidate: Clang documents codegen-data driven cross-translation-unit outlining followed by conventional ICF; LLVM's current MachineOutliner source contains global-outlining controls; and the 2025 LLVM technical material reports Global Function Merger leveraging linker ICF. The intended constructor is therefore current-union/paper-owned rather than an unexpressed residual.

No renamed optimizer, policy selector, or generic set-cover/ILP formulation is carried forward.
