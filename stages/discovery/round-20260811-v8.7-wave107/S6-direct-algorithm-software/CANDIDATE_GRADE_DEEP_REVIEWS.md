# Candidate-grade deep reviews

## D01 — Qhull convex-hull constructor

- **Atomic union:** point insertion/partition, conflict lists, visible facets, horizon construction, facet/ridge updates and output traversal.
- **Same-object/full cost:** fixed coordinates and precision/option semantics; charge preprocessing, predicates, conflict storage, hull facets, CPU/memory and containment/facet verification.
- **Witness/72h killer:** four non-coplanar points make insertion/order choices observable, but they remain native conflict/horizon actions. Public point cloud; kill on invalid hull or a proposal reducible to insertion/pivot ordering.
- **Disposition:** `STRUCTURAL_ABSORPTION`.

## D02 — Clipper2 polygon-Boolean constructor

- **Atomic union:** edge ingestion, intersections, sweep/order processing, winding/fill evaluation, output path/ring assembly and native cleanup.
- **Same-object/full cost:** identical polygons, fill rule and Boolean operation; charge intersection handling, output allocation, output coordinates, CPU/memory and polygon equality/area/orientation checks.
- **Witness/72h killer:** two crossing rectangles expose event order but not a union-external full action. Public GIS polygons; kill if fill/precision semantics change or output fails native predicates.
- **Disposition:** `STRUCTURAL_ABSORPTION`.

## D03 — Triangle constrained-Delaunay mesh constructor

- **Atomic union:** PSLG parsing, initial triangulation, segment recovery, point insertion, flips, refinement and quality/area constraint enforcement.
- **Same-object/full cost:** fixed PSLG and flags; charge mesh build, Steiner points, predicates, output mesh bytes, CPU/memory and boundary/quality verification.
- **Witness/72h killer:** a square with interior constraint admits flip/refinement paths but they belong to native construction; changed quality target changes contract. Public CAD PSLG; kill on boundary/quality violation or uncharged Steiner cost.
- **Disposition:** `STRUCTURAL_ABSORPTION`.

## D04 — SuiteSparse AMD ordering constructor

- **Atomic union:** sparse-pattern preprocessing, approximate-degree scoring/update, quotient/elimination graph handling, tie ordering and permutation emission.
- **Same-object/full cost:** fixed symmetric sparsity pattern and target ordering objective; charge preprocessing, ordering, symbolic fill/flop proxy, memory and permutation validity.
- **Witness/72h killer:** a four-vertex elimination pattern exposes ties, but tie choice is an internal action. SuiteSparse matrix; kill if objective/ordering semantics are changed or full symbolic cost does not improve.
- **Disposition:** `STRUCTURAL_ABSORPTION`.

## D05 — bliss canonical-label constructor

- **Atomic union:** graph coloring/partition refinement, individualization, search/backtracking, automorphism pruning and canonical certificate emission.
- **Same-object/full cost:** fixed labeled graph and canonical-label semantics; charge refinement/search, certificate, memory, CPU and canonical invariance verification under a vertex relabeling witness.
- **Witness/72h killer:** a symmetric four-cycle exposes branching, yet branch order/pruning is inside native canonical-label construction. Public graphs; kill if certificates differ under isomorphism or action is search-order tuning.
- **Disposition:** `STRUCTURAL_ABSORPTION`.

## D06 — LEMON shortest-path tree constructor

- **Atomic union:** distance initialization, priority/queue discipline, edge relaxation, predecessor updates, unreachable handling and result tree emission.
- **Same-object/full cost:** fixed weighted graph/source and nonnegative-weight contract; charge graph load, queue/relax work, tree/distance storage, CPU/memory and edge/path optimality verification.
- **Witness/72h killer:** equal-cost two-path graph exposes queue ties, which are native relaxation actions. Public road graph; kill on distance error or on a mere queue/heap substitution with no new complete guarantee.
- **Disposition:** `NOT_ADMITTED_UNFROZEN`.

## Result

Six deep reviews and zero briefs. Five mechanisms are current-union absorption. LEMON retains a finite natural route but lacks a named union-external N2 whole action; this is `NOT_ADMITTED_UNFROZEN`, not a readiness or resource rejection.
