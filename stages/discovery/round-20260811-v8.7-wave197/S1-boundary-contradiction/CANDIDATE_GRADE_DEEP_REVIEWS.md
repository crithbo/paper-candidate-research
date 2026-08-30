# CANDIDATE_GRADE_DEEP_REVIEWS

## U01 — RVV restart-state loop / call-boundary constructor

**Verdict:** `DROP__SAME_ABI_FORCES_ZERO_VSTART__NO_WHOLE_ACTION`.

### Semantic boundary and complete comparator

The current RISC-V V specification defines `vstart` as the first element executed after a resumable vector trap. Earlier elements are undisturbed; a successful vector instruction resets `vstart` to zero. It permits some implementations to reject a user-supplied nonzero `vstart` when that value could never be produced for that instruction/type. FOF loads have a different specified action: a synchronous fault at element zero traps; a later synchronous fault reduces `vl`; an interrupt should retain `vl` and set `vstart`.

The current RISC-V psABI 1.1 pre-release (2026-07-01) is the direct subtractor for the requested interprocedural construction: functions may assume `vstart=0` on entry and return, and any procedure explicitly setting it nonzero must clear it before calling another procedure or returning. The standard and vector calling-convention variant both enforce this. RVV C intrinsics likewise have `vstart=0` semantics and do not expose positive `vstart` portably. Consequently, carrying restart state across a call changes the ABI contract; clearing it turns the supposed interprocedural action into ordinary within-instruction hardware restart.

### Current-upstream reality check

The union checked is (i) official V ISA precise/restart and FOF semantics, (ii) current psABI call-state rule, (iii) the current RVV intrinsic interface and its compiler-managed `vl`/`vtype` bookkeeping, (iv) GCC's current FOF `vl`-setting handling (2026 first-party patch), (v) LLVM current upstream entrypoint, and (vi) QEMU current upstream entrypoint. No claim that a source lacks an action is made. The semantic and ABI rules already exclude the requested cross-call action independent of a particular compiler revision; hence an unavailable full commit pin for all implementation trees is not treated as scientific evidence.

### Action-divergence test

| Dimension | Result |
|---|---|
| Decision rule | Trap restart is selected by hardware/trap handling. A compiler does not legally elect a nonzero `vstart` across a procedure boundary. |
| Information | The proposed action would need trap element/implementation support unavailable in ordinary source intrinsics; granting it violates the fair same-information comparator. |
| Complexity/resource | Any loop transformation must charge compile/code size, trap work, execution, and state; no legal distinct algorithm exists to cost. |
| Quality/guarantee | Precise restart, FOF `vl` behavior, memory effects, psABI entry/return zero state, and exception observability are frozen. Relaxing any one changes object. |
| Full cost | Denominator is frozen in U01. No result has been run or inferred. |
| Generalization/no-gain | A restart is already architectural instruction semantics. A migration emulator is a runtime/emulator action and expressly excluded; no portable cross-call construction survives. |

### Finite killer and stop condition

**72-hour killer (not run):** assemble the official `strlen`-style FOF loop with a fixed `rv64gcv` target; create a single mapped/unmapped boundary and one interrupt/restart harness; compare ISA trace, `vstart`, `vl`, destination/memory state and psABI boundary zero state in Spike/QEMU. If every candidate either leaves `vstart=0` at call/return, relies on the hardware restart already prescribed, or needs a nonzero cross-call state, it is stopped. This is a finite fidelity plan, not an experiment executed here.

**Structural stop condition met now:** the requested whole-loop/interprocedural constructor is either (a) the existing architectural restart, (b) a different exception or hardware-runtime object, or (c) an ABI violation. Therefore no N1/N2 satisfies same object and guarantee, and no `PROPOSE_STAGE0` is emitted.

