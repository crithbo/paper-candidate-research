# QUIC-0RTT-REPLAY-CERTIFICATE-INDEX — independent Stage 0 confirmation

## Verdict

- Assignment: `STAGE0-C2-20260811-QUIC-0RTT-REPLAY-CERTIFICATE-INDEX-CONFIRM-V8.7`
- Decision: `CONFIRM_STOP`
- Tier: `BELOW_Q2_STOP__BACKEND_ANTI_REPLAY_INDEX_OR_GENERIC_CACHE`
- Scientific revision: not allowed; no union-external atomic gate was identified.
- StageA/B: `false` / `false`
- Evidence ceiling: current official source/RFC and static same-object audit only; no attack traffic, implementation, benchmark, or result was used.

## Frozen-input integrity

The assigned hashes match: `AGENTS.md` `66231F71EF6AB250A1AD9FF576D5840978F09EFC03BF5D2F0527D47F4D82B063`, `plan.md` `41DA0FA8FEB2E2A0EC2D80129686BFD5C64C0F2D9D1AD02BC5806BFDFED06E08`, `registry.yaml` `340DB5BBB8647009282AC54C3842E185EC82E0223B890F018EA03C46842AF6C0`, and `ROLE_STAGE0_REVIEW.md` `741EC3544797FF8A5BF337E1E3448B5F683823E5229F818F162834400581626E`. The frozen PRIMARY package matches its supplied `4/4` hashes.

## Independent attack

### Same endpoint: direct backend absorption

OpenSSL documents automatic TLS 1.3 anti-replay when a server enables early data. Its mechanism is an internal server session cache: a ticket is added when issued; a resumption is accepted only while present; the cache entry is removed on first use; subsequent attempts fall back to a full handshake. `SSL_OP_NO_ANTI_REPLAY` is the explicit opt-out. The allow-early-data callback, where applicable, does not bypass this protection unless it is explicitly disabled. This is the candidate's ticket-identity, membership, expiration and first-use decision at the same backend decision boundary, not merely a comparable baseline.

The candidate cannot recover a residual by adding epoch, certificate or QUIC context to the cache key. If ticket-wide at-most-once acceptance remains the security predicate, context is redundant: the first accepted ticket must remove/reject it for every context. If each `(ticket, context)` can be accepted independently, the candidate has weakened that predicate. If the added fields only alter table layout, expiry, lookup or callback/controller policy, the method is a generic membership/expiry cache.

### QUIC and RFC boundary

ngtcp2 documents 0-RTT as resumption using a saved TLS session ticket together with remembered QUIC transport parameters. It documents tokens separately as address-validation artifacts. RFC 9001 likewise requires the 0-RTT inputs to come from the same connection and distinguishes application-data replay risk from QUIC transport behavior. RFC 8446 makes single-use session tickets a basic stateful anti-replay defense; RFC 9001 leaves application semantics and distributed deployment policy outside the one-endpoint TLS/QUIC object.

Thus a ticket-plus-transport-parameter index has no separate server duplicate-acceptance identity. Binding a token/transport context cannot turn address validation into a new TLS replay theorem. Moving to HTTP/application replay semantics or a shared multi-node cache changes the threat/deployment object, which is prohibited for this ID.

### API nuance does not create a residual

OpenSSL's current documentation notes that `SSL_read_early_data` and the allow-early-data callback are unavailable on OpenSSL-owned QUIC SSL objects, while a third-party QUIC TLS integration has its own QUIC TLS callbacks. This narrows the exact wrapper wording from PRIMARY, but not the decision: either the frozen ngtcp2/OpenSSL integration uses the documented TLS stateful-ticket path, in which case the automatic cache directly absorbs the index, or a QUIC-specific API omits that callback, in which case the callback cannot be claimed as a new candidate action. No evidence supports a distinct QUIC context-index action under the frozen endpoint contract.

## No lawful revision

The complete same-object union—automatic OpenSSL stateful anti-replay, its default/non-default control, any available accept policy callback, and ngtcp2 ticket/transport-parameter path—already contains the claimed membership decision. The candidate names neither a non-product action nor a target-specific proof obligation/guarantee. An exhaustive or faster cache, Bloom filter, epoch rotation, storage structure, or controller timing remains generic cache engineering. Therefore no finite atomic Stage 0 revision can repair this ID without changing the security predicate or research object.

`CONFIRM_STOP` follows from positive direct current-source absorption, not missing implementation, natural results, resources, or bounded-search absence. `SEARCH_BOUNDED_OPEN` remains only for a different future research object; it cannot reopen this ID.
