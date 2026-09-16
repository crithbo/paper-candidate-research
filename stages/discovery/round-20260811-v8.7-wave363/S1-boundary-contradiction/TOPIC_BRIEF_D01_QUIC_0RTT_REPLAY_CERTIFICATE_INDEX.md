# Topic brief — QUIC 0-RTT replay-certificate index

**Status:** `PROPOSE_STAGE0` / `FINITE_FIDELITY_GAP`  
**Contribution:** N2, target-specific replay-certificate index and certified decision algorithm.

## Frozen research object

For one pinned QUIC stack and TLS backend, preserve the same endpoint, resumption tickets, transport parameters, 0-RTT HTTP request trace, and observable accept/reject behavior. The security contract is unchanged: duplicate/replayed early data cannot be accepted. The comparison keeps the same authenticated ticket and packet information, time/lifetime assumptions, and backend capabilities.

## Mechanism and baseline

The proposed whole action is a certificate construction over ticket epoch, authenticated identity, and fixed QUIC context, with deterministic expiry and membership decision. It may use already legal storage/lookup actions but must supply a non-generic exact/FPT/approximation guarantee. The strongest executable union to close is the selected TLS backend's stock anti-replay/early-data interface plus ngtcp2's resumption, token and transport-parameter path. A callback selector, retry policy, generic cache, wrapper, or a changed threat model is not a contribution.

## Fidelity plan and killer

Within Stage0, pin source commits, list every default and non-default early-data/anti-replay entry, and freeze a first-use/replay pair with TLS/QUIC acceptance logs. Search direct primary collisions on that exact union. Within StageA, use public ngtcp2 examples/tests, transcript/packet trace and server logs; include code/RSS, certificate bytes, lookup/crypto CPU, latency, acceptance and duplicate-rejection costs. Kill the topic if stock union is equivalent, the action reduces to a backend configuration/callback, or the proof needs changed semantics.

## Claim ceiling

Only conditional structural potential is claimed. Current absence, implementation feasibility, performance gain and novelty remain `SEARCH_BOUNDED_OPEN` pending the finite closure.
