# Action and Guarantee Audit — HNSW-LAYER-BMATCH Revision 1

## Atomicity verdict

`PASS_FOR_CLOSING_REVIEW`. The candidate is one constructor whose state always couples connectivity, capacity and HNSW greedy-path quality. It is not a list of independent mechanisms.

## Six-dimensional residual audit

| Dimension | Frozen candidate | Strongest subtraction | Residual |
|---|---|---|---|
| Decision rule | entry-rooted portal-ear growth plus atomic capacity exchanges | local RNG; global FastHNSW RNG; additive matching; bridge/tree repair | connectivity is maintained during selection and exchanges optimize path-dependent `G` |
| Information | exact shared `C_l`, coordinates, entry, caps and build-vector landmarks | same information supplied to adapted controls | no extra KNN/query oracle |
| Complexity/resource | fixed `L=3`, `k=3`; bounded ear/bundle enumeration | cheap local pruning and generic matching; exact solver ceiling | explicit polynomial fixed-parameter route; full cost charged |
| Quality/guarantee | `PE(L,b)` completeness, persistent legality/connectivity and `k`-exchange local optimality | native output legality; generic connected repair | named class/property tied to one action, not just output checking |
| Full cost | candidate generation, `G`, ears, exchanges, integration, memory, bytes, load/search/fallback | identical denominator | no omitted optimizer or repair cost |
| Generality/no-gain | useful only with multiple portal alternatives and greedy-search traps | FastHNSW/native likely dominate easy/high-cap cases | explicit natural occurrence and no-gain killers |

## Why this is not generic matching plus repair

- No disconnected maximum-weight matching is produced as the candidate's initial solution.
- Every committed growth state is connected to the HNSW entry.
- Candidate additions and capacity releases are one atomic bundle; bridge edges are never appended to saturated endpoints.
- The primary objective `G(E)` is the behavior of the frozen standard HNSW greedy layer search and is path-dependent, so it cannot be represented by an additive b-matching edge score without changing the problem.
- The named completeness class is defined by bounded entry-rooted portal ears, not by “run any matching, then DFS.”
- Exact connected optimization remains a small ceiling; it is not relabeled as the method.

## Algorithm contract

### Inputs

`(V, E_C, coordinates, metric, r, b, L, k, candidate-ranks, deterministic-ties)`.

### Outputs

One of:

- `SUCCESS(E, ear_certificate, exchange_ledger, Q)` with `E⊆E_C`, legal degree and entry connectivity;
- `UNSUPPORTED_PORTAL_EAR_CLASS(frontier, saturated_endpoints, L, k)` plus frozen native fallback.

The second status is not a proof that no connected degree-bounded graph exists.

### State transition

Each transition is a symmetric-difference bundle `(A_plus,A_minus)`. It is legal only when the final state satisfies `E'=(E\A_minus)∪A_plus⊆E_C`, every degree cap, and entry connectivity for every processed vertex. The ledger contains all changed edges, degree deltas, connectivity witness and `Q` delta.

### Deterministic choice

Choose the legal bundle maximizing `(new_vertices, ΔG, ΔD, -ΔL, reverse_lex_edge_key)` during growth, then `(ΔG,ΔD,-ΔL,reverse_lex_edge_key)` during refinement. Zero-gain cycles are not accepted.

## Formal-property scope

### `PE(L,b)` completeness

The claimed future proof obligation is limited to graphs carrying an entry-rooted ear certificate of maximum ear length `L` with per-vertex incidence within `b`. Complete legal-ear enumeration must find a spanning feasible construction on that class. It makes no statement for arbitrary connected degree-bounded graphs.

### Exchange local optimality

Termination after complete enumeration of legal bundles with at most `k` additions/deletions implies no such bundle improves `Q`. For the frozen mechanism `k=3`.

### Complexity ceiling

For fixed `L` and `k`, a direct implementation has a finite conservative route bounded by polynomial enumeration, with targets `O(|V|·|E_C|^L)` for growth and `O(|E_C|^{2k})` for exhaustive refinement. Stage A may improve these bounds but may not replace the action with an opaque unbounded solver.

## Comparator action catalog

| ID | Action | Information | Guarantee/limit | Witness disposition |
|---|---|---|---|---|
| B1 | hnswlib-style fixed-`C` local replay | same `C`, order, metric, cap | local RNG/diversity and reciprocal pruning | two portal edges are occluded after internal neighbors; reciprocal static output is two triangles |
| B2 | Faiss-style fixed-`C` local replay | same | local selection/pruning | same static action class on the symmetric witness |
| B3 | FastHNSW layer RNG | same layer/`C`, cap and metric | global layer build but local RNG pruning; no frozen PAX invariant | two triangles on witness |
| B4 | additive maximum-weight b-matching | same `C`, additive local diversity/length weight | degree legal, no connectivity | two triangles via deterministic internal-edge tie |
| B5 | greedy bridge | B4 output plus component quotient | connectivity attempt only | saturated endpoints require deletions |
| B6 | bridge plus one/two-edge swap and bounded refill | same | capacity-safe local repair, no path objective/global ear property | deterministic one-portal path `E_R`; frozen local fixed point |
| B7 | reserved-capacity / spanning-tree-first | same | connected output where feasible; additive deterministic completion | same one-portal family under frozen reverse-lex tie |
| B8 | exact connected degree-bounded optimizer | same plus exact `Q` | small-instance ceiling only | agrees with candidate `E*` |
| C | `PAX-HNSW(3,3)` | same | `PE(3,2)` target, invariants, 3-exchange local optimum | two-portal cycle `E*` |

The exact official FastHNSW call path must be pinned before a claim-bearing Stage A run. Its current bounded classification is `SEARCH_BOUNDED_OPEN`, never an inferred absence.

## Static guarantee checks on the witness

- `Candidate fidelity`: every `E*` edge is in `C`.
- `Degree safety`: every vertex has degree exactly two.
- `Entry connectivity`: `E*` is one six-cycle containing entry `v0`.
- `Determinism`: all distance ties use vertex ID and every edge-set tie uses the frozen reverse-lex key.
- `HNSW path objective`: `G(E*)=6`; `G(E_R)=3`; `G(E_tri)=3`.
- `Atomic exchange`: `E* = E_R + {01,25,34} - {12,35}`; degrees and connectivity are checked on the committed final bundle.
- `Ear certificate`: `P1=(0,1,3,4)`, `P2=(0,2,5,4)`; each has three edges and their union is `E*`.

## Readiness boundary

The static contract is sufficient for conditional paper-potential screening. Still open for Stage A are the native adapter, exact FastHNSW code path, natural portal-ear occurrence, computational overhead, native save/load/search equivalence and matched-recall Pareto evidence. None is represented as established.

