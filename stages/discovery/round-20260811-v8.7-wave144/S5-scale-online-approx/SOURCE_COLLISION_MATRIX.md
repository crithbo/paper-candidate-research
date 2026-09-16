# Wave144 Source / Collision Matrix

| Family | Same-object information/action and current native union | Guarantee/full-cost | Witness/killer outcome |
|---|---|---|---|
| CockroachDB | Range replicas, requests/locality/state; snapshot+Raft join/replay, lease/replica transfer, split/merge; allocator thresholds, zones and `ALTER RANGE RELOCATE`. | quorum, consistency, survivability; snapshot bytes, replay, handoff, CPU/network, retry/rollback. | Proposed global move selection is only a controller. |
| YugabyteDB | Tablets, live requests, leader/follower state; presplit, manual/automatic split, bootstrap and rebalance plus flags. | online Raft availability; split metadata, bootstrap/catch-up, leader transfer and foreground effect. | Proposed constructor is already native/configurable. |
| ScyllaDB | Tablet partitions, shard/node load; autonomous moves, splits, Raft topology and SSTable streaming. | correctness/uninterrupted service; SSTables, cleanup, disk/network/CPU, compaction and latency. | No atomic action outside union. |
| Ceph Reef | CRUSH PG placement and OSD map; `upmap`, compat weights, phased remap, deviation/sleep and tunables. | placement/replication; recovery/backfill, map propagation, degraded-state and client impact. | Per-PG remap is directly expressible. |
| Vitess v25 | Keyspace shards and VReplication state; Create/copy/catch-up/VDiff/SwitchTraffic/reverse/Complete with routing/tablet controls. | copy equivalence/write availability; source reads, replication lag, validation, cutover, rollback, cleanup. | Reordering is workflow control, not N2. |
| Apache HDFS | Blocks/namespaces and live NameNode state; iterative Balancer moves/state refresh plus Federation incremental copy/diff/final round. | replication/availability; bytes, bandwidth, NameNode/disk/network, contention, diff/cutover. | Threshold/bandwidth/plan variation is configuration. |

All rows use the official sources listed in `DISCOVERY_LOG.md`, checked 2026-08-11. A future <=72h killer requires a public version-pinned natural trace or official reproducible workload and fails closed on non-legal action coverage, a safety/consistency violation, or no full-cost Pareto/guarantee gain. No source-inspected trace gap is treated as scientific DROP.
