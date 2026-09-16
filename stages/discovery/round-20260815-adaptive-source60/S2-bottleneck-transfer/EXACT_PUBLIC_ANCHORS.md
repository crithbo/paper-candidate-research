# Exact public anchors — Source60 S2

| RQ | Fixed same-object boundary | Official current anchor | Role |
|---|---|---|---|
| RQ-S60-01 | Fixed AF_XDP socket/netdev/queue, UMEM contents and packet/ownership semantics | Linux kernel AF_XDP documentation, accessed 2026-08-15: https://docs.kernel.org/networking/af_xdp.html | ANCHOR/CURRENT |
| RQ-S60-02 | Fixed MPI communicator, buffer values, partition count/count/datatype/destination/tag and completion semantics | Open MPI `MPI_Psend_init`, accessed 2026-08-15: https://docs.open-mpi.org/en/v5.0.x/man-openmpi/man3/MPI_Psend_init.3.html ; `MPI_Pready`, v5.0.8 | ANCHOR/CURRENT |
| RQ-S60-03 | Fixed buffer values, protection domain and access contract for a registered RDMA memory region | NVIDIA RDMA Aware Networks Programming manual, accessed 2026-08-15 | ANCHOR/CURRENT |

Anchors freeze object boundaries only. They do not establish current absence, novelty, performance or Q2 shape.
