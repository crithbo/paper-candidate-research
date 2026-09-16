# Exact public anchors

| ID | Exact public identity / version | Roles | Frozen point | Result |
|---|---|---|---|---|
| A93-01 | The Open Group POSIX.1-2024 `posix_spawn()` / `posix_spawnp()` | ANCHOR, CURRENT, CONTRARY | initial descriptor state, added-order file actions, tracked working directory, final child image | Official primary search response read-only on 2026-08-15. |

The page states that spawn file actions are performed in the order added, and that relative pathnames use the tracked working directory after prior file actions. That is the decisive same-object contrary constraint.
