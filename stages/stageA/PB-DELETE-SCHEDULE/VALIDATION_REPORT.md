# Delivery validation

- Validator: `scripts/validate_delivery.py`
- Result: **46/46 checks passed**.
- Scientific artifacts: corpus, legal-choice, full-cost JSON, full-cost CSV, source-tree hashes, and executable hashes match their frozen values.
- Corpus: 30 unique complete traces; minimum 153 checked deletions per trace.
- Probe matrix: 240 rows / 120 trace-method pairs; fixed-contract and dual-replay checks passed.
- Decision recomputation: `STOP_RECOMMENDED`; the candidate has no required p50/p90 full-cost Pareto residual and is slower than original order at both percentiles.
- Governance: `stageb_authorized=false`, no user Stage B approval, lane `IDLE_REUSABLE_AWAITING_MAINLINE`.
- Resource: directory remained below the 4 GiB ceiling when validated.

The machine-readable details are in `VALIDATION_REPORT.json`.
