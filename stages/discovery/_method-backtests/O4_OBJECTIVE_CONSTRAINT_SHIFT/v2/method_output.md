# Executor method output — O4 v2

Role: `DISCOVERY-BACKTEST-EXECUTOR`. This is a sealed-input reconstruction only, not a candidate or calibration verdict.

## S4-POS-01

- **Recovered problem shape.** Always-on replicated services need availability, bounded per-operation durability, and low tail latency under failures/partitions; uniform strong consistency is not necessarily the service contract for single-key state.
- **Baseline limitation.** Chord/consistent hashing address placement while CAP/optimistic replication identify tradeoffs but do not supply a production decision policy for semantics, replicas, and failure behavior.
- **Decision structure.** Choose replication/quorum/durability and conflict semantics per operation/key, with failure detection and recovery; compare strong-consistent, eventual/optimistic, and asymmetric/quorum mechanisms.
- **Contribution route.** N1: service contract separating availability/durability/consistency dimensions; N2: replica/commit protocol; N3: measured failure/operation distributions if used.
- **Evidence entry.** Fault injection and workloads measuring availability, tail latency, durability, conflict semantics and recovery, with partitions and multi-key/strong-invariant boundaries.
- **Abstain.** No.

## S4-POS-02

- **Recovered problem shape.** Microsecond services require tail-SLO compliance and high CPU efficiency under bursty colocation; isolated-throughput and permanently dedicated polling cores optimize the wrong contract.
- **Baseline limitation.** Kernel-bypass stacks maximize packet throughput, while tail-oriented queues can retain peak CPU allocation.
- **Decision structure.** Dynamically assign/reclaim cores, select polling/sleep/queue ownership and rebalance timing from load/SLO signals. Competing mechanisms: adaptive core allocation with fast handoff versus dedicated cores/shared work stealing.
- **Contribution route.** N2: SLO-aware allocation/rebalancing algorithm; N1 conditional on an explicit service-resource control abstraction; N3: burst/idle regularity.
- **Evidence entry.** Tail distributions, SLO violations, CPU efficiency, reallocation overhead and isolation under burst/colocated traces; falsify under sustained peak or handoff-dominated load.
- **Abstain.** No.

## S4-POS-03

- **Recovered problem shape.** Multi-model GPU serving must prioritize per-request predictability/isolation, not only mean throughput, because reactive batching and worker decisions generate tail-risk.
- **Baseline limitation.** Best-effort batching and cluster scheduling lack a deterministic or sufficiently controlled admission/execution policy for heterogeneous resident models.
- **Decision structure.** Reserve/partition GPU execution capacity, choose batching/admission and model placement with SLO/isolation/cost constraints. Competing mechanisms: predictable schedule/resource isolation versus reactive batching/work-conserving sharing.
- **Contribution route.** N1: predictable-serving contract/model; N2: admission/scheduling/control algorithm; N3: stable model/request interference signatures if measured.
- **Evidence entry.** Per-request latency distributions, isolation and throughput/cost across mixed-model workloads; ledger utilization loss, controller overhead and underload/no-interference boundaries.
- **Abstain.** No.

## S4-NEG-01

- **Recovered finding.** Offline exact GEMM has unchanged numerical and resource contracts; parameter tuning does not create an objective shift.
- **Baseline limitation / decision structure.** All changes remain within a fixed mature throughput objective.
- **Contribution/evidence route.** None within O4.
- **Abstain.** Yes.
