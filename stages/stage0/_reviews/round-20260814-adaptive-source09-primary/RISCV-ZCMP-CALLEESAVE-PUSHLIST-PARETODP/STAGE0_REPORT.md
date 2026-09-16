# RISCV-ZCMP-CALLEESAVE-PUSHLIST-PARETODP — Stage 0 PRIMARY

## Decision

- Assignment: `STAGE0-P1-20260814-RISCV-ZCMP-CALLEESAVE-PUSHLIST-PARETODP-PRIMARY-V8.7`
- Decision: `REVISE_ONCE`
- Conditional tier if the gate closes: `TIER_B_Q2_VIABLE`
- Current tier: `BELOW_Q2_STOP` is **not** recommended; the missing static certificate is not a scientific negative result.
- Confidence: 0.71
- Evidence ceiling: `E1_STATIC_PREFLIGHT__SEARCH_BOUNDED_OPEN`
- Novelty route: `N2` — target-specific bounded-frontier construction over current legal actions.
- Stage A/B authorization: `false / false`

The candidate has a credible Q2-shaped conditional contribution: it is not an option sweep, because a Zcmp list couples ABI callee-save colors to a constrained stack adjustment and to spill/frame costs. Current LLVM confirms a late PushPop pass, rather than an early joint planner. However, the submitted package does not yet pin an immutable LLVM revision, supply one complete same-MachineFunction two-plan witness, or demonstrate that the current RA/frame/Zcmp configuration union misses a frontier point. One atomic scientific revision is appropriate; no result, implementation, or benchmark is required for that revision.

## Structural paper potential vs current readiness

- Structural potential if successful: `TIER_B_Q2_VIABLE`. An exact/FPT frontier parameterized by the cross-call interface, with stock code generation and full cost, is a recognizable compiler-algorithm paper shape.
- Current readiness: finite but incomplete. The current-source action boundary was inspected, but transport failed when obtaining an immutable Git ref; this is a provenance/readiness risk, not absence evidence or a STOP reason.
- Non-fatal missing material: no solver, corpus result, emitted object, or measured gain was needed to reach this revision decision.

## Frozen exact object and claim

The object is one RV32IMAC+Zcmp, ILP32 psABI, fixed target/features/optimization level MachineFunction with fixed liveness, call behavior, unwinding, output and stock assembler semantics. The output may only use stock native allocation, frame, Zcmp pseudo, pseudo-expansion, assembler, linker and DWARF/CFI paths.

The complete action is jointly choosing, for a bounded set of values live across calls: (i) ABI callee-save colors or legal spill alternatives; (ii) the resulting legal Zcmp `{ra,s0...sk}` prefix list; and (iii) a legal `stack_adj`/frame realization. The objective is a Pareto vector of text bytes, prologue/epilogue instruction count, static frame bytes, spill/reload count and planner cost. No changed ABI, source rewrite, register invented only for debug, post-emission patch, arbitrary list, profile oracle, generic ILP/CP solver, or late selector is an admitted action.

## Current-upstream reality check

Checked on 2026-08-14:

- LLVM current `RISCVPushPopOptimizer.cpp` exposes a Zcmp Push/Pop pass. It exits without Zcmp (or vendor Xqccmp), respects shadow-stack restrictions, and only turns an already-existing frame-destroy POP followed by `PseudoRET` into POPRET/POPRETZ. Its implicit operands depend on the list selected during frame lowering.
- LLVM current `RISCVTargetMachine.cpp` schedules `createRISCVPushPopOptimizationPass()` in `addPreEmitPass2`, immediately before pseudo expansion. Thus this pass is a late legalization/peephole over a frame choice, not evidence of a pre-RA bounded joint frontier.
- Current `RISCVFrameLowering.cpp` retains ordinary callee-save spill-slot and save/restore-libcall paths. They are baseline actions and must be enumerated before claiming a residual.
- LLVM's current RISC-V guide documents architecture strings and target feature use, but no inspected current document establishes a whole-function Zcmp-aware callee-save coloring frontier. This is `SEARCH_BOUNDED_OPEN`, not proof of absence.

`git ls-remote https://github.com/llvm/llvm-project.git HEAD` failed locally with `SEC_E_NO_CREDENTIALS`; no absence or current-commit conclusion is inferred. The revision must record a reachable immutable commit/blob and the exact `-march`, `-mabi`, optimization, RA, frame-pointer, shrink-wrap, save/restore and Zcmp controls.

## Baselines and fairness contract

1. Pinned current LLVM default optimized GPR RA + frame lowering + Zcmp PushPop + expansion.
2. The finite set of documented/current legal RA alternatives, frame-pointer/shrink-wrap/save-restore controls and Zcmp-enabled/disabled configurations under the same ILP32 function and information.
3. Current ordinary callee-save sequence/spill realization for the same function.
4. Generic exact RA/CP/ILP only as an offline ceiling, not a deployable union component.

