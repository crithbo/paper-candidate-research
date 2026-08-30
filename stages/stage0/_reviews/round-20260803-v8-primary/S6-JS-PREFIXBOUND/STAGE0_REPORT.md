# Stage 0 PRIMARY report — S6-JS-PREFIXBOUND

**Decision:** `REVISE_ONCE` — **AWAITING_CONFIRMATION**  
**Confidence:** 0.83 | **Route:** N2 | **Score:** academic 50/70 + AI 24/30 = **74/100**

## Frozen object and exactness boundary

The object is DPomega’s merge-join JS core: conjunctive equi-join query, fixed relation/cardinality statistics, bushy plan space, external-sort costs, final order and Omega-condition. The algorithm must return the same globally minimum estimated join-plus-sort cost in the same plan space. The candidate decision is a formally defined order-prefix future-equivalence signature plus an admissible `max(join relaxation, unavoidable-sort relaxation)` bound; PostgreSQL deployment choices and plain order-free objectives are not substitutes.

## Genealogy, collision and baselines

DPomega is the exact same-object anchor and proves an Omega-conditioned exact DP. Haffner–Dittrich gives a shortest-path/A* exact framework only for plain join planning; DPconv gives subset convolution only for plain join. These are direct subtractors but not direct fatal: no verified source was found that supplies both a safe DPomega-prefix quotient and the stated same-object admissible bound. The candidate cannot describe A* or convolution themselves as its contribution.

Finite baselines are: (1) DPomega bushy exact DP, reconstructed at algorithm fidelity if source is unavailable; (2) PostgreSQL 12.4 as non-equivalent deployment reference only; (3) Haffner–Dittrich A* on the stripped order-free relaxation; (4) DPconv on that same relaxation. Exhaustive enumeration/MILP on small JS instances is an oracle only.

## Facets, natural headroom and mechanisms

| Facet | Candidate | Existing work | Review finding |
|---|---|---|---|
| Exact object | DPomega JS / Omega condition | DPomega | identical object, high correctness bar |
| New state | future-equivalent prefix class | full order state | not yet defined/proved |
| Search | same-object admissible bound + A* | plain join A*/convolution | separate, not transferable by name |
| Natural result | state/RAM reduction | DPomega TPC-DS/JOB/SYN-S | candidate witness absent |

Mechanism A is quotient A*; B is a bounded order-automaton min-plus DP. They are mutually contingent alternatives, not a union. DPomega’s natural corpus establishes optimizer cost exists, but not a quotient residual.

## Killer, Q1, and AI

Within 72 hours, write the signature and exhaustively enumerate small complete JS instances. For any two equal-signature partial plans, enumerate every legal continuation; a future-cost distinction stops the topic. If not falsified, cross-check global optimum with enumeration/MILP and show one natural or controlled DPomega-shaped family with state/RAM reduction without a cost/plan-space change. 

| Calibrator | Shape | Candidate requirement |
|---|---|---|
| [DPomega, VLDB Journal 2025](https://doi.org/10.1007/s00778-025-00906-y) | exact join-and-sort DP and system study | correct quotient plus lower state complexity |
| [Haffner–Dittrich, PACMMOD 2023](https://doi.org/10.1145/3588927) | exact heuristic search | transfer with a proven order-aware bound |
| [DPconv, SIGMOD 2025](https://doi.org/10.1145/3698809) | exact plain-join convolution | valid order-state closure, if used |

Q1 shape is conditionally credible only with a nontrivial theorem and same-object state reduction. AI core fraction is **0.75**, conditional on human proof and DPomega-fidelity audit; no hardware or fault is relevant.

## Atomic revision gate

`EXPLICIT_OMEGA_PREFIX_EQUIVALENCE_THEOREM_AND_NATURAL_STATE_REDUCTION_WITNESS`: define the signature, pass the exhaustive continuation counterexample search, establish admissibility, and show a nonzero same-object state/RAM residual. No Stage A/B is authorized.
