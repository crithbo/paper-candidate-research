# Raw screen row events — Source60 S2

| Event | Family | Disposition | Reason |
|---|---|---|---|
| ordinary closure | S60-01 AF_XDP | `LOCATOR_ONLY__RQ_BACKLOG` | Native union closed; target-specific N2 action/guarantee not named. |
| ordinary closure | S60-02 MPI partitioned | `EXCLUDED_BEFORE_RAW__GENERIC_SCHEDULER_CONTROLLER` | Only `MPI_Pready` timing survives. |
| ordinary closure | S60-03 RDMA MR | `LOCATOR_ONLY__RQ_BACKLOG` | Native registration action visible; no non-generic constructor/guarantee. |

`EVIDENCE_QUALIFIED_RAW=0`; no C0/deep review/brief started and there was no outcome-aware replacement.
