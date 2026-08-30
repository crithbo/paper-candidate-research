# Source and collision matrix

Frozen cutoff: 2026-08-11. Sources are official project/standards sources. No v8.8, R7 shadow, or dormant behavior was used for a canonical decision.

| family | current official source / source reality | decision |
|---|---|---|
| BGP-FIB-PREFIX-DAG | [RouteViews](https://www.routeviews.org/) public collector; [FRR official documentation](https://docs.frrouting.org/). Current exact mutable-FIB source/flag union remains unfrozen. | NOT_ADMITTED_UNFROZEN |
| OSRM-ROAD-CELL-CONSTRUCTOR | [OSRM tools documentation](https://project-osrm.org/docs/v26.4.0/tools): CH, MLD, `osrm-partition`, cell-size/balance/boundary/cut options. | Direct native construction/config union; DROP. |
| VG-GBWT-MERGE-CONSTRUCTOR | [vg index construction](https://github.com/vgteam/vg/wiki/Index-Construction) and [GBWT subcommand](https://github.com/vgteam/vg/wiki/VG-GBWT-Subcommand): GFA input, merge algorithms, r-index and compatibility flags. | Existing same-object constructors absorb mechanism; DROP. |
| OPENFOAM-MESH-CUT | [OpenFOAM parallel guide](https://www.openfoam.com/documentation/user-guide/3-running-applications/3.2-running-applications-in-parallel) and [decomposePar source reference](https://api.openfoam.com/2506/decomposePar_8C.html). | Generic partition/config residual only; DROP. |
| NEO4J-ADJACENCY-PLACEMENT | [Neo4j current store formats](https://neo4j.com/docs/operations-manual/current/database-internals/store-formats/). | Full recovery/action contract unfrozen; NOT_ADMITTED_UNFROZEN. |
| OSM-PBF-ORDERING | Official [OSM PBF wiki](https://wiki.openstreetmap.org/wiki/PBF_Format). | Excluded pure emitter. |
| ORC-STRIPE-ENCODING | Official [Apache ORC documentation](https://orc.apache.org/docs/). | Excluded pure emitter. |
| ROUTING-POLICY-UPDATE-SCHEDULING | [FRR documentation](https://docs.frrouting.org/). | Excluded online controller. |

The collision review is bounded to these materials; it does not claim a global novelty proof.
