# Guarantee-first / witness-first raw events

| id | original same-function guarantee | current native action/config union | minimum alleged divergence witness | result |
|---|---|---|---|---|
| R01 Pineapple | linearizable reads/writes and one-shot transactions with stated crash/asynchrony/partial-synchrony conditions | logical timestamps, Multi-Paxos plus ABD registers, non-blocking execution, quorums | a different legal operation-construction preserving every stated condition | `DEEP_DIVE_REQUIRED` |
| R02 GPHash | byte-granularity persistent-memory hash semantics with consistency | lock-free warp-cooperative operations, CAS/slot states, hot-item GPU cache | a new index action preserving same consistency and GPM model | `DEEP_DIVE_REQUIRED` |
| R03 Scalio | linearizable DPU-JBOF KV operations under its disaggregated memory/SSD model | NVMe-oF/RDMA offload, two-layer hot-read path, RDMA cache-consistency protocol | a different complete I/O/consistency construction under identical hardware model | `DEEP_DIVE_REQUIRED` |
| R04 FiDe | crash detection reliability and coordination safety in a datacenter process model | stable end-to-end interactions plus FiDe-derived consensus protocols | a detector/construction action preserving exact reliability and timing assumptions | `DEEP_DIVE_REQUIRED` |
| R05 selective on-device read | same B+-tree/WiredTiger read results | on-device I/O function plus in-kernel path | only a placement choice; no whole union-external action stated | `NOT_ADMITTED_UNFROZEN__PLACEMENT_ONLY` |
| R06 temporal P4 verification | fixed P4 program temporal property | source details insufficient to freeze solver/action/guarantee union | no legal atomic witness available | `NOT_ADMITTED_UNFROZEN__CONTRACT_INCOMPLETE` |

No row is judged on implementation availability, results, resource, or AI readiness.
