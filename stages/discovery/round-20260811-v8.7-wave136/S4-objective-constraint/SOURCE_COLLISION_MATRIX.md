# Source and collision matrix

Frozen cutoff: 2026-08-11. All technical sources are first-party USENIX venue pages or proceedings. Current-reality checks are positive-paper-constructor checks; no unsupported absence claim is made.

| id | official source | source-supported observation | collision / reason not admitted |
|---|---|---|---|
| R01 | [The Tail at Scale: How to Predict It?](https://www.usenix.org/conference/hotcloud16/workshop-program) | high-load p99 can be predicted from task mean/variance in reported cases | existing characterization; external stability not shown |
| R02 | [FAST 2025 technical sessions](https://www.usenix.org/conference/fast25/technical-sessions) | integrity-tree paper quantifies realistic costs and Dynamic Merkle Trees exploit workload patterns | direct current characterization/mechanism collision |
| R03 | [FAST 2025 technical sessions](https://www.usenix.org/conference/fast25/technical-sessions) | AegonKV identifies GC CPU/I/O trade-off for throughput, tail, and space | direct current explanation/construction collision |
| R04 | [More is Different — ATC 2024](https://www.usenix.org/conference/atc24/presentation/zhang-li-prototyping) | gaming/transcoding/inference measurement includes throughput, latency, power, quality, and cost | changed deployment hardware/object confounds N3 |
| R05 | [BlitzScale — OSDI 2025](https://www.usenix.org/conference/osdi25/presentation/zhang-dingyan) | real workloads reveal scaling-speed/cache and tail/GPU-time tension | autoscaling controller, excluded contribution type |
| R06 | [NSDI 2025 technical sessions](https://www.usenix.org/conference/nsdi25/technical-sessions) | Microsoft-derived traces support accuracy/latency policy results | selector/policy, excluded contribution type |

No maintained-upstream feature flag was used as evidence. The relevant current object is the positive published construction/characterization on the frozen official page.
