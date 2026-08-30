# Exact public anchors

| ID | Public identity | Roles | Frozen semantics | Result |
|---|---|---|---|---|
| A94-01 | Rust std 1.97.1 `std::thread::scope`, commit `8bab26f4f` | ANCHOR, CURRENT, CONTRARY | all scoped threads are joined before return; only thread main functions are waited for; TLS destructors can still run after return | Official current documentation retrieved read-only on 2026-08-15. |

This anchor is a locator only. Its TLS-destructor statement is the directly relevant contrary semantic boundary.
