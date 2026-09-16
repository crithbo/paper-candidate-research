# QUIC-0RTT-REPLAY-CERTIFICATE-INDEX — Stage 0 PRIMARY

## Decision

`STOP_RECOMMENDED` — `BELOW_Q2_STOP__BACKEND_ANTI_REPLAY_INDEX_OR_GENERIC_CACHE`.

This is a structural decision, not a consequence of missing implementation, traces, hardware, benchmark results, or an application interruption.  Stage A and Stage B are not authorized; no same-ID revision is recommended because the frozen mechanism is absorbed at the exact backend decision boundary.

## Frozen same-object contract

The independently pinned executable contract is **ngtcp2 `0134a19b63f0a3578a3879a557a8c0bb52d28fdc` + OpenSSL `6d250710fb8cfd5c9a41af373c0c1ca85ff836c2`**, one endpoint, fixed TLS 1.3 resumption ticket/early-data policy, fixed QUIC transport parameters, and the same HTTP early-data trace.  The retained security requirement is: a replay of the same authenticated early-data ticket must not be accepted more than once under the backend's consistent-state scope.  The candidate may not weaken it by keying only a `(ticket, QUIC-context)` pair that permits the same ticket under a different context, nor extend it into a different distributed/application threat model.

## Direct current-source collision

OpenSSL's current server state machine makes the relevant anti-replay action part of the same native object:

- `SSL_OP_NO_ANTI_REPLAY` is documented in the current public header as the option that **switches off** automatic TLS 1.3 early-data anti-replay.  Thus the default is protection on.
- With `max_early_data > 0` and that disabling option unset, `tls_construct_new_session_ticket` takes the stateful-ticket path.  The source comment states that anti-replay protection behaves as `SSL_OP_NO_TICKET`, because tickets are cached already; the path calls `construct_stateful_ticket` and updates the server cache.
- Current OpenSSL documentation states that replay protection is on by default and automatically detects a session ticket used more than once when TLS 1.3 and server early data are enabled.  The decision callback `SSL_CTX_set_allow_early_data_cb` runs immediately before accept/reject, which makes an alternative policy a backend callback implementation, not a new QUIC primitive.
- ngtcp2's current README documents a supported experimental OpenSSL backend and 0-RTT resumption through the saved session ticket plus transport parameters.  It separately describes tokens as address-validation data.  It does not add a competing QUIC-side duplicate-acceptance identity.

Consequently, for the exact same endpoint, ticket information, lifetime and at-most-once acceptance guarantee, the proposed epoch/authenticated-identity/certificate membership decision is extensionally a stateful ticket anti-replay index already provided by the pinned backend.  Replacing the index behind the callback is a cache/controller implementation; adding QUIC context either remains redundant or changes the ticket-wide duplicate-rejection contract.

## Protocol and threat-model audit

RFC 8446 assigns replay protection to the TLS mechanisms and explains that a consistently shared cluster can accept a given ClientHello/early-data pair at most once, while applications must still tolerate remaining replay risks.  RFC 9001 §9.2 requires QUIC endpoints to use TLS replay protections, says QUIC frame processing is idempotent, and puts residual replay risk/application semantics at the application-protocol layer.  It also says tickets and address-validation tokens must not communicate application semantics.

Therefore a purported stronger index cannot claim a new QUIC security guarantee simply by incorporating transport/token context: accepting the same ticket once per context weakens the frozen ticket-wide rejection property, while moving replay logic to HTTP/application semantics is a different object.  Global/distributed replay coordination is likewise a new deployment/threat model, not the one-endpoint same-information candidate.

## Strongest fair union

| Component | Same object role |
|---|---|
| OpenSSL automatic anti-replay/stateful ticket cache | Direct same-backend duplicate-rejection anchor |
| `SSL_CTX_set_allow_early_data_cb` plus default/non-default anti-replay option | Complete backend callback/configuration surface |
| ngtcp2 ticket, transport-parameter, token and 0-RTT resumption path | Required QUIC integration/comparator boundary |
| TLS 1.3/RFC 9001 replay rules | Security/semantic constraint, not an optional baseline |
| Generic cache, Bloom filter, timer-wheel, certificate index | Method kernel already subsumed unless a new same-contract theorem/action is named |

The candidate brief names no non-product action, target-specific state quotient, new proof obligation, or algorithmic guarantee beyond membership plus expiry.  Any optimization limited to storage layout, hash, expiration, callback timing, retry policy, or cache replacement is generic cache engineering.  A generic cache can be valuable implementation work but does not form the required Q2 N2 paper kernel under this frozen object.

## Structural potential and readiness, separately

| Axis | Finding |
|---|---|
| Current evidence readiness | A finite replay/first-use test route exists via public ngtcp2 examples and backend logs.  Its absence was not used in this decision. |
| Structural paper potential of this ID | Fails.  Even if the proposed index succeeds, it is either backend-equivalent or changes the duplicate-rejection/threat contract. |
| N1/N2/N3 | No admissible route remains: N1 is absent; N2 collapses to a generic cache/callback; N3 is not a stated natural-law contribution. |

## Claim ceiling and successor boundary

No performance, security, storage or latency claim is made.  A future topic requires a **new ID** and a materially different, explicitly frozen research object, for example a defined multi-node consistency model and a protocol/application contract that makes a non-product action/guarantee possible.  It may not relabel OpenSSL's anti-replay cache, its callback, ticket expiry, or QUIC transport-parameter binding as a successor.

## Routing

This is a terminal Stage-0 scientific recommendation.  No Stage A/B work is requested.  A confirmation reviewer should independently verify the current OpenSSL auto-anti-replay path and that no hidden candidate theorem escapes the generic membership/cache collapse.
