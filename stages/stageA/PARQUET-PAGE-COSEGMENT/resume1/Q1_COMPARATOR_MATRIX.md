# PARQUET-PAGE-COSEGMENT Q1/Q2 Comparator Matrix

- Stage: `STAGEA`
- Candidate venue family: analytical data systems / database storage and formats
- Calibration status: `PARITY_NOT_PLAUSIBLE`
- Quality tier: `BELOW_Q2_STOP`
- Cutoff inherited from frozen Stage0 package: `2026-08-09`

## Reference set

| Role | Frozen reference | Calibration use |
|---|---|---|
| Contribution/evaluation anchor | Liu et al., *Data formats in analytical DBMSs: performance trade-offs and future directions*, VLDB Journal 2025 | Requires broad natural, format-aware, full-cost evidence beyond codec/page microbenchmarks. |
| Native execution anchor | Shaikhha et al., *Apache Arrow DataFusion: A Fast, Embeddable, Modular Analytic Query Engine*, SIGMOD 2024 | Requires an unmodified current engine path and reproducible end-to-end semantics. |
| Method genealogy | Kimura et al., *Compression Aware Physical Database Design*, PVLDB 2011 | Subtracts generic workload-aware joint compression/physical-design framing. |
| Decisive current baseline | Current Arrow/Parquet CDC, WriterProperties, PageIndex and DataFusion late materialization | Subtracts generic nonuniform pages and requires a residual outside a complete current native family. |

No new literature or current-upstream claim was introduced during resume1.

## Comparator matrix

| Dimension | Candidate observation | Anchor requirement | Gap | Disposition |
|---|---|---|---|---|
| Problem importance | Parquet page layout remains relevant. | Broad analytical-format consequence. | Importance alone does not yield a result. | Retained context only. |
| Contribution type | Nontrivial global DP constructs legal layouts. | Stable N2 mechanism with directional natural benefit. | Natural useful residual is 7.8358%. | FAIL. |
| Nearest-prior delta | Outside selected fixed/CDC union actions exist. | Surviving action must yield end-to-end residual. | Action divergence does not translate to query/full-cost support. | FAIL. |
| Algorithm substance | Deterministic file-level budgeted allocation. | Reusable model/guarantee plus robust benefit. | Stage A validates execution, not a publishable guarantee. | Insufficient. |
| Baseline fairness | Complete executable fixed-writer + CDC union, same information. | Current strong same-object union. | Closed. | PASS. |
| Natural workload | 20 official NYC TLC monthly files. | Natural, multi-family evidence for Q1; credible same-object evidence for Q2. | Single family and negative directional outcome. | FAIL for paper shape. |
| Full-cost | Planning/write/query/bytes and process resources recorded. | Non-dominated directional residual after all costs. | 126.50x and 130.68x candidate full-cost ratios; 0 strict residuals. | FAIL. |
| Main result/statistics | Double replay; p50 gate 7/20 then 0/20; p90 16/20 both. | Stable p50/p90 improvement. | Threshold and stability fail. | FAIL. |
| Mechanism evidence | 398 outside actions, 126 useful actions. | >=10% useful residual plus end-to-end effect. | 7.8358%. | FAIL. |
| Scale/generalization | 20 files, one public family. | Multiple workload/data families and scale. | Not run; negative killer makes expansion unwarranted. | STOP, not a readiness excuse. |
| Failure boundary | Precisely localized to frozen object/workload/mechanism. | Honest boundary and negative-region reporting. | Closed. | PASS. |
| Reproducibility | Stable projections 20/20; output Parquet hashes 340/340. | Reproducible artifact and exact semantics. | Closed. | PASS. |

## Reviewer-shape assessment

- Editor/venue fit: the topic fits database storage, but the frozen main directional premise is not supported.
- Methodology: same-object, strong-baseline, natural-input, full-cost, and deterministic-replay quality is credible.
- Domain contribution: size-only non-dominance is too small and too costly to sustain the proposed query-performance N2 claim.
- Devil's advocate: replay1 timing alone could be cherry-picked as partially positive; replay2 eliminates that interpretation, and useful-action/full-cost failures are stable.

## Decision

`BELOW_Q2_STOP / PARITY_NOT_PLAUSIBLE` for the narrow frozen mechanism. Reproducibility and fairness gaps closed, but the main result gap is a scientific negative rather than an executable evidence gap. No Stage B expansion is recommended.

