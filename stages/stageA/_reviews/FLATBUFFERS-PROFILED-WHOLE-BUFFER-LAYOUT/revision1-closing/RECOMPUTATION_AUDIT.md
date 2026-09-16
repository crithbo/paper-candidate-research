# Independent Recomputation Audit

## Method

This audit used read-only parsing of the frozen revision package. It did not invoke the candidate runner, modify owner artifacts, or generate new claim-bearing observations. Owner summaries were treated as claims to reproduce from raw tables and scripts.

## Package integrity

- Owner manifest self hash: `72A84CA17702E0519DB3C4681E5F2075EBAD58EC3E070E43A1E42040E01EDDD9`
- Entries recomputed: `94/94 PASS`
- Missing/mismatched entries: `0/0`
- Covered bytes: `5,557,846`

## Trace provenance

Independent table checks found:

- 11 training model identifiers in the trace and request program;
- exact equality with the manifest's 11 `train` identifiers;
- zero overlap with the 13 held-out identifiers;
- 704 request-program rows, with request ordinals 0 through 63 for each training model;
- 23,936 trace-event rows over 34 endpoints;
- 34 endpoint weights whose sum is 23,936;
- each endpoint occurs exactly 704 times, and each recorded event count equals its planner weight.

The trace-generation script filters the corpus manifest to `train`, asserts the 24/11 split, iterates those 11 files, and refuses to proceed if revision result artifacts already exist. Static path review found no read of initial results and no held-out model input.

## Preclaim ordering

- Final gate status: `PASS`.
- Claim-bearing rows before gate pass: `0`.
- Suppressed-objective arm probes: `8/8` eligible with one canonical digest.
- Scientific revision marker: first model `00_quantize_quantize0`, eight eligible rows, timestamp `2026-08-11T09:34:45.650613+08:00`.

The natural runner checks the gate before a natural model is accepted and writes the revision-consumption marker only after the first model's eight eligible rows. The fidelity correction therefore precedes evidence consumption.

## Raw natural-result table

The raw table has 192 rows: 24 models and exactly eight frozen arms per model. All 192 rows pass eligibility, reader verification, canonical equality, file-identifier, and alignment checks. Each model has a single canonical digest across all arms.

Split cardinality is 11 training and 13 held-out models. No unknown or duplicate arm was observed.

## Useful-action recomputation

| Split | Numerator | Denominator | Fraction |
|---|---:|---:|---:|
| train | 0 | 383 | 0% |
| held-out | 0 | 763 | 0% |
| all | 0 | 1146 | 0% |

The frozen success threshold is at least 10%. The failure margin is therefore ten percentage points, not a rounding boundary. Candidate diagnostics also show 700 distinct-raw merges, 153,197 expanded transitions, strict merges on 23/24 models, and two fallbacks; the zero numerator is not caused by the mechanism never attempting a merge.

## Primary residual recomputation

For each held-out model, I selected the best eligible executable comparator under each primary metric and computed `(candidate / comparator - 1) * 100`. Positive means the candidate is worse.

| Metric | p50 | p90 |
|---|---:|---:|
| raw serialized bytes | +1.376146789% | +1.936582252% |
| warm traced wall time | +0.795947902% | +4.024972379% |
| cold traced wall time | +0.925277291% | +1.912882837% |

The success rule requires a negative residual at both p50 and p90 for at least one primary byte/access metric. None qualifies.

## Pareto reconstruction

Candidate whole-vector frontier membership is 15/24 overall and 9/13 held-out. Independent aggregate-frontier membership matches the frozen analyzer:

- p50 includes `fb_rcfdp_bounded`, `generated_pack_default`, `hot_first_ready`, `local_field_order`, `stable_dedup_off`, `stable_legal_topo`, and `stable_size_matched_capacity`;
- p90 includes `fb_rcfdp_bounded`, `generated_pack_default`, `generic_bounded_beam`, `hot_first_ready`, `local_field_order`, `stable_dedup_off`, and `stable_size_matched_capacity`.

This is not contradictory. Pareto membership is a full-vector property; the contract separately requires primary byte/access improvement and at least 10% useful actions. The analyzer implements that conjunction.

## Reproducibility assessment

The reported replay and stable artifact checks are consistent with the manifest and table cardinalities. Arithmetic and selection logic were independently reconstructed without relying on the rendered owner report. No material direction, percentile, denominator, or split error was found.

## Audit conclusion

Both scientific STOP kernels reproduce exactly enough to be decision-stable:

- useful residual: `0/1146 < 10%`;
- held-out primary benefit: none at both p50 and p90.

Result: `CONFIRM_STOP`, narrow to the frozen mechanism and corpus/trace contract.
