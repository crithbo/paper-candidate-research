# Corrected Stage A results

## Owner outcome

`STOP_RECOMMENDED__OWNER_NONFINAL` / `BELOW_Q2_STOP`.

This is a narrow owner recommendation for the frozen trace-profiled mechanism and must be checked by the independent Stage A gate. Stage B remains unauthorized.

## Revised fidelity gate and revision use

- Final revised preclaim gate: `PASS` before any corrected objective row.
- Training profile: 11 frozen training models, 704 native request descriptors, 23,936 ordered generated-reader events and 34 logical endpoints; freeze SHA-256 `4F6B2CE063D1FFA31B249DB3379ECB83BF46AA9116A189ACC6371706A5F2F832`.
- Leakage controls: held-out files opened during trace derivation `false`; initial result files opened `false`; reference offsets used `false`.
- The preregistered request program touches every mapped endpoint once per request on this training corpus, so all 34 observed endpoint counts are `704`. This uniform observed profile is disclosed, not retuned.
- Collector/replay parity: 64-request checksum `15,744` on the preclaim carrier; 19 positive mapped graph fields and applied weight sum `13,376`.
- Small witness: unchanged native 56-byte plans, profile distances `20` versus `36`, PASS.
- Tiny ceiling: unchanged 1,136 legal native paths, 148 unique buffers and exact candidate/exhaustive frontier equality, PASS.
- Suppress-objectives arm check: 8/8 eligible, one canonical digest, zero objective rows.
- Scientific revision consumed: `true`, at `2026-08-11T09:34:45.650613+08:00` on the first accepted corrected eight-row model.

## Natural same-object execution

- Frozen corpus: unchanged 24 official TFLite Micro models, 11 train / 13 held-out by family.
- Frozen arms: unchanged 8 per model; 192 rows.
- `eligible=verify=equality=identifier=alignment=1`: `192/192`.
- Within-model canonical digest disagreement: `0/24`.
- Candidate fallback: `2/24`, both included in the denominator and full-cost vector.

## Mechanism and useful residual action

The quotient remains nonvacuous: the candidate encountered `700` distinct-raw prefix merges over `153,197` expanded transitions, with a strict merge on `23/24` models. But the preregistered useful residual numerator is `0`:

| Stratum | Useful candidate actions | Candidate selected transitions | Fraction |
|---|---:|---:|---:|
| train | 0 | 383 | 0% |
| held-out | 0 | 763 | 0% |
| all | 0 | 1,146 | 0% |

The frozen threshold is `>=10%` overall. A candidate transition receives credit only at a strict quotient state, with at least one B0/B1/B2 path at the same completion set, and only when its next node/field variant differs from every such comparator continuation. Fallback transitions receive zero numerator credit. The `0%` result is therefore not the old merge-incidence proxy.

Candidate and generic bounded-beam plan hashes are identical on `11/24` models; equality with stable/config paths occurs on only `2/24`. The absence of useful credit is a state-conditioned absorption result, not a claim that every final plan byte image is identical.

## Paired primary residuals

Each value is candidate minus the best eligible comparator for the same model, divided by that comparator. Positive is worse. Coordinate-wise minima are used only for these paired scalar residuals, never as an executable Pareto point.

| Split/metric | p50 | p90 |
|---|---:|---:|
| train raw bytes | +2.000% | +3.846% |
| train trace warm latency | +0.806% | +5.115% |
| train trace cold latency | +1.069% | +2.198% |
| held-out raw bytes | **+1.376%** | **+1.937%** |
| held-out trace warm latency | **+0.796%** | **+4.025%** |
| held-out trace cold latency | **+0.925%** | **+1.913%** |

No primary metric is better at both held-out p50 and p90. The corrected access metric is the frozen profile-matched native generated-reader replay, not `ReaderChecksum` or weighted address distance.

## Whole-executable-arm Pareto frontier

The true frontier uses one complete vector per executable arm: raw bytes, trace warm/cold wall and CPU, end-to-end construction wall/CPU, peak RSS, total temporary bytes and fallback. No coordinates are spliced across arms.

- Held-out p50 frontier: `fb_rcfdp_bounded`, `generated_pack_default`, `hot_first_ready`, `local_field_order`, `stable_dedup_off`, `stable_legal_topo`, `stable_size_matched_capacity`.
- Held-out p90 frontier: `fb_rcfdp_bounded`, `generated_pack_default`, `generic_bounded_beam`, `hot_first_ready`, `local_field_order`, `stable_dedup_off`, `stable_size_matched_capacity`.
- Candidate per-model frontier membership: `15/24` overall and `9/13` held-out.

Candidate frontier membership does not qualify the mechanism: the frozen rule forbids cost/noise-only nondominance and separately requires a real byte or trace-access primary benefit at both held-out p50 and p90. That required benefit is absent.

## Corrected killers

Two independently sufficient frozen killers fire after a valid corrected run:

1. `USEFUL_RESIDUAL_ACTION_FRACTION_BELOW_10_PERCENT`: `0/1,146`.
2. `NO_HELDOUT_P50_AND_P90_RAW_BYTE_OR_PROFILE_TRACE_ACCESS_RESIDUAL`: all six held-out paired summaries are adverse.

The candidate happens to remain on the high-dimensional aggregate p50 and p90 full-cost frontiers, so no false claim is made that one comparator arm dominates it on every dimension. The scientific STOP is supported by the missing useful action coverage and missing primary residual, not by the old hard-coded nondominance flag.

## Mechanical recomputation

`scripts/audit_corrected_results.py` independently re-parsed the raw CSV and reproduced:

- 192 rows / 24 models / 192 eligible;
- useful fraction `0/1,146`;
- all six held-out paired p50/p90 deltas;
- both held-out aggregate whole-arm frontier sets.

Result: `results/recomputation.json`, SHA-256 `18644A13AEB65393C6CB1AE5AA84BAB7A71F4D2A7F746BE22C978BFF0EBB25AC`.

## Claim boundary

Supported: under the frozen 704-request training trace, same-object native implementation, 24-model corpus, 8-arm union and registered full costs, FB-RCFDP has nonvacuous quotient merges but zero useful residual-action coverage and no held-out p50/p90 byte or matched-trace access residual.

Unsupported: impossibility for other request traces, other FlatBuffers schemas/corpora, other mechanisms, population-wide TFLite behavior, hardware cache-miss claims, or any final status before independent gate/mainline acceptance.

Evidence ceiling: `CORRECTED_TRACE_PROFILED_SAME_OBJECT_24_MODEL_STAGEA_NEGATIVE__OWNER_NONFINAL`.
