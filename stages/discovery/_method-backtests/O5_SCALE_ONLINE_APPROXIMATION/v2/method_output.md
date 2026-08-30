# Executor method output — O5 v2

Role: `DISCOVERY-BACKTEST-EXECUTOR`. Reconstruction relies only on the sealed packet; it does not create candidates or judge calibration.

## S5-POS-01

- **Recovered problem shape.** Cluster-scale ad-hoc analytics cannot always meet interactive full-scan latency, but users can consume approximate answers with interpretable uncertainty; choose and reuse data summaries/samples per query.
- **Baseline limitation.** Online aggregation gives progressive estimates, static synopses trade accuracy/storage, and batch/working-set systems do not jointly optimize query-specific choice, latency, and error.
- **Decision structure.** Maintain/select samples, sketches or synopses and an execution plan under response-time, storage/update cost, bias/variance/confidence and workload constraints. Competing mechanisms: adaptive query-aware approximation versus fixed precomputed samples/full distributed scans.
- **Contribution route.** N2: adaptive approximate-query planning/summary algorithm; N1 conditional on a unified error-aware interface; N3: workload/query regularity.
- **Evidence entry.** Workload accuracy/latency/confidence, maintenance/storage and bias ledger against full scans and fixed synopsis baselines; falsify for adversarial/selectivity-shifting queries or strict exactness.
- **Abstain.** No.

## S5-POS-02

- **Recovered problem shape.** Fine-grained, stateful, nested, heterogeneous online AI workloads overflow centralized schedulers and static dataflow assumptions; preserve a unified interface while distributing scheduling and state management.
- **Baseline limitation.** Static/coarse-grained systems and general dynamic DAG runtimes respectively lack flexibility or scalable coordination for actors, nested tasks, failures and interactive execution.
- **Decision structure.** Represent tasks/objects/actors, decide ownership and local versus global scheduling, scheduling hierarchy, fault recovery and resource allocation. Competing mechanisms: distributed control/store architecture versus centralized dynamic scheduling/static dataflow.
- **Contribution route.** N1: unified task/actor/object abstraction; N2: hierarchical/distributed scheduling and storage; N3: task-duration/dependency locality if measured.
- **Evidence entry.** End-to-end throughput, scheduling latency, scalability, fault recovery and programmability across varied dynamic workloads; price control-plane traffic, state-store overhead and coarse/static-task boundaries.
- **Abstain.** No.

## S5-POS-03

- **Recovered problem shape.** Distributed ML needs elastic shared parameter access at model/data scale; exact synchronous coordination can waste time while unbounded asynchrony harms convergence, requiring a parameter-management/consistency decision.
- **Baseline limitation.** Partitioned tables, shared-memory lock-free updates, and graph frameworks do not separately manage distributed parameters, sparse communication, bounded staleness and recovery at scale.
- **Decision structure.** Choose parameter sharding/placement, push/pull aggregation, consistency/staleness, communication suppression and fault recovery. Competing mechanisms: parameter-server-style decoupling with bounded consistency versus direct worker/graph-table coordination.
- **Contribution route.** N1: parameter-management abstraction; N2: distributed consistency/communication algorithm; N3: sparse update regularity.
- **Evidence entry.** Convergence/accuracy, throughput, communication, scaling and recovery against synchronous/asynchronous/GraphLab-style baselines; falsify on dense updates, tight-consistency objectives or small clusters.
- **Abstain.** No.

## S5-NEG-01

- **Recovered finding.** A small static in-memory exact shortest-path query supplies no scale, online, or approximation pressure.
- **Baseline limitation / decision structure.** Priority-queue variation is mature implementation work and lacks a changed error/consistency/scale contract.
- **Contribution/evidence route.** None within O5.
- **Abstain.** Yes.
