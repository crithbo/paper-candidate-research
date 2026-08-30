# Candidate-grade deep reviews

## ANANKE-FS-RECOVERY — `DROP_DIRECT_ABSORPTION`

The fixed object is a file-system execution with unchanged semantics and fault recovery. Ananke already defines a transparent filesystem microkernel recovery action that prepares for and detects faults with minimal common-case overhead. The fair union includes that architecture and established recovery paths under the same detected state. Full cost spans normal I/O, preparation/detection, recovery work, CPU, latency and persistent result. A scalar reliability-cost weight only chooses a policy. A finite killer would replay 20–50 fault/application witnesses and demand the same recovered state outside Ananke's atomic action; none is frozen. Direct absorption, not readiness.

## NVLOG-NVM-WAL — `DROP_DIRECT_ABSORPTION`

The exact object is legacy disk filesystem semantics with crash consistency. NVLog already supplies a complete on-demand byte-granularity NVM WAL constructor with heterogeneous crash handling, small-write optimization, robust recovery and GC. Its fair union charges temporary NVM space, DRAM/disk/NVM I/O, sync latency, CPU, recovery and all migration avoidance. Reweighting reliability and latency is not N2. A 20–50 operation/crash witness must preserve the same state and use an action outside this WAL construction; no action divergence exists. Direct absorption.

## ATOMICDISK-TEE — `DROP_DIRECT_ABSORPTION`

The object is TEE virtual-disk behavior with confidentiality, integrity, freshness and sync atomicity. AtomicDisk's internal-commit construction already makes uncommitted eviction distinguishable from committed writes, preventing eviction attacks with trace-driven performance evaluation. The full denominator contains MHT/TEE operations, all syncs/evictions, snapshots, space, CPU, I/O and security property. A deadline/cost policy cannot replace the commit action without changing the guarantee. A finite killer would use 20–50 write/sync/eviction histories and require exactly one valid committed state; no union-external action is named. Direct absorption.

## ZOOROUTE-OVERLAY — `DROP_DIRECT_ABSORPTION`

The fixed object is tenant-transparent VPC traffic with deterministic failure recovery. ZooRoute already joins reliability, outage latency and capacity cost through candidate source-port probing and VXLAN rerouting, including hypervisor probe overhead, Tofino gateway memory and stateful-middlebox conditions. The fair union has identical failure observations and complete deployment cost. Choosing a candidate path or probe interval is controller/tuning. A finite killer would replay 20–50 tunnel/failure schedules and require one-shot healthy-path rerouting outside the candidate-port construction; none is frozen. Direct absorption.
