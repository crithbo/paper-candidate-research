# State-migration collision matrix

| Object | Strongest current union | Atomic reader/recovery semantics | Natural carrier | Outcome |
| --- | --- | --- | --- | --- |
| Redis 8.4 slot migration | atomic range migration, snapshot/replication handoff, visibility/task controls | stock cluster client, routing and restart | trace not frozen | direct action absorption |
| Ceph PG | backfill/recovery, watermarks and PG state | RADOS reads/PG recovery intended but source/config unclosed | trace not frozen | `NOT_ADMITTED_UNFROZEN` |
| OpenSearch shard | reroute move/allocate/cancel, recovery/deciders | stock search/recovery | trace not frozen | direct action absorption |
| Vitess | VReplication/reshard lifecycle | SQL/routing cutover but current closure incomplete | trace not frozen | `NOT_ADMITTED_UNFROZEN` |
| Kubernetes/priority lines | orchestration/priority | not a native same-reader constructor | n/a | controller drop |

No missing implementation, result, resource or AI-readiness condition is used as a scientific negative.
