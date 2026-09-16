# Question card QC01

| Field | Frozen value |
|---|---|
| exact public identity | MPI-4.1 partitioned point-to-point request + MPICH implementation surface |
| same-object contract | same request/partitions, Pready trace, message contents, matching and completion visibility |
| candidate action | group or advance ready partition publication/transfer states |
| endpoint | same MPI request observations with a claimed full-cost difference |
| current locus | MPICH partitioned communication support surface |
| non-generic discriminator | must freeze a transport/request-state constraint not reducible to choosing a ready partition next |
| minimum falsifier | all legal variants are ordinary ready-partition scheduling or alter MPI visibility/progress guarantee |
| full cost | runtime CPU/RSS, message/control bytes, ready-to-visible latency, request metadata, and completion tail |

**Known structural fatal:** the RQ has no target-specific state or information condition beyond generic scheduling of ready work. The standard explicitly leaves initialization/negotiation timing flexible; making a controller choose it is not N2. Disposition: `EXCLUDED_BEFORE_RAW__GENERIC_COMMUNICATION_SCHEDULING_SHELL`.
