# Unique opportunity families

| id | natural carrier | fair comparator / full-cost denominator | preliminary residual status |
|---|---|---|---|
| R01 | etcd integration plus LAN/WAN and YCSB balanced workload | published Pineapple, PQR, Gryff, Multi-Paxos, EPaxos/Raft under same failures; messages, quorum work, CPU, latency/throughput | current action union closes |
| R02 | YCSB and reported real-world workloads | GPHash and same GPM consistency alternatives; index build, cache management, GPU/PM transfers, recovery/consistency work | current action union closes |
| R03 | high-density SSD YCSB workload | Scalio, LEED, and LEED+Ditto under same DPU/SSD model; DPU CPU/NIC/SSD/DRAM work, consistency and construction | current action union closes |
| R04 | KV store and synchronization-service clients | FiDe and state-of-art detector/consensus under same failure model; interaction/probe, CPU/network, false-positive and coordination costs | current action union closes |
| R05 | B+-tree and WiredTiger reported workloads | source's host/in-kernel/on-device paths; device operation, host work, and correctness | no atomic witness |
| R06 | official P4 verification benchmarks, if frozen later | not admissible until property, verifier, and semantic union are explicit | no atomic witness |

The first four were sent to negative deep review; R05/R06 are not deep-reviewed and are not hidden as candidates.
