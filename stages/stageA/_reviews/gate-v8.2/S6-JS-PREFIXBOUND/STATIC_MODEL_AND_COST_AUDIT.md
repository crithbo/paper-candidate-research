# Static Model and Cost Audit — S6-JS-PREFIXBOUND

## Summary finding

The program implements a coherent exact merge-join join+sort finite model and gives a useful negative witness against the final-`Omega`-only signature. However, the frozen evidence cannot yet support Stage A PASS because the executable does not implement one preregistered cost-profile formula and its signature full-cost ledger omits the dominant quotient-path constructions.

## 1. Same-object fidelity

The following elements are faithful finite restrictions of the DPomega JS object:

- conjunctive equi-join graph represented by global attribute equivalence-class labels;
- connected bushy binary trees without Cartesian products;
- merge-join demands given by permutations of cross-cut join attributes;
- output order overwritten by the chosen merge demand;
- objective equal to intermediate-result join cost plus partial-sort cost and optional final `Omega` sort;
- exact order-state enumeration used as a ceiling.

The absence of DPomega's own edge-based implementation and implicit Omega-condition pruning does not by itself create a different optimization objective: DPomega states that the Omega-condition enables optimal substructure for general JS queries rather than restricting the query set. The package must therefore be described as an independent finite exact encoding of the same problem, not an executable reproduction of DPomega.

### Frozen-contract deviation

`EXPERIMENT_CONTRACT.yaml` preregisters:

- `ndv(S,A)=min(card(S),2+mask(S)%5)`;
- `ndv(S,B)=min(card(S),3+(mask(S)*2)%7)`.

`run_probe.py::ndv` instead derives an attribute digest from SHA-256 and returns:

`2 + ((mask * (digest % 11 + 1) + digest) % 13)`.

The candidate artifacts therefore do not report the frozen NDV instance family. The contract hash embedded in the result proves which YAML was referenced, not that the executable followed its formulas. This is a material experiment-contract fidelity defect even though both profiles remain deterministic proxies.

## 2. Future-equivalence result

The full-vector signature contains, for every legal first future demand, both the longest common prefix and the exact `sort_cost(S,o,d)`. The counterexample loop then groups states by that vector and compares the same `sort_cost` components. Apart from rounding tolerance, zero first-action cost counterexamples is therefore guaranteed by the signature definition.

The substantive finite findings are narrower:

- the code confirms that after a merge demand overwrites the old order, retaining the cheapest `g` per full cost-vector signature preserves the optimum on the executed family;
- the weak `lcp(o,Omega)` signature is genuinely falsified by concrete continuation witnesses;
- distinct orders sometimes share the full future-cost vector, creating a nonzero class-count quotient.

These are useful implementation and non-vacuity checks, but they do not establish a compact equivalence theorem.

## 3. Admissible-bound result

`h_join` is an exact order-free completion oracle and `h_sort` is the minimum next/final sort charge. Zero overestimates supports finite admissibility. The bound is not used to order or prune search in `quotient_dp`, so the artifacts provide no bound-strength, expansion-reduction, or construction-cost residual. Admissibility and usefulness must remain separate claims.

## 4. Signature-cost accounting defect

The result reports `signature_constructions = 404,450`. That counter is incremented only in the post-hoc audit loop over exact states. It excludes:

- one `signature(...)` call for each generated quotient transition in `quotient_dp`—`873,620` formal quotient transitions are reported;
- singleton/base-state signature construction;
- the corresponding JOB 4a quotient-path calls;
- the number of vector elements built, normalized, hashed, compared and retained;
- separate memory/time for exact DP, quotient DP, signature generation, bound oracle and audit.

Thus the reported construction count is not the candidate algorithm's full signature workload. The combined wall/CPU/`tracemalloc` totals contain both baseline and candidate work and cannot show whether the candidate is faster or smaller than the exact order-state control. A 3.634565% class-count reduction and 0.383133% transition reduction are real structural counts, but no positive full-cost residual follows from them.

## 5. Natural JOB check

The pinned JOB 4a SQL supplies a genuine five-relation join graph and equality-class structure. Because cardinalities and NDVs are deterministic proxies, the `29 -> 24` state result is an orthogonal natural-structure witness only. It is properly labeled and need not become natural performance evidence at Stage A.

## Atomic revision gate

`CONTRACT_FAITHFUL_COSTED_NONVACUITY_GATE`

Without changing the exact JS object or broadening the workload:

1. Freeze a revision contract and make the executable implement the declared NDV formulas exactly; any intended formula change must be explicitly frozen before execution, never silently substituted.
2. Measure the identical finite exact control and quotient separately. Count every signature invocation and vector element, normalization, hash/compare, lookup and retained-key byte; separately account for bound-oracle work.
3. Preserve exact optimum and zero admissibility overestimates, then show at least one predeclared positive local residual after signature cost—retained memory or optimizer/search work—not merely fewer logical classes.
4. If the full vector is absorbed, a compact representation may be used only as the single remaining same-mechanism pivot and must reproduce the identical equivalence relation. If no nonempty costed residual remains, recommend `STOP`.

This is one evidence-fidelity/non-vacuity question on the existing object, not a request for an unbounded theorem, DPomega source reproduction, DBMS integration, or Stage B workload campaign.
