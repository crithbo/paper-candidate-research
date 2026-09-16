# RISC-V Zcmp callee-save/push-list Pareto DP — independent confirmation

## Decision

- Assignment: `STAGE0-C2-20260814-RISCV-ZCMP-CALLEESAVE-PUSHLIST-PARETODP-CONFIRM-V8.7`
- PRIMARY decision reviewed: `REVISE_ONCE`
- Sole gate confirmed (with one completeness clarification):
  `PINNED_RV32_ZCMP_SAME_MACHINEFUNCTION_TWO_PLAN_WITNESS__TARGET_SPECIFIC_BOUNDED_FRONTIER_CERTIFICATE`
- Independent disposition: `CONFIRM_REVISE_ONCE`
- Conditional tier if the gate closes: `TIER_B_Q2_VIABLE`
- Evidence ceiling: `E1_STATIC_PREFLIGHT__SEARCH_BOUNDED_OPEN`
- Stage A/B: not authorized; no revision, implementation, build or experiment was run.

The missing certificate is a finite static construction, not a scientific
negative result. It is therefore not grounds for STOP. Conversely, the
existing evidence does not yet establish a same-MachineFunction two-plan
residual, a complete current-action union, or a non-generic frontier
guarantee, so it cannot be upgraded to PASS.

## Integrity and independent source findings

All four canonical PRIMARY artifacts match the frozen manifest (4/4). The
PRIMARY correctly treated its failed immutable-git transport as neither source
absence nor novelty evidence.

Current first-party sources sharpen the action boundary:

- The ratified [Zcmp specification](https://docs.riscv.org/reference/isa/v20260120/unpriv/zc.html)
  defines only `{ra}`, then `{ra,s0...sk}` prefix lists (with the specified
  `s10` exception) and a list-dependent legal `stack_adj`; a candidate may not
  synthesize arbitrary register lists or frame increments.
- LLVM's current [RISC-V FrameLowering](https://github.com/llvm/llvm-project/blob/main/llvm/lib/Target/RISCV/RISCVFrameLowering.cpp)
  already owns more than ordinary spill slots: it has the fixed CSR map,
  `getNumPushPopRegs`, `isPushable`-conditioned save information,
  `CM_PUSH/CM_POP` generation and frame/CFI handling. This is a mandatory part
  of the strongest union.
- LLVM's current [PushPop optimizer](https://github.com/llvm/llvm-project/blob/main/llvm/lib/Target/RISCV/RISCVPushPopOptimizer.cpp)
  is late and turns an existing frame-destroy POP adjacent to `PseudoRET` into
  POPRET variants while copying the list's implicit operands. The
  [target pipeline](https://github.com/llvm/llvm-project/blob/main/llvm/lib/Target/RISCV/RISCVTargetMachine.cpp)
  schedules it before pseudo expansion. It is not, by itself, a pre-RA
  optimizer over coloring/list/frame trade-offs.

Thus the PRIMARY's central residual is not directly absorbed, but its phrase
“late PushPop pass” was incomplete as a description of the current union:
revision must enumerate the complete FrameLowering grammar as well.

## Independent attacks

| Attack | Finding | Consequence |
|---|---|---|
| Same object and legal actions | A fixed RV32 ILP32 MachineFunction can in principle have different legal allocation and CSR-save realizations. But no pinned two-plan native witness currently supplies exact list, `stack_adj`, spills, frame offsets and CFI for both branches. | gate remains necessary |
| Existing direct coverage | Current FrameLowering realizes a selected legal Zcmp list and stack/frame actions; current late PushPop realizes POPRET. Neither supplied source selects a coloring to optimize the joint reconstructible vector nor proves an exact/FPT Pareto frontier. | no direct absorption established |
| Generic degeneration | Coloring plus ordinary frame packing alone is generic. The retained state must include the Zcmp prefix/list grammar, list-dependent stack adjustment, target CSR fixed-location/CFI obligations, active call-crossing intervals, spills and full costs. Omitting these collapses the claim to generic RA or a configuration sweep. | gate narrowed for completeness |
| Fair union | The next construction must enumerate, at the same information and ABI: GPR RA alternatives; `RISCVFrameLowering` pushability, fixed CSR map, `CM_PUSH/CM_POP`, normal saves and save/restore libcalls; PushPop POPRET; pseudo expansion; feature/ABI/frame-pointer/shrink-wrap/save-restore/shadow-stack controls. | precondition to any residual claim |
| Guarantee and cost | An exact frontier is credible only for a declared bounded interface width and a transition system whose state preserves future native legality, CFI/unwind and an explicit full-cost vector. It cannot claim general RA or use a generic ILP as the method. | finite revision obligation |

## Single permitted revision gate

The same atomic gate is confirmed, with the following non-expansive
clarification to its required certificate:

1. pin a reachable LLVM commit/blob and all RV32IMAC+Zcmp/ILP32, RA,
   frame-pointer, shrink-wrap, save-restore and shadow-stack controls;
2. construct one fixed pre-RA MachineFunction with at least `ra` and two
   call-crossing values, and give two *complete* native plans—exact colors,
   legal Zcmp prefix list and `stack_adj`, regular/spill realization, generated
   prologue/epilogue and CFI—preserving behavior, ABI and unwind;
3. enumerate the full union above, including current FrameLowering rather
   than only the late POPRET pass, and remove all union-reproducible points;
4. give a target-specific bounded state and action/path bijection preserving
   every future native action, legality and declared cost, with an honest
   exact/FPT/certified-frontier recurrence and no-gain boundary; and
5. freeze the tiny native oracle and natural/full-cost Stage A killer.

This is still one gate, not permission for a changed ABI, a post-emission
rewrite, an arbitrary register-list selector, an input/profile oracle or a
second mechanism. If it fails because the current union covers the complete
native frontier, the plans cannot preserve ABI/unwind, or only generic
RA/frame-packing remains, the pre-registered result is
`BELOW_Q2_STOP__CURRENT_ZCMP_UNION_ABSORPTION_OR_GENERIC_RA`.

## Ceiling and disposition

The review neither requires nor reports a candidate implementation, emitted
binary, benchmark, natural speedup or theorem beyond the future bounded
certificate. Latest-paper collision remains `SEARCH_BOUNDED_OPEN`; no
unavailable source transport is read as absence. The lane must await mainline
acceptance and then return to `IDLE_REUSABLE_AWAITING_MAINLINE`.
