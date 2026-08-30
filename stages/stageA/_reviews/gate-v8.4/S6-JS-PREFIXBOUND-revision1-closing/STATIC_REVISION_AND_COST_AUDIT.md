# Static Revision and Cost Audit

## Contract fidelity

Static inspection of `run_revision.py` confirms that the executed model uses the frozen formulas:

- `card(S)=32+7*mask(S)+3*|S|`;
- `ndv(S,A)=min(card(S),2+mask(S)%5)`;
- `ndv(S,B)=min(card(S),3+(mask(S)*2)%7)`;
- JOB equivalence classes map by the frozen even/odd rule.

The same relation graph, connected bushy plan space, merge-key permutations, final order, sort-cost model, information, action set, and exact objective are used by exact, full-vector, and compact paths. No object substitution was found.

## Compact representation and equivalence

The compact path constructs the same full signature on first use of each `(subset, order)`, interns exact-equal tuples to a contiguous class id, and retains a class-indexed array of `(cost, representative order)`. Temporary `order_to_id` and `class_by_sig` maps are discarded after the subset freezes. The class id is implicit in the array index; downstream enumeration needs the retained representative and cost, not a persistent copy of the temporary vector map.

This is a representation change over the same finite equivalence relation, not a new information set or a cheaper decision problem. Its important weakness is also real: it has not derived a direct compact characterization and must first construct full-vector equality.

The reported `0` compact-equivalence mismatches are consistent with the construction. The implementation additionally compares compact and full-vector class counts per subset. Because class ids are assigned directly from exact tuple equality, pairwise equivalence is definitional within this implementation; it is not an unbounded proof.

## Independent arithmetic

All logical ledgers sum to their reported totals:

| Phase | Recomputed total |
|---|---:|
| Exact control | 5,482,863 |
| Full-vector quotient | 10,788,389 |
| Compact quotient | 11,906,560 |
| Bound-oracle audit | 58,192,861 |

The residual arithmetic independently reproduces:

- full-vector work: `5,482,863 - 10,788,389 - 58,192,861 = -63,498,387`;
- compact work: `5,482,863 - 11,906,560 - 58,192,861 = -64,616,558`;
- full-vector retained payload: `20,929,349 - 53,678,883 = -32,749,534 B`;
- compact retained payload: `20,929,349 - 20,327,780 = +601,569 B`;
- compact retained fraction: `601,569 / 20,929,349 = 2.8742843%`.

The full vector is therefore absorbed. The selected compact representation passes only the predeclared retained-payload arm. It fails the work arm and is slower than exact in both recorded runs.

## Correctness and replay

| Check | Result |
|---|---:|
| Formal instances | 19,440 |
| Formal plus JOB exact states | 404,479 |
| Full-vector optimum mismatches | 0 |
| Compact optimum mismatches | 0 |
| Compact/full-vector equivalence mismatches | 0 |
| Candidate future-equivalence counterexamples | 0 |
| Bound overestimates | 0 / 404,479 |
| Primary/replay nonvolatile equality | exact |

The validator removes only the preregistered wall time, CPU time, and peak-memory fields. State, transition, work-ledger, retained-payload, signature, bound, trigger, verdict, and authority fields remain in the equality comparison.

## Evidence ceiling

The retained metric is canonical UTF-8 serialization bytes for frozen entries and persistent metadata, not process RSS. Peak `tracemalloc` is descriptive. JOB 4a supplies a real SQL graph and equality-class structure, but its cardinalities and costs remain frozen proxies. Accordingly:

- supported: finite optimum preservation, finite exact-equivalence reproduction, finite non-overestimation audit, a small deterministic persistent-representation residual, and same-direction state reduction on a natural graph structure;
- unsupported: optimizer speedup, logical-work reduction, process-RAM reduction, cheap/useful pruning, executable DPomega fidelity, natural cost or DBMS performance, an unbounded theorem, and global novelty closure.

