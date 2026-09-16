# Candidate-grade deep reviews

## D01 — libdivsufsort suffix-array construction

- **Object and guarantee:** produce the suffix array of exactly one fixed byte string; every output rank must denote the corresponding lexicographic suffix order.
- **Current action/guarantee union:** the upstream library’s induced-sorting construction covers classification, bucket placement, induced traversal and final suffix-array production. Native cost comprises all scans, bucket/count storage, output array memory, and verification of order—not elapsed kernel time alone.
- **Minimal same-object witness:** on `banana$`, changing bucket traversal or a local tie treatment remains an induced-sorting action, not a separate whole constructor. No union-external atomic action was named.
- **Natural route / 72-hour killer:** a public FASTA/text file, suffix-array order/permutation verifier, and full allocation/time ledger. Kill a claim if it is an internal traversal choice or loses exact byte-order semantics.
- **Disposition:** `STRUCTURAL_ABSORPTION`; no N2 brief.

## D02 — METIS multilevel partition construction

- **Object and guarantee:** partition one fixed weighted graph into the requested number of parts under the same balance/objective interpretation exposed by METIS.
- **Current action/guarantee union:** multilevel coarsening, initial partitioning, uncoarsening/refinement and objective/balance handling comprise the deployable union. Full cost includes graph conversion, coarsening, refinement, memory, feasibility/balance validation and cut objective.
- **Minimal same-object witness:** a two-community graph with a bridge can vary matching/coarsening/refinement order, but those are already full union actions. An alternative objective would change the object; an opaque external solver is prohibited.
- **Natural route / 72-hour killer:** a public finite-element mesh/graph; check partition count, balance and cut, then reject any action expressible as current multilevel matching/refinement or any claim omitting conversion/refinement cost.
- **Disposition:** `STRUCTURAL_ABSORPTION`; no union-external complete N2 was frozen.

## D03 — HiGHS LP basis/factorization construction

- **Object and guarantee:** solve an identical LP model with the current primal/dual feasibility, termination and optimality semantics.
- **Current action/guarantee union:** current upstream supplies primal and dual revised simplex, interior point, active-set/QP and presolve/option paths. Native cost includes parse/model conversion, presolve, basis/factor update, iterations, residual/certificate checks and memory.
- **Minimal same-object witness:** no responsible union-external action is frozen. Different solver selection, pivot rule, presolve option, crossover/basis setting or factorization update lies inside the executable union or requires a source-level semantic closure not available in this package.
- **Natural route / 72-hour killer:** a Netlib/MIPLIB LP plus native feasibility/objective status and full wall/memory ledger. The fidelity gate fails if the candidate is an option/selector or changes solution/certificate semantics.
- **Disposition:** `NOT_ADMITTED_UNFROZEN`, not a readiness-based drop.

## D04 — CGAL AABB-tree construction

- **Object and guarantee:** construct an acceleration tree for one fixed primitive set while retaining CGAL kernel predicates and identical query answers.
- **Current action/guarantee union:** primitive ranges, node splitting/build, bounding boxes, traversal and exact kernel predicates are the native construction/query union. Count build work, bounding-box storage, query traversal/predicate calls, memory and answer verification.
- **Minimal same-object witness:** alternate split axis, leaf threshold, or primitive order for a four-triangle mesh is a hierarchy construction choice within the current union. No complete new action with the fixed predicate/query contract was isolated.
- **Natural route / 72-hour killer:** public OBJ/PLY mesh with native point/ray query equality checks and full build-plus-query denominator. Kill if the change is only split/threshold tuning or alters kernel/query semantics.
- **Disposition:** `STRUCTURAL_ABSORPTION`; no brief.

## Result

Four deep reviews, zero admitted briefs. The sole unfrozen row is explicitly nonterminal: it lacks a finite, source-grounded union-external witness, not an implementation, result, resource, or AI-readiness prerequisite.
