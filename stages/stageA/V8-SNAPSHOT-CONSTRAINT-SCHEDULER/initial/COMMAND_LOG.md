# Command Log

- Assignment: `STAGEA-L1-20260811-V8-SNAPSHOT-CONSTRAINT-SCHEDULER-INITIAL-V8.7`
- Date/time zone: `2026-08-11 / Asia/Shanghai`
- Workflow: `academic-research-suite / experiment-agent`, reproducibility and fail-closed protocols.
- Write boundary: only this `initial` directory.

## Input and integrity

1. Read and hashed `AGENTS.md`, `plan.md`, `registry.yaml`, `rules/ROLE_CANDIDATE_OWNER.md`. All four matched the user freeze at intake.
2. Read the full ARS router plus experiment workflow, code-runner, reproducibility and stall protocols. No subagent or external model was used.
3. Strictly decoded the complete registry as UTF-8: `942346 bytes`, `16209 lines`, SHA-256 `E958B8A074F222213DCD918CBB20A362A40A09A27040C9F94A2C3CDA41D004D5`.
4. The first per-1000-line registry audit failed after the full decode because this PowerShell/.NET runtime lacks static `SHA256.HashData`; exact error was `MethodNotFound`. No write occurred. Reissued with `SHA256.Create().ComputeHash()` and obtained hashes for all 17 line chunks.
5. Read the complete PRIMARY, confirmation, revision1 and revision1-closing packages. Initial PRIMARY manifest parsing treated GNU binary-mode `*filename` as a literal star path and reported false mismatches. The raw manifest exposed the convention; a compatible parser then verified PRIMARY `4/4`. Confirmation `2/2`, revision1 `4/4`, and closing `2/2` also passed. Top closing hashes matched the assignment.
6. Mainline changed plan/registry after intake. Before package write their observed hashes were `8A3AE8F8...1537D` and `B74A2113...2347B`. The assignment remained bound to its intake freeze; no shared control was modified.

## Resource/preclaim inventory

7. Read-only PATH inventory found Node `v24.15.0`, V8 `13.6.233.17-node.48`, and Git `2.53.0.windows.3`. Node executable SHA-256 is `3331E1FFE19874215472217C5E94F5A0C6D8E18C4AC7111D3937AA0AD5E9B4A5`.
8. `d8`, `mksnapshot`, `v8_context_snapshot_generator`, GN, autoninja, Ninja, CMake, Python, MSVC and Clang drivers were absent from PATH. The same-topic StageA root was absent before this assignment and contained no pinned source/build asset.
9. The installed Node/V8 was retained only as a non-claim-bearing environment inventory. It was not treated as commit `c635f0d160b6e988b5ea5a907511a2929beb5d5e`, a matching stock deserializer, or a candidate-capable writer.

## Fail-closed boundary

- No network request/download, depot_tools sync, source build, system install, global environment change, snapshot generation, serializer modification, tiny oracle, natural carrier selection/run, timing, RSS measurement, benchmark, automation or StageB action occurred.
- Claim-bearing observation count: `0`.
- Scientific revision consumed: `false`.
- Failures and controls were retained rather than silently retried or promoted to scientific evidence.
