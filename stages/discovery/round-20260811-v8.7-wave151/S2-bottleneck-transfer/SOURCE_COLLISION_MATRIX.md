# Pulsar persistence/cursor constructor red-team — source and collision matrix

**Assignment:** `DISCOVERY-S2-20260811-V8.7-WAVE151-PULSAR-PERSISTENCE-CURSOR-CONSTRUCTOR-DEPTH-REDTEAM`  
**Cutoff:** 2026-08-11. All sources are Apache upstream documentation/source or Apache-maintained project sources.

| Facet | Current first-party anchor | Collision / fidelity consequence |
|---|---|---|
| current broker configuration | [Pulsar `broker.conf` on `master`](https://github.com/apache/pulsar/blob/master/conf/broker.conf) | Dispatcher read-batch sizes, round-robin batch size, rate controls, batch-index acknowledgement, and related defaults/non-defaults are already part of the comparator union, not a gap. |
| persistent message / ledger position | [Pulsar messaging 4.2](https://pulsar.apache.org/docs/4.2.x/concepts-messaging/) | A BookKeeper-assigned message ID identifies a ledger position; altered position/layout requires reader/recovery fidelity, not a local packing claim. |
| batching and batch-index ack | [Pulsar messaging 4.2](https://pulsar.apache.org/docs/4.2.x/concepts-messaging/) | Batches are stored/tracked as units; consumers unbundle; optional batch-index state prevents redelivery of acknowledged members. The proposed action meets an existing complete union. |
| cursor and restart recovery | [Pulsar messaging 4.2](https://pulsar.apache.org/docs/4.2.x/concepts-messaging/) | Durable cursors persist positions and recover after broker failure; cursor representation changes are not invisible local choices. |
| storage architecture | [Pulsar architecture overview](https://pulsar.apache.org/docs/next/concepts-architecture-overview/) and [Apache BookKeeper upstream](https://github.com/apache/bookkeeper) | Persistent topic storage is BookKeeper-backed; append/replication belongs in full cost and guarantee boundary. |
| redelivery and delivery guarantee | [Pulsar messaging 3.3](https://pulsar.apache.org/docs/3.3.x/concepts-messaging/) | Negative-ack/timeout/retry and at-least-once behavior constrain the same cursor/ack outcome. |
| latest direct collision | current native batching + managed ledger/BookKeeper + dispatcher + cursor/ack/recovery union, checked to cutoff | Unchanged descriptor decisions are direct absorption; divergent ones change layout, recovery, ordering, durability, or require a wrapper. |

## Six-dimensional residual audit

| Dimension | Finding |
|---|---|
| decision rule | The proposed rule assigns messages to entries/batches and cursor/index persistence. The same assignment is already the native union; a different one changes stored/reader-visible state. |
| information condition | A fair constructor has only the same ordered producer sequence, topic/subscription state, durability setting, and ack trace. Extra application or future information is disallowed. |
| complexity / resource | CPU/I/O/RSS/bytes/latency improvements require all append, replication, dispatch, ack and recovery work; no separate complexity/quality proposition was frozen. |
| quality / guarantee | Ordering, durable position, batch-index ack, restart recovery, and redelivery are the guarantee. Changing them is not same-object. |
| full cost | Produce + persist + replicate + dispatch + ack/cursor + recovery must be charged; entry packing alone is incomplete. |
| generalization / no-gain | Identical mappings are representation-only; changed mappings require a reader/format or semantic/guarantee change. |

## Decision

`DROP` for the exact assigned action. This is neither an absence claim about current Pulsar nor a scientific inference from unavailable implementation/results/resources. It does not alter Wave140's prior record or preclude a distinct future exact object with a separately frozen union-external action.
