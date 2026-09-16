# Discovery method v2 backtest review — O1/O6

Role: `DISCOVERY-BACKTEST-AUDITOR` (independent of PACKER and EXECUTOR).

## Seal and isolation audit

- The manifest, sealed packet, auditor key, and executor output hashes match the PACKER and EXECUTOR handoffs.
- The sealed packet contains four packets (three positive, one negative); all listed visible inputs precede their packet cutoff. No hidden-target title appears in any sealed packet.
- The executor attests to reading only `sealed_packets.yaml`, not reading the auditor key/raw Discovery sources or post-cutoff material, and rendering no calibration verdict. No contrary local evidence was found.

## Revealed-anchor comparison

| Packet | Audit finding |
|---|---|
| S1-POS-01 (FlashAttention) | Reasonably recovered the exact-attention, hierarchy-I/O problem, block/online-normalization decisions, N2 route, and HBM/exactness evidence. It does not name the lower-bound form, but does not need to for a reasonable pre-target recovery. |
| S1-POS-02 (PagedAttention) | Reasonably recovered non-contiguous dynamic-state allocation, mapping/reclamation, admission interaction, and a memory/latency/metadata ledger. Copy-on-write is not explicit, a non-decisive omission. |
| S1-POS-03 (Learned Index Structures) | Reasonably recovered distribution-to-position prediction with bounded correction/fallback, N1 representation, and update/drift/worst-case evidence. |
| S1-NEG-01 | Correctly abstained: it identifies only mature GEMM tile/launch tuning and supplies no new causal mechanism. |

## Verdict

`CALIBRATED`

All three positives reasonably recover a distinct problem shape and decision structure rather than merely restating a limitation. The negative control abstains, and no decisive leakage or packet-integrity failure was found. This verdict calibrates the O1/O6 discovery method only; it creates no candidate, headroom, novelty, feasibility, score, or Stage 0 authorization.
