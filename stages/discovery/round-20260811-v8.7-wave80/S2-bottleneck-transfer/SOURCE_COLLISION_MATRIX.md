# Source / collision / allocation-lifetime action matrix

**Assignment:** `DISCOVERY-S2-20260811-V8.7-WAVE80-ALLOCATION-LIFETIME-BOTTLENECK-MIGRATION` · **cutoff:** 2026-08-11.

| Unique family | Official current anchor | Exact object / full-cost denominator | Current union or safety/config facet | Disposition |
|---|---|---|---|---|
| mimalloc abandoned state | [mimalloc upstream](https://github.com/microsoft/mimalloc) | C/C++ allocation/free; alloc/free, cross-thread state, retention, OS purge/decommit/RSS | sharded freelists; abandoned-page/segment reclamation; `mi_option_abandoned_reclaim_on_free`, max reclaim, purge/reset/decommit | screened action is policy over native collection; no distinct whole algorithm | `DROP` |
| Crossbeam epoch | [Crossbeam upstream](https://github.com/crossbeam-rs/crossbeam) | concurrent operation with safety/linearizability; op+pin/retire/epoch/reclaim/retention | epoch GC protocol for concurrent structures | no fixed new safety-preserving protocol/action witness | `DROP` |
| Linux RCU | [current RCU requirements](https://www.kernel.org/doc/html/latest/RCU/Design/Requirements/Requirements.html) | RCU-safe kernel reclamation; update+grace+callback+retention cost | reader safety, callbacks and grace period requirements | batching/offload/pacing is controller; no new protocol fixed | `DROP` |
| Go GC | [Go GC guide](https://go.dev/doc/gc-guide) | same Go program reachability/finalization; mutator+mark+sweep+assist+retention | GC/pacing/memory-limit controls | policy configuration, no union-external collector construction | `DROP` |
| snmalloc | [snmalloc upstream](https://github.com/microsoft/snmalloc) | concurrent alloc/free/reclaim | remote deallocation/message-passing allocator surface | whole action and fidelity witness unfrozen | `NOT_ADMITTED_UNFROZEN` |
| CPython GC | [CPython GC documentation](https://docs.python.org/3/library/gc.html) | Python lifetime/cycle collection | generation and threshold controls | controller or lifetime semantic change | `STRUCTURAL_DROP` |
| .NET GC | [.NET GC fundamentals](https://learn.microsoft.com/dotnet/standard/garbage-collection/fundamentals) | managed allocation/lifetime | generations, large/pinned object heaps and collector configuration | placement/configuration only | `STRUCTURAL_DROP` |
| PostgreSQL MVCC | [PostgreSQL routine vacuuming](https://www.postgresql.org/docs/current/routine-vacuuming.html) | transactional rows/version visibility; write+retention+vacuum/full I/O cost | dead-tuples and vacuum actions | scheduling formulation; same-object construction unfrozen | `STRUCTURAL_DROP` |
| FoundationDB retention | [FoundationDB upstream](https://github.com/apple/foundationdb) | versioned transactional storage/reclaim | storage-version retention path | active distributed-storage scope and action unclosed | `NOT_ADMITTED_UNFROZEN` |
| Linux cgroup reclaim | [Linux cgroup v2 memory controller](https://docs.kernel.org/admin-guide/cgroup-v2.html) | cgroup memory pressure/reclaim | memory controller/reclaim configuration | resource controller, not same program action | `STRUCTURAL_DROP` |

## Collision boundary

Wave55 user-mode storage/network families, Wave60 memory-representation allocator direction (jemalloc), Wave70 reader/storage families, and registry active/terminal objects are excluded. Native allocator/collector interfaces were not by themselves treated as direct absorption; direct drops above follow only after the proposed atomic action was fixed as selection/pacing over the documented current protocol. The matrix makes no broad claim of implementation absence.
