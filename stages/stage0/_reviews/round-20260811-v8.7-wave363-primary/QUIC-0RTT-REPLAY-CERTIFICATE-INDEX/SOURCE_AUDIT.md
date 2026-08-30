# Source audit and collision log

## Frozen mechanics

| Input | SHA-256 / status |
|---|---|
| plan.md | `B07226380BC4ADBE0E44B11F1EE65727DBD84C6821FF26C7A5B698C5954505D0` — verified at assignment start |
| registry.yaml | `3384355AC482D5B8A71D00611F80F17B007272DA2104AF53E3CB80D04183B9AC` — verified at assignment start |
| ROLE_STAGE0_REVIEW.md | `741EC3544797FF8A5BF337E1E3448B5F683823E5229F818F162834400581626E` — verified at assignment start |
| Discovery brief | `DFEE584C63CE39B3A3F13880241AB77E03754FB84FBAEE5F37C0A58DB0F384B2` |
| Discovery handoff | `3B99034BBDACC4586CFCFA537A50A967FD3ED0567B3E06EE058E80A2D4B29940` |
| Discovery manifest | `5B59DB59584762E1272992D2283778396B488A98B07C9B0037AEDBDCF5760C57` — 8/8 pre-verified |

## First-party current reality check

| Source | Pin / access | Direct finding |
|---|---|---|
| OpenSSL public header `include/openssl/ssl.h.in` | current `6d250710fb8cfd5c9a41af373c0c1ca85ff836c2` | `SSL_OP_NO_ANTI_REPLAY` is explicitly the option to switch off automatic TLS 1.3 early-data replay protection. |
| OpenSSL `ssl/statem/statem_srvr.c` | same pin | With early data enabled and anti-replay not disabled, new tickets take `construct_stateful_ticket`; source states tickets are cached for anti-replay and invokes `ssl_update_cache`. |
| OpenSSL `SSL_read_early_data(3)` and `SSL_CTX_set_options(3)` official docs | current documentation | Server early-data acceptance has allow callback; replay protection defaults on and detects repeated session-ticket use. |
| ngtcp2 README | current `0134a19b63f0a3578a3879a557a8c0bb52d28fdc` | Supported experimental OpenSSL backend; session ticket plus transport parameters drive resumption/0-RTT; token is a distinct address-validation artifact. |
| RFC 8446 §§8, E.5 | IETF standards track | TLS replay defenses/consistent-state boundary and application responsibility. |
| RFC 9001 §9.2 | IETF standards track | QUIC endpoints must use TLS replay protections; tickets/tokens are not application semantics; residual replay is application-protocol concern. |

## Collision conclusion

`DIRECT_CURRENT_SOURCE_ABSORPTION`: the proposed ticket epoch/identity/context certificate is a membership/expiry decision at OpenSSL's exact automatic anti-replay/cache decision point.  No current-source absence is inferred.  The conclusion rests on positive first-party evidence of the same ticket duplicate-rejection mechanism.

## Evidence discipline

No attack traffic, public-server use, benchmark, code modification, experiment, hardware, Stage A or Stage B activity occurred.  RFC and source claims are separated from the inference: the inference is that the candidate has no union-external N2 action/guarantee under the frozen one-endpoint contract.
