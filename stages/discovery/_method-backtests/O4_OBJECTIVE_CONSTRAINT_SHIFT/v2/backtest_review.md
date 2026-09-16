# Discovery method v2 backtest review — O4

Role: `DISCOVERY-BACKTEST-AUDITOR` (independent of PACKER and EXECUTOR).

## Seal and isolation audit

- The four declared file hashes match the PACKER and EXECUTOR handoffs.
- Three positives and one negative have cutoff-valid visible inputs; no revealed target title is in the sealed corpus.
- The executor handoff attests to sealed-only isolation, no auditor-key/raw-source/post-cutoff reads, no target search, and no calibration verdict. No contrary local evidence was found.

## Revealed-anchor comparison

| Packet | Audit finding |
|---|---|
| S4-POS-01 (Dynamo) | Reasonably recovered availability/durability/consistency as the changed contract and quorum, replication, conflict, and recovery choices. It is less specific than the key on version vectors/hinted handoff, but preserves the required decision structure. |
| S4-POS-02 (Shenango) | Reasonably recovered burst-sensitive tail-SLO/CPU-efficiency pressure and fast core allocation/revocation decisions with reallocation costs and sustained-load falsifier. |
| S4-POS-03 (Clockwork) | Reasonably recovered predictability/isolation rather than mean throughput, and admission/reservation/scheduling choices with SLO and utilization-cost evidence. |
| S4-NEG-01 | Correctly abstained because the objective and constraints remain fixed and only mature tuning is exposed. |

## Verdict

`CALIBRATED`

Three reasonable recoveries, correct negative abstention, and no decisive leakage satisfy the minimum contract. This is not an authorization to formulate candidates or advance work to Stage 0.
