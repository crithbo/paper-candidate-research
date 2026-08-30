# Stage 0 PRIMARY report — S6-EGRAPH-LIVEEXTRACT

**Decision:** `REVISE_ONCE` — **AWAITING_CONFIRMATION**  
**Confidence:** 0.81 | **Route:** N2 | **Score:** academic 51/70 + AI 23/30 = **74/100**

## Frozen object and claim

For a fixed pure, acyclic e-graph `G`, roots, rewrite closure, backend operation costs/output sizes and temporary-memory bound `B`, jointly select eclass representatives, materialize-versus-recompute choices and legal topological schedule. Preserve IR semantics; charge extraction/scheduling time, peak temporary memory, recomputation, code size and backend effects. This excludes e-graph construction RAM and a post-hoc register allocator.

## Genealogy and finite fair baselines

FastOpt (OOPSLA 2024) gives exact low-treewidth sparse extraction on real Cranelift e-graphs; Julia EqSat (TACO 2026) gives ILP extraction with code reuse; e-boost is an ICCAD 2025 shared-DAG-cost subtractor. These strong bases make ordinary shared extraction unavailable as a claim. They do not, on reviewed evidence, jointly encode representative selection, materialize/recompute, peak-live bound and schedule in the same object. Thus no `DIRECT_FATAL` is found, but the claimed coupling cannot be presumed from a generic pebbling analogy.

Baselines are: (1) egg/Cranelift standard extraction + backend schedule/allocation, (2) FastOpt, (3) Julia EqSat/e-boost where their documented scope permits, and (4) a strong sequential runtime-min-DAG then optimal fixed-DAG scheduling pipeline, together with memory-first. Joint MILP/SMT is an oracle only.

## Facets, headroom and mechanisms

| Facet | Candidate | Prior extraction | Review outcome |
|---|---|---|---|
| selection | enode + reuse | low-cost/shared DAG | already absorbed |
| memory | live frontier + slots | no same-object scheduling | potential residual |
| action | recompute/materialize/order | extraction-only | needs fixed backend boundary |
| natural headroom | Cranelift/egg under B sweep | real egraphs available | no non-dominated point measured |

Mechanism A is live-boundary tree-decomposition DP; B is Lagrangian branch-and-bound. Either must independently create a sequentially non-dominated point. No fault or special hardware is required.

## Killer, Q1, AI

Within 72 hours, lock at least one Cranelift and one egg corpus and the peak-live accounting interface; sweep `B` against runtime-first and memory-first *optimal fixed-DAG* schedules plus a small joint oracle. If every joint point is sequentially dominated, or an advantage changes semantics/backend costs, stop. 

| Calibrator | Shape | Calibration |
|---|---|---|
| [FastOpt, OOPSLA 2024](https://doi.org/10.1145/3689801) | exact extraction / parameterized algorithm | direct Q1-shape comparator |
| [SmoothE, ASPLOS 2025](https://www.csl.cornell.edu/~zhiruz/pdfs/smoothe-asplos2025.pdf) | EqSat compiler system | adjacent systems strength |
| [Julia EqSat, TACO 2026](https://doi.org/10.1145/3795883) | ILP extraction and code reuse | strongest shared-DAG subtractor |

Q1 parity is conditional upon an exact/parameterized result plus natural Pareto residual. AI core fraction is **0.70**; the backend live-memory interface is the remaining human validity boundary.

## Atomic revision gate

`SAME_EGRAPH_PEAK_LIVE_BOUNDARY_AND_NONDOMINATED_CORPUS_WITNESS`: bind semantics, cost and allocation boundary; provide one corpus witness with a non-dominated joint point against both strong sequential orders. No Stage A/B is authorized.
