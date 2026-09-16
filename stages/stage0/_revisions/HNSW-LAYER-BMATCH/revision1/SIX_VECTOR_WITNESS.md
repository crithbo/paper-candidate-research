# Six-Vector Metric-Realizable Action-Divergence Witness

## Purpose and evidence ceiling

This is a static selector discriminator. It establishes that the frozen `PAX-HNSW` action and its path-dependent objective are well defined on a metric-realizable same-information candidate graph. It is not a native performance result, a natural-workload result, or proof that unmodified hnswlib/Faiss/FastHNSW emits the listed adapted outputs.

## Coordinates and metric

Let `a=1/sqrt(3)` and use Euclidean distance in two dimensions.

| Vertex | Coordinate | Role |
|---|---|---|
| `v0` | `(0,0)` | frozen layer entry |
| `v1` | `(1,-a)` | left cluster |
| `v2` | `(1,+a)` | left cluster |
| `v3` | `(3,-a)` | right cluster / portal |
| `v4` | `(4,0)` | right cluster |
| `v5` | `(3,+a)` | right cluster / portal |

All vertices are in one frozen layer. Degree cap is `b(v)=2` for every vertex. Ties use ascending vertex ID for greedy search and the comparator-specific frozen edge key for construction.

## Exact squared-distance matrix

| `d²` | 0 | 1 | 2 | 3 | 4 | 5 |
|---|---:|---:|---:|---:|---:|---:|
| 0 | 0 | 4/3 | 4/3 | 28/3 | 16 | 28/3 |
| 1 | 4/3 | 0 | 4/3 | 4 | 28/3 | 16/3 |
| 2 | 4/3 | 4/3 | 0 | 16/3 | 28/3 | 4 |
| 3 | 28/3 | 4 | 16/3 | 0 | 4/3 | 4/3 |
| 4 | 16 | 28/3 | 28/3 | 4/3 | 0 | 4/3 |
| 5 | 28/3 | 16/3 | 4 | 4/3 | 4/3 | 0 |

Thus each three-vertex cluster is equilateral, and the two candidate portal edges have length two.

## Frozen same-information candidate graph

The exact undirected candidate edge set is:

`C={01,02,12,13,25,34,35,45}`.

This is a frozen candidate-generation trace, not an exact-kNN oracle claim. Every adapted selector receives exactly these eight edges, their metric distances, the same entry, cap and ties. No candidate may add another pair.

## HNSW greedy-reachability objective

For every target `q=vi`, run standard single-layer `ef=1` greedy search from `v0`. At a current vertex, choose the neighbor with minimum `(d(q,v),id(v))` and move only if the distance strictly decreases. `G(E)` counts targets at which search terminates exactly at `q`.

## Frozen comparator outputs

### Local RNG / FastHNSW RNG / additive b-matching output

Internal equilateral edges are preferred before the longer portal edges. With cap two, the frozen local-RNG, layer-RNG and additive maximum-weight b-matching catalogs return:

`E_tri={01,02,12,34,35,45}`.

It is degree legal but has two connected components. From entry `v0`, only `v0,v1,v2` can be reached, so `G(E_tri)=3`.

This does not claim all official implementations must emit exactly this graph without the common-`C` adapter; that native equivalence is a Stage A fidelity gate.

### Frozen ordinary one-portal repair

The repair catalog chooses portal `13` first. Both endpoints are saturated. Its deterministic reverse-lex removable-edge rule deletes `01` and `34`, then adds `13`, producing:

`E_R={02,12,13,35,45}`.

This is the path `0-2-1-3-5-4`. Every degree is at most two and the graph is connected. A maximal additive refill cannot add portal `25` because both `v2` and `v5` remain saturated. A one- or two-edge local capacity swap cannot reach the candidate graph while preserving connectivity and caps after every committed state.

Greedy-search traces include:

- target `v1`: `v0` cannot move to `v2`, since `d(v1,v2)=d(v1,v0)`; failure;
- target `v2`: `0→2`; success;
- target `v3`: `0→2→1→3`; success;
- target `v4`: `0→2`, then no strict improvement; failure;
- target `v5`: `0→2`, then no strict improvement; failure.

Together with target `v0`, `G(E_R)=3`.

### Reserved-capacity / spanning-tree-first control

Under the same first-portal and reverse-lex completion rule, this control belongs to the same one-portal path family and has no guarantee on the path-dependent objective. It is retained as a separate Stage A comparator; the witness does not assume every possible spanning tree is poor.

## Candidate output

`PAX-HNSW(3,3)` uses the entry-rooted portal ears:

- `P1=(0,1,3,4)` using `{01,13,34}`;
- `P2=(0,2,5,4)` using `{02,25,45}`.

Their union is:

`E*={01,02,13,25,34,45}`.

This is the six-cycle `0-1-3-4-5-2-0`. Every selected edge is in `C`, every vertex has degree two, and all vertices are entry reachable.

Greedy traces are:

- `q=v1`: `0→1`;
- `q=v2`: `0→2`;
- `q=v3`: `0→1→3` because `d(v3,v1)=2 < d(v3,v2)=4/sqrt(3)`;
- `q=v5`: `0→2→5` by the symmetric inequality;
- `q=v4`: the entry tie chooses `v1`, then `1→3→4`;
- `q=v0`: already at target.

Therefore `G(E*)=6`.

## Atomic exchange divergence

Relative to the frozen repaired path:

`E* = E_R + {01,25,34} - {12,35}`.

The exchange must be committed atomically. After the final bundle:

- `v0`: loses nothing, gains `01`, final degree two;
- `v1`: loses `12`, gains `01`, retains `13`, final degree two;
- `v2`: loses `12`, gains `25`, retains `02`, final degree two;
- `v3`: loses `35`, gains `34`, retains `13`, final degree two;
- `v4`: gains `34`, retains `45`, final degree two;
- `v5`: loses `35`, gains `25`, retains `45`, final degree two.

The final graph remains one connected cycle. The move has three additions and two deletions, so it is outside the frozen ordinary one/two-edge repair catalog and inside `PAX-HNSW(3,3)`.

## Exact ceiling

Enumerating the finite connected degree-bounded subsets of the eight-edge `C` is a small-instance checker, not the method. Under lexicographic `Q`, any feasible graph with `G<6` loses to `E*`; among the frozen six-edge `G=6` candidates, the deterministic secondary/tie rules select `E*`. Stage A must independently encode this enumeration and compare its hash to the hand table before using the witness.

## Failure interpretation

If a faithful FastHNSW/native adapter or a frozen ordinary repair reproduces `E*` with the same property under identical information, the claimed residual is absorbed. If native serialization cannot represent the reciprocal edge set without changing the search object, the topic stops. Those tests remain future preclaim fidelity gates.

