# Discovery method v2 backtest review — O7

Role: `DISCOVERY-BACKTEST-AUDITOR` (independent of PACKER and EXECUTOR).

## Seal and isolation audit

- The manifest, sealed-packet, auditor-key, and executor-output hashes match all declared values.
- The sealed inventory is three cutoff-valid positives and one negative, and no revealed target title occurs in sealed packet text.
- EXECUTOR attests to reading only sealed packets and not auditor keys/raw Discovery/post-cutoff material, identifying targets, or rendering calibration. No contrary local evidence was found.

## Revealed-anchor comparison

| Packet | Audit finding |
|---|---|
| S6-POS-01 (Halide) | Reasonably recovered same-semantics algorithm/schedule separation and the fusion/tiling/storage/recomputation/vectorization decision space, with portable same-output evidence. |
| S6-POS-02 (Ansor) | Reasonably recovered the expressiveness-versus-search-cost problem and sketch generation, search, learned costing, and cross-task budget decisions. |
| S6-POS-03 (Ambit) | Reasonably recovered channel-bound bulk Boolean computation and DRAM row/command/temporary-state choices, including reliability/timing and modeled-evidence boundaries. It is less explicit about ordinary-memory preservation, but the core decision structure is present. |
| S6-NEG-01 | Correctly abstained: renamed LRU plus a baseline-exposed capacity setting contains no algorithmic delta. |

## Verdict

`CALIBRATED`

All three positives reasonably recover the nontrivial same-function mechanism, the negative is not forced, and no decisive integrity or leakage issue was observed. This is strictly a discovery-method calibration and does not establish any new paper claim, candidate, novelty, headroom, feasibility, or execution permission.
