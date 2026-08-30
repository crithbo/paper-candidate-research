# Two-axis v8.2 independent audit

- Role: `DISCOVERY-BACKTEST-AUDITOR`
- Audit date: 2026-08-09
- Scope: frozen PACKER inputs and frozen EXECUTOR delivery only; no candidate generation, experiment, or production Discovery.
- Overall verdict: `CONTAMINATION_UNKNOWN`

## Result

The executor's packet-local reasoning is substantively strong: it continued all 18 positives, abstained on all 12 negatives, and continued all six `evidence_incomplete_but_finite_route` positives without treating unacquired implementation, measurement, deployment, or proof as a structural stop. It did not merely repeat an input limitation: every positive contains a residual, object boundary, finite baseline register, evidence route, claim ceiling, and atomic gate.

That does **not** permit calibration. Three positive targets were already public at their declared cutoff: `L5-P01` (2001-09-11 <= 2003-12-31), `L5-P03` (2013-04-14 <= 2015-12-31), and `L6-P02` (2017-04-08 <= 2017-12-31). These are invalid historical holdouts. Further, neither sealed input provides the per-source frozen publication record or byte snapshot required to independently recompute the source-level cutoff/byte-hash chain; `auditor_key.yaml` supplies target provenance only. Consequently leakage cannot be ruled out for any lens, and the three identified violations independently invalidate L5 and L6.

## Per-lens decision

| Lens | Content recovery (R/P/M) | Negative abstention | Cutoff status | Verdict |
|---|---:|---:|---|---|
| O1/O6 boundary/contradiction | 1/1/1 | 2/2 | declared target dates post-cutoff; source chain unavailable | `CONTAMINATION_UNKNOWN` |
| O2 bottleneck transfer | 3/0/0 | 2/2 | declared target dates post-cutoff; source chain unavailable | `CONTAMINATION_UNKNOWN` |
| O3 natural structure | 3/0/0 | 2/2 | declared target dates post-cutoff; source chain unavailable | `CONTAMINATION_UNKNOWN` |
| O4 objective/constraint shift | 3/0/0 | 2/2 | declared target dates post-cutoff; source chain unavailable | `CONTAMINATION_UNKNOWN` |
| O5 scale/online/approximation | 3/0/0 substantive only | 2/2 | P01 and P03 target pre-cutoff | `CONTAMINATION_UNKNOWN` |
| O7 direct algorithm/software | 3/0/0 substantive only | 2/2 | P02 target pre-cutoff | `CONTAMINATION_UNKNOWN` |

`L1-P02` is the one substantive omission: the executor recovered a lineage-driven reconstruction opportunity, whereas the unveiled target is *Dryad*, whose central recovered object is a distributed data-parallel execution graph rather than the stated reconstruction/lineage residual. `L1-P03` is partial: the response catches the external-consistency decision family but not the specific 2017 SQL-system contribution. The other 16 packet-level target shapes are reasonable broad recoveries. Thus the content-only count is 17 reasonable recoveries (including one partial) of 18, 1 omission, and 0 false opportunities/over-packaged negatives; this count is not a calibration pass.

## Negative controls and two axes

All 12 structural negatives received `ABSTAIN`; none was continued, so false opportunities and forced packaging are both 0. The 12 reasons agree with the sealed modes: 3 selector absorption, 3 ordinary tuning, 3 undefined same-object/fairness, 2 no finite evidence route, and 1 no novelty route. All six finite-but-unacquired positives (`L1-P02`, `L2-P02`, `L3-P02`, `L4-P01`, `L5-P02`, `L6-P02`) were continued with `FINITE_ROUTE_NOT_YET_ACQUIRED`; none was structurally stopped merely for missing results. L6-P02 remains an invalid holdout despite that correct two-axis treatment.

## Executor report count discrepancy

`EXECUTOR_REPORT.md` says “ten negative controls,” but the sealed manifest has 12 and `EXECUTOR_RESULTS.yaml` contains 12 abstentions. The report's subsequent category arithmetic (5 + 3 + 2 = 10) omits two ordinary-tuning negatives (`L1-N02`, `L6-N01`). This is a narrative counting error, not a result-completeness error: the canonical frozen result has one entry for each of all 30 manifest packets and both omitted-in-prose negatives are present and abstained. It is reported here without modifying executor material.

## Primary-source target verification

Unveiled identities and target dates were checked only against the canonical venue/DOI records in `packer/auditor_key.yaml`, including official USENIX, VLDB, NeurIPS, IEEE, and DOI landing records. The decisive cutoff comparisons above use the frozen key's publication dates; source-level pre-cutoff provenance could not be independently checked because its promised frozen records were absent.

## Required disposition

Do not promote this method revision as calibrated. Re-pack a fresh, genuinely pre-publication split for every affected lens, include immutable per-source publication metadata and byte hashes/snapshots, and use a new executor. This audit creates no candidate or research claim.
