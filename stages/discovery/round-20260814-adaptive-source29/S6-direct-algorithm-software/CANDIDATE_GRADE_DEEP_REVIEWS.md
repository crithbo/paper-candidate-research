# Candidate-grade deep reviews

## D29-01 — AArch64 SME joint virtual-tile / ABI-state construction

- Entry: `QC29-01`, evidence-qualified raw; `C0 → D1 → DEEP`.
- Fixed semantics: same MLIR/LLVM function, call attributes, target features, ABI and observable code behavior.
- Preliminary strongest composition: function/callsite attribute lowering and `SMEABIPass` / streaming transitions, followed by ArmSME tile allocation in conversion. This is a fair current executable composition, not a straw baseline.
- Proposed complete action skeleton: over CFG cut states `(SM mode, ZA interface state, ZT0 requirement, live virtual-tile set)` select a legal boundary representation and virtual tile binding; reconstruct existing ABI transition and tile allocation actions; optimize/certify a Pareto frontier in preservation instructions, bytes and tile-state lifetime.
- Minimum action/observation survival trace: a two-tile ArmSME function with an intervening call whose frozen attributes require state handling. Two source-level plans are to be constructed only if both pass LLVM verifier and ABI legality: independent current composition versus one joint binding/boundary plan. This is a Stage0 finite witness debt, not a completed Discovery fact.
- Target-specific guarantee shape: FPT in maximum simultaneously live virtual tiles and finite ABI cut-state cardinality, with a certificate that every emitted transition satisfies the same SME ABI attributes.
- Natural/canonical route: current LLVM/MLIR ArmSME regression/MIR test selection; stock IR verification and codegen/object checks.
- Full cost: compile CPU/RSS/temp, emitted code/save bytes, state transition count and code-size; no unmeasured hardware speed claim.
- 72h killer: any current path proves identical joint optimization; no two legal plans on the minimal witness; direct same-object compiler paper covers the same state/action/guarantee; recurrence reduces to generic allocation after removing SME state.
- Deep outcome: `PROPOSE_STAGE0__FINITE_FIDELITY_GAP`, `TIER_B_Q2_VIABLE` conditional on the finite debts.

## D29-02 — RVV VTYPE/VL transition construction

- Entry: `QC29-02` was rejected before C0 after current-source check.
- Current source is already a three-phase global dataflow transition constructor across basic blocks, including redundancy avoidance after allocation.
- Proposed action lacks a distinct target-specific joint algorithm beyond that kernel; adding generic materialization would violate the assignment’s generic-kernel exclusion.
- Outcome: `STRUCTURAL_DROP__CURRENT_UNION_ABSORPTION`.
