# Raw screen row events

| Row | Exact native object | Result |
|---|---|---|
| R01 | Qhull fixed point set to convex hull | DEEP |
| R02 | Clipper2 fixed polygon sets to Boolean polygon result | DEEP |
| R03 | Triangle PSLG to constrained Delaunay mesh | DEEP |
| R04 | SuiteSparse AMD sparse pattern to fill-reducing ordering | DEEP |
| R05 | bliss graph to canonical labeling/certificate | DEEP |
| R06 | LEMON weighted graph/source to shortest-path tree/distances | DEEP |

All exact objects were independently checked against existing S6 graph/geometry reviews and active S1–S5 topics. No generic ILP/matching, wrapper, controller or reorder-only row was retained.
