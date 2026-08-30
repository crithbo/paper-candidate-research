# Checkpoint / verification preliminary-witness and collision matrix

**Assignment:** `DISCOVERY-S2-20260811-V8.7-WAVE111-ENDTOEND-CHECKPOINT-VERIFICATION-BOTTLENECK-DEEP` · **cutoff:** 2026-08-11.

| Family | Official primary anchor | Exact same-object / full cost | Current union and preliminary action witness result | Natural carrier / finite killer | Final |
|---|---|---|---|---|---|
| DMTCP | [DMTCP upstream](https://github.com/dmtcp/dmtcp) | process restart; dump+image+verify+transfer+restore+first correct observation | checkpoint/restart image paths; only compression/dedup/path policy named, no whole state construction | upstream process tests; restart semantics + option-expression check | `NOT_ADMITTED_UNFROZEN` |
| CRIU | [CRIU upstream](https://github.com/checkpoint-restore/criu) | restored process; freeze+image/pages+verify+restore | dump/restore/lazy-page and kernel-object paths; no union-external protocol fixed | CRIU tests; resource/restore semantics check | `NOT_ADMITTED_UNFROZEN` |
| LLNL SCR | [SCR upstream](https://github.com/LLNL/scr) | MPI restart; state save+node cache/replica+verify+restart | multi-level cache and replication operations; action is placement policy | `examples/test_api`; restart-state/level-policy check | `NOT_ADMITTED_UNFROZEN` |
| etcd | [etcd upstream](https://github.com/etcd-io/etcd) | revision-correct read/snapshot; log+snapshot+compaction+verification | history/compaction/snapshot actions; changed retention changes legal revisions | etcd integration test; requested revision behavior | `STRUCTURAL_DROP` |
| Kubernetes checkpoint | [Kubernetes checkpoint documentation](https://kubernetes.io/docs/reference/node/kubelet-checkpoint-api/) | container restore; runtime image+verify+restore | CRI/CRIU wrapper and runtime policy | CRIU/container test; wrapper/path check | `STRUCTURAL_DROP` |
| VPIC | [VPIC upstream](https://github.com/lanl/vpic) | simulation restart; dump/read/check+resumed state | application dump carrier; no shared reader/checker construction | VPIC restart example; state equality | `NOT_ADMITTED_UNFROZEN` |

## Deduplication and canonical boundary

QEMU migration, Spark/Flink checkpoint families, PyTorch checkpoint-adjacent runtime work, object-store manifest constructions, and all registry active/terminal objects are excluded. The zero preliminary-witness count is an assignment-local discovery ordering fact, not a new canonical STOP/DROP state or a claim that these ecosystems lack future work. No current source absence is asserted.
