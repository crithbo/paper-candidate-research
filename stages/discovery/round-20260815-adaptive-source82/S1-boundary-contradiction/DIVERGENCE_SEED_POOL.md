# Divergence seed pool

The pool was generated offline before evidence lookup and is non-evidentiary.

| Seed | Engine | Perspective | Sketch | Pre-evidence result |
|---|---|---|---|---|
| S01 | JANUSIAN_TENSION | runtime engineer | A detached task may finish its block before its asynchronous event is fulfilled. Could a same-endpoint event-placement construction reduce runtime retention? | Selected |
| S02 | CONSTRAINT_MANIPULATION | application author | Can multiple detachable tasks aggregate/advance fulfilment while retaining task dependencies? | Merged into S01 |
| S03 | PROBLEM_REFRAMING | compiler engineer | Can compiler emission choose detach only for the long async tail? | Not selected: API/configuration selection |
| S04 | NEGATION_OR_INVERSION | OpenMP runtime maintainer | Can libomp defer proxy completion without changing task completion? | Not selected: runtime controller/policy |
| S05 | ABSTRACTION_LADDER | theorist | Can event lifecycle be optimized as a generic concurrent state-machine search? | Not selected: generic solver shell |
| S06 | COMPOSE_DECOMPOSE_SIMPLIFY | performance reviewer | Can a task split into producer and event-follower tasks preserve completion? | Not selected: changed task graph/action endpoint |

S01 isolates the event-fulfillment/observable-completion seam under a fixed OpenMP task and dependency contract.
