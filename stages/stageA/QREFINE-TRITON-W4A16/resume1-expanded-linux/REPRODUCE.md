# Reproduce the resource preflight

This package reproduces a resource decision, not a scientific experiment.

1. Verify the canonical manifest from this directory.
2. Verify immutable initial handoff `4EF72E9C...506AB` and manifest `E6C0E60E...53007`; its 30 entries were checked without writing there.
3. Read `EXECUTOR_PREFLIGHT.yaml` and `COMMAND_LOG.md` for the exact read-only checks and exit codes.
4. Do not download LLVM from this resume directory. Do not run `wsl --install`, enable optional features, install container/VM software, or change system/global state.
5. Resume only under a new mainline assignment after the user supplies an executor or explicitly approves named system changes.

No executable scientific result exists to replay; reproducibility verdict is `CANNOT_VERIFY_NOT_RUN_RESOURCE_BLOCKED`.
