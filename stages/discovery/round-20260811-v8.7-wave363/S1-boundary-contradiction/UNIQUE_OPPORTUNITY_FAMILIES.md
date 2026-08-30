# Unique opportunity families

| ID | Exact object / guarantee | Proposed complete action shape | Admission status |
|---|---|---|---|
| D01 | A fixed QUIC server, TLS 1.3 resumption ticket set, transport parameters and 0-RTT HTTP request trace; accepted early requests must satisfy the existing at-most-once/replay-safety contract. | N2: a QUIC-ticket/epoch/transport-parameter-aware replay-certificate index that jointly chooses certificate representation, expiry partition and lookup proof; the action is not retry, routing or generic batching. | `PROPOSE_STAGE0` with `FINITE_FIDELITY_GAP` |

The stock two actions to close in Stage0 are accept a valid first presentation versus reject an already-seen/replayed presentation. Their different publication outcome is native to 0-RTT; the proposed contribution is the certificate-index algorithm under the fixed reject-duplicate safety guarantee, not changing protocol semantics.
