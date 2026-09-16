# LLVM-DWARF-CALLSITE-RECONSTRUCTIBILITY — Stage 0 Revision 1

## Decision

- Assignment: `STAGE0-P1-20260814-LLVM-DWARF-CALLSITE-RECONSTRUCTIBILITY-REVISION1-V8.7`
- Sole gate: `SAME_MIR_TWO_PLAN_CLOBBER_WITNESS__TARGET_SPECIFIC_CALLSITE_FRONTIER`
- Scientific revision: `1/1`, **consumed** by this gate-bearing static construction.
- Decision: `RECOMMEND_STAGE0_PASS_FOR_CLOSING_REVIEW`
- Conditional quality tier: `TIER_B_Q2_VIABLE`
- Confidence: 0.76
- Evidence ceiling: `E1_STATIC_PREFLIGHT__STATIC_CERTIFICATE_ONLY`
- Stage A/B authorization: `false / false`

This revision closes the sole gate statically. It does not claim an implementation, a natural-corpus gain, an empirical Pareto point, or a completed theorem outside the precisely declared bounded trace class. Those are Stage A matters after an independent closing review.

## Frozen contract and compatibility mode

- LLVM upstream pin: `e72ba6cf366a3180cbf5a8690d9e50665880ab76` (LLVM main, read-only pin 2026-08-14).
- Target/ABI: `x86_64-unknown-linux-gnu`, SysV AMD64, fixed data layout and standard DWARF object semantics.
- Fixed mode: optimized `-O2 -g`, instruction-reference-compatible `LiveDebugValues` configuration, current target hooks, a fixed `CallSitesInfo`/all-calls-described input, and call-site parameter emission enabled only where supported by that compatible configuration. VarLoc is a separate fixed-grid baseline, not stacked with instruction reference.
- Object: a single fixed pre-register-allocation MachineIR function and its fixed call-regmask/clobber trace. Source semantics, ABI, unwind, reader/checker and DWARF grammar do not change.

## Gate proposition and result

**Proposition.** In the pinned contract, there exist two complete native plans for one identical pre-RA call-clobber MIR. Both preserve executable behavior, SysV ABI, unwind and valid DWARF. Their call-site reconstructibility/full-cost coordinates differ, and this difference is not reproduced by the current allocator + debug propagation/emission union. A finite state retaining target-register alias/clobber, call-site recognizer, frame/CFI and cost information is sufficient for an exact bounded-frontier recurrence.

**Result.** Closed, subject to the declaration below. Plan A is cheaper but the current `DwarfDebug` recognizer cannot describe the computed caller-saved source of the forwarded call argument. Plan B legally keeps the computed value in a saved callee-saved register and is describable with the existing `DW_OP_breg` call-site grammar. The extra save/restore/CFI actions are real native code and create an explicit Pareto trade-off.

## Same-MIR two-plan clobber witness

### Fixed pre-RA region

The notation is a declarative MachineIR trace, not a build artifact. `%sum` is a non-parameter computed value; therefore it is not eligible for the documented unmodified-formal `DW_OP_LLVM_entry_value` fallback.

```text
bb.0:
  %sum:gr64 = ADD64rr %a:gr64, %b:gr64
  JMP_1 %bb.1
bb.1:
  $rdi = COPY %sum:gr64
  CALL64pcrel32 @sink, implicit killed $rdi,
                    regmask <SysV caller-saved clobbers including RAX>
  RET64
```

`@sink(a+b)` is the observable computation. The call's ABI location is `$rdi`; the regmask is fixed in both plans. The callee's parameter value must be described at the caller call site, not recovered by changing source semantics. The call is deliberately in non-entry `bb.1`: current `DwarfDebug` only enables its entry-value trial in the entry MBB, so this witness cannot borrow an entry-block fallback.

### Plan A — current low-code-cost caller-saved realization

```text
  $rax = ADD64rr $rsi, $rdx
  $rdi = COPY $rax
  CALL64pcrel32 @sink, implicit killed $rdi, regmask <... RAX ...>
```

No extra CSR save/restore or spill frame object is introduced. For the current call-site collection path, backward interpretation from `$rdi` reaches the computed `$rax` definition. That defining arithmetic instruction is not a current `describeLoadedValue` source; its physical definition also invalidates the forwarded-register worklist. Because the call is in non-entry `bb.1`, the current entry-value trial is disabled there. Thus neither a recognized load/copy source nor an entry fallback justifies a value. The current recognizer therefore has no valid call-site value to emit for this parameter. The correct result is **unavailable**, not an invented `DW_OP_breg RAX` expression.

### Plan B — callee-saved, recognizer-visible realization

```text
  PUSH64r $rbx                 ; FrameSetup, save incoming RBX
  .cfi_offset rbx, <native offset>
  $rbx = ADD64rr $rsi, $rdx
  $rdi = COPY $rbx
  CALL64pcrel32 @sink, implicit killed $rdi, regmask <same fixed mask>
  POP64r $rbx                  ; restore outgoing RBX
  .cfi_restore rbx
```

This is a complete native choice: `$rbx` is callee-saved under SysV; save/restore and CFI make its use ABI/unwind legal. The current call-site backward transfer can recognize the forwarding copy and a callee-saved source. Its existing DWARF action is a valid parameter entry such as:

```text
DW_TAG_call_site_parameter
  DW_AT_location   (DW_OP_reg5 RDI)
  DW_AT_call_value (DW_OP_breg3 RBX+0)
```

The precise register numbers are x86 DWARF numbers; a Stage A fidelity check must obtain them from the pinned target printer rather than hand-transcribe an object file. The legality proposition is fixed: the value in `$rbx` immediately before the call equals `a+b`, and `$rdi` receives that value.

### Required divergence

