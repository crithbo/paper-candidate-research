# Independent Stage 0 confirmation — MLIR vector representation / register-pressure Pareto DP

## Frozen scope and result

| Field | Value |
|---|---|
| Assignment | `STAGE0-C2-20260814-MLIR-VECTOR-REPRESENTATION-REGISTER-PRESSURE-PARETO-DP-CONFIRM-V8.7` |
| Role | Independent confirmation sentry |
| PRIMARY decision reviewed | `REVISE_ONCE` |
| Confirmation decision | `CONFIRM_REVISE_ONCE` |
| Tier if the gate closes | `TIER_B_Q2_VIABLE` |
| Evidence ceiling | `STATIC_ACTION_AUDIT_AND_FIDELITY_PLAN__NO_COMPILE_OR_PERFORMANCE_CLAIM` |
| Stage A / B action | `false / false` |

I independently confirm that the PRIMARY decision is correctly bounded.  The frozen material establishes a potentially nontrivial same-object N2 route, but not a completed paper claim: a single, auditable static revision must close the gate below.  No implementation, compilation, runtime measurement, spill measurement, or natural-workload result was required or performed for this Stage 0 judgment.

## Current-object and strong-union attack

The object must remain one pinned MLIR-to-LLVM pipeline, one target triple/subtarget/features/data layout, one fixed MLIR vector function grammar, and unchanged observable MLIR/LLVM/ABI semantics.  In particular, values, shapes, masks, fast-math and memory/alias conditions must not be altered to manufacture a representation choice.

The current Vector dialect documentation makes the candidate action space real but qualified: nested aggregate representation is the present default; a flattened one-dimensional representation and mixtures using `vector.cast` are documented alternatives, with different dynamic-indexing, shuffle, memory, and lowering consequences.  It also expressly places accurate register allocation/spill modeling outside MLIR's abstract target-cost layer.  Thus a later physical-spill statement cannot be asserted at MLIR level; it is only a declared downstream cost bridge to be falsified at fidelity closure.  [MLIR Vector dialect](https://mlir.llvm.org/docs/Dialects/Vector/)

The comparator must include every semantically legal pinned conversion route and its default/nondefault options, including Vector-to-LLVM and Vector-to-SCF paths and target-dialect lowering controls.  Flags that change source semantics, depend on an unproved alignment/precondition, or introduce undefined behavior are comparator facts but not interchangeable candidate actions.  [MLIR pass reference](https://mlir.llvm.org/docs/Passes/)

LLVM VPlan is a direct, serious subtractor for vectorization-factor/unroll-factor and target register-budget decisions: it accounts for open live intervals, target register use, and modeled spill/reload cost when use exceeds availability.  It does **not**, on the frozen evidence, itself choose or certify a global MLIR n-D representation/cast-boundary plan before MLIR conversion.  A revision must preserve this separation rather than relabel VPlan tuning as a new solver.  [VPlan analysis source](https://llvm.org/doxygen/VPlanAnalysis_8cpp_source.html)

Accordingly the fair current union is: (1) the pinned stock MLIR conversion pipeline and all legal configurations; (2) all same-semantics nested, flattened, and documented mixed/cast choices already expressible in the fixed grammar; and (3) identical downstream LLVM vectorization/VPlan, register allocation, scheduling, assembler, and linker for every plan.  Bounded exhaustive enumeration is allowed only as a fidelity oracle, never as the proposed algorithm or baseline disguise.

No frozen source demonstrates that this full union already exposes a target-specific, globally complete representation-boundary optimizer with the claimed guarantee.  The most-recent direct-collision search therefore remains `SEARCH_BOUNDED_OPEN`; this is not an absence inference.

## Single admissible revision gate

`PINNED_MLIR_REPRESENTATION_ACTIONS__VPLAN_SEPARATED_BOUNDED_FRONTIER_CERTIFICATE`

The only permitted revision must statically establish all of the following.

1. Pin the MLIR and LLVM revisions, complete target/pipeline/option grid, fixed source grammar, and every allowed/forbidden representation action.  It must give a plan-to-stock-builder/lowering map, not an emitter surrogate.
2. Exhibit a small same-function two-plan witness whose nested/mixed/flattened edges and `vector.cast` operations are legal, preserve output and memory semantics, survive stock verification/conversion, and are outside what the complete stock configuration plus VPlan action set directly selects or certifies.
3. Define a bounded target-specific frontier state containing the remaining representation/cast interface, vector type/shape and static-versus-dynamic indexing mode, mask and target-operation support, live outgoing interfaces, and only cost information that is future-action and legality preserving.  It must prove the path-to-native-plan bijection and state the exact/FPT/certified-frontier complexity and cap/no-gain boundary honestly.
4. State a finite Stage A fidelity/killer plan: complete small stock-native oracle, equality/verification checks, full pipeline cost accounting, and failure conditions for illegal casts, duplicate VPlan/configuration action, or failed downstream cost bridge.

The gate is neither a demand for a pre-run native output nor permission to substitute a generic Pareto/ILP wrapper, pass ordering, unroll selection, target-cost tuning, identity enumeration, or an MLIR-level claim of physical register allocation.  Those substitutions fail the frozen N2 contract.

## Decision rationale

The published representation alternatives and the documented limit of MLIR's cost abstraction leave a narrow, mechanically falsifiable same-object residual: a complete legal representation/cast action planner can still be distinct from downstream VPlan's VF/UF/register-budget planning.  But the frozen PRIMARY package has not yet supplied the complete legal action grammar, witness, future-preserving quotient, and non-generic recurrence needed to turn that residual into a paper-shaped N2 claim.

That is an atomic static construction deficit, not evidence of direct absorption, a changed object, or formal impossibility.  It warrants exactly one `CONFIRM_REVISE_ONCE`; it does not warrant a Stage 0 PASS, scientific STOP, implementation request, or escalation to Stage A/B.

## Required next route and falsifiers

The PRIMARY owner alone may perform the one registered static revision.  An independent closing review must then test the certificate without designing a second revision.  The revised route must be stopped if it reduces to any of the forbidden generic forms, if the two plans are not legal stock-conversion plans of the fixed function, if the complete union can already express/certify the selected plan, or if the finite quotient cannot preserve all remaining legal actions and declared costs.

Lane terminal state: `IDLE_REUSABLE_AWAITING_MAINLINE`.
