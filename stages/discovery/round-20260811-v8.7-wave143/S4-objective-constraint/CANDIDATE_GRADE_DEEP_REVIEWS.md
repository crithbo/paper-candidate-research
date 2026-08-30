# Candidate-grade deep reviews

## R01 — Pineapple: `STRUCTURAL_DROP__CURRENT_COMPLETE_OPERATION_CONSTRUCTION`

Pineapple's current official source freezes a complete same-object action: logical timestamps unify Multi-Paxos and atomic shared registers, allowing all nodes to serve reads/writes with non-blocking execution. The guarantee includes linearizability, crash tolerance, asynchronous safety, and partial-synchrony liveness for one-shot transactions. A different quorum, ordering, or offload rule is inside this current operation-construction union; relaxing failure, conflict, or transaction semantics changes the object. Natural carriers (etcd, YCSB, LAN/WAN) and full cost are clear. A ≤72h falsifier, if an action existed, would check the exact same failure/transaction contract on fixed etcd/YCSB traces and stop if current Pineapple reproduces it; not run because the witness is already absorbed.

## R02 — GPHash: `STRUCTURAL_DROP__CURRENT_CONSISTENT_HASH_CONSTRUCTION_UNION`

The exact object is a GPM hash index with byte-granularity persistence and unchanged consistency. GPHash's native union already combines warp-cooperative lock-free operations, CAS/slot-state consistency, and hot-item caching. Replacing slot actions or cache selection is a local tuning/placement choice; a new persistence ordering changes the consistency/recovery guarantee. The source reports YCSB and real workloads; full cost must charge indexing, cache management, PM/GPU movement, and consistency/recovery. The finite killer would require identical GPM and crash-consistency semantics over the source's workloads, failing on full-cost Pareto loss. No union-external whole action survives.

## R03 — Scalio: `STRUCTURAL_DROP__CURRENT_IO_PLUS_LINEARIZABILITY_CONSTRUCTION_UNION`

The same object is a DPU-based JBOF KV store with the source's linearizability and hardware model. Its current constructor includes RDMA/NVMe-oF target offload, compact two-layer memory structures, and the RDMA cache-consistency protocol. A new caching threshold is a policy; dropping the protocol violates linearizability; moving the function to another CPU/DPU/SSD model changes the object. Natural YCSB carriers and an explicit full-cost denominator exist. A finite killer would charge DPU, NIC, DRAM and SSD work plus cache-protocol traffic on fixed operation traces; it is not run because no legal action-divergence witness remains.

## R04 — FiDe: `STRUCTURAL_DROP__CURRENT_RELIABILITY_TIMING_CONSTRUCTION_UNION`

FiDe's official construction joins stable end-to-end interactions with a fully reliable crash detector and derives consensus protocols under the stated datacenter process model. Changing timeout or probe thresholds is controller/tuning; weakening reliability, timing, or process assumptions changes the guarantee. The KV-store and synchronization-service integrations supply natural carriers; full cost includes probe traffic, CPU/network, false detections, and end-to-end coordination latency. A ≤72h killer would require the same process/failure contract and charge those denominators, failing if FiDe's current construction expresses the proposed action. The action is already expressed.

All deep dispositions are direct absorption or guarantee change—not evidence-readiness decisions. No `PROPOSE_STAGE0` is truthful.
