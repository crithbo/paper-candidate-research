# Candidate-grade depth reviews

## D1 — Faiss IVF/PQ joint assignment and list-layout constructor

**Frozen object.** The input is the same vector set, metric, training data and query workload; the observable contract is the stock Faiss index/search result under the fixed approximation configuration, rather than a changed index type or reader.

**Current strongest executable union.** Faiss officially exposes composite `index_factory` constructions combining preprocessing, IVF, nested IVF, PQ/SQ/RQ-family encodings, refinement and fast-scan variants. The official index documentation lists explicit IVF/PQ parameters such as coarse quantizer, `nlists`, `M`, `nbits`, and refinement. This union already composes assignment, list/index representation and codec choices; auto-tuning further covers Pareto search parameters.

**Proposed witness and failure.** A conceivable two-index witness would keep vectors and metric fixed while changing redundant assignment and list placement. It is native-legal only after choosing an IVF-family representation. It is not union-external: it lies in the existing IVF representation/action family, and the primary 2026 RAIRS paper explicitly studies redundant assignment and list layout for IVF-based ANN search. Thus the intended target-specific N2 is directly absorbed/collides rather than a new residual.

**Direct subtractors.** Official Faiss factory/index documentation; Faiss auto-tuning documentation; RAIRS, *Optimizing Redundant Assignment and List Layout for IVF-Based ANN Search* (primary arXiv 2026). Generic ANN literature is not needed to reach the absorption result.

**Natural route and full cost, if it had survived.** Versioned SIFT1M/Deep1B-style public vector collections; exact top-k/recall oracle under the fixed metric; train/build CPU/RSS/temp/index bytes plus query CPU/RSS/latency/recall. A 72-hour killer would compare the candidate against the current Faiss IVF-PQ/FastScan/refinement union at fixed recall and include training and build cost. It is not authorized because the structural collision closes the line first.

**Decision.** `STRUCTURAL_DROP` — not because a result is missing, but because the action shape is represented by the current family and directly targeted by a primary same-object paper.

## D2 — HiGHS LP basis/crash batch constructor

**Frozen object.** Fixed LP matrix, bounds, objective, tolerances and termination semantics; stock HiGHS status, primal/dual feasibility and objective are the oracle.

**Current anchor.** The official HiGHS repository documents primal and dual revised simplex solvers and a basis-file output option. This verifies a public CPU-native object but not a complete immutable action-union pin for current crash selection, presolve transformations, basis construction, parallel paths, defaults and all non-default entry points.

**Witness attempt.** The intended two-history witness would retain the same LP and final valid basis while forming two different batches of crash/basis choices. The review could not establish that the batch is a native producer action independent of presolve settings, solver strategy, or generic ordering. Calling it an FPT/exact/Pareto constructor now would therefore be unsupported.

**Natural route and finite closure.** MIPLIB/Netlib public LP instances, stock primal/dual feasibility and objective oracle, and a ledger for presolve, crash, solve, verification, basis bytes, CPU/RSS/temp. A finite 72-hour admission route is to pin one HiGHS commit, enumerate all crash/basis/presolve configuration paths, produce two same-LP basis artifacts, and state a target-specific guarantee not reducible to solver selection.

**Decision.** `NOT_ADMITTED_UNFROZEN` — current source/action and direct-collision closure is incomplete; no absence conclusion is drawn.
