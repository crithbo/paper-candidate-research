# RISC-V Zcmp callee-save/push-list — Stage 0 Revision 1

## Decision

- Assignment: `STAGE0-P1-20260814-RISCV-ZCMP-CALLEESAVE-PUSHLIST-PARETODP-REVISION1-V8.7`
- Sole gate: `PINNED_RV32_ZCMP_SAME_MACHINEFUNCTION_TWO_PLAN_WITNESS__TARGET_SPECIFIC_BOUNDED_FRONTIER_CERTIFICATE`
- Revision: `1/1`, consumed by this static gate-bearing certificate.
- Decision: `RECOMMEND_STAGE0_PASS_FOR_CLOSING_REVIEW`
- Conditional tier: `TIER_B_Q2_VIABLE`
- Confidence: 0.75
- Evidence ceiling: `E1_STATIC_PREFLIGHT__NATIVE_GRAMMAR_CERTIFICATE_ONLY`
- Stage A/B authorization: `false / false`

This revision closes the frozen static gate for a bounded call-interface class. It does not claim an implemented planner, an emitted object, a natural-corpus result, a speedup, or an exact theorem for general register allocation. Those remain gated Stage A work after an independent closing review.

## Pinned native contract

- Upstream: LLVM `main` as represented by GitHub's current commit-list head `ba5bccf` (observed 2026-08-14) and the linked current FrameLowering/PushPop/TargetMachine source pages. The abbreviated GitHub commit identifier and source-page timestamp are recorded as an immutable-web pin; Stage A must additionally retain the full 40-hex commit and blob hashes before any claim-bearing run.
- Target: `riscv32-unknown-elf`, `rv32imac_zcmp`, `ilp32`, fixed `-O2`, no dynamic alloca, no stack realignment, no shadow-call-stack and no save/restore libcall realization; the function does not require a dedicated frame pointer.
- Object: one fixed pre-RA MachineFunction whose two live values cross a call. It has fixed CFG, call clobber model, source behavior, ABI, unwind contract, native assembler/linker semantics and Zcmp grammar.

The fixed exclusions are part of same-object fidelity rather than a configuration advantage: changing ABI, enabling a libcall, requiring FP, allowing dynamic frame objects, or changing the extension grammar is not a second plan.

## Complete current action grammar and union

The current strong union is not only a late POPRET peephole:

1. current GPR register allocation, copies/coalescing, split/spill/reload and target register constraints;
2. `RISCVFrameLowering` fixed CSR map/order, `getNumPushPopRegs`, `RISCVMachineFunctionInfo::isPushable`, selected `CM_PUSH`/`CM_POP`, `determineFrameLayout`, regular callee saves, optional save/restore-libcall branch, residual stack adjustment and CFI construction;
3. `RISCVPushPopOptimizer`, which only changes an existing adjacent frame-destroy POP + `PseudoRET` into POPRET/POPRETZ and carries over its existing implicit register-list operands;
4. pseudo expansion, assembler, linker, psABI and unwind/CFI validation; and
5. the fixed same-information compiler controls, with generic RA/ILP as a ceiling only.

The ratified Zcmp grammar admits only `{ra}`, then prefix lists `{ra,s0...sk}` (with the specified `s10` encoding exception) and list-dependent stack adjustments. `getNumPushPopRegs` computes the highest fixed-CSR-map position and rejects the `x26`-without-`x27` form. Thus an arbitrary saved-register set, arbitrary slot permutation or late metadata repair is not an action in this certificate.

## Same-MachineFunction two-plan witness

### Fixed pre-RA trace

```text
bb.0.entry:
  %x: gpr = COPY $a0
  %y: gpr = COPY $a1
  PseudoCALLReg @clobber              ; clobbers caller-saved GPRs
  $a0 = ADD %x, %y
  PseudoRET
```

`@clobber` returns normally and does not alter the abstract values. `%x` and `%y` are both live across this one call; the observable return is `x+y`. `ra` is live until return. The function has no variable-sized object, no outgoing stack argument, no FP requirement and stack alignment is 16 bytes.

### Plan P — Zcmp-prefix realization

```text
cm.push    {ra,s0-s1}, -16
mv         s0, a0
mv         s1, a1
call       clobber
add        a0, s0, s1
cm.popret  {ra,s0-s1}, 16
```

The legal prefix list stores/restores `ra,s0,s1` in the 16-byte frame. Current FrameLowering carries the fixed list through the `CM_PUSH`/`CM_POP` pseudos, produces its CFI record, and the late pass may form `cm.popret`. The CFI coordinate is `CFA=sp+16` after push with recoverable offsets for `ra,s0,s1`; after popret it returns to entry CFA.

### Plan S — smaller prefix plus native spill realization

