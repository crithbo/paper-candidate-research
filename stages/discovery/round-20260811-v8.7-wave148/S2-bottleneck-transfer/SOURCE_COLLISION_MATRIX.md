# quiche descriptor red-team — source and collision matrix

**Assignment:** `DISCOVERY-S2-20260811-V8.7-WAVE148-QUICHE-COALESCED-SEND-DESCRIPTOR-DEPTH-REDTEAM`  
**Cutoff:** 2026-08-11; all technical anchors below are upstream or standards-body primary sources.

| Facet | Frozen first-party source / current reality | Consequence for the proposed action |
|---|---|---|
| quiche native object | [cloudflare/quiche upstream](https://github.com/cloudflare/quiche), default `main`, accessed 2026-08-11; dated branch pin because local read-only SHA retrieval failed | Connection `recv()`/`send()` and connection-owned transport state define the native object; application socket I/O remains outside it. |
| stream and HTTP/3 semantics | [RFC 9114](https://www.rfc-editor.org/rfc/rfc9114) | Request/response streams and frame-to-QUIC mapping constrain a same-object constructor; changed stream behavior is not an admissible residual. |
| packet, ACK and transport state | [RFC 9000](https://www.rfc-editor.org/rfc/rfc9000) | Packet number spaces, ACK ranges/timing, flow control and transport legality are part of the frozen oracle. |
| loss and congestion recovery | [RFC 9002](https://www.rfc-editor.org/rfc/rfc9002) | Moving frames among packets or changing emission ordering has recovery consequences; it is not a free buffer-layout substitution. |
| pacing / send timing | [quiche upstream](https://github.com/cloudflare/quiche) public send/pacing API surface | Changing timing is a change to the frozen pacing observable, not a descriptor-only action. |
| GSO / socket segmentation | [quiche upstream](https://github.com/cloudflare/quiche) and the caller-owned UDP boundary | No absence is inferred. Where socket/GSO batching is outside `send()`, using it is a wrapper; where native, it belongs to the strongest union. |
| latest direct collision | current native `recv` + connection state + frame/packet construction + `send` + pacing/recovery union, cutoff 2026-08-11 | The descriptor action is absorbed if observables are unchanged; otherwise it changes packet/pacing/recovery semantics. |

## Six-dimensional residual audit

| Dimension | Finding |
|---|---|
| decision rule | A new packet-descriptor rule is either the same `send()` construction expressed differently, or chooses different packet/datagram/timing output. |
| information condition | Both constructors must consume the identical connection state, pending frames, timers, and network events; added future/application knowledge would violate fairness. |
| complexity / resource | Copy/socket savings are a valid metric only alongside all packet construction, connection bookkeeping, pacing, and recovery work. No distinct complexity proposition survives the contract. |
| quality / guarantee | The relevant guarantee is protocol, stream, packet, ACK/loss and pacing equivalence. A different grouping/timing cannot be assumed equivalent. |
| full cost | frame + packet + descriptor/buffer + socket/GSO + pacing/loss/ACK CPU/RSS/bytes/latency is required; a copy-only measurement would be incomplete. |
| generalization / no-gain | Unchanged packet plans have no mechanism-level gain beyond local representation; changed plans fail the frozen contract or require a wrapper. |

## Collision decision

`DROP` for the exact Wave140 coalesced-send descriptor sketch. This does not assert that quiche lacks a feature, does not modify any prior STOP, and does not foreclose a future different exact object with an independently frozen union-external complete action. It is not a rejection for implementation, results, resources, or AI readiness.
