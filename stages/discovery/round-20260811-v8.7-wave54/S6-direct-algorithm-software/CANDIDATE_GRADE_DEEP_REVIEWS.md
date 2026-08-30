# Candidate-grade deep review — Wave54

## LLVM-DOMTREE

- Exact object: a fixed LLVM control-flow graph and its exact dominance relation/queries.
- Current source and official semantics: [LLVM DominatorTree documentation/source](https://llvm.org/doxygen/classllvm_1_1DominatorTree.html) and the current LLVM project; native IR verification and dominance-query agreement are finite formal oracles.
- Candidate action tested: a cache-aware whole-CFG dominator-tree constructor that changes traversal/union-find scheduling while preserving the same relation.

| Dimension | Residual review |
|---|---|
| Decision rule | Construct immediate dominators and tree representation for every CFG vertex. |
| Information | Entire fixed CFG; no profile, target, or additional oracle. |
| Complexity/resource | Charge constructor CPU/RAM, query representation and all preprocessing. |
| Quality/guarantee | Exact dominance relation, identical queries. |
| Full cost | CFG extraction, construction, peak memory, validation and query cost. |
| Generalization/no-gain | Public LLVM CFGs are a natural carrier; no gain if it is only an implementation traversal/order of established Lengauer–Tarjan-family construction. |

Current direct dominator construction already supplies the complete same-object algorithmic action. The hypothesized cache-aware ordering changes implementation scheduling, without a newly named data structure, complexity/approximation guarantee, or union-external atomic action. A finite checker exists but does not turn a local implementation change into N2.

`DROP_CURRENT_DIRECT_ALGORITHM_FAMILY__NO_NONTRIVIAL_ATOMIC_RESIDUAL`.

No DROP reason is readiness, resources, current results, or AI ability.
