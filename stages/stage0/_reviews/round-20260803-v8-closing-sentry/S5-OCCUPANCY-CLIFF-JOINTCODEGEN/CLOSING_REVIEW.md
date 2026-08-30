# S5-OCCUPANCY-CLIFF-JOINTCODEGEN - Independent Stage 0 Closing Review

## Outcome

- Decision: `CONFIRM_STAGE0_PASS`
- Conditional quality tier: `TIER_B_Q2_VIABLE`
- Structural paper potential: confirmed
- Current evidence readiness: `DESIGN_READY__PINNED_STACK_AND_NATURAL_DELTA_UNOBTAINED`

This is a potential-screening pass. It does not claim a natural cliff, a non-dominated point, a compiler improvement, or a kernel-speed result, and it grants no downstream authority.

## A. Structural paper potential

The object is a pinned LLVM AMDGPU Machine-IR stack with fixed subtarget, optimization level, time budget, legal scheduling region, and SGPR/VGPR/AGPR accounting. The conditional N2 contribution is a fixed-budget tier-frontier joint scheduling/allocation algorithm and certificate. It explicitly excludes broad occupancy-aware scheduling, generic register allocation, ISA changes, profile substitution, and an offline-only optimum.

LLVM GCNSchedStrategy is a mandatory production baseline; pressure-list control, min-register reconstruction, and Unison are finite algorithmic subtractors, while CP-SAT is only a ceiling. The frozen sources show that generic occupancy/pressure claims are absorbed but do not show a fixed-budget multi-bank tier-certified joint solver on this exact stack. Natural MIR sources, compile-cost ledger, and open LLVM reproduction route are definable. A successful same-object residual would support a bounded N2 compiler paper at Tier B.

The lack of a pinned LLVM checkout, MIR corpus, candidate, or measured delta is readiness only. It does not establish structural absorption, undefined fairness, or absence of an N2 contribution.

## B. Current evidence readiness and Stage A probe ceiling

The current materials lack the version/subtarget/budget lock, two public MIR cliff labels, and any ledger. Current claim ceiling is the conditional compiler-design hypothesis.

If later authorized, the first killer should be a cheap static fixed-stack probe: obtain two public MIR cases and search for a counterexample to the tier-feasibility contract under the named baseline accounting. A counterexample, or proof that the current LLVM path already implements the same joint certificate, would refute the premise. A surviving probe says only that this premise has not been falsified; it cannot establish natural headroom, compile-time benefit, or a paper result. Full evidence belongs later.

## Collision, fairness, and authority

- Collision status: `SEARCH_BOUNDED_OPEN_WITH_DIRECT_SUBTRACT`; broad LLVM/Unison/ML framing is excluded.
- The current production stack, finite controls, and full compile/spill/tier cost must stay fixed; no universal union or 100x ceiling is a deployable baseline.
- GPU absence is not a STOP condition; it affects only later performance evidence.
- Revision is consumed 1/1, with no object or mechanism change authorized.

## Closing recommendation

Confirm conditional Stage 0 Tier B potential. Mainline alone may determine any next step; this report authorizes none.
