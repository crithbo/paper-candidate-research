# Discovery log — S2 Pulsar persistence/cursor constructor depth red-team

**Assignment:** `DISCOVERY-S2-20260811-V8.7-WAVE151-PULSAR-PERSISTENCE-CURSOR-CONSTRUCTOR-DEPTH-REDTEAM`  
**Cutoff:** 2026-08-11  
**Result:** `COMPLETE_ZERO_PROPOSALS`

## Frozen method and rescreen boundary

Method: `production_v2_v8.1 + v8.6 fidelity-closure-plan + v8.7 CURRENT_UPSTREAM_REALITY_CHECK`; authoritative revision: `v8.7-authoritative-plus-r3-p0-clarity-compatibility__r5-p0-funnel-clarity__r7-p0-repair-vector-dormant-off__discovery-six-lanes-direct-20260811__p1-shadow-not-authoritative`; `DISCOVERY_QUALITY_MODE=OFF`.

This is a finite red-team of the Wave140 Pulsar sketch, not a new opportunity family or a revival of any terminal topic. Missing code, measurements, data, hardware, or AI capacity is not a premise of the result.

## R5-P0 ledger

| Item | Count / outcome |
|---|---|
| raw row events | 1 (assigned Wave140 rescreen) |
| repeat/rescreen events | 1 |
| unique opportunity families | 0 |
| candidate-grade deep reviews | 1 |
| grounded briefs | 0 |
| final decision | `DROP` for the exact descriptor/batch/persistence/cursor constructor; `PROPOSE_STAGE0: []` |

## Current upstream reality and strongest union

**Frozen sources:** [Apache Pulsar upstream, `master`](https://github.com/apache/pulsar), [current `broker.conf`](https://github.com/apache/pulsar/blob/master/conf/broker.conf), and [Pulsar messaging documentation](https://pulsar.apache.org/docs/4.2.x/concepts-messaging/), accessed 2026-08-11. The static pass did not clone/download the repository; source is therefore a dated upstream-branch/source-file pin, not a claim of a missing symbol or feature.

The native same-object union is: producer-side batching and message metadata; broker validation/deduplication; managed-ledger/BookKeeper append, replication, and ledger position assignment; broker read batching and dispatch; subscription cursor/mark-delete plus individual, cumulative where legal, and batch-index acknowledgments; redelivery and durable recovery. Official documentation states that a persisted message ID identifies its ledger position; batches are stored/tracked as units and unbundled for consumers; batch-index acknowledgment tracks indices to avoid redelivery of already acknowledged members; durable cursors recover from BookKeeper after broker failure.

Configuration/feature facets were treated as a union, not as evidence of novelty: `dispatcherMaxReadBatchSize`, `dispatcherMaxReadSizeBytes`, `dispatcherMinReadBatchSize`, `dispatcherMaxRoundRobinBatchSize`, dispatch-rate controls, producer batching, `acknowledgmentAtBatchIndexLevelEnabled`, subscription mode/type, deduplication, retention, and BookKeeper replication/durability settings. Their default/non-default use can alter policy, but no parameter choice creates a distinct constructor.

## Same-object contract, natural route, and oracle

**Exact object:** a persistent Pulsar topic, its managed ledger/BookKeeper replication contract, and a durable subscription cursor, processing the same ordered producer messages and consumer acknowledgment trace. The observable contract includes assigned ledger/message positions, permitted per-topic/subscription ordering, acknowledged and unacknowledged membership, batch-index state when enabled, durable cursor recovery, and at-least-once redelivery behavior. It excludes a changed durability quorum, changed ordering/subscription contract, format replacement, or application-side packing wrapper.

**Native oracle:** the current Pulsar messaging contract cited above, [Pulsar architecture overview](https://pulsar.apache.org/docs/next/concepts-architecture-overview/) for BookKeeper-backed persistent storage, and current `broker.conf`. Together these check position/cursor/ack/recovery outcomes rather than only byte packing.

**Natural trace route:** a bounded official upstream integration route is a persistent topic with producer batching, a durable consumer, selected individual/batch-index acknowledgments, broker restart/reconnect, and redelivery. It uses versioned Pulsar integration/client test material and official docs/configuration; it was not downloaded or run here.

## Complete-action red-team

### Proposed action

Given a finite ordered sequence of producer messages and subscription acknowledgment state, construct jointly: batch membership and entry descriptors, ledger append units, dispatch slices, and persistent cursor/batch-index state, with the claimed aim of reducing persist/read/ack movement while preserving the frozen topic/ledger/cursor outcomes.

### Minimal legal action-divergence witness required

The witness would require two whole constructors over the same producer sequence, durability/replication setting, subscription type, and acknowledgment trace where the new constructor makes a different descriptor/batch/persistence/cursor decision yet produces the same ledger positions or an explicitly identical reader-visible mapping, ordering, recovery, batch-index behavior, and redelivery set—without a broker policy, application wrapper, generic packer, or changed persistence guarantee.

No legal witness survives:

1. If message-to-entry membership, ledger position mapping, dispatch mapping, and cursor/batch-index state are unchanged, the claimed descriptor is merely an internal representation of the current batch/managed-ledger/cursor union. It supplies no independent complete action, guarantee, or algorithmic quality dimension.
2. If it changes entry boundaries, message-position mapping, batch membership, or persisted cursor/index representation, it changes a reader/recovery-visible construction. Maintaining equivalence would require a new reader/format mapping or a changed ledger/cursor contract, which violates same-object fidelity.
3. If it obtains a gain only by dispatch policy, thresholds, throttling, retention, replica/durability selection, or external producer packing, it is respectively a controller/configuration, changed guarantee, or wrapper. Generic packing/ILP does not define a native Pulsar action.

Thus current whole-action union directly absorbs the unchanged case, while every divergent case changes the frozen contract or leaves the native object. This is a structural decision, not a readiness judgment.

## Full-cost and finite killer

The required denominator would include producer encode/batch + broker admission + managed-ledger/BookKeeper append and replication + storage I/O + broker reads/dispatch + consumer ack/cursor persistence + redelivery/recovery, with CPU, I/O, RSS, bytes/copies, latency and message-position correctness recorded.

**≤72h killer (not executed):** use one official persistent-topic integration trace with a finite ordered message sequence, producer batching, partial batch-index acknowledgments, a restart/reconnect, and a forced redelivery. Compare message/ledger positions, ordered deliveries, acknowledged index set, durable cursor after restart, and redelivery set, while collecting the full denominator. Fail if any oracle observable differs, if a new reader/format or application packing wrapper is needed, or if the alleged decision is expressible by the native batch/entry/cursor union or its configuration. A representation-only rewrite fails admission even if it reduces a local cost.

## Outcome

No `TOPIC_BRIEF` is created. The exact Wave140 descriptor proposal is `DROP`; its changed layout/cursor variants are not same-object, and its unchanged variants are absorbed. No experiment, benchmark, large download, automation, Stage0/A/B creation, or shared-control mutation occurred. State after handoff: `IDLE_REUSABLE_AWAITING_MAINLINE`.
