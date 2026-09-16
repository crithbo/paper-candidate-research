# AARCH64-SVE-SME-JOINT-STATEFUL-CODEGEN — Stage 0 PRIMARY

## Disposition

- Assignment: `STAGE0-P2-20260811-AARCH64-SVE-SME-JOINT-STATEFUL-CODEGEN-PRIMARY-V8.7`
- Decision: `REVISE_ONCE`
- Conditional tier: `TIER_B_Q2_VIABLE__ONLY_IF_ATOMIC_GATE_CLOSES`
- Novelty route: `N2`
- Evidence ceiling: `CURRENT_SOURCE_AND_STATIC_CERTIFICATE_ROUTE_ONLY`
- StageA/B: `false` / `false`
- Search status: `SEARCH_BOUNDED_OPEN`

The Discovery premise is not ready to PASS.  It calls SME streaming/ZA lifetime a free code-generation choice, but current LLVM and the AAPCS64 treat PSTATE.SM and ZA interfaces as attribute- and ABI-constrained state. This is a structural correction, not a failure caused by missing implementation or performance data.

## Frozen object and corrected research question

The only admissible object is a pinned LLVM AArch64 MIR/IR caller-callee region for a fixed Linux AAPCS64 target, fixed `+sve,+sme` feature set, fixed function/callsite SME attributes, fixed vector-length-dependent type rules, fixed ZA interface, and an unchanged stock assembler/linker/ABI-visible behavior. SME2/ZT0, inline-assembly-managed mode changes, changed function attributes, changed source/IR semantics, profile information, custom runtime support, and modified reader/ABI are outside this first object.

The corrected question is not “choose arbitrary streaming/ZA lifetimes.” It is whether a bounded, target-specific solver can jointly choose **only ABI-permitted existing transition/lazy-save actions** and SVE predicate/Z-register spill-placement choices, while preserving all future AArch64 SME actions and declared costs, in a way not provided by the current LLVM composition.

## Current-source reality check

Official LLVM SME documentation states that ACLE attributes map to LLVM IR attributes and that the ABI governs calls involving PSTATE.SM/ZA. Streaming transitions can change vector length, zero FP/AdvSIMD/SVE registers, and alter instruction legality. LLVM lowers required `SMSTART`/`SMSTOP` around calls, does so before register allocation so that spills/reloads can be placed, and has `MachineSMEABI` plus an `aarch64-sme-peephole-opt` pass. The AAPCS64 defines fixed N/S/SC PSTATE.SM interfaces and private/shared/agnostic ZA interfaces, including lazy-save requirements and ordering constraints.

Therefore the present union already absorbs: attribute-to-ABI lowering, required call-boundary transitions, conditional transition pseudoinstructions, ordinary AArch64 RA/scavenging/spills, and current SME peephole simplification. Feature flags alone do not define streaming legality. The broad Discovery formulation is consequently not a candidate-only action gap.

## Conditional N2 opportunity

There is still a finite, conditional N2 route, but only on a smaller action set. A revision may show a real same-interface MIR region in which two distinct **ABI-permitted native** transition/lazy-save/predicate-spill traces exist, neither changes attributes nor violates the SM/ZA/TPIDR2 protocol, and current LLVM's complete pass/configuration union does not compute the same bounded Pareto frontier/guarantee. The state would have to retain SM interface/state, ZA off/dormant/active and lazy-save obligations, relevant TPIDR2 status, legal instruction-mode class, live Z/P values and their VL/SVL-compatible spill slots, call/exception ports, and the exact declared cost vector.

This can be target-specific because changing SM zeros Z/P state, instruction legality depends on mode, and ZA lazy-save obligations are ABI-visible. It is not target-specific if it is only generic RA after treating all transition instructions as ordinary barriers.

## Atomic revision gate

`NATIVE_SME_ABI_ACTION_COMPLETE__SAME_INTERFACE_TRANSITION_LAZYSAVE_PREDICATE_FRONTIER_CERTIFICATE`

The sole revision must provide one integrated static certificate:

1. Pin an LLVM commit, AAPCS64/ACLE revision, exact target features, optimization/pass controls, and all fixed function/callsite SM and ZA attributes.
2. Give a concrete two-action native MIR witness under the **same** interface: each trace must use only legal LLVM/assembler actions; preserve required N/S/SC entry/return behavior; obey ZA off/dormant/active, TPIDR2 lazy-save and asynchronous-order constraints; and keep vector-length-dependent values out of illegal cross-mode transfer.
3. Enumerate the complete current union: attribute lowering, SelectionDAG/GlobalISel path where applicable, `MachineSMEABI`, SME peephole, register allocation/scavenging/spill/frame handling, post-RA scheduling, `+sve/+sme` and legal optimization controls. A current pass combination emitting both traces is direct absorption.
4. Define a state equality that preserves every future native action and all declared costs. It must expose every live Z/P value, mode/ZA/TPIDR2 obligation, mode-legal instruction class, call/exception port, stack-size domain and remaining use; no identity enumeration may be hidden.
5. Give an exact/FPT/certified-Pareto recurrence with visible parameters and an explicit cap-failure result. Generic ILP/CP/RA, a scalar transition score, or a fixed single local rewrite is not N2.
6. Freeze a finite Stage A preclaim gate: tiny native exhaustive oracle and stock ABI/assembler/linker/semantic checks; complete-union replay; then named public LLVM SVE/SME IR/MIR carriers and full planner/compile/RSS/object/spill/transition/runtime ledger.

Failure sentinels are: any action needs changed attributes/ABI/IR; the two traces are actually determined uniquely by the current ABI pass; no non-current complete action/guarantee remains; a state merge loses a legal suffix/cost; or the method collapses to generic RA. These are scientific `BELOW_Q2_STOP` conditions. Lack of code or a positive result is not.

## Evaluation route and killer

The Stage A route is finite only after the gate supplies the concrete witness and named carrier manifest. It must reject the topic on witness illegality, ABI/semantic/assembler/linker mismatch, a current-union reproduction of every candidate action or guarantee, cap-only frontier, or no full-cost Pareto residual. It must charge solver/model build, compile CPU/wall/RSS/temp, object/text/unwind, Z/P/ZA save-spill and transition counts, verification/fallback, and runtime where a public hardware route is available.

## Why not STOP now

Current evidence refutes the broad free-lifetime premise but does not establish a direct same-object proof that every ABI-permitted joint transition/lazy-save/pressure frontier is reproduced by the complete current LLVM union. The missing exact native two-action map and sufficient state are a single finite static closure task. One revision is therefore warranted; no Stage A/B is authorized.
