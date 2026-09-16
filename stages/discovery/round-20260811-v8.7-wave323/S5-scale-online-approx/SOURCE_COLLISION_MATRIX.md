# Source and collision matrix

| Family | Current strongest union | Reader/recovery oracle | Versioned natural carrier | Decision |
| --- | --- | --- | --- | --- |
| Berkeley DB 18.1.32 | WAL + native checkpoint/archive/recovery and `-k`/`-p` controls | DB recovery/open then transactional reads | not frozen | native action; policy residual → `DROP` |
| ZooKeeper 3.9 | snapshot/log roll, recovery, snap/size/log limits and purge | unmodified server restart + znode reads | not frozen | native action; threshold residual → `DROP` |
| Pulsar 4.1 | broker topic compaction/rewrite and documented settings | stock consumer/recovery latest-per-key view | not frozen | native action; scheduler residual → `DROP` |
| TensorFlow | checkpoint save/restore + retention | restored trackables | not deepened | retention controller → `DROP` |
| PyTorch/BookKeeper | union/current source respectively not closed | possible stock reader | not frozen | `NOT_ADMITTED_UNFROZEN` |

No absence claim is inferred from unavailable source/trace material. No candidate is rejected for implementation, outcome, resource or AI readiness.
