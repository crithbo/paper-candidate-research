# Raw screen row events

| Row | Signature | Result |
|---|---|---|
| S95-S1-R01 | `PYTHON_ASYNCIO_TASKGROUP__CANCELLATION_EXCEPTION_GROUP_EXIT_BOUNDARY__FIXED_TASK_COMPLETION_COUNT_ENDPOINT__CPU_RSS_LATENCY` | `EXCLUDED_BEFORE_RAW__STRUCTURAL_GENERIC_OR_CHANGED_ENDPOINT` |

Reason: changing cancellation/exception handling changes the endpoint; preserving it leaves generic scheduler/state-machine work. Counts: seeds 6; RQ 1; locator 1; raw/deep/brief 0/0/0.
