# Research Question Card — MLPerf inferred-scenario ranking validity

- Card ID: `S4-120-QC01`
- Exact public identity: MLPerf Inference Edge rules plus public MLCommons result/test-submission summaries, current as of 2026-08-30.
- Carrier: `CANONICAL_BENCHMARK_ONLY`
- Exact object: same system–benchmark–division–accuracy-version rows with measured SingleStream and measured MultiStream/Offline results.
- Contribution type: `BENCHMARK_DATASET` / `MEASUREMENT_CHARACTERIZATION`
- Claim endpoint: validity and ranking coverage of officially permitted inferred scenario metrics.
- Counterfactual: benchmark consumers must distinguish inferred from measured rankings or apply a validated error condition if formulas cause material error/rank reversal.
- Non-generic discriminator: the audit targets three exact MLPerf formulas and their cross-scenario metric semantics, not generic benchmark realism.
- Current locus: `mlcommons/inference_policies/inference_rules.adoc`; public result summaries expose scenario, result, system metadata, version, power and `inferred` fields.
- Known direct fatal: none found within bounded first-party/paper search.
- Minimum falsifier: on every eligible measured pair, formula error is within 2% and no material cross-system rank reversal occurs under bootstrap/held-out stability checks.
- Initial full-cost boundary: result metric, scenario, accuracy contract, system identity/configuration, power flag, version, measured/inferred status, missing-pair selection.
- Closure debt: exact eligible-pair count and cross-version coverage, owned by Stage0/StageA preclaim; finite deterministic parse of public summaries.
- Disposition: `EVIDENCE_QUALIFIED_RAW`
- Claim ceiling: canonical MLPerf benchmark validity only; no natural-deployment extrapolation.
