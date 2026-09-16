# Independent Stage 0 Confirmation Review

## Frozen assignment

- Assignment: `STAGE0-C1-20260811-AARCH64-SVE-SME-JOINT-STATEFUL-CODEGEN-CONFIRM-V8.7`
- Topic: `AARCH64-SVE-SME-JOINT-STATEFUL-CODEGEN`
- Role: independent confirmation reviewer. This reviewer did not participate in the frozen PRIMARY review.
- Scope: conditional Stage 0 paper-potential judgment only. No implementation, experiment, benchmark, Stage A, or Stage B was performed or authorized.
- PRIMARY package verification: all five named primary artifacts match the supplied SHA-256 values (5/5 file checks; the supplied package manifest is also matched).

## Decision

**`CONFIRM_REVISE_ONCE`**

The prior `REVISE_ONCE` is confirmed, with exactly one retained atomic scientific gate:

`NATIVE_SME_ABI_ACTION_COMPLETE__SAME_INTERFACE_TRANSITION_LAZYSAVE_PREDICATE_FRONTIER_CERTIFICATE`

This is a conditional `TIER_B_Q2_VIABLE` route, not a Stage 0 pass and not evidence that a performance claim has been achieved. Confidence: **0.86**. Current evidence readiness is **medium-low** because the gate-bearing native witness and bounded-state construction have not yet been supplied; this is a research-readiness issue, not a scientific stop.

## Independent findings

### Same-object ABI boundary — confirmed and narrowed

The LLVM SME guide states that ACLE attributes map to LLVM IR attributes and that the ABI governs calls involving PSTATE.SM or PSTATE.ZA. It identifies normal (`N`), streaming (`S`), and streaming-compatible (`SC`) interfaces, with prescribed call-boundary mode transitions. It also states that a PSTATE.SM change can change vector length, zero FP/AdvSIMD/SVE registers, and alter the legal instruction set. Consequently, an admissible candidate may not change ACLE attributes, call-site attributes, Linux AAPCS64 interface class, vector-length rules, or ZA sharing semantics.

This rejects the broad formulation “freely choose an SME lifetime.” The residual, if any, is only within a fixed interface/ABI contract and only among native-legal choices that preserve the stated semantics.

### Current-union attack — not yet a direct absorption proof

The current documented LLVM lowering includes call-boundary `SMSTART`/`SMSTOP`, conditional pseudo forms for `SC` transitions, register masks, insertion before register allocation so that spilling/reloading can occur around a mode change, and a specialized SME ABI/peephole pipeline. This is a strong subtractor and must be modeled as the default composition:

1. attribute and call-site lowering;
2. `MachineSMEABI` / call-boundary transition placement;
3. `SMEPeepholeOpt` simplification;
4. vector-first register allocation, group legality, Z/P pressure handling, spills/reloads, frame formation, and post-RA/MC lowering.

However, neither the published guide nor the primary package establishes that this composition enumerates every ABI-legal, same-interface joint choice over transition placement, lazy ZA save/restore state, and Z/P-pressure decisions, nor that it provides an exact/FPT/certified Pareto frontier for that joint choice. A generic RA/ILP/CP solver does not itself fill that target-specific algorithmic gap. No same-object direct paper or current-source collision was found that proves the complete residual is already absorbed. The remaining collision result is therefore `SEARCH_BOUNDED_OPEN`, not an assertion of absence.

### Structural paper potential

If a target-specific future-action-preserving frontier can be constructed, the topic has an N2 paper shape: a bounded state representation and exact/FPT/certified-Pareto algorithm for ABI-fixed SME transition, lazy-save, and vector/predicate pressure decisions. The contribution is not a new ABI action and must not be presented as one.

The route is structurally credible because ABI legality constrains the action graph enough to make a finite certificate falsifiable. It fails if that certificate either changes the interface or collapses to ordinary target-independent register allocation / integer programming.

## Required closure of the single revision gate

The revision must deliver one coherent certificate, not a collection of independent repairs:

1. Pin current LLVM source plus target triple, CPU/features, ABI, fixed function and call-site SME attributes, fixed VL/SVL assumptions, and ZA sharing class.
2. Give the complete native action grammar after the current mandatory pipeline, including `N/S/SC` transitions, conditional pseudo expansion, ZA active/dormant/lazy-save states, TPIDR2 and exceptional paths where applicable, Z/P group and whole-spill legality, frame obligations, and relevant peephole actions.
3. Exhibit a small native MIR two-action witness with identical attributes and ABI. Both actions must be legal through the native pipeline, differ in the stated joint objective, and not be reproduced merely by the mandatory pass composition.
4. Define a finite state/equivalence that preserves all remaining legal native actions, legality, ABI/frame obligations, vtype/vector-length consequences, and declared full cost. Arbitrary register-bank permutations and identity enumeration do not qualify.
5. Supply a target-specific exact, FPT, or certified-frontier recurrence with an honest parameterization and degeneration map to the current composition and generic exact solvers.
6. Freeze a finite Stage A pre-claim falsifier: native MIR replay plus stock assembler/linker and semantic/ABI checks, with full cost including transition instructions, spills/reloads, frame bytes, compile time and code size. A failure of MIR legality, semantics/ABI preservation, or any claimed non-domination stops the mechanism before a claim-bearing run.

## Stop boundary

The revision must receive the pre-registered scientific stop if it requires changed attributes, changed AAPCS64/ACLE interface, non-native actions, an oracle unavailable to the current composition, a generic RA/ILP/CP formulation without a target-specific sufficient state and guarantee, or a witness fully reproduced by mandatory current transition/RA/spill/frame lowering. Lack of an implementation, hardware, or current performance result is not a stop condition.

## Source and collision audit

Primary current sources independently checked on 2026-08-11:

- LLVM, [Support for AArch64 Scalable Matrix Extension in LLVM](https://llvm.org/docs/AArch64SME.html): ACLE-to-IR mapping; `N/S/SC` interfaces; call transition table; vector-length/register-zeroing/instruction-legality consequences; pre-RA insertion rationale and conditional transition nodes.
- Arm, [AAPCS64 current source](https://github.com/ARM-software/abi-aa/blob/main/aapcs64/aapcs64.rst): authoritative ABI boundary for SME call/interface and ZA preservation semantics.
- LLVM current source/documentation family: `AArch64SMEAttributes`, `MachineSMEABI`, `SMEPeepholeOpt`, AArch64 register allocation/spill/frame lowering. These are required comparators; this review does not infer their absence from unavailable transport or a moving branch.

No non-primary source was treated as a direct collision. The audit does not claim a complete negative literature proof.

## Routing

- Stage A: `false`
- Stage B: `false`
- Scientific revision allowance: one, **not consumed by this confirmation**.
- Next permitted action: route the frozen single gate to the original PRIMARY revision owner; then require an independent closing review. Only mainline may alter formal state.

