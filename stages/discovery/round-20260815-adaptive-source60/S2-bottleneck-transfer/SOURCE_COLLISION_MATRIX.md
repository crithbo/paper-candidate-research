# Source/collision matrix — Source60 S2

| Family | Official/current source result | Outcome |
|---|---|---|
| AF_XDP UMEM/ring/metadata | Kernel documentation specifies UMEM registration, SPSC ownership rings, shared UMEM and copy/zero-copy configuration. | Only native setup/policy actions visible; locator-only. |
| MPI partitioned request/readiness | Open MPI specifies partitioned request initialization and per-partition ready primitive. | Proposed difference is readiness scheduling; excluded pre-raw. |
| RDMA MR registration/translation | Official RDMA material documents MR-to-PD/access registration and existing memory-translation facilities. | No target-specific new constructor/guarantee frozen; locator-only. |

Bounded current-source screen only; not global absence or novelty evidence.
