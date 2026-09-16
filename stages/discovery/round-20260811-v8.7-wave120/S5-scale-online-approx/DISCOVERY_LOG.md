# DISCOVERY-S5-20260811-V8.7-WAVE120-ONLINE-RECOURSE-CURRENT-CONSTRUCTOR-BREADTH

- Lane/cutoff: `DISCOVERY-S5-SCALE-ONLINE-APPROX`; first-party/current cutoff `2026-08-11`.
- Frozen authority: `v8.7-authoritative-plus-r3-p0-clarity-compatibility__r5-p0-funnel-clarity__r7-p0-repair-vector-dormant-off__discovery-six-lanes-direct-20260811__p1-shadow-not-authoritative`; `DISCOVERY_QUALITY_MODE=OFF`.
- Method: accepted v2/v8.1, v8.6 fidelity admission, v8.7 current-upstream reality. No v8.8/R7 shadow/dormant semantics were used canonically.
- BREADTH protocol: six current first-party constructors were selected; before deep review each required a same-object action-divergence witness. No candidate is admitted merely because current configuration offers an imperfect performance trade-off.
- Input SHA-256: `AGENTS.md=66231f71ef6ab250a1ad9ff576d5840978f09efc03bf5d2f0527d47f4d82b063`; `plan.md=db62a1017ef42d7fdba960024fe917ada162a05916582128a5919958194ad60f`; `registry.yaml=7c9d6ded2c3da851883d41cad09a2144f9f9399bd1a971c67fd255f7426daefd`; `ROLE_DISCOVERY=fcb9bd73c39f39d31f6c8154e6b48ea23187ff28bdf2bb3d9c59e3d28fa518a3`.

## Funnel

| Unit | Count | Result |
|---|---:|---|
| `RAW_SCREEN_ROW_EVENT` | 6 | Six non-repeat current constructors. |
| `UNIQUE_OPPORTUNITY_FAMILY` | 6 | Each has current-reality record. |
| `CANDIDATE_GRADE_DEEP_REVIEW` | 0 | No same-object action-divergence witness survived. |
| `STAGE0_BRIEF` | 0 | `COMPLETE_ZERO_PROPOSALS`. |

## Current constructor records

### Flink keyed-state rescaling — `NOT_ADMITTED_UNFROZEN`

- Exact object/action: keyed streaming state is redistributed by fixed key groups when parallelism changes; key/state alignment preserves local updates and consistency.
- Information/guarantee/full cost: prefix stream, keyed state/checkpoint information, exact state semantics; state bytes, checkpoint/restore, old/new task overlap, backlog/catch-up and rescale pause are all necessary cost dimensions.
- Current union and preliminary witness: key-group redistribution, checkpoint/savepoint and compatible state backends already express the complete transfer action. A different `maxParallelism` or autoscale threshold is configuration/controller; no union-external action was named.
- Natural carrier / finite killer: public event streams plus checkpoint/rescale history would be usable, but no candidate action exists for a 72h killer.

### Flink operator-state redistribution — `NOT_ADMITTED_UNFROZEN`

- Exact object/action: non-keyed list-style operator state, redistributed on parallelism change by defined schemes; independent list objects are its finest redistribution granularity.
- Information/guarantee/full cost: checkpoint state and changed parallelism; state-equivalent restore; serialization, transfer, initialization, downtime and replay must be charged.
- Current union and preliminary witness: `snapshotState`/`initializeState` plus even-split/union redistribution already specify complete action. Altering list chunking changes user state representation; no same-function atomic residual is frozen.
- Natural carrier / finite killer: Kafka-source partition/offset state is natural, but cannot distinguish a non-existent residual.

### Kafka consumer rebalance protocol — `NOT_ADMITTED_UNFROZEN`

- Exact object/action: consumer-group partition ownership transfer under membership changes, using Kafka's incremental consumer rebalance protocol.
- Information/guarantee/full cost: coordinator group state/heartbeats and subscriptions; partition ownership/offset semantics; rebalance duration, revocation/assignment, catch-up and service disruption are all costed.
- Current union and preliminary witness: server-controlled assignors, incremental protocol and online upgrade/downgrade path already express transfer. `uniform`/`range`, assignor ordering, heartbeat/session values and custom assignor hook are documented action/config space, not an unrepresented construction.
- Natural carrier / finite killer: public Kafka benchmark/event traces are plausible, but a merely different assignor is a policy; no finite N2 killer is honest.

### Pulsar bundle unloading — `NOT_ADMITTED_UNFROZEN`

- Exact object/action: broker owns topic bundles and closes/releases/reassigns them on load change; clients reconnect after a bounded latency blip.
- Information/guarantee/full cost: current broker load and ownership; topic availability semantics; connection closes, reassignment, transfer/recovery work and latency must be charged.
- Current union and preliminary witness: automatic/manual unload, splitting, pre/post-assignment and documented shedders directly cover the action. Thresholds and choice among `TransferShedder`, `AvgShedder`, etc. are controllers/configurations.
- Natural carrier / finite killer: broker topic/load statistics are natural, yet no outside-union action exists.

### HBase region move/split/merge — `NOT_ADMITTED_UNFROZEN`

- Exact object/action: regions transition through persisted `OFFLINE`/`OPENING`/`OPEN`/`CLOSING`/`CLOSED` and split/merge states; master reassigns regions and load balancer periodically moves them.
- Information/guarantee/full cost: `hbase:meta`/coordination state and server responses; serving-state correctness; close/open, RPC retry, region bytes, WAL/recovery and unavailability cost.
- Current union and preliminary witness: the region-state machine plus load balancer/move/split/merge are complete native actions. A stochastic-balancer score or period is policy/config; no new state action appears.
- Natural carrier / finite killer: public HBase/YCSB traces can exercise it, but cannot separate a new action.

### Iceberg atomic file rewrite — `NOT_ADMITTED_UNFROZEN`

- Exact object/action: table file rewrite replaces data/delete files and atomically commits a logically equivalent current snapshot; grouped/partial-progress file rewrites are supported.
- Information/guarantee/full cost: current snapshot, rewrite candidates and conflict validation; snapshot equivalence/serializable table semantics; reads/writes, file groups, concurrent commit retries, old/new file retention and planning effects.
- Current union and preliminary witness: `RewriteFiles`/`RewriteDataFiles` with bin-pack/sort/Z-order/filter/partial progress already expose the complete rewrite action and concurrent group budget. File-size/count/byte caps and strategy selection are configurations/controllers.
- Natural carrier / finite killer: public Iceberg-compatible lake tables could supply a carrier, but there is no union-external atomic rewrite action.

## Canonical outcome

`COMPLETE_ZERO_PROPOSALS`. The zero result follows from direct expression of each complete action in the current native union, not from absence of implementation, results, data, resources or AI readiness. No experiment, benchmark, large download, automation, downstream-stage creation or shared-control modification occurred.
