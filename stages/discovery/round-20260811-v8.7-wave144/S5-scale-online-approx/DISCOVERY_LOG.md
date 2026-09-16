# Wave144 Discovery Log

Assignment: `DISCOVERY-S5-20260811-V8.7-WAVE144-ONLINE-RECOURSE-GUARANTEE-WITNESS-BREADTH`  
Frozen rules: v8.7 + R5-P0, `DISCOVERY_QUALITY_MODE=OFF`; cutoff 2026-08-11. Only first-party current documents were inspected. No experiment, benchmark, large download, automation, Stage 0/A/B, or shared-control mutation occurred.

## Guarantee-first / witness-first funnel

Six new families were screened, after checking the registry/plan for cross-lane name collisions: CockroachDB range rebalancing, YugabyteDB tablet split/rebalance, ScyllaDB tablet migration, Ceph PG/CRUSH rebalance, Vitess VReplication resharding, and Apache HDFS block/federation balancing. All six have a natural operational carrier, but their current official pages do not supply a version-pinned public production trace sufficient for an admitted finite natural evaluation.

For each, I froze the same object, online information, whole migration/rebuild action, consistency/availability boundary and full-cost ledger before considering novelty. Every initial witness failed current-native-union coverage:

| Object | Whole action proposed | Current-union result |
|---|---|---|
| CockroachDB ranges | coupled split, snapshot, Raft membership/log replay, replica and lease transfer | Native replication layer, allocator settings, zone controls and `ALTER RANGE RELOCATE` directly cover it. |
| YugabyteDB tablets | runtime/automatic split, bootstrap, leader/follower moves | Native presplit/manual/automatic split, rebalance and splitting flags directly cover it. |
| ScyllaDB tablets | split plus shard/node migration and topology update | Native autonomous migration, tablet split, Raft topology and file-based SSTable streaming directly cover it. |
| Ceph PGs | minimum-movement placement/remap | CRUSH, per-PG `upmap`, compat weights, phase/deviation controls and migration-aware tunables directly cover it. |
| Vitess keyspace shards | copy, catch-up, validated cutover, rollback | VReplication Reshard's Create/VDiff/SwitchTraffic/ReverseTraffic/Complete lifecycle directly covers it. |
| HDFS blocks/namespaces | online incremental block move/copy/diff/cutover | Balancer and Federation Balance directly expose moves, state refresh, threshold, bandwidth, incremental diff and final round. |

The remaining variation is a score, threshold, cadence or generic solver selecting existing native actions. It is controller/configuration work, not a same-object N1/N2 witness. No brief was created.

## Fair comparison/fidelity requirements if reconsidered

Any future finite 72-hour killer needs a version-pinned public operator trace or reproducible official workload, identical arrival/information state, and a full ledger: transferred bytes, snapshots/SSTables or block copies, CPU/network/disk, metadata, catch-up/replay, foreground latency/availability, retries and rollback. It must reject the claim if action coverage is not legal, the frozen safety/consistency guarantee fails, or there is no Pareto/guarantee improvement over the native union. Lack of that trace is an admission gap—not a scientific negative.

## Primary sources / current reality

- [CockroachDB replication layer](https://www.cockroachlabs.com/docs/v26.2/architecture/replication-layer), [ALTER RANGE](https://www.cockroachlabs.com/docs/stable/alter-range)
- [YugabyteDB tablet splitting](https://docs.yugabyte.com/stable/architecture/docdb-sharding/tablet-splitting/), [distribution](https://docs.yugabyte.com/stable/explore/linear-scalability/data-distribution/)
- [ScyllaDB tablets](https://docs.scylladb.com/manual/stable/architecture/tablets.html)
- [Ceph balancer](https://docs.ceph.com/en/reef/rados/operations/balancer/), [CRUSH map](https://docs.ceph.com/en/reef/rados/operations/crush-map/)
- [Vitess VReplication](https://vitess.io/docs/25.0/reference/vreplication/vreplication/), [Reshard create](https://vitess.io/docs/archive/19.0/reference/programs/vtctldclient/vtctldclient_reshard/vtctldclient_reshard_create/)
- [HDFS Balancer](https://hadoop.apache.org/docs/current/hadoop-project-dist/hadoop-hdfs/build/source/hadoop-hdfs-project/hadoop-hdfs/target/api/org/apache/hadoop/hdfs/server/balancer/Balancer.html), [Federation Balance](https://hadoop.apache.org/docs/current/hadoop-federation-balance/HDFSFederationBalance.html)

## Decision

`COMPLETE_ZERO_PROPOSALS`. This is direct current-union absorption of the frozen actions, not a STOP claim and not a result of missing implementation, results, resources, network, or AI readiness.
