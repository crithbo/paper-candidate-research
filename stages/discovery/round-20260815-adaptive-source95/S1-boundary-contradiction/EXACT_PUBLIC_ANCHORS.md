# Exact public anchors

| ID | Public identity | Roles | Frozen facts |
|---|---|---|---|
| A95-01 | Python 3.14.7 `asyncio.TaskGroup` | ANCHOR, CURRENT, CONTRARY | all tasks awaited on exit; a non-cancellation failure cancels remaining tasks; exception grouping and cancellation count preservation are specified. |

Source: <https://docs.python.org/3/library/asyncio-task.html#task-groups>, official Python documentation, read-only, accessed 2026-08-15.