Every comparison must include compile CPU/RSS, planner cost, text bytes, prologue/epilogue count, static frame size, spills/reloads, assembly/link success, ABI behavior and unwind/CFI validity. `-msave-restore` or configuration changes are baseline branches, not candidate actions.

## Collision and facet audit

| Predicate | Finding | Status |
|---|---|---|
| Same object | LLVM/RISC-V source proves native Zcmp frame actions exist | PASS for baseline identity |
| Same atomic joint planning action | late PushPop consumes a chosen frame list; no inspected source proves pre-RA bounded joint frontier | OPEN |
| Same information | candidate can use only MachineFunction liveness/interference/frame data | definable |
| Same guarantee | no inspected source supplies exact/FPT Pareto guarantee | OPEN |
| Same full cost | required ledger is finite but unmeasured | planned |
| Direct paper collision | no verified eight-predicate direct cover | `SEARCH_BOUNDED_OPEN` |

The ISA is a direct subtractor for register-list/stack-adjust legality, not for the proposed planner. Generic register allocation and frame packing are methodological subtractors; they become fatal only if the revision cannot retain target list/ABI/unwind state beyond their generic formulation.

## Competing mechanisms

- Selected: bounded interface dynamic program with state `(live cross-call values, legal CSR-prefix/list state, stack-adjust/frame state, spill realization, ABI/CFI obligations, Pareto cost)`.
- Backup: an FPT enumerator of legal CSR-prefix decisions followed by the unchanged native allocator. It is admissible only if the same sufficient state and a non-generic exact/certified frontier remain; otherwise it is a parameter sweep and fails.
- Pivot boundary: moving selection after frame lowering, merely choosing an existing POP/RET opcode, or using arbitrary list/stack candidates is not the research object.

## Sole revision gate

`PINNED_RV32_ZCMP_SAME_MACHINEFUNCTION_TWO_PLAN_WITNESS__TARGET_SPECIFIC_BOUNDED_FRONTIER_CERTIFICATE`

This is one certificate, not separate scope expansion. It must pin a current LLVM commit and prove the following single proposition: for one fixed pre-RA RV32 ILP32 MachineFunction, two complete stock-native plans preserve behavior, ABI and unwind, yet have different jointly legal CSR-prefix/list/frame/spill Pareto coordinates; current finite configuration composition does not already supply every coordinate; and a finite state preserving all future native actions admits an honest exact/FPT/certified-frontier recurrence.

The minimum construction should use `ra` plus at least two cross-call values. A plausible form is Plan A coloring them to a Zcmp-compatible `s0,s1` prefix and realizing a legal `{ra,s0-s1}` push/pop adjustment, versus Plan B using a legal ordinary save/spill realization. This is only a construction template, not evidence: both precise lists, offsets, CFI, instructions and costs must be derived from the pinned native grammar. If all legal plan coordinates are already generated by the current union, or the certificate collapses to generic graph coloring/frame packing, the revision must STOP under `BELOW_Q2_STOP__CURRENT_ZCMP_UNION_ABSORPTION_OR_GENERIC_RA`.

## Natural opportunity and finite Stage A killer

Natural carrier: fixed LLVM RISC-V code-generation tests plus versioned public embedded C/C++ functions that contain an ordinary callee-save frame. Stage A, if later authorized, first runs only a pre-claim fidelity gate: pin the compiler, materialize the tiny witness, verify assembler/disassembly/ABI/unwind, enumerate the complete current configuration union, and bind the ledger. The first finite killer is: stop if no list-compatible two-plan divergence exists, any plan changes ABI/unwind/observable output, the current union covers every point, or p50/p90 full cost has no residual Pareto point on the frozen denominator.

## Q1/Q2 shape and scoring

The appropriate calibrated shape is a compiler-algorithm paper with a target-specific formulation, finite guarantee, stock compiler comparison and natural corpus. `PARITY_CONDITIONAL`: it is viable for Q2 only after the static gate and later fidelity closure; it is not presently Q1-calibrated.

- Academic potential: 52/70 (conditional N2 16/20; collision/headroom 9/15; baseline/venue 8/10; falsifiability 9/10).
- AI execution bonus: 22/30; `AI_CORE_CONDITIONAL`, estimated `ai_core_fraction=0.70` for parser/state/enumerator/ledger work after fidelity authorization.
- Total: 74/100; scores do not override the unfinished atomic gate.

## Stop conditions and repair vector

Stop only after the revision if the complete current union absorbs the two-plan frontier, the witness changes the ABI/unwind/function, or the only recurrence is generic RA/frame packing. Missing runtime measurements, hardware, source build, corpus results or a positive outcome are not STOP conditions.

`STAGE0_REPAIR_VECTOR: [OMITTED_CURRENT_SAME_OBJECT, ATOMIC_ACTION_UNCLEAR, FULL_COST_GAP]`. Material: yes. This does not change the independent decision.