```text
cm.push    {ra,s0}, -32
mv         s0, a0
sw         a1, 0(sp)
call       clobber
lw         t0, 0(sp)
add        a0, s0, t0
cm.popret  {ra,s0}, 32
```

`{ra,s0}` and a 32-byte list-dependent frame adjustment are legal Zcmp forms. The unused part of the native frame holds the ordinary `y` spill at `0(sp)`; its load and store are normal RV32 instructions. CFI is `CFA=sp+32` after push with recoverable offsets for `ra,s0`, and contains no fictitious saved `s1`. Both plans restore every ABI callee-save register they write and have identical call/return behavior.

| Coordinate | Plan P | Plan S |
|---|---:|---:|
| Zcmp list / frame | `{ra,s0-s1}` / 16 | `{ra,s0}` / 32 |
| compressed prologue/epilogue bytes | 4 | 4 |
| additional spill bytes | 0 | 8 (`sw` + `lw`) |
| static frame bytes | 16 | 32 |
| cross-call values in CSRs | 2 | 1 |
| behavior, ABI and unwind | identical / valid | identical / valid |

This is a whole native plan divergence, not a different POPRET spelling or a postprocessor. Plan P strictly improves the declared static coordinates on this micro-object. A current allocator may select either assignment on a particular build; that is not asserted. The residual is the absence, in the current composition exposed by source, of a complete bounded frontier construction that enumerates and certifies all such legal action paths under fixed information. If its finite configuration grid emits Plan P for a future pinned replay, that point is removed; the planned method must still compare against the whole grid.

## Target-specific bounded frontier certificate

At ordered call cuts, retain the state

```text
S = (I, M, R, K, F, U, C)
I = identity and liveness of the at-most-w critical cross-call intervals
M = their fixed-identity mapping to caller-save / ordered CSR / native spill
R = maximal fixed CSR-prefix position and the legal Zcmp rlist class
K = legal list-dependent stack-adjust class and residual frame slots
F = frame offsets, CFA/CFI and ABI restore obligations
U = future call-clobber/alias mask and permitted spill/reload/copy actions
C = declared Pareto full-cost vector
```

Canonicalization does not permit arbitrary bank or register permutations: each live MachineIR value remains named, and only identical future native legality/cost states are merged. The fixed CSR map, prefix rule, stack-adjust table, CFI obligations and future call clobbers are retained. Therefore equivalent states have the same legal native continuations, path-to-emitted-plan realization, and incremental cost; induction over cuts gives a future-action and declared-cost preserving bisimulation.

For `n` ordered local operations and interface width `w`, enumerate only fixed native actions and retain non-dominated states. With the finite RV32 CSR and Zcmp grammars:

```text
O(n · 2^(O(w log w)) · |ZcmpGrammar| · poly(n))
```

is exact for the declared bounded-interface class. This is an FPT statement in `w`, not a claim about arbitrary graph coloring or global frame packing. The explicit no-gain boundary is: if all non-dominated paths are generated by the complete pinned current union, if no pushable legal prefix survives, or if the required state loses a listed native predicate, return the current plan and make no research claim.

## Current-union separation

FrameLowering and PushPop are intentionally included as strong baseline actions. Given a chosen CSR set, they can materialize the relevant push/pop, frame and CFI path; PushPop only recognizes its late existing POP/RET context. The source-inspected composition neither exposes a bounded multi-path Pareto constructor over pre-RA cross-call identities nor provides an exact/FPT guarantee for that composition. The candidate's admissible content is the finite action/path frontier and its target-specific proof obligation—not a new instruction, a different ABI, or an assertion that current greedy allocation cannot happen to find Plan P.

## Frozen Stage A pre-claim falsifier (not run)

1. Pin the full LLVM commit/blob, target, ABI and all controls above; materialize the exact MachineFunction and validate both plans through the stock verifier, assembler/disassembler, linker and unwind reader.
2. Enumerate the complete same-information current union including RA alternatives, FrameLowering pushability/list/frame/CFI, libcall control, late PushPop and expansion.
3. Enumerate the small native candidate state space and check plan/action bijection, cost ledger and no-gain branch.
4. Only after fidelity passes, test fixed LLVM RISC-V codegen tests and a versioned embedded corpus with code bytes, frame/spill counts, compile CPU/RSS, runtime where available and fallback costs.

Stop this direction if any witness plan is illegal, CFI/unwind diverges, the union covers every candidate point, the frontier degenerates to generic RA/frame packing, or no full-cost residual remains. Positive measurements would be preliminary support only.

## Claim ceiling

This revision proves a static bounded native-grammar certificate only. It does not claim natural prevalence, compiler-output dominance, speedup, runtime improvement, general RA optimality, complete artifact reproduction or an unbounded theorem. Latest-paper collision remains `SEARCH_BOUNDED_OPEN` and no transport failure was used as absence evidence.
