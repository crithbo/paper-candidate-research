# S4 Source19 — cross-domain problem-evidence rotation

Assignment `DISCOVERY-S4-20260814-ADAPTIVE-SOURCE19-CROSS-DOMAIN-PROBLEM-EVIDENCE-V3`; canonical v8.7; claim-pack `OFF`; bounded primary-source review dated 2026-08-14.  Network-security, vulnerability, attack/defence, exploit, protocol-security and malicious-traffic families were excluded before locator review.

| Locator / raw | Independent problem-bearing evidence | D1 gate result |
|---|---|---|
| S19-01 `TPCXAI_OPTIONAL_ENERGY_COVERAGE_RANKING_BIAS` | TPCx-AI’s current public result table contains `NR` (not reported) for Watts/AIUCpm across the listed results, while the current specification makes energy reporting optional and defines a full end-to-end workload with audited disclosures.  This is a genuine coverage gap, not a tool claim. | Carrier, stock oracle and audited disclosures exist.  Not frozen: an independent same-run energy validity subtractor for NR systems, a representative result-release panel large enough for a stable coverage law, full acquisition/normalization cost, decision threshold and held-out release/scale split. `NOT_ADMITTED_UNFROZEN__D1_INCOMPLETE`. |
| S19-02 `MLPERF_MOBILE_NPU_LLM_REPRESENTATIVENESS` | MLPerf Mobile v6 introduces on-device LLM cases on TinyMMLU/IFEval and states NPU acceleration support for a declared mobile SoC; it is a new versioned mobile/NPU benchmark object. | Current app/task/model/accuracy union and natural task inputs exist, but no frozen full device-energy/memory/tail estimator, independent validity subtractor, cross-device ranking threshold or held-out device/task split. `NOT_ADMITTED_UNFROZEN__D1_INCOMPLETE`. |
| S19-03 `EEMBC_MLMARK_EMBEDDED_ACCELERATOR_SCORE_COVERAGE` | EEMBC states that MLMark measures embedded inference performance and accuracy and publishes benchmark score material; the workload table records its image-classification/detection carrier. | Published scores do not freeze a versioned, reproducible cross-device result panel, complete energy/tail/memory denominator, independent subtractor or held-out device family. `NOT_ADMITTED_UNFROZEN__D1_INCOMPLETE`. |
| L4 | MLPerf Tiny streaming energy-tail. | `EXCLUDED_SOURCE18_IDENTITY`. |
| L5 | SPECviewperf 15 workload coverage. | `EXCLUDED_SOURCE18_IDENTITY`. |
| L6 | MLPerf Power Edge/Server. | `EXCLUDED_SOURCE17_IDENTITY`. |

Counts: `LOCATOR_EVENT=6`; `FRESH_RAW_EVENT=3`; `PREOUTCOME_D1_COMPLETE=0`; `CANDIDATE_GRADE_DEEP_REVIEW=0`; `STAGE0_BRIEF=0`; `PROPOSE_STAGE0=0`.

## D1 boundary

TPCx-AI is the closest signal: the published table makes energy-reporting coverage visibly incomplete, and its current standard has audited full disclosures, reference-result validation and a defined optional energy denominator.  It nevertheless does **not** establish the unreported systems’ energy, nor an external measurement comparator, so an alleged energy-rank reversal would be fabricated at this point.  MLPerf Mobile and MLMark likewise provide real natural tasks/score material but not the required independent validity comparator and predeclared held-out route.  Since `0 D1 = 0 deep`, no depth review, brief, or outcome-aware replacement was performed.

No non-admission is based on missing implementation, current result, hardware, resources or AI readiness.

## Primary-source record

- TPC, [current TPCx-AI result table](https://www.tpc.org/tpcx-ai/results/tpcxai_last_ten_results5.asp), accessed 2026-08-14.
- TPC, [TPCx-AI 2.0.0 specification](https://www.tpc.org/TPC_Documents_Current_Versions/pdf/TPCx-AI_v2.0.0.pdf) and [current specifications](https://tpc.org/TPC_Documents_Current_Versions/current_specifications5.asp), accessed 2026-08-14.
- MLCommons, [MLPerf Mobile v6](https://mlcommons.org/2026/06/mlperf-mobile-v6/), accessed 2026-08-14.
- EEMBC, [MLMark](https://www.eembc.org/mlmark/) and [benchmark workload table](https://www.eembc.org/products/kernels.php), accessed 2026-08-14.

No experiment, benchmark run, download, install or Stage work was performed.
