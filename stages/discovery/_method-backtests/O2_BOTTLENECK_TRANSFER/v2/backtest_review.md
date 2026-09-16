# Discovery method v2 backtest review — O2

Role: `DISCOVERY-BACKTEST-AUDITOR` (independent of PACKER and EXECUTOR).

## Seal and isolation audit

- Hashes of the manifest, sealed packet, auditor key, and executor output match both handoffs.
- The sealed corpus has three cutoff-valid positives and one cutoff-valid negative; hidden target titles are absent from every sealed packet.
- EXECUTOR's sealed handoff attests to sealed-packet-only reading, no auditor-key/raw-source/post-cutoff reading, and no self-calibration. No contrary local evidence was found.

## Revealed-anchor comparison

| Packet | Audit finding |
|---|---|
| S2-POS-01 (ZeRO) | Reasonably recovered replicated state as the transferred bottleneck and state-class partitioning/communication decisions with memory, communication, scaling, and equivalence evidence. It labels N2 primary where the key labels N1, but the mechanism itself is recovered. |
| S2-POS-02 (Dark Silicon) | Reasonably recovered the voltage/power-to-active-area bottleneck transfer and the area/power/core/workload decision model. The contribution-route wording is broader than the key's N3 emphasis, but the structural route is explicitly retained. |
| S2-POS-03 (Eyeriss v2) | Reasonably recovered compact/sparse network pressure on delivery, metadata, interconnect, and utilization, with configurable dataflow decisions and layer-wise falsifiers. |
| S2-NEG-01 | Correctly abstained: measurement vocabulary without a prior-to-new regime transition is not a bottleneck transfer. |

## Verdict

`CALIBRATED`

The three positive shapes are reasonably recovered, the control is not force-packaged, and there is no decisive leakage or integrity failure. This is method calibration only; it is not evidence for any new candidate or execution authorization.