| Coordinate | Plan A | Plan B |
|---|---|---|
| Executable result / call ABI | identical | identical |
| Unwind / SysV preservation | valid | valid with explicit save/restore CFI |
| Call-site parameter reconstructed by current grammar | 0 for `%sum` | 1 for `%sum` |
| Added instructions / frame pressure | baseline | `push` + `pop` + CFI / CSR cost |
| DWARF call-site bytes | no parameter value | one legal parameter value |

This is not metadata-only: Plan B changes physical allocation, prologue/epilogue and unwind actions. It is not cherry-picking a mode: the compatible current instruction-reference/entry-value setting is fixed for both plans, and Plan A remains ineligible because `%sum` is a computed non-formal value.

## Current-union separation

The strongest fair union is:

1. pinned x86 allocation/coalescing/copy insertion, split/spill/reload and CSR policy;
2. `LiveDebugVariables` where the fixed compatible pipeline uses it, plus instruction-reference lifecycle;
3. fixed-mode `LiveDebugValues` location propagation and target copy/spill/restore/clobber hooks;
4. `DwarfDebug` forwarding-register, clobbered-register-unit and call-site parameter construction; and
5. legal fixed configuration grid for allocation and debug-entry-value behavior. A generic exact RA/CP/ILP is a ceiling only.

The union can faithfully propagate an already chosen native location and emit Plan B's value; it does not add the CSR save/restore or spill decision solely to retain an otherwise unrepresentable computed call-site value. Plan A and Plan B therefore remain distinct at equal input information. If a finite grid of current legal options produces the same Plan B coordinates, that instance is removed from the candidate denominator; the research claim is only over residual instances where the current selected plan is Plan A or another dominated allocation plan.

## Target-specific bounded frontier certificate

### Action catalog

For each debug-relevant interval at a call-clobber cut, actions are exactly current native actions:

- assign a non-clobbered physical register, including a CSR with its save-mask/CFI obligation;
- retain/reuse a legal physical location through a copy/coalescing action;
- use a pre-existing or newly legal stack spill location with native store/reload and frame predicate;
- use a target-recognized rematerialization only when the current target/DWARF expression grammar can describe it;
- mark the call-site value unavailable.

No post-emission patch, unbounded symbolic expression, artificial storage, new register, changed call convention or generic solver action is admitted.

### Sufficient state and equivalence

At a cut, state is

```text
S = (L, A, F, Q, E, C)
L = target-register alias / frame-location descriptor for each critical interval
A = allocated and clobbered x86 register-unit mask plus CSR save mask
F = active frame-location and CFI obligations for the bounded crossing set
Q = DwarfDebug-compatible forwarded-argument map and recognized source class
E = entry-value eligibility (only documented unmodified formal/register cases)
C = declared Pareto cost vector
```

Two prefixes are equivalent only if all six components agree after canonicalization of non-critical current-pipeline fragments. This is deliberately stronger than `(interval, register, scalar-cost)`: future `DwarfDebug` behavior depends on the forwarding map/source class, future legality depends on aliases and call regmasks, and valid output depends on frame/CFI and entry-value eligibility. Conversely, current native actions after the cut consult no discarded identity of a non-critical interval; those fragments are frozen to the baseline plan. This gives a future-action, legality and full-cost preserving bisimulation for the declared action catalog.

### Recurrence and guarantee

Decompose the fixed MachineIR at ordered call-clobber cuts. For each cut, enumerate the legal transitions from `S_i` to `S_{i+1}` and retain only non-dominated `C` vectors. A transition updates `(L,A,F)` by the current allocation/copy/spill/CSR operation, updates `Q` by the documented DwarfDebug backward-forwarding transfer and clobber invalidation, and updates `E` only under the entry-value grammar. Invalid ABI/CFI/DWARF transitions are rejected.

Let `w` be the maximum number of debug-critical live intervals, forwarded argument units and frame-location obligations crossing any retained cut. On x86, the physical register-unit and legal expression alphabets are target constants. The frontier is exact for the declared bounded-cut class in

```text
O(n · f_x86(w) · poly(n)),
f_x86(w) = 2^(O(w log w)) · k_x86^O(w),
```

where `k_x86` is the finite native descriptor/action alphabet. This is an FPT claim parameterized by `w`, not a claim of exact general register allocation. The no-gain boundary is explicit: if every critical call is already entry-expressible, unavailable under every legal location, or the current selected plan supplies an identical state/cost coordinate, the recurrence returns the unchanged current plan and makes no contribution.

## Finite Stage A pre-claim fidelity killer (frozen, not run)

1. Pin the commit above, target, `-O2 -g`, compatible debug-location mode and every allocation/debug flag.
2. Materialize the witness as valid MIR and enumerate the complete tiny native action catalog; run MachineVerifier, object/link checks, unwind check and `llvm-dwarfdump` only after Stage A authorization.
3. Require the A/B coordinate difference above and compare every candidate point with the full compatible current union/configuration grid and a generic exact oracle.
4. Before any corpus claim, audit at least 30 natural optimized debug functions with the same fixed denominator and full cost: code/DWARF bytes, CSR/spill/frame, compile CPU/RSS, runtime and invalid/unavailable outcomes.

The direction stops in Stage A if the emitted Plan B is invalid, the current union reproduces every action coordinate, a valid computed-value Plan A is already emitted, or all residual points are full-cost dominated. A positive result would only be preliminary support.

## Claim ceiling and integrity

- This revision supplies a static witness, action catalog and bounded certificate only.
- It does not claim that LLVM currently produces Plan A on a natural corpus, that Plan B improves end-to-end performance, or that the FPT frontier scales beyond bounded debug-critical cuts.
- The direct-collision boundary remains `SEARCH_BOUNDED_OPEN` beyond current first-party source review. No absence inference uses a transport failure.
