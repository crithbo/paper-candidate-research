# Topic brief — certified bounded-width GlobalISel bank/selection planning

## Disposition

- Recommendation: `PROPOSE_STAGE0`
- Tier: `TIER_B_Q2_VIABLE` with a possible Q1 extension only if cross-target generality and natural workload results hold.
- Structural paper potential: credible compiler-tool / method-algorithm N2. Current evidence readiness: `FINITE_FIDELITY_GAP`; no implementation or performance result is claimed.

## Frozen claim package

- Exact object and same-function contract: fixed LLVM GlobalISel `MachineFunction`, target triple/features, legal `RegisterBankInfo` alternatives, ABI, input IR and target-machine output semantics. All chosen mappings must remain legal and result in the same executable behavior/diagnostics as the stock pipeline.
- Problem / bottleneck transfer: after instruction lowering is legal, the current default makes one-instruction bank choices and introduces cross-bank `COPY` repairs. A local choice may shift cost to later register pressure/copies and machine-code quality.
- N2 atomic action: on a reducible, bounded-treewidth GMIR region, jointly select each target-supplied instruction mapping and legal repair-edge placement. Dynamic-program state records boundary virtual-register bank, live/repair interface and accumulated target mapping/copy cost. Return an exact optimum and certificate for bounded width; outside the width/legality budget, fall back to stock `RegBankSelect` with no claim.
- New decision structure: current selection is locally minimizing per instruction; the proposed DP makes bank assignment, instruction mapping and repair placement a coupled region decision under an explicit boundary interface. It is neither an ILP invocation nor a mapping selector.
- Information fairness: candidate and baseline receive the same GMIR, target RBI mapping/cost table, block frequencies and target features. Profile information, if introduced, is given to both and charged.
- Strongest same-object baseline union: stock GlobalISel IRTranslator → Legalizer → `RegBankSelect` → InstructionSelect; default/fast/greedy mapping modes where available; target-specific `RegisterBankInfo`; ordinary downstream register allocation/scheduling. A fair comparator may compose compatible stock controls, but cannot change GMIR semantics or suppress later full cost.
- Current-source reality: current [`RegBankSelect.h`](https://llvm.org/doxygen/RegBankSelect_8h.html) calls the default local; its documented algorithm chooses a minimum mapping cost per instruction and inserts COPY repairs. Current source exposes `MappingCost`, `RepairingPlacement`, CFG insertion points and `assignRegisterBanks`; current target selectors use `RegisterBankInfo`. Non-default target alternatives are inputs to the candidate and baseline, not an absence claim.
- Direct subtractors / latest collision: historical GlobalISel’s described global mode and generic global RA/scheduling are adjacent. No read primary/current source found a deployable same-object algorithm that jointly optimizes these mapping and repair variables with the stated bounded-width exact/FPT guarantee. This is `SEARCH_BOUNDED_OPEN`, not a novelty proof; Stage 0 must independently re-search.

## Natural route, full cost, and falsifier

- Natural carrier: LLVM test-suite plus public LLVM/Clang C/C++ bitcode or a versioned target-supported corpus, restricted to targets for which GlobalISel and RBI alternatives are actually enabled.
- Oracle: LLVM verifier plus object/executable semantic test suite and unchanged ABI/diagnostic contract.
- Full-cost: DP analysis/compile CPU/RSS/temp; mapping/repair and downstream RA/scheduling compile cost; object/text size; static COPY count; necessary runtime/energy proxy only when controlled. No claim may use only copy count.
- 72-hour Stage A killer: implement only the bounded-width region extractor and certificate checker on 20–50 fixed functions, then compare with the complete stock union under identical target/options. Stop the claim if (a) legal RBI alternatives cannot yield a non-local witness, (b) certificate/stock semantic equivalence fails, or (c) full cost has no nontrivial residual on the preregistered set.

## Fidelity closure plan

- Status: `FINITE_FIDELITY_GAP`.
- Small witness: a target-supported MIR diamond/loop with two legal bank mappings whose independent local minima introduce a repair that the coupled region plan avoids, while stock verifier accepts both outputs.
- Finite steps: pin LLVM commit and one target RBI; enumerate default/non-default GlobalISel flags and mapping modes; build the witness and certificate checker; freeze LLVM test-suite subset and stock command lines; independently audit collision and then run the Stage-A preclaim fidelity gate.
- Structural failure: current union already contains the same region-wide certified optimizer; or the only feasible plan changes target/IR semantics, relies on unavailable information, or cannot preserve stock legality.

## Boundaries

- No-gain cases: one legal mapping per instruction, regions above the bounded-width budget, no meaningful cross-bank alternatives, or downstream RA dominates.
- AI/readiness: static source/audit and small DP are AI-executable; absence of an implementation/result is not a negative conclusion.
- Why Q2: a target-specific exact/FPT algorithm, certificate, compiler integration contract, natural corpus, fair stock union and full compile-plus-runtime cost form a complete N2 paper shape. Q1 would require multi-target evidence or a stronger region/generalization theorem.
