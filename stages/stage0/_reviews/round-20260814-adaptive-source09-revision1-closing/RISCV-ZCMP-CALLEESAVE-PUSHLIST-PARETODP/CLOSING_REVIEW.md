# RISC-V Zcmp callee-save/push-list Pareto DP — independent Revision 1 closing

## Disposition

- Assignment: `STAGE0-C2-20260814-RISCV-ZCMP-CALLEESAVE-PUSHLIST-PARETODP-REVISION1-CLOSING-V8.7`
- Atomic gate: `PINNED_RV32_ZCMP_SAME_MACHINEFUNCTION_TWO_PLAN_WITNESS__TARGET_SPECIFIC_BOUNDED_FRONTIER_CERTIFICATE`
- Decision: `CONFIRM_STAGE0_PASS`
- Conditional tier: `TIER_B_Q2_VIABLE`
- Evidence ceiling: `E1_STATIC_PREFLIGHT__SHORT_COMMIT_LOCATOR__NATIVE_GRAMMAR_CERTIFICATE_ONLY`
- Revision: `1/1` consumed; no second revision is authorized.
- Stage A/B: not authorized or started.

The static gate is closed for the explicitly bounded RV32 interface class.
The unrecorded full commit/blob hash limits reproducibility evidence and is a
mandatory preclaim Stage A fidelity condition, but does not by itself invalidate
the current static native-grammar conclusion or turn into scientific STOP.

## Frozen revision integrity

The four canonical revision artifacts match their frozen hashes: report
`8317C76A…F521`, audit `F46CC136…AE4C`, claim matrix
`048C71D7…B8DE`, and handoff `26045F48…7DEA`; revision manifest self is
`5CDE7894…A20C`. This review independently assessed the package and did not
change its construction.

## Reconstructed legality and arithmetic

The [ratified Zcmp grammar](https://docs.riscv.org/reference/isa/v20260120/unpriv/zc.html)
permits the two declared RV32 forms. `{ra,s0-s1}` is rlist 6 and admits a
16-byte adjustment; `{ra,s0}` is rlist 5 and admits a 32-byte adjustment.
Both satisfy the ILP32 16-byte stack-alignment requirement.

| Property | Plan P | Plan S | Independent check |
|---|---:|---:|---|
| Cross-call realization | `%x→s0`, `%y→s1` | `%x→s0`, `%y→0(sp)` | both values survive the call; `t0` is only used after reload |
| Zcmp frame | `{ra,s0-s1}`, 16 | `{ra,s0}`, 32 | both are legal prefix/adjustment pairs |
| Native spill work | none | `sw` + `lw` = 8 instruction bytes | exact RV32 instruction arithmetic |
| Saved register storage | 12 bytes inside a 16-byte frame | 8 bytes at high frame offsets plus a 4-byte ordinary spill | `0(sp)` is free after the 32-byte push frame; RA/s0 slots are at the frame's high end |
| CFI | CFA becomes `sp+16`; recover `ra,s0,s1` | CFA becomes `sp+32`; recover `ra,s0`, no fabricated `s1` rule | valid static unwind relation |

The [RISC-V psABI](https://riscv-non-isa.github.io/riscv-elf-psabi-doc/)
defines `s0/s1` as callee-saved; `s0` need be a frame pointer only when the
function has one. The frozen no-FP contract therefore permits both plans.
Each has identical call/return behavior and restores the callee-saved registers
it writes. This is a physical plan difference, not a POPRET spelling or debug
metadata alteration.

## Current-union and direct-absorption attack

The independent union includes current GPR RA/spill behavior plus
[`RISCVFrameLowering`](https://github.com/llvm/llvm-project/blob/main/llvm/lib/Target/RISCV/RISCVFrameLowering.cpp)'s
fixed CSR order, prefix selection, pushability, frame layout, CFI and libcall
branches; the late
[`RISCVPushPopOptimizer`](https://github.com/llvm/llvm-project/blob/main/llvm/lib/Target/RISCV/RISCVPushPopOptimizer.cpp)
only converts an existing frame-destroy POP followed by RET; pseudo expansion,
assembler/linker, psABI and unwind complete the baseline.

This union can materialize either already-chosen legal plan. No reviewed
current source supplies the declared exact bounded multi-path Pareto
constructor over pre-RA cross-call identities and the Zcmp list/frame/CFI
state. A current allocation run may happen to emit Plan P; the revision does
not deny that. Any such union-reproduced coordinate is excluded from the future
residual denominator. Thus there is no direct absorption of the declared N2
algorithm/guarantee, while the strongest current execution paths remain fair
comparators.

## Frontier certificate attack

The certificate retains each critical value identity and location, the ordered
CSR prefix/rlist, legal adjustment and residual frame slots, ABI/CFI offsets,
future clobbers and declared Pareto cost. These are precisely the target
predicates omitted by generic graph coloring or ordinary frame packing. With a
bounded crossing width `w`, two prefixes may be merged only when they have the
same legal successors and incremental costs; the stated
`O(n · 2^(O(w log w)) · |ZcmpGrammar| · poly(n))` recurrence is therefore an
honest FPT claim for the fixed native catalog, not a claim of global register
allocation optimality. The no-gain branch explicitly returns the current plan
when the native union covers all points or the state falls outside the catalog.

## Commit-locator ceiling

`ba5bccf` is a usable short locator to a then-observed immutable Git commit,
but it is not a self-contained reproduction pin: it lacks the 40-hex commit,
blob IDs and locally retained source content. It cannot support a claim that a
future build has replayed the exact source. This is a finite provenance
closure—obtain the full commit and all decisive blob hashes before the first
Stage A claim-bearing run—not a change of object, guarantee or static witness.
No unavailable transport is treated as evidence of absence.

## Required first Stage A preclaim fidelity gate if mainline advances

Before any measurement, retain the full commit/blob hashes and exact controls;
materialize and verify both plans through stock verifier, assembler,
disassembler, linker and unwind reader; enumerate the complete current union;
and check the tiny action/path bijection and full cost. Then use the frozen
natural denominator. Stop the direction if either plan fails native legality,
CFI/unwind differs, the current union covers all coordinates, the state reduces
to generic RA/frame packing, or no full-cost residual remains.

No implementation, source build, download, experiment, benchmark or Stage A/B
operation was performed in this closing. Latest-collision status remains
`SEARCH_BOUNDED_OPEN`; lane disposition after mainline acceptance is
`IDLE_REUSABLE_AWAITING_MAINLINE`.
