# Candidate-grade deep reviews

## D1 — Redis Cluster atomic slot migration — `DROP__DIRECT_CURRENT_UNION`

**Pin and union.** Redis Open Source 8.4 current official documentation freezes `CLUSTER MIGRATION IMPORT`, `CANCEL`, `STATUS`, atomic slot-range migration, task state, snapshot-plus-replication handoff, importing/migrating visibility and all documented handoff lag/write-pause controls. The source/semantic reference is the [8.4 release](https://redis.io/docs/latest/develop/whats-new/8-4/) plus the [command contract](https://redis.io/docs/latest/commands/cluster-migration/).

**Fixed contract.** Same slot ranges, keys/values/TTL, routing/ASK behavior, client-visible reads/writes and stock restart/recovery. At each step the action sees current source/destination slot state and replication progress, never future writes. Full cost: snapshot/replication bytes, source/destination CPU/RSS/temp, write pause, requests, retry/rollback work, client latency and recovery validation.

**Minimal action witness.** Migrate slots `[0,1000]` from source to destination: copy a snapshot, propagate changes, pause writes within the documented handoff bound, then switch ownership atomically. This is already an entire native migration action, including multiple ranges and task lifecycle. A proposal that only chooses ranges, lag or concurrent tasks is a controller; a changed routing/visibility contract fails same-object. Natural versioned traces were not frozen, but that is not the DROP reason. Conditional 72h killer: pinned Redis trace, stock client/restart oracle, current command replay and full-cost Pareto comparison.

## D2 — Ceph PG migration/backfill — `NOT_ADMITTED_UNFROZEN`

**Frozen boundary.** The official Ceph pool-migration design describes a PG `MIGRATION_WAIT` state, existing backfill, hash-ordered objects, watermarks and continued I/O; current docs also expose recovery/backfill state and priority. Exact RADOS object/read/recovery semantics and all current OSD feature/config paths could not be commit-pinned in this no-download review.

**Candidate-shaped action.** A possible complete N2 would keep the same PG map/read semantics while transferring a bounded set of hash intervals per client-update epoch, publish watermark/state transitions atomically, and prove recourse plus completion/availability bounds. It is not “prioritize PGs” or tune reservations. However current union and an official versioned PG migration trace are not closed sufficiently to distinguish this from existing backfill/recovery. Full ledger would include object/log bytes, replicas, CPU/RSS, network, temporary replicas, client I/O tail latency, peering/recovery and rollback. Conditional 72h killer: pin OSD source/config and a public PG event trace; fail on current backfill replay, RADOS mismatch, non-atomic state transition or no full-cost residual.

## D3 — OpenSearch shard relocation — `DROP__CURRENT_WHOLE_ACTION`

**Pin and union.** Current official [cluster reroute](https://docs.opensearch.org/latest/api-reference/cluster-api/cluster-reroute/) permits move, allocate and cancel commands under allocation deciders, `dry_run`, `explain`, retry and reinitialization/recovery. The union includes relocation of started primary/replica shards, state publication, recovery and documented allocation modes.

**Contract/witness.** Fixed index documents/mappings, query results, primary/replica semantics and stock recovery. For a started shard, the `move(index, shard, from_node, to_node)` action itself performs the legal state migration. Any residual that picks a destination, timing, priority, bandwidth or parallelism is an allocation controller; changing replica/recovery semantics violates same-object. Charge segment/translog bytes, CPU/RSS/temp, network, disk duplicate residency, query/write latency and restart/recovery. A public versioned natural relocation trace was not frozen; the direct native action is the decision basis. Conditional 72h killer: stock relocation trace plus source/destination restart and query digest; fail on equivalence, native replay or full-cost dominance.
