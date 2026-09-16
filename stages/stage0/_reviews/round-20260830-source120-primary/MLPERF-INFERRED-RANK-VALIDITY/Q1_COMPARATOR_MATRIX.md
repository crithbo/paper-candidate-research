# MLPERF-INFERRED-RANK-VALIDITY Q1/Q2 Paper Calibration

- Stage: `STAGE0`
- Candidate venue family: `ACM TOS / PVLDB / benchmark-governance and performance-evaluation venues`
- Calibration status: `PARITY_CONDITIONAL`
- Quality tier: `TIER_B_Q2_VIABLE`
- Search/cutoff date: `2026-08-30`

## Reference set

| Role | Paper | Venue/status | Read scope | Why selected |
|---|---|---|---|---|
| CONTRIBUTION_SHAPE_ANCHOR | MLPerf Inference Benchmark | peer-reviewed systems benchmark paper | abstract/scenario/method | defines four canonical scenarios and evaluation contract |
| EVALUATION_ANCHOR | MLPerf Training Benchmark | peer-reviewed benchmark-governance paper | abstract/multi-round analysis | calibrates public multi-round dataset and benchmark-evolution evidence |
| DOMAIN_NEIGHBOR | Performance Characterization of Quantization for DNN Inference on Edge Devices | peer-reviewed/extended characterization | abstract | uses MLPerf Edge scenarios across frameworks/platforms |
| BOUNDARY | MLCommons Inference Rules/Audit Guidelines | official normative source | relevant scenario/formula/audit sections | defines the exact formula and metric semantics; not novelty evidence |

## Decision

- Quality tier: `TIER_B_Q2_VIABLE`
- Status: `PARITY_CONDITIONAL`
- Closed gaps: exact object, official formulas, versioned carrier, reproducible parser route, strong baseline and falsifier.
- Executable next gaps: eligible pair count, error/reversal statistics, held-out release stability.
- Human/resource gaps: none decisive.
- Q1 gaps: general replacement estimator, broader governance result and independent replication.
- Invalidating gap: too few exact measured pairs or no material stable validity failure.

