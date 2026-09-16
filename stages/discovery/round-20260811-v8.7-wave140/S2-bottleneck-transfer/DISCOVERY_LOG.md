# Discovery log — S2 data-movement action-residual breadth

**Assignment:** `DISCOVERY-S2-20260811-V8.7-WAVE140-DATA-MOVEMENT-BOTTLENECK-ACTION-RESIDUAL-BREADTH`  
**Cutoff:** 2026-08-11 · **result:** `COMPLETE_ZERO_PROPOSALS`

## Frozen method

Method: `production_v2_v8.1 + v8.6 fidelity-closure-plan + v8.7 CURRENT_UPSTREAM_REALITY_CHECK`; revision `v8.7-authoritative-plus-r3-p0-clarity-compatibility__r5-p0-funnel-clarity__r7-p0-repair-vector-dormant-off__discovery-six-lanes-direct-20260811__p1-shadow-not-authoritative`; `DISCOVERY_QUALITY_MODE=OFF`.

This pass applies witness-first ordering. A candidate-grade deep review requires a minimum legal action-divergence witness: a named whole same-object construction that current configuration/features cannot express. This ordering changes neither canonical decision meanings nor admission standards.

## R5-P0 breadth ledger

| Family | Current whole action/config union | Minimum divergence witness | Funnel result |
|---|---|---|---|
| Tokio runtime task/I/O queue | scheduler, cooperative budget, I/O driver, work-steal and runtime configuration | only task ordering/queue-selection surfaced; no whole observable-runtime construction | `NOT_ADMITTED_UNFROZEN` |
| Seastar shard buffer/reactor | per-core reactor, buffers, futures, polling and cross-shard messaging | only buffer ownership/queue scheduling; no new request-to-response construction | `NOT_ADMITTED_UNFROZEN` |
| quiche QUIC packet construction | `recv`/connection state, `send`, packet buffers and pacing hints | proposed verified coalesced descriptor plan, then deep reviewed | deep reviewed |
| Apache Pulsar batch/dispatch | producer batching, broker dispatch/read batches, buffer high/low watermarks, ordering/cursor semantics | proposed joint batch-entry/dispatch descriptor construction, then deep reviewed | deep reviewed |
| OpenCL command-buffer movement | command queues, events, memory objects, copy/kernel ordering | only queue/event configuration; no whole command graph action fixed | `NOT_ADMITTED_UNFROZEN` |
| TVM runtime buffer plan | graph executor/runtime allocation, device copy and schedule/config paths | only planner/schedule path; no same-output whole runtime constructor fixed | `NOT_ADMITTED_UNFROZEN` |

Counts: `raw_row_events=6`; `repeat_rescreen_events=0`; `unique_opportunity_families=6`; `preliminary_action_divergence_witnesses=2`; `candidate_grade_deep_reviews=2`; `grounded_briefs=0`.

## Deep review: quiche

**Optimization and residual:** transport crypto/protocol processing improvements expose packet-buffer construction, pacing and socket data movement. **Exact object:** same QUIC/HTTP3 byte stream, packet-number, congestion/loss, endpoint and error semantics. **Full cost:** application data + connection state + frame/packet construction + buffer movement + socket send + pacing/loss processing.

**Action witness:** construct a verified coalesced descriptor plan that jointly partitions frames into packets, assigns buffer ownership, and produces a local proof of packet-number/ack/flow-control legality before emitting packets. This is more than selecting the next queued packet.

**Current union and red team:** current upstream exposes `send()` packet emission, caller-owned I/O/event loop, a buffer-pool component and pacing hints. The proposed construction cannot be frozen separately from QUIC’s current connection state/congestion/loss and application event ordering; a new grouping may change wire packetization, ACK/loss and pacing behavior. No same-object quality/guarantee condition or finite fidelity closure persists. **Natural carrier:** quiche upstream HTTP/3 examples/tests. **72h killer:** same request trace and deterministic network emulator; fail if packet-number/stream/ACK outcome differs or if construction is only existing send/pacing/buffer configuration. `NOT_ADMITTED_UNFROZEN`.

## Deep review: Apache Pulsar

**Optimization and residual:** after broker/network path improvements, producer batch construction, BookKeeper-entry dispatch, buffer ownership, cursor/ack and queue movement can dominate. **Exact object:** same topic/queue messages with Pulsar ordering, consistency, cursor/ack, durability and subscription semantics. **Full cost:** produce + batch/entry construct + broker/buffer movement + persistence + dispatch + ack/cursor.

**Action witness:** construct a joint batch-entry descriptor that maps a finite sequence of messages to persistent entry fragments and consumer-visible batch indexes while proving ordering/cursor/ack equivalence. It is not a batch-size or throttling parameter.

**Current union and red team:** current source documents transparent batching, batch-index acknowledgments, configurable broker read batches, watermarks, dispatch controls and queue/topic semantics. The proposed descriptor either reduces to the current batch/entry/ack union or changes durable entry layout and recovery/consumer semantics. No whole same-object action, complexity/quality delta or finite reader/recovery closure was frozen. **Natural carrier:** Pulsar upstream integration tests and public message-order/ack workloads. **72h killer:** fixed ordered producer/consumer trace; fail on message ordering, batch-index ack, cursor or restart/recovery difference, or if native batch/dispatch controls express it. `NOT_ADMITTED_UNFROZEN`.

## Outcome

The four remaining families fail before deep review because only controllers/configurations were nameable. The two legal sketch attempts fail at same-object protocol/recovery equivalence, not for lack of implementation, results, resources, hardware, downloads or AI readiness. No experiments, benchmarks, downloads, automation, Stage0/A/B or shared-control mutations occurred.

`PROPOSE_STAGE0: []`; state after handoff: `IDLE_REUSABLE_AWAITING_MAINLINE`.
