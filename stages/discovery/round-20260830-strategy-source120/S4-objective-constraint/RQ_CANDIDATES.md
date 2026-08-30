# Source120 S4 RQ Convergence

Exact carrier was frozen first in `EXACT_CARRIER_PORTFOLIO.md`.

## Primary RQ — MLPerf Edge inferred-scenario ranking validity

For identical public MLPerf Edge system–benchmark submissions that contain measured SingleStream and measured MultiStream/Offline results, how accurately do the officially permitted SingleStream→MultiStream/Offline inference formulas preserve metric values and cross-system rankings under the same accuracy/model contract?

- Exact object: MLPerf Inference Edge scenario results under the current official rules.
- Contribution type: `BENCHMARK_DATASET` with `MEASUREMENT_CHARACTERIZATION` support.
- Claim endpoint: benchmark validity/coverage, limited to canonical MLPerf rankings.
- Immutable guarantee: same submission system, benchmark, division, accuracy target and result version; inferred and measured metrics are never mixed silently.
- Counterfactual: if inferred formulas produce material value error or ranking reversals, benchmark consumers should distinguish inferred from measured scenario rankings or require a bounded validation condition.
- Minimum falsifier: across all eligible same-system measured pairs, inference error is small under a preregistered tolerance and no statistically/materially meaningful ranking reversal occurs.
- Full-cost boundary: public result metric, scenario, accuracy, power flag, system configuration and inference status; no natural-deployment extrapolation.
- Precommitted source route: current official MLPerf rules, official result/test-submission summaries, then exact prior-paper search.
