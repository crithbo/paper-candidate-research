# Exact public anchors

| ID | Selected seed | Exact public identity / version | Source role | What it freezes | Retrieval result |
|---|---|---|---|---|---|
| A92-01 | S92-S1-01 | The Open Group, POSIX.1-2024 `fork()` | ANCHOR, CURRENT, CONTRARY | multithreaded child semantics, calling-thread-only child, handler context, async-signal-safe restriction | Read-only browser retrieval on 2026-08-15; official page accessible. |

The anchor is a locator, not a novelty or quality claim. Its relevant contrary constraint is that a multithreaded child contains only the calling thread and applications are restricted to async-signal-safe operations before `exec`; thus a purported recovery-order construction must not silently expand that contract.
