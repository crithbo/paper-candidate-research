# User Blocker Packet

## State

`BLOCKED_USER_ACTION_REQUIRED__RESOURCE_FAILURE_ONLY__NO_SCIENTIFIC_INFERENCE`.

The corrected relay compile route is partially closed: compilation passed. The POSIX smoke and Carcara build are still unobserved because the one allowed smoke gate failed in the outer orchestration parser before any child process began.

## Exact blocker

- Stage: `POSIX_RELAY_SMOKE_GATE_HARNESS`.
- Error class: `OUTER_POWERSHELL_PARSER_ERROR_BEFORE_PROCESS_CREATION`.
- Exact evidence: `resources/logs/relay-smoke-harness.stderr.log` and `resources/logs/relay-smoke-status.json`.
- Processes started by this gate: none (`sh.exe=false`, relay=false, GCC=false, loader=false).
- Carcara build attempts: `0`.

## Completed evidence that may be reused read-only

- Corrected relay source: SHA-256 `A9185EFE4CDC0953638FC6823305941F3162C5DD5DEA40422003F9A5F753F752`.
- Compiled relay executable: `resources/env/relay/native_tool_relay.exe`, `259,735 B`, SHA-256 `78978515A5F2A14F733A4B689272438336075B3876A878F1DB66B7341B418E8C`.
- Frozen GCC compile: exit `0`, empty stdout/stderr.

## Minimum action to resume

If recovery is to continue, mainline must issue a new immutable assignment and write directory that explicitly freezes a parser-safe smoke launcher. A sufficient minimal form is either:

1. a hash-frozen `.sh` file invoked as one `sh.exe <file>` command, or
2. a hash-frozen native/PowerShell launcher whose argument array contains no interpolated inline shell program.

The new assignment may read-only reuse the compiled relay only after revalidating SHA-256 `78978515A5F2A14F733A4B689272438336075B3876A878F1DB66B7341B418E8C`. It must separately authorize the still-unconsumed one native POSIX smoke and one clean locked offline Carcara build. Resume11 must remain immutable.

## Expected budget and safety boundary

- Network: `0 B`.
- Smoke: one relay invocation plus one loader run only on compile success; seconds and negligible storage.
- Build: at most one clean locked offline build, at most 2 jobs, within the separately frozen CPU/wall/storage envelope.
- No source/Cargo.lock/feature/test changes; no system/WSL/global modification; no claim-bearing/preclaim/Stage B.

No further action is authorized in this assignment.

