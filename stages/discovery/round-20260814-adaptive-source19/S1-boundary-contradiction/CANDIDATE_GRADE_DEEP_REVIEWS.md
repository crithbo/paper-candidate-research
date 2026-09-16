# Candidate-grade deep review

## D01 — `AARCH64_FPMR_FP8__CALL_BOUNDARY_STATE_WRITE__FIXED_FP8_RESULT_AND_ABI`

**Frozen same-object witness.** In a loop calling an FP8 routine with the same required FPMR value, both (a) an unconditional FPMR write before every operation and (b) a read/compare/conditional write preserve the same FP8 result and public AAPCS64 call contract. The tension is native: FPMR controls modal FP8 instructions and AAPCS64 classifies it as caller-saved.

**Proposed residual considered.** A whole-call-graph FPMR-state region constructor could choose placements of writes/checks across basic blocks and call boundaries, with an exact/FPT/Pareto guarantee over writes, checks, code bytes, register pressure and control-flow cost while retaining every FP8 result and caller-saved ABI observable. Natural StageA closure would use public FP8 intrinsic tests/call-loop corpus, assembler/disassembler and ABI oracle; costs would be compile CPU/RSS, code bytes, FPMR reads/writes/branches, spill/frame growth and runtime cycles. A mismatched FP8 value or ABI-visible state effect would kill it within 72 hours.

**Current-upstream reality and collision.** Arm’s current AAPCS64 explicitly says FPMR controls modal FP8 behavior and is caller-saved. GCC’s upstream commit `1886dfb27a296b31de46b44beae0f1db6c1584b6` (“Avoid redundant writes to FPMR”) describes the same repeated-call witness, emits a conditional FPMR write, and has a target tuning flag. The upstream LLVM discussion likewise addresses FPMR representation and optimization. Thus the supposed primitive, information condition, target-specific cost trade-off and direct two-action witness are already current compiler work, not an unopened seam.

**Fair strongest-union decision.** A proposed extension that merely selects intervals, thresholds or variants of the existing conditional write is target cost tuning. A generic region/RA/scheduling solver would be non-specific. A more aggressive construction would need to preserve FPMR through calls, conflicting with the frozen caller-saved contract unless it changes the ABI. Therefore the known current union absorbs the only static witness before a new target-specific N2 guarantee can be frozen.

**Disposition.** `DROP__DIRECT_CURRENT_GCC_FPMR_REDUNDANT_WRITE_COLLISION_AND_ABSORPTION`.

This is a structural collision, not a conclusion based on lack of hardware, implementation, results, or AI readiness.
