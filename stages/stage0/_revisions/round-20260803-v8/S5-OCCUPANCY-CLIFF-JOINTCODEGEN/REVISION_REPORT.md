# S5-OCCUPANCY-CLIFF-JOINTCODEGEN — Stage 0 `REVISE_ONCE` hypothesis review

- **Revision recommendation:** `RECOMMEND_STAGE0_PASS_FOR_CLOSING_REVIEW`
- **Structural paper potential:** `TIER_B_Q2_VIABLE`
- **Current evidence readiness:** `DESIGN_READY__PINNED_STACK_AND_NATURAL_DELTA_UNOBTAINED`
- **Revision budget:** consumed (`1/1`); no same-ID revision remains
- **Stage A/B authorization:** none; recommendation requires closing review

## Single atomic proposition

On a pinned LLVM AMDGPU MIR stack, a tier-frontier joint scheduling/allocation algorithm can preserve a discrete occupancy tier (or certify a lower tier) under the current compiler's time budget, producing a legal non-dominated `(tier, spills, compile-time)` point over the current staged pipeline on natural cliff regions.

**Structural falsifier:** current same-object LLVM or prior work already covers a fixed-budget multi-bank tier-certified joint solver, or the tier and full-cost comparison cannot be defined without changing compiler semantics. **Not a falsifier:** no current local LLVM, MIR corpus, GPU timing or candidate result.

## Structural paper potential

**Confirmed conditional potential.** LLVM's native occupancy/pressure logic sharply narrows the claim but does not absorb the stated fixed-budget joint decision/certificate. Unison and min-register are finite subtractors, while an offline CP-SAT result is only a ceiling. The tier-frontier state and fixed budget create a bounded N2 compiler kernel capable of a credible Q2 paper if a natural current-stack residual appears.

## Current evidence readiness and claim ceiling

No LLVM commit/subtarget/budget, natural MIR cliff labels, candidate implementation or output ledger is currently supplied. These are explicitly Stage A evidence tasks; a local command inventory does not mean LLVM or open artifacts do not exist. Current claim ceiling is the algorithmic hypothesis and evaluation design—no compile-time, spill, occupancy or kernel-performance gain.

## Fairness, collision and killer

- [LLVM `GCNSchedStrategy`](https://llvm.org/doxygen/classllvm_1_1GCNSchedStrategy.html) verifies current occupancy and pressure treatment; it must be the pinned production baseline.
- Current LLVM+greedy, same-allocator pressure-list, min-reg reconstruction, and CP-SAT ceiling are finite comparators; no universal union is permitted.
- No direct-fatal fixed-stack solver collision is identified.
- **Minimal killer:** freeze commit/subtarget/O-level/budget and two public MIR sources; label cliff regions; evaluate tier/spill/compile cost against the named current-stack controls. Stop in Stage A if the baseline already meets the ceiling band or no non-dominated same-budget point exists.

## Non-relaxable design audit

| Gate | Status |
|---|---|
| Same object | legal MIR/AMDGPU semantics and tier objective fixed; version binding pending |
| Latest collision | current LLVM rechecked; generic claim excluded |
| Fair strong baseline | finite production/control/ceiling set defined |
| Natural input/evidence | two-corpus route and falsifier defined; results pending |
| Full cost | compile/spill/tier ledger specified |
| Reproducibility | open LLVM/MIR route exists; local bundle not required at Stage 0 |
| Claim honesty | no performance result claimed |

## Closing handoff

Submit to closing review as `TIER_B_Q2_VIABLE`. This recommendation does not itself authorize Stage A/B.
