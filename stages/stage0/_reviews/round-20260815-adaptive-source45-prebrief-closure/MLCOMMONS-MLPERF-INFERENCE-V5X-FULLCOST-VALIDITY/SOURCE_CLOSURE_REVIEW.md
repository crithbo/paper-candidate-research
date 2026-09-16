# MLCommons MLPerf Inference v5.x full-cost validity — prebrief source closure

## Disposition

`LOCATOR_ONLY__FIXED_ARTIFACT_CANNOT_INSTANTIATE_FROZEN_ESTIMAND`

This is not a Stage 0 STOP or PASS. It does not authorize Stage A/B and makes no novelty, Q1/Q2, ranking-reversal, or natural-deployment claim.

## Outcome-blind freeze

The frozen selection was executed before any performance or quality value was opened:

1. Official repository metadata listed `mlcommons/inference_results_v5.0` and `mlcommons/inference_results_v5.1`; numeric latest stable v5.x was therefore fixed as `v5.1`.
2. A metadata-only repository tree then fixed the lexicographically first datacenter submission path as division `closed`, submitter `AMD`, system `8xMI300X_2xEPYC_9575F`.
3. The selected content address is anchored by repository tree `5ea4f62ef62536e6bf4d78a9b440fb9035ddfb4a`, system-description blob `85bf95624eedc241010fd7561c013b80a70e30ce`, results subtree `4faa6f9281da516eb9ade81d38c7271b1a1d2c24`, and measurements subtree `a8d90aaa19fc2236c36a0c725878a30f33ea77db`.
4. Only after `SELECTION_FREEZE.yaml` was written were the selected result summaries read. No artifact or workload was reselected after observing an outcome.

The recursive result-tree response is globally marked truncated. It nevertheless contains the complete early `closed/AMD/8xMI300X_2xEPYC_9575F` prefix used here; this limits claims to the retained paths and forbids any assertion that the entire repository was exhaustively enumerated.

## Official carrier and schema boundary

The selected public artifact is a real datacenter closed submission with a system description, measurement instructions, performance log summary, accuracy log summary, result subtree and measurement subtree. The retained v5.1 inference tree also identifies the official submission checker and power checker paths. The official v5.1 `Submission_Guidelines.md` states that:

- closed submissions require performance and accuracy runs;
- power is a separate submission path with extra equipment/files and manual-content review;
- checker passage establishes review eligibility, not semantic completeness of every system-description field; and
- reproducibility instructions in submission README files require manual inspection.

Thus the official union validates performance/quality submission structure and optionally validates power submissions. It does not declare setup time, build time, runtime memory, preprocessing/postprocessing time, or energy to be mandatory components of every official score.

## Field availability for the frozen artifact

| Frozen cost/validity field | Evidence in exact artifact | Status for the estimand |
| --- | --- | --- |
| Performance | Official summary contains validity status, throughput and latency/tail-latency fields. | Present, official metric. |
| Quality | Accuracy result directory and official summary are present; retained summary reports checker-level completion without errors. | Present as validation metadata; no broader quality inference. |
| Tail | Percentile latency fields appear in the performance summary. | Present for the fixed result slice. |
| System memory | Host/accelerator capacity and configuration appear in system JSON. | Capacity metadata only; not runtime memory cost. |
| Setup/build | README specifies model/data acquisition, quantization, image build and benchmark commands. | Procedure present; elapsed CPU/wall/RSS/bytes are not reported. |
| Pre/postprocess | Commands identify the harness path. | No separately charged cost vector retained. |
| Energy/power | System power fields are empty and the selected results/measurements prefix has no power path. | Not reported for this artifact; power is optional, not evidence of absence generally. |

No missing or optional field was imputed. The absence statements above are artifact-local path/field observations, not claims about MLPerf generally.

## Why the frozen estimand cannot be instantiated

The estimand asks whether adding declared setup, build, memory, energy and tail costs can materially change a comparative ranking's validity. The fixed object supplies official performance/quality data and one tail component, but it does not supply a commensurate full-cost vector. It also freezes one submission artifact, not an outcome-independent comparison panel with at least two complete full-cost vectors.

Producing the missing setup/build/runtime-memory/energy values would require a new benchmark or measurement study; importing other submissions after seeing outcomes would violate the selection rule; and treating hardware capacity or command text as measured cost would change the estimand. Therefore no same-object comparator, ranking statistic, or minimum ranking-reversal falsifier can be computed from this artifact alone.

This is a carrier/estimand mismatch, not official-metric absorption and not paper-owned direct characterization. The route remains a locator only. A future Discovery assignment would need a newly frozen, outcome-independent multi-artifact panel or an official artifact that already contains all predeclared cost coordinates. Such a change is outside this assignment and must not be backfilled here.

## Claim and evidence ceiling

- Supported: exact release selection, exact public artifact identity, official schema/metric boundary, field-presence audit, and inability of this fixed artifact to instantiate the stated comparative full-cost estimand.
- Unsupported: ranking reversal, system superiority, natural deployment validity, exhaustive repository coverage, novelty, Tier A/B quality, full Stage 0, or any performance conclusion.
- Retrieval and resource status: all eight bounded official requests succeeded; no benchmark, implementation, build or claim-bearing experiment ran.

Academic-research source-verification discipline materially constrained the result: official repositories, schemas and retained hashes were treated as evidence; optional or missing fields were not upgraded into either values or general absence claims.
