# Source29 RQ candidates

Shared exact object: MLPerf Mobile v6.0, fixed Android on-device LLM benchmark/workload/quality semantics and official result contract (`CANONICAL_BENCHMARK_ONLY`).

| RQ | Atomic estimand | Preserved guarantee | Minimum falsifier |
|---|---|---|---|
| A | Validity of a fixed quality/tail ordering conditional on officially disclosed device-memory/energy coverage. | Native workload, Android device, quality and result semantics. | Held-out workload has unchanged ordering or fields cannot support the condition. |
| B | Coverage bound for which model/device pairs admit a joint tail/resource conclusion. | Same native semantics. | Official complete coverage makes the bound vacuous. |
| C | Full-cost characterization separating benchmark startup, quality validation and reported inference metrics. | Same task/quality. | Native rules already expose all components or held-out result unchanged. |

RQ-A selected: concrete counterfactual and no post-hoc scalarization; FINER-lite is scheduling only.
