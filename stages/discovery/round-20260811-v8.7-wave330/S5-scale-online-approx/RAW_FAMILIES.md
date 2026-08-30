# Bounded-recourse state-migration screen

| ID | Fixed same-object state | Official/current entry | Initial disposition |
| --- | --- | --- | --- |
| R1 | Redis Cluster slots, keys and client routing during migration | [Redis 8.4 `CLUSTER MIGRATION`](https://redis.io/docs/latest/commands/cluster-migration/) | deep |
| R2 | Ceph PG object state and RADOS read/recovery view | [Ceph pool migration design](https://docs.ceph.com/en/latest/dev/pool-migration-design/) | deep |
| R3 | OpenSearch index shard and stock search/recovery view | [cluster reroute API](https://docs.opensearch.org/latest/api-reference/cluster-api/cluster-reroute/) | deep |
| R4 | Vitess keyspace/table rows, routing and VReplication cutover | [current reshard docs](https://vitess.io/docs/21.0/user-guides/vreplication/resharding/) | `NOT_ADMITTED_UNFROZEN`: current source/trace closure incomplete |
| R5 | Redis module auxiliary state during atomic slot migration | [Redis module migration API](https://redis.io/docs/latest/develop/reference/modules/modules-api-ref/) | `DROP__CURRENT_UNION` |
| R6 | Kafka partition reassignment state | [Kafka docs](https://kafka.apache.org/documentation/) | excluded: Wave323 Kafka vicinity |
| R7 | Kubernetes PVC/data relocation | [Kubernetes storage docs](https://kubernetes.io/docs/concepts/storage/persistent-volumes/) | `DROP__ORCHESTRATION_CONTROLLER` |
| R8 | Ceph recovery/backfill priority | [Ceph PG docs](https://docs.ceph.com/en/quincy/rados/operations/placement-groups/) | `DROP__SCHEDULER` |
| R9 | OpenSearch replica allocation preference | [reroute API](https://docs.opensearch.org/latest/api-reference/cluster-api/cluster-reroute/) | `DROP__ALLOCATION_CONTROLLER` |

All are distinct from Zarr/HDF5/FITS and Wave323 checkpoint/compaction objects. R6 is excluded rather than rescreened.
