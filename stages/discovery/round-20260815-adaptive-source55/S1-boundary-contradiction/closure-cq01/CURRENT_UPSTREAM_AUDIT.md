# Current upstream audit — pinned MIPS scope

| Item | Evidence |
|---|---|
| Current upstream resolution | Official GitHub commit API response retained as `resources/downloads/attempt-01-llvm-main-commit.json`; resolved `main` to `fc145527a539be71d15fca3bc10618196e84f4cf`. |
| Source-scope selection | Pinned official directory listing retained as `attempt-02-mips-directory.json`; selected MIPS lowering/instruction artifacts only. |
| Default/nondefault surface actually inspected | `MipsISelLowering.cpp` and `MipsInstrInfo.td`; no default/nondefault FCSR option is asserted from this bounded slice. |
| Current positive evidence | `MipsTargetLowering::getRoundingControlRegisters()` returns `Mips::FCR31`. |
| Contrary evidence | Existing generic rounding-control-register handling is present at the lowering interface, so any later residual must distinguish callable FCSR observability from ordinary state placement. |
| Canonical carrier | `llvm/test/CodeGen/Mips/2008-08-07-FPRound.ll` at the same pin, limited to floating truncation/rounding lowering. |
| Unread but named next loci | `llvm/lib/Target/Mips/MipsInstrFPU.td` and MIPS call-lowering/call-preservation source. They remain unread because the frozen six-call acquisition cap is reached. |
| Claim ceiling | Current source findings support only the stated bounded inventory; they do not support a current-union absence claim, a residual claim, or a two-action witness claim. |

The bounded GitHub Contents listings were official repository views of the two already-authorised MIPS subtrees. They were used instead of a recursive whole-repository tree response in order to respect the response-size cap.
