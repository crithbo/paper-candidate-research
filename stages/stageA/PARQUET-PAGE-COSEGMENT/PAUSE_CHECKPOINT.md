# Pause checkpoint

- Assignment: `STAGEA-L2-20260809-PARQUET-PAGE-COSEGMENT-INITIAL-V8.7`
- Topic: `PARQUET-PAGE-COSEGMENT`
- Lane: `CANDIDATE_EXECUTION_LANE_2`
- Status: `SAFE_PAUSED_AWAITING_MAINLINE_RESUME`
- Pause reason: explicit user request to temporarily stop.
- Registry/plan/history/rules/templates changed: no.

## Completed before pause

- Minimal intake and all three frozen upstream manifests were verified; input freeze SHA-256 is `8F0FC9EF326FBA31EEED824CD45642A9D6AC36F0B547950B5F44AB6485DFC66D`.
- `PRE_CLAIM_CONTRACT_FIDELITY_GATE=PASS`: the 32-row witness passed exact Arrow table/schema/row-group equality, unmodified DataFusion SQL equality, and independent parsing of 12 DataPageV2 headers plus standard ColumnIndex/OffsetIndex structures.
- Twenty complete official NYC TLC Green Taxi monthly Parquet files were downloaded and hashed before decode. The natural audit passed 20/20 flat-primitive/schema/readability checks and PyArrow/DataFusion row counts matched.
- Replay 1 has five fully closed per-file results: 2024-01 through 2024-05. These are partial observations only and are not an aggregate scientific decision.

## Current command disposition

- Command: `python scripts/parquet_stagea.py probe --corpus-dir assets/nyc-green --output-dir artifacts/replay1`.
- It produced complete `result.json` files for 5/20 inputs, then was stopped at a safe per-file boundary in response to the pause request. Shell exit was 1 because of the user-requested interruption.
- The spawned probe process was explicitly stopped; verified running Codex-runtime Python process count is 0.
- `green_tripdata_2024-06` contains 15 complete boundary-oracle Parquet files but no strongest-union output, candidate output, query result, or `result.json`. Treat it as incomplete preparation, not an observation.

## Integrity at pause

- Assignment tree: 1,698 files, 1,128,723,577 bytes (<4 GiB ceiling).
- Replay-1 tree: 105 files, 143,771,739 bytes.
- Replay-1 Parquet magic validation: 100/100 pass; corrupt/truncated Parquet files: 0.
- Canonical replay-1 tree SHA-256 (UTF-8 `relative/path=UPPERCASE_SHA256`, sorted, LF with final LF): `BB6EC296E6019CF476DBFAAAE778DA5D0EC2EB291DD353FDAA746E682AEBD64E`.
- Core hashes:
  - `EXPERIMENT_CONTRACT.yaml`: `843E55559486640B79D86A9E184429E9B191D0F2640FF9597C57FC8BECF5BD2E`
  - `PRE_CLAIM_CONTRACT_FIDELITY_GATE.md`: `C3D5A929156C0D7A6CE6ED3EA3F848CB9E5CEDD8F0DFFC45DD9F546C3D09F3F8`
  - `artifacts/witness/witness_result.json`: `24417FD6E160AC2CAB16C024D1BF61D9E5C2C7BBEFDDD2FB579A925B60627798`
  - `artifacts/corpus_audit.json`: `CFED787BCAF68D0B750CDEC2D90CDF5AA41E8032EB549E4356EC1808013B96AE`
  - `scripts/parquet_stagea.py`: `38E7BC74352BFD235709BD383E087BF5CEDF978DE2017BBC65BD9764A083EFF6`
- Completed-result hashes:
  - `green_tripdata_2024-01/result.json`: `F46DCB12B15568545EB5F13281288D03B905A71833987368E2066FD0A0828631`
  - `green_tripdata_2024-02/result.json`: `C1F7CFAA5CEACD1740CAD4E7826517EC5146A815C748B3AC0FF12EAAAED41F1C`
  - `green_tripdata_2024-03/result.json`: `E26D4E4EFAA5B0719BE48A8B11D22EFA4AB819BE2C95207E41AEE20E85902AF4`
  - `green_tripdata_2024-04/result.json`: `061FF6A562622780E8D781820C68055316992B8AE3F1ABE6F4176513CE0B8F94`
  - `green_tripdata_2024-05/result.json`: `03C9050EE21A1D74A50541BE2FEDD7376D2A8CB1E6BEF3BF052616112951B65F`

## Not started or not completed

- Replay 1 aggregate: files 2024-06 through 2025-08 are not complete; no `probe_summary.json` exists.
- Replay 2 / double replay has not started.
- Aggregate useful-action-rate, 12/20 p50 gate, p90/full-cost Pareto gate, and final evidence ceiling have not been evaluated.
- `STAGEA_REPORT.md`, `RESULTS.md`, `USER_REVIEW_PACKET.md`, canonical `handoff.yaml`, and final `HASH_MANIFEST.sha256` have not been produced.
- Independent Stage A gate and every Stage B action remain unstarted and unauthorized.

## Resume entry

Resume only after an explicit mainline instruction for this same assignment. First recompute the core hashes and replay-1 tree hash above. Preserve the five completed result directories without overwrite. Add or invoke a resume path that skips those five verified results, revalidates the 15 partial 2024-06 boundary oracles, and continues at 2024-06. Do not infer an aggregate result until all 20 files and the independent replay close.

## Status of evidence

- Claim-bearing observation exists: yes, but only 5/20 per-file partial results.
- Resource blocker: none at pause.
- Scientific PASS/STOP/RESERVE/REVISE conclusion: none; explicitly withheld.
- Stage B authorized: false.
- `pending_user_stageb_review`: false.
- `stageb_user_approval_id`: null.

