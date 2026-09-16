# RQ-S90-01 — GNU sed command-program plan

- Anchor: official GNU sed manual, `sed Programs` and `Execution Cycle`, current online manual, checked 2026-08-15.
- Object: fixed input stream, ordered GNU sed script and command-line options, file/command inputs referenced by the script, GNU sed version.
- Endpoint: stdout/stderr, exit status, file writes/command effects, and pattern/hold-state-sensitive behavior.
- Primary RQ: “Can a GNU-sed-specific whole command-program constructor lower CPU/RSS/I/O while preserving this complete stock endpoint beyond sequential execution?”
- N2 hypothesis: only if a non-generic, semantics-preserving action survives; pure regex-address planning is insufficient.
- Ordinary closure route: official program/execution-cycle/command-summary pages; no selective nomination.
