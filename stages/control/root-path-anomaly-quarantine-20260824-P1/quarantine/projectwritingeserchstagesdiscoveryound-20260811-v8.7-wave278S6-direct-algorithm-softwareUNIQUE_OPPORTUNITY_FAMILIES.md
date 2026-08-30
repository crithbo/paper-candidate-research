# CUDD BDD reorder trace closure

The fixed object is a Boolean function under fixed variables/group constraints and stock BDD evaluation/equivalence. A minimal legal action-divergence witness is two legal permutations of the same variables that represent the same function but have different BDD node counts and reorder costs.

Current CUDD action/config union is unusually broad. It permits manual shuffle and direct reduction; automatic reordering when a node threshold is crossed; threshold adjustment; variable group trees and fixed relative group order; sifting, symmetry/group sifting, window permutations, simulated annealing, genetic reordering, converging variants and exact dynamic-programming reordering. CUDD documentation also exposes BDD/ZDD realignment and GC/reordering hooks. This is the fair same-information baseline.

The proposed target-specific trace Pareto DP would optimize the same ordering/reorder trace. It is not a new native constructor action: CUDD already includes exact DP reordering for small instances, while variable ordering, iterative reorder and multiobjective BDD ordering are direct research families. Without changed function semantics, the remaining idea is generic ordering/ILP or a selector over this union.

Natural route if it were admissible: a version-pinned public circuit/model corpus, functional-equivalence oracle and full construction/reorder CPU/RSS/temp/peak-node ledger. No run was made. **Outcome: `STRUCTURAL_DROP`; no brief.**
