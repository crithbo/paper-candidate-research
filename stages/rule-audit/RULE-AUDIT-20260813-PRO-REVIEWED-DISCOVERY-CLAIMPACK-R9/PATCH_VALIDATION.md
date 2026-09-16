# Patch validation

- Checked at: `2026-08-13 Asia/Shanghai`
- Workspace root: `<LEGACY_LOCAL_PROJECT_ROOT>`
- Patch: `DRAFT_PATCH.diff`
- Command: `git apply --check --recount --unidiff-zero --unsafe-paths <patch>`
- Result: `PASS`, exit code `0`
- Shared files changed by audit lane: `false`
- New protocol defaults to canonical mode: `OFF`
- Existing assignment migration: none
- Candidate-state migration: none

The narrow-context flags are intentional because the advisory diff changes Markdown sections without a Git repository index. Mainline must still verify the preimage hashes or manually reconcile any changed file rather than force-applying.

