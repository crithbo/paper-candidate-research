# Final Mechanical Self-check

- Required owner files present: `STAGEA_REPORT.md`, `EXPERIMENT_CONTRACT.yaml`,
  `COMMAND_LOG.md`, `RESULTS.md`, `Q1_COMPARATOR_MATRIX.md`,
  `USER_REVIEW_PACKET.md`, `handoff.yaml`, `HASH_MANIFEST.sha256`.
- Unique write boundary: all created files are under this assignment's
  `initial/` tree.
- Forbidden `E:\` references in assignment text/code: 0.
- Completed natural window JSON files: 11.
- Completed 40-window `summary.json`: absent, as required after fail-closed exit.
- Replay2: absent; no post-failure scientific run.
- Decision: `REVISE_ONCE`.
- Evidence ceiling:
  `IMPLEMENTATION_FIDELITY_FAILURE__NO_NATURAL_SUPPORT_OR_STOP_INFERENCE`.
- Stage A scientific revision consumed: false.
- Stage B authorized: false; approval: null.
- Cross-assignment contamination: false.
- System/global environment changes: false.
- YAML parser boundary: PyYAML and Node `yaml` module unavailable; no closeout
  dependency installation. Textual structure, indentation, required keys, and
  frozen values were checked.
- Canonical manifest rule: every file in `initial/` except the manifest itself,
  ordinal path order, uppercase SHA-256, two spaces, forward-slash relative path.
  The manifest is regenerated only after this file and handoff are frozen, then
  independently recomputed entry by entry.
