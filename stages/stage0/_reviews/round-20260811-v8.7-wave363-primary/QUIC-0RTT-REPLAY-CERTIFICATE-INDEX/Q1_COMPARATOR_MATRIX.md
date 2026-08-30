# Q1/Q2 comparator matrix

| Comparator / contribution shape | Object and guarantee | Relationship to candidate | Result |
|---|---|---|---|
| OpenSSL automatic TLS 1.3 anti-replay | Same backend ticket, early-data accept/reject and stateful cache | Directly implements ticket single-use rejection | Absorbs certificate-index kernel |
| OpenSSL allow-early-data callback | Same decision point and input | Candidate deployment is a callback/cache policy | Wrapper, not N2 |
| ngtcp2 0-RTT resumption | Same QUIC ticket + transport-parameter path | Supplies actual QUIC carrier; no separate ticket identity | Must remain in union |
| RFC 8446 replay protection | TLS consistent-state boundary | Defines same security floor | Cannot weaken key/acceptance semantics |
| RFC 9001 §9.2 | QUIC requires TLS protections; app semantics separate | Blocks transport-token semantic pivot | Different object if extended |
| CAHP-level systems/security paper shape | New protocol action, non-product theorem, or natural system phenomenon | Brief provides only membership/expiry cache | Q2 parity not plausible |

**Conclusion:** a cache/index result cannot reach Q2 within the frozen same-object contract.  A new research object would need a genuine protocol/system theorem or action beyond the current OpenSSL callback/cache union.
