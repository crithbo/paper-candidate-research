# Discovery log — S2 quiche coalesced-send descriptor depth red-team

**Assignment:** `DISCOVERY-S2-20260811-V8.7-WAVE148-QUICHE-COALESCED-SEND-DESCRIPTOR-DEPTH-REDTEAM`  
**Cutoff:** 2026-08-11  
**Result:** `COMPLETE_ZERO_PROPOSALS`

## Frozen method and boundary

Method: `production_v2_v8.1 + v8.6 fidelity-closure-plan + v8.7 CURRENT_UPSTREAM_REALITY_CHECK`; authoritative revision: `v8.7-authoritative-plus-r3-p0-clarity-compatibility__r5-p0-funnel-clarity__r7-p0-repair-vector-dormant-off__discovery-six-lanes-direct-20260811__p1-shadow-not-authoritative`; `DISCOVERY_QUALITY_MODE=OFF`.

This is a finite fidelity red-team of Wave140's quiche sketch, not a change to any prior terminal state. The question is whether a protocol-preserving, complete descriptor/buffer/packet joint constructor exists outside the current native union. A missing implementation, result, resource, or AI capability is not used as a negative premise.

## R5-P0 ledger

| Item | Count / outcome |
|---|---|
| raw row events | 1 (the explicitly assigned Wave140 rescreen) |
| repeat/rescreen events | 1 |
| unique opportunity families | 0 (not represented as new) |
| candidate-grade deep reviews | 1 |
| grounded briefs | 0 |
| final decision | `DROP` for this exact descriptor action; `PROPOSE_STAGE0: []` |

## Current-source reality check

**Source frozen:** [cloudflare/quiche, default `main` branch](https://github.com/cloudflare/quiche), accessed 2026-08-11, together with its public README/API documentation. A read-only `git ls-remote` attempt could not obtain a SHA because the local Windows Schannel credential provider failed; no repository clone/download was authorized. Thus the source reference is a dated upstream-branch pin, not an asserted absence claim. No conclusion relies on an unavailable source symbol or on GSO being absent.

The public quiche surface establishes `recv()` for incoming UDP datagrams, `send()` for produced UDP payloads, connection-owned transport state, caller-owned socket I/O/event loop, and send/pacing timing information. The audited native union is therefore: receive/decode and connection state; frame selection and packet construction inside the connection; packet emission from `send()`; loss-recovery/congestion/ACK state; and caller socket/timer handling. Public configuration and feature facets relevant to the boundary include transport/HTTP3 setup, UDP payload sizing, pacing/timing delivery, socket-side datagram/GSO capability, and buffer ownership. They were treated as a union, including non-default use where exposed; none supplies an action gap merely because it is a flag.

## Frozen same-object contract and oracle

**Exact object:** one quiche QUIC connection carrying the same HTTP/3 request/response stream trace, under the same supplied network/timer events. The observable contract includes stream bytes, offsets, FIN/reset/error outcomes; packet-number-space and packet/frame legality; ACK ranges and timing within negotiated limits; congestion/loss/recovery state; `send()` payloads and `SendInfo.at` pacing eligibility; and socket datagram/GSO segmentation semantics when that facility is actually enabled.

**Native protocol oracle:** [RFC 9000](https://www.rfc-editor.org/rfc/rfc9000) for QUIC transport and ACK semantics, [RFC 9002](https://www.rfc-editor.org/rfc/rfc9002) for loss detection/recovery, and [RFC 9114](https://www.rfc-editor.org/rfc/rfc9114) for HTTP/3's mapping of request/response streams onto QUIC. These are first-party IETF standards, not a performance claim.

**Natural route:** the upstream quiche repository's public HTTP/3 applications/integration tests and its `h3i`/qlog tooling provide a bounded official carrier route. A Stage A implementation, if admissible, would use a small upstream request/reply plus controlled loss/reordering trace; this pass did not download or run it.

## Action red-team

### Proposed complete action

For a fixed pending-frame set and connection state, construct a descriptor plan that assigns frame byte spans and buffer ownership to packets, chooses coalescing/datagram boundaries, and updates packet-number, ACK, flow-control, congestion, loss-recovery, and pacing bookkeeping before socket emission. Its purported benefit would be lower frame/packet/socket movement cost without changing the frozen protocol outcome.

### Minimal legal action-divergence witness attempted

The required witness would be two legal constructors over exactly the same connection state and application/network event trace where the new constructor makes a different descriptor/buffer/packet decision, while retaining all frozen stream, packet, ACK/loss, pacing, and socket observables and not delegating batching to an application wrapper.

No such witness can be frozen:

1. If frame assignments, packet boundaries, and emission eligibility stay identical, a descriptor merely changes an internal representation of the existing `send()` construction. It has no distinct complete action, guarantee, or solution-quality dimension outside the native union.
2. If it changes coalescing, packet boundaries, GSO segmentation, or send order to reduce copies/syscalls, it changes packet/socket observables and can alter ACK/loss attribution or recovery. If it changes emission time, it changes the frozen pacing eligibility/timing contract.
3. If it implements batching after `send()` in the caller's UDP/GSO layer, it is an application/socket wrapper rather than a same-object native constructor.

This is direct absorption or a necessary contract change, not an implementation/readiness failure. The assigned action is therefore structurally `DROP`.

## Full-cost and finite falsifier

The required denominator, had the action survived, is frame selection/encoding + packet construction + descriptor/buffer movement + connection bookkeeping + socket/GSO transmission + pacing/loss/ACK processing, with CPU, RSS, bytes/copies, packet/datagram count, and end-to-end latency all recorded.

**≤72h killer (not executed):** use a minimal official quiche HTTP/3 request/reply trace with deterministic timer/network events and one loss/reordering case. Record frame placement, packet numbers, stream offsets/FIN, ACK ranges/deadlines, loss/recovery events, `SendInfo.at`, emitted datagrams/GSO metadata, CPU/RSS/bytes, and latency. Fail immediately if any frozen observable differs, if a caller-side socket wrapper is required, or if the alleged action is expressible as the existing constructor plus configuration. Passing only a representation rewrite would also fail admission because it does not establish a union-external complete action.

## Outcome

The Wave140 sketch is not advanced to a brief. The decision is based on the complete-action/contract red-team, not on lack of execution, positive results, source accessibility, hardware, natural workload availability, or AI readiness. No experiment, benchmark, download, automation, Stage0/A/B creation, or shared-control mutation occurred.

State after handoff: `IDLE_REUSABLE_AWAITING_MAINLINE`.
