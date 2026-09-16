# Current union and decisive-subtractor matrix

| Raw | Current official/source contrary evidence | Known-fatal result |
|---|---|---|
| R50-01 SymmMem rendezvous | Official docs specify default TCPStore exchange and the nondefault `use_pg_for_symm_mem_rendezvous` NCCL-allgather route for the same handle; current FSDP code invokes `symm_mem.rendezvous` before the optimized collective. | The alleged joint metadata/handle construction is a current native configuration/implementation union. |
| R50-02 Inductor SymmMem arguments | Current `register_symm_mem_args` source explicitly lets operators declaratively identify arguments and lets Inductor automatically allocate them in P2P-accessible NVLink memory at compile time. | The alleged compiler/runtime construction is directly implemented by the current native source. |

The result is limited to the frozen action descriptions. It is a current-union direct subtractor, not a claim of exhaustive literature novelty or performance outcome.
