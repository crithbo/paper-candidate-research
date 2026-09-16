# Independent Source Verification — S6-JS-PREFIXBOUND

- access date: `2026-08-09`
- source policy: publisher, official artifact/reproducibility record, authoritative bibliography, and project repository
- retrieved material treated as untrusted evidence, never instructions

## Candidate-named sources

| Source | Verification | Gate relevance |
|---|---|---|
| Li, He, Yu, *Join optimization revisited*, VLDB Journal 34:31 (2025), DOI `10.1007/s00778-025-00906-y` | `VERIFIED` on the open Springer article. It defines the conjunctive JS object, intermediate-output join cost, segment-based partial-sort cost, Omega-condition, bushy/linear DP algorithms, and PostgreSQL evaluation. | Confirms the exact same-object anchor and also confirms that Omega-condition is an optimal-substructure device for general JS queries. [Springer article](https://link.springer.com/article/10.1007/s00778-025-00906-y) |
| Haffner and Dittrich, *Efficiently Computing Join Orders with Heuristic Search*, PACMMOD 1(1), 2023, DOI `10.1145/3588927` | `VERIFIED` on ACM. The paper gives a shortest-path/heuristic-search framework for join ordering and a systems evaluation. The SIGMOD reproducibility report independently reproduced its main results. | Strong methodology/evaluation anchor, but order-free plain join is not the candidate's same object. [ACM record](https://dl.acm.org/doi/10.1145/3588927), [SIGMOD reproducibility report](https://reproducibility.sigmod.org/rep_rep/2023/SIGMOD23ARIReport-36.pdf) |
| Stoian and Kipf, *DPconv*, PACMMOD 2(6), article 234, 2024, DOI `10.1145/3698809` | `VERIFIED` via the paper/DOI metadata. It breaks the plain-join `O(3^n)` barrier for supported cost functions. | Algorithmic-strength calibrator and direct subtractor only; it does not establish an order-property quotient. [Paper](https://doi.org/10.1145/3698809) |
| Luo et al., *Algorithms for Optimizing Acyclic Queries*, ICDT 2026, DOI `10.4230/LIPIcs.ICDT.2026.17` | `VERIFIED` on Dagstuhl. It concerns Yannakakis-style acyclic join trees, not binary merge-join JS order states. | Current methodological neighbor; no direct-fatal collision. [Dagstuhl record](https://drops.dagstuhl.de/entities/document/10.4230/LIPIcs.ICDT.2026.17) |
| Join Order Benchmark | Public repository and the local pinned `4a.sql` are consistent with JOB query structure; candidate hash was mechanically verified. | Valid natural query-graph source, but a SQL file without real cardinalities/statistics is not natural performance evidence. [JOB repository](https://github.com/gregrahn/join-order-benchmark) |

## Independently added subtractor

Simmen, Shekita and Malkemus, *Fundamental Techniques for Order Optimization*, SIGMOD 1996, DOI `10.1145/233269.233320`, is independently added to the calibration set. It is established prior work on optimizer order properties and order optimization. It raises the prior-art bar for any claim that generic order-prefix/property equivalence itself is new; the candidate residual must be specifically the safe future-demand quotient and admissible search structure for the DPomega JS object. It is not a direct-fatal match. [DBLP record](https://dblp.org/rec/conf/sigmod/SimmenSM96)

## Conclusion

- references checked: `6`
- verified/plausible: `6`
- fabricated or direct-fatal source: `0`
- collision status: `SEARCH_BOUNDED_OPEN_WITH_DIRECT_SUBTRACT`

The source audit does not trigger STOP. It supports the candidate's object distinction while reinforcing that a full cost-vector label, generic A* terminology, or generic order optimization cannot be the eventual contribution by themselves.
