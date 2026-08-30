# CUDD BDD reorder trace closure

The fixed object is a Boolean function under fixed variables and group constraints, checked by stock BDD evaluation/equivalence. Two legal permutations can represent the same function with different BDD node counts and reorder costs.

Current CUDD includes manual shuffle and direct reduction, automatic threshold-triggered reordering, threshold adjustment, variable-group constraints, sifting/window/symmetry/group/annealing/genetic methods and exact dynamic-programming reordering. It also exposes BDD/ZDD realignment and GC/reordering hooks. This is the fair same-information union.

The proposed target-specific trace Pareto DP optimizes exactly this ordering/reorder trace. CUDD already includes exact DP for small cases; direct variable-ordering, iterative-reorder and multiobjective-BDD research covers the remaining generic problem. Cache/GC/trigger state turns it into an excluded controller/selector. Natural route if needed: public circuit/model corpus, equivalence oracle and construction/reorder CPU/RSS/temp/peak-node ledger. No run was made. **Status: `STRUCTURAL_DROP`; no brief.**
