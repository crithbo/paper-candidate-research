# KaHIP native action closure

**Same-object contract.** Input is a weighted graph and fixed `k`/balance bound; output is a node-to-block assignment accepted by KaHIP's graph checker/evaluator. Natural route would be public graph collections/Walshaw-style instances. Full cost would include coarsening, initial partition, refinement/evolution, evaluator CPU/RSS and output bytes; a finite 72-hour killer would require cut and balance improvement over every current KaHIP preconfiguration at equal budget.

**Current union.** The official KaHIP v3.25 source documentation exposes KaFFPa Strong/Eco/Fast multilevel algorithms, KaFFPaE and KaBaPE evolutionary combine/mutation, shared/distributed parallel variants, node ordering/edge partitioning, and optional ILP improvements. It documents quality-time trade-offs and configuration choices rather than one fixed greedy constructor.

**Witness refutation.** Two legal partitions of a graph can of course differ. That is not a union-external action witness: both are outputs of the current multilevel/evolutionary/local/flow/ILP-improvement action union. The putative action—choosing a different coarsening/refinement/combine sequence—is an existing action/composition, and a new generic selection/order would violate the assignment exclusion.

**Collision.** Primary KaHIP papers already describe the multilevel and evolutionary methods; the current official repository also cites the relevant partitioning papers. No target-specific exact/FPT/approximation/certified-Pareto proposition outside that union was identified.

**Decision.** `STRUCTURAL_DROP`: same-object action residual is absorbed. This does not claim graph partitioning itself lacks future research potential.
