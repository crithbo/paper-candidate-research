# Source32 RQ Candidates

## RQ32-01 — SystemZ packed-stack callee-save construction

- RQ-A: For fixed SystemZ ELF MachineFunction/ABI, can callee-save selection and packed-stack object layout be jointly constructed with a target-specific code-size/prologue-cost guarantee?
- RQ-B: Does the ABI’s fixed register-save range and packed-stack state admit a finite certified Pareto constructor beyond sequential RA then frame layout?
- Selected: RQ-B. Type `COMPILER_TOOL`, N2. Same function, ABI, exception behavior and object semantics are immutable.
- Primary: current official SystemZ frame-lowering/register sources; canonical LLVM SystemZ tests. Fallback: official LLVM release source only.
- FINER-lite: feasible `CONDITIONAL`; interesting `CONDITIONAL`; novelty threat `HIGH`; scope `PASS`; relevant `CONDITIONAL`.
- Disposition: `RQ_READY_FOR_EVIDENCE_LOOKUP`.

## RQ32-02 — AArch64 SVE frame state

Potentially adjacent to cooled SME; not promoted until exact identity distinctness is closed.

## RQ32-03 — NVPTX mbarrier state

Potentially overlaps cooled GPU barrier identity; no pre-evidence exemption.

## RQ32-04 — SystemZ XPLINK layout

Separate ABI from RQ32-01 but source union not closed within this cycle.
