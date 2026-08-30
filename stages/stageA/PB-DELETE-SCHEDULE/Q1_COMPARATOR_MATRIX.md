# Q1/Q2 Comparator Matrix

| Requirement | Frozen expectation | Stage A evidence | Assessment |
|---|---|---|---|
| Same object | Fixed natural WCNF/output/objective/deletion set | 30 complete traces; 240/240 replay rows preserve output/objective | Pass |
| Natural evidence | At least 30 natural traces, >=2 checked deletions | 30 traces; minimum 153; no split examples | Pass |
| Fair current baselines | Original, stable legal, greedy earliest-ready | All present with same information and checker contract | Pass |
| Legality/equivalence | Forced checked semantics and CakePB equioptimal | 240/240 pass, dual hash closure | Pass |
| Nontrivial mechanism opportunity | Legal scheduling choice rate >=0.20 | 0.80 | Pass |
| Full-cost residual | Candidate Pareto residual at p50 and p90 against every baseline | Empty against every baseline; candidate 1.87x/1.93x original time | Fail, decisive |
| Generalizable contribution | Nontrivial N2 scheduling benefit after all cost | Scheduling overhead absorbs checker-local changes | Fail |
| Q2 paper shape | Credible contribution and evidence route | Core mechanism negative on frozen natural corpus | `BELOW_Q2_STOP` |
| Q1 parity | Stronger scope, robustness, and material residual | No core residual to scale | Not plausible |

The failure is not an evidence-volume gap that Stage B could repair. The contribution premise itself is absent under the frozen mechanism; therefore the candidate should stop instead of expanding experiments.
