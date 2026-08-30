# S93-S1-RQ01 — POSIX spawn file-action ordering under a fixed child image

- Assignment / lane: Source93 / S1.
- Seed: `S93-S1-01`.
- Exact anchor: The Open Group POSIX.1-2024 `posix_spawn()` / `posix_spawnp()` page, <https://pubs.opengroup.org/onlinepubs/9799919799/functions/posix_spawn.html>, accessed 2026-08-15.
- Stable object and guarantee: one spawn file-actions object, same executable image, final working directory, final open-file-descriptor set and inherited open-file-description attributes.
- Contribution hypothesis: `COMPILER_TOOL`, N2.

## Primary RQ

For a fixed POSIX `posix_spawn` call and fixed child image/descriptor/working-directory endpoint, is there a target-specific complete action-list construction that lowers setup cost while preserving the standard's ordered file-action semantics, rather than merely applying generic dependency-preserving list simplification?

- FINER-lite: Feasible CONDITIONAL; Interesting CONDITIONAL; novelty threat HIGH; ethical/scope PASS; relevant CONDITIONAL.
- Null: the standard makes list order part of the endpoint; legal normalization of commuting independent actions is a generic compiler/list-optimization kernel.
- Primary source route: official POSIX.1-2024 `posix_spawn` specification.
- Fallback: official POSIX.1-2024 System Interfaces index for the identical function family, transport-only.
- Pre-RQ closure: `ORDINARY_CLOSURE`; no selective nomination.
