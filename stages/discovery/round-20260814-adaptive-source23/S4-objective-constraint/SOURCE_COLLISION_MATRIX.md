# Source23 carrier / type-specific C0 matrix

| Locator | Exact candidate identity and type | Carrier-first / identity check | C0 or survival status |
|---|---|---|---|
| MLPerf Storage v2 checkpoint | Checkpoint save/load full-cost characterization or dataset. | Nominal datasets are synthetic file populations, not exact public natural carrier. | `EXCLUDED_BEFORE_RAW__SYNTHETIC_CARRIER_NOT_NATURAL` |
| MLPerf Training v6 | Cross-hardware training time/power characterization. | Source18 identity. | `EXCLUDED_BEFORE_RAW__SOURCE18_IDENTITY` |
| MLPerf Inference | Published GPU/NPU ranking/validity characterization. | Contained Source17–19 identity; no separate same-object estimand. | `EXCLUDED_BEFORE_RAW__HISTORICAL_CONTAINED_IDENTITY` |
| SPEC CPU 2026 | Application-workload energy/ranking characterization. | Source17 identity; no GPU/NPU-specific new facet. | `EXCLUDED_BEFORE_RAW__SOURCE17_IDENTITY` |
| SPECworkstation | Workstation/GPU result stability characterization. | Source17 identity/config restatement. | `EXCLUDED_BEFORE_RAW__SOURCE17_IDENTITY_OR_CONFIG_RESTATEMENT` |

## V7 witness rule

The type-specific C0 and survival trace are downstream of raw admission.  With no raw identity, no origin/sampling-transform/estimand-input/final-survival trace is asserted.  A future candidate must first bring an exact versioned public natural carrier and a distinct same-object estimand; only then may its contribution-type C0 be evaluated.
