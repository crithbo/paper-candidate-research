# Case n5r8

Cutoff: 2026-08-03. A fixed conjunctive equi-join with required output order,
statistics, merge-join physical space, and an order-dependent exactness
condition must return the global minimal estimated cost. Plain join search and
convolution results are not equivalent baselines; a current full order-state
exact dynamic program is the same-object baseline.

Candidate action: define a future-equivalence signature for order prefixes and
run exact search with a safe relaxation lower bound. A finite closure path first
builds a tiny enumerator and exhaustive counterexample search for two allegedly
equivalent partial states, cross-checking optimum with exhaustive/ILP oracle;
only if unrefuted may it compare state/time/memory to the full exact dynamic
program. The unchanged query result, plan space, cost model, and optimum are
mandatory.
