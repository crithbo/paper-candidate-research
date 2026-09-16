# Current-union / collision matrix

| Family | Current union | Residual test | Result |
|---|---|---|---|
| KokkosComm non-contiguous View | Packer DeepCopy, MPI datatype, request-owned temporaries | must exceed native pack/datatype alternative with target-specific guarantee | generic/current union |
| rocSHMEM put-signal | device put/signal plus wave/workgroup/NBI variants | must exceed calls while preserving same signal/order | protocol controller/current union |
| KokkosComm Channel | registration queues, start fence and wait completion | must exceed native registration/lifetime composition | controller/current union |

`SEARCH_BOUNDED_OPEN` is the paper-collision ceiling, not a novelty assertion.
