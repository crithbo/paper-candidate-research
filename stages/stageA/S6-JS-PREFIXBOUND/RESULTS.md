# S6-JS-PREFIXBOUND Stage A Results

## Verdict and evidence ceiling

- Probe verdict: `NOT_FALSIFIED_WITH_PRELIMINARY_SUPPORT`
- Owner recommendation: `PASS_RECOMMENDED`
- Quality tier retained conditionally: `TIER_A_Q1_POTENTIAL`
- Evidence ceiling: finite model enumeration plus one natural SQL join-graph structure with proxy costs; **not** a theorem, DPomega code reproduction, natural-cardinality result, DBMS integration, or optimizer speedup result.

## Frozen formal object

For a connected relation subset `S`, an exact state is `(S, o, g)`: `o` is the current merge-join output order and `g` is the accumulated join-output-cardinality plus partial-sort cost. A legal merge across a connected cut selects any permutation `d` of the cut's join-attribute equivalence classes, sorts both inputs toward `d` using the longest-common-prefix segment cost, charges the join output cardinality, and emits order `d`. The final state optionally sorts to `Omega`.

The candidate signature is not an arbitrary truncation:

`Sigma_S(o) = [(d, lcp(o,d), scost(S,o,d)) for every legal next demand d]`.

If two states share `Sigma_S`, every legal first continuation action has equal incremental cost. That action overwrites the output order with the selected demand `d`, so subsequent continuation costs no longer depend on the old order. The enumerator attacks this transition-bisimulation obligation; finite survival is not a proof for unbounded instances.

The tested bound is:

`h(S,o) = max(h_join(S), h_sort(S,o))`,

where `h_join` is the exact order-free join-only completion cost with `S` treated as an indivisible available atom, and `h_sort` is the minimum unavoidable next-input (or final `Omega`) sort cost. Both relax the same remaining objective, so their maximum is a candidate admissible lower bound. The executable oracle checks every reachable state in the frozen finite scope.

## Main finite enumeration

The generator exhausts every connected labeled simple graph with 3 or 4 relations, every assignment of edge keys from `{A}`, `{B}`, `{A,B}`, and each final order in `empty`, `A`, `B`, `AB`, `BA`: exactly **19,440 instances**.

| Metric | Result |
|---|---:|
| Reachable exact order states | 404,450 |
| Candidate quotient states | 389,750 |
| Aggregate state reduction | 3.634565% |
| Exact DP transitions | 876,980 |
| Quotient DP transitions | 873,620 |
| Aggregate transition reduction | 0.383133% |
| Instances with positive state reduction | 9,404 / 19,440 |
| Instances with zero state reduction | 10,036 / 19,440 |
| Candidate same-signature pairs checked | 17,506 |
| Legal first-continuation actions checked | 8,384 |
| Candidate signature counterexamples | **0** |
| Quotient/exact optimum mismatches | **0** |
| Bound checks | 404,450 |
| Bound overestimates | **0** |
| Naive `lcp(o,Omega)` counterexamples | **69,920** |

Maximum per-instance state reduction was 27.78% (18 to 13 states). The minimum was 0%; no-gain cases are common and are part of the result.

### Concrete negative witness against the naive signature

In `n3-g3-lA_AB-oEMPTY`, subset mask `5` admits orders `AB` and `BA`. Both have the same naive empty-`Omega` signature, but future demand `A` costs 378.8571927982413 from `AB` and 451.8571927982413 from `BA`. Therefore, “same prefix against final `Omega`” is not future-equivalence. This negative result narrows the viable mechanism to a future-demand-indexed signature.

## Natural-structure probe: JOB 4a

Input: pinned [`JOB 4a`](https://github.com/gregrahn/join-order-benchmark/blob/a39603662e023e449cb2121997a5034df9e02ebf/4a.sql), 450 bytes, SHA-256 `C80E515F37A633ADCA3AB45BBD5CBA20E760C80A71D7841B51E64154B1008065`.

The SQL parser recovered five relations (`it`, `k`, `mi_idx`, `mk`, `t`) and three equality classes. Only the natural join graph/equivalence structure is used; cardinality and NDV values are deterministic proxies.

| Metric | Result |
|---|---:|
| Exact order states | 29 |
| Quotient states | 24 |
| State reduction | 17.241379% |
| Exact / quotient transitions | 44 / 41 |
| Exact / quotient optimum | 4304.112939279771 / 4304.112939279771 |
| Candidate counterexamples | 0 |
| Bound overestimates | 0 / 29 checks |
| Naive-signature counterexamples | 6 |

This is natural structural headroom, not natural performance evidence. No real JOB cardinalities, PostgreSQL execution, or DPomega implementation were used.

## Full-cost and replay ledger

| Run | Wall time | Process CPU | Peak `tracemalloc` | Result |
|---|---:|---:|---:|---|
| Primary | 224.914 s | 221.922 s | 2,189,819 B | completed |
| First replay attempt | ~135 s before external exit | unavailable | unavailable | exit 1, no stderr, no output file |
| Controlled replay | 274.631 s | 270.703 s | 2,189,819 B | completed |

`validate_results.py` removed only the three preregistered volatile runtime fields. Every other JSON field matched exactly. GPU use was false; probe-time network use was false. Input retrieval was a one-time 450-byte pinned download before execution.

The full-cost result does **not** establish speedup: signature construction was performed 404,450 times; transition reduction was only 0.38%; and the Python oracle deliberately recomputed expensive exact completions for admissibility. Stage B would need an efficient signature representation, amortized bound precomputation, and same-object DPomega runtime/RAM comparison.

## Interpretation

### Supported

- The final-`Omega`-only prefix signature is unsafe in the frozen finite object.
- The future-demand-indexed prefix/cost signature was not falsified over the complete locked family and JOB 4a structure.
- The quotient preserved the exact optimum over the executed scope.
- `max(h_join,h_sort)` did not overestimate over 404,479 total bound checks.
- State reduction is observable, including on a natural SQL join-graph structure.

### Unsupported

- No unbounded future-equivalence theorem or admissibility theorem is proved.
- No claim is made that the signature is minimal, cheap, or asymptotically smaller.
- No DPomega source-code fidelity, PostgreSQL integration, optimizer wall-time/RAM advantage, query-runtime advantage, or natural-cardinality result is established.
- No global novelty closure is claimed; collision status remains `SEARCH_BOUNDED_OPEN_WITH_DIRECT_SUBTRACT`.

## Stop-condition audit

No preregistered STOP condition fired. The main remaining risk is economic rather than finite correctness: a demand-cost fingerprint can be expensive enough to erase the small transition reduction. This is a mandatory Stage B killer, not a fact hidden by the positive finite result.

