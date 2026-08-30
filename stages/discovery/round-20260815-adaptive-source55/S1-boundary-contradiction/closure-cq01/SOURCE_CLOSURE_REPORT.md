# CQ01 MIPS FCSR source closure

## Disposition

`UNRESOLVED_BACKLOG__BOUNDED_SOURCE_OR_CARRIER_CLOSURE_INCOMPLETE`

This is a Discovery prebrief source-closure disposition only. It does not decide raw admission, a brief, tier, paper potential, Stage 0, or any later state.

## Frozen boundary and method

- Assignment: `SOURCE-CLOSURE-SOURCE55-S1-CQ01-MIPS-FCSR-V1`.
- Exact project and pin: official `llvm/llvm-project` `main` resolved to `fc145527a539be71d15fca3bc10618196e84f4cf` before target-content inspection.
- Inspected scope: only `llvm/lib/Target/Mips/**` and `llvm/test/CodeGen/Mips/**`; the frozen GCC page remains an external semantic anchor and was not used as current-LLVM evidence.
- Acquisition: six recorded, localised official-source calls; 1,060,412 persisted response-body bytes, under the 16 MiB cap. No build, install, test execution, candidate implementation, or claim-bearing observation occurred.

## Bounded current-source findings

1. `MipsISelLowering.cpp:2967-2970` implements `getRoundingControlRegisters()` as the single physical register `Mips::FCR31`. This supports a narrow current-source observation: the lowering layer recognises FCR31 as a rounding-control register.
2. `MipsInstrInfo.td:2476-2484` declares CPU/cop0/cop2 control-register moves (`MTC0`, `MFC0`, `MFC2`, `MTC2`). It does not, within the inspected slice, establish an FCSR read/write-plus-call preservation union.
3. The pinned test `llvm/test/CodeGen/Mips/2008-08-07-FPRound.ll` is a canonical in-tree MIPS rounding carrier (`llc -mtriple=mips -mattr=single-float`), but it tests `fptrunc` helper lowering. It is not the required explicit-FCSR-write/call trace and provides no legal two-action placement witness.

## Required-output assessment

| Required closure output | Result | Basis / limitation |
|---|---|---|
| Pinned current FCSR action/config/default–nondefault union | Incomplete | The current pin is fixed and FCR31 is identified, but no inspected artifact establishes the full FCSR instruction, builtin/lowering, call-clobber, ABI, or flag union. |
| Strongest current-union or generic-state-management objection | Open contrary | The generic rounding-control-register framework is a material subtractor; it may absorb ordinary placement. The frozen slice is insufficient to prove it covers the callable-state contract. |
| Fixed in-tree/public carrier | Partial | `2008-08-07-FPRound.ll` is a pinned canonical rounding carrier, not a callable FCSR state/call carrier. |
| Native legal same-object two-action witness | Not frozen | No read artifact gives an explicit FCSR write/call trace with two legal placements, preserved numerical/exception/ABI semantics, and a declared cost difference. |
| Finite oracle/falsifier route | Defined but unexecuted | A successor must inspect the pinned FCSR instruction/builtin and call-lowering sources, then freeze one MIPS hard-float trace containing explicit FCSR control and a call; a semantic or ABI difference under deferred placement is the earliest falsifier. |

## Why this is not a structural conclusion

The six-call cap was reached before inspecting the remaining named MIPS FPU instruction and call-lowering loci. That cap prevents completion of the native action/configuration union; it does not establish that FCSR actions are absent, that a two-action witness cannot exist, or that the generic objection is decisive. No transport error, HTTP status, or zero-match result is treated as absence.

## Remaining named debt and bounded resume condition

A future explicitly authorised closure assignment would need a fresh bounded resource envelope and must remain on the same `llvm/llvm-project` MIPS hard-float/FCSR callable-state object. It should inspect the then-frozen equivalents of `MipsInstrFPU.td` and MIPS call-lowering/call-preservation source, plus one exact in-tree test or official public carrier that uses explicit FCSR control across a call. It must either freeze a legal two-action witness or record a direct current-union/generic-kernel absorption with source-level coverage. No object, ABI, guarantee, or full-cost endpoint may change.
