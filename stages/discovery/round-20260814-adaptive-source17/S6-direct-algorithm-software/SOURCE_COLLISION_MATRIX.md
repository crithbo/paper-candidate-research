# Source and collision matrix — Source17

| Family | Same-object strong union | Direct/independent subtractor | Collision or structural result |
|---|---|---|---|
| CUTLASS async pipeline | Pipeline state machine, producer/consumer actions, TMA/async variants, CollectiveBuilder policies. | CUTLASS expert `CollectiveMma` interface and its documented pipeline model. | The candidate is either the existing complete constructor or generic scheduling. |
| CUTLASS CLC persistent kernel | CLC scheduler, pipeline and cluster state. | Official dynamic tile scheduler documentation. | Controller/scheduler class, excluded. |
| Halide autoscheduler | Existing Halide search/schedule union. | Official autoscheduler paper and current production scheduler. | Generic schedule synthesis, excluded. |
| AProVE termination construction | Current dependency-pair/reduction-order/size-change/prover composition. | Termination-prover and dependency-pair literature. | Generic proof search, excluded. |
| CUDA/CUTLASS mbarrier | Source15 NVPTX phase/transaction union. | Source15 bounded closure. | Repeated family, excluded. |
| OpenVINO NPU mapping | Source13 OpenVINO current union. | Source13 bounded closure. | Repeated family, excluded. |

No `SEARCH_BOUNDED_OPEN` state is used to claim novelty. No direct collision
was left unresolved for a proposed topic because there are no proposals.
