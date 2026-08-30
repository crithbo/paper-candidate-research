# Source and collision matrix — WAVE45 S2

## Primary source ledger

| Genealogy | Official primary source | Direct contribution used for subtraction |
|---|---|---|
| PolyStore | [FAST 2025 paper page](https://www.usenix.org/conference/fast25/presentation/ren) | Fine-grained placement across heterogeneous devices through a cross-layer meta layer. |
| HotRAP | [ATC 2025 paper page](https://www.usenix.org/conference/atc25/presentation/qiu) | Per-record promotion and hotness tracking for tiered LSM storage. |
| Tiered Memory Management Beyond Hotness | [OSDI 2025 paper page](https://www.usenix.org/conference/osdi25/presentation/liu) | AOL-based allocation and migration regulation. |
| umap | [OSDI 2026 paper page](https://www.usenix.org/conference/osdi26/presentation/he-yongchao) | Network-efficient communication, concurrency-aware cache protocol, and lazy expansion for DFS mmap access. |
| SBB | [OSDI 2026 paper page](https://www.usenix.org/conference/osdi26/presentation/hu-kang) | Decentralized userspace runtime mechanism coupled with scheduling. |
| VTC | [OSDI 2026 paper page](https://www.usenix.org/conference/osdi26/presentation/hu-muyan) | Virtual-tensor representation to eliminate DNN data movement. |
| TileLoom | [OSDI 2026 paper page](https://www.usenix.org/conference/osdi26/presentation/li-wei) | End-to-end tile dataflow planning over explicit on-chip movement. |
| Duhu | [OSDI 2026 paper page](https://www.usenix.org/conference/osdi26/presentation/men) | Same-object shared-disaggregated-memory object store for DDFs. |
| Pluto | [OSDI 2026 paper page](https://www.usenix.org/conference/osdi26/presentation/wu-ying-wei) | Partial/mirror-free graph representation and work migration. |
| Incr | [OSDI 2026 paper page](https://www.usenix.org/conference/osdi26/presentation/xie-yizheng) | Effect analysis plus static/dynamic optimizations for correct incremental re-execution. |
| MOST | [FAST 2026 accepted-paper listing](https://www.usenix.org/conference/fast26/spring-accepted-papers) | Dynamic hot-data mirroring that avoids migration while retaining tiering. |
| DPA-Store | [OSDI 2026 technical sessions](https://www.usenix.org/conference/osdi26/technical-sessions) | On-path DPA data path for stateless range-query storage. |

## Six-dimensional audit of nearest residuals

| Object | Candidate decision rule and information | Complexity/resource and quality/guarantee | Full cost and natural carrier | Current strongest union / collision | Outcome |
|---|---|---|---|---|---|
| umap DFS matrix access | Choose cache admission/expansion from DFS access/concurrency state. | Would preserve matrix reads, but adds only a cache policy with no new representation or objective. | Charge network, cache memory, synchronization, page faults and matrix access latency; production matrix-access workloads are a natural carrier. | umap already names network-efficient communication, a concurrency-aware cache protocol, and lazy expansion for the same object. | `DIRECT_ABSORPTION_OR_CONTROLLER`; DROP. |
| SBB userspace network runtime | Assign ownership/work progression from request and core state. | Same networking guarantee; proposed action is resource scheduling, not a new runtime primitive. | Charge CPU, synchronization, tail latency, throughput and scaling; runtime request traces are natural. | SBB's stated mechanism combines decentralized runtime design with scheduling policy. | `DIRECT_ABSORPTION_OR_CONTROLLER`; DROP. |
| Incr shell re-execution | Select dependency/effect reuse from program/effect state. | Correct non-idempotent re-execution is fixed; remaining action is cache/dependency tuning without a changed guarantee. | Charge analysis, metadata, reuse storage, invalidation and re-execution time; shell workloads form the natural carrier. | Incr already combines effect analysis and static/dynamic optimizations with runtime/storage accounting. | `DIRECT_ABSORPTION_OR_CONTROLLER`; DROP. |

## Strong-union conclusion

Native APIs, modes, and policies are not automatically absorbing.  Here, the
collision is stronger: each primary mechanism explicitly includes the whole
transferred-stage coupling that a residual would need to claim.  A future
proposal must name an action that cannot be replayed by that union under the
same information, function/guarantee, and complete cost denominator.

No source is used to assert an unimplemented-upstream absence.  The current
reality hard gate will apply only after such an action is actually specified.
