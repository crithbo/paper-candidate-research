# Baseline and Full-cost Fairness Audit

## Verdict

`FAIL_CLAIM_BEARING_FAIRNESS`

## Required contract

Stage 0 requires the candidate and complete fixed/CDC representation family to receive the same data, workload information and selection budget; baseline grid/model-selection cost and candidate planning/search cost must be charged symmetrically. The parent contract additionally freezes deterministic Latin rotation by file and arm.

## Executed path

Static inspection of `parquet_stagea.py` (`38E7BC74352BFD235709BD383E087BF5CEDF978DE2017BBC65BD9764A083EFF6`) shows:

- `planning0` starts before all 12 fixed and 3 CDC boundary configurations are constructed or loaded and before their two representation modes are scored;
- the candidate DP and retention plan run inside the same timer;
- only one combined `planning_wall_ns` is emitted;
- union queries are always measured before candidate queries; and
- the numerical representation family is limited to custom plain DataPageV2/Zstd plus two retention modes.

Static inspection of `aggregate_results.py` (`9A2CE1CEBB9D085EC95ABA15C98F963E02259000EFAAC17B933D192E050A8E79`) shows the complete combined timer is added only for `arm == candidate`.

## Scientific consequence

The package cannot distinguish baseline planning, shared preprocessing and candidate-only planning. Therefore the `126–131x` ratio is not a measured deployable candidate penalty. The fixed arm ordering also prevents contract-faithful p50/p90 inference.

The baseline is executable and same-object, and its selected output is not a metric-wise synthetic envelope. Those strengths do not cure the cost and ordering failures.

## Boundary

This audit does not say the candidate would pass under corrected accounting. It says the present package cannot establish either PASS or the recommended full-cost scientific STOP.
