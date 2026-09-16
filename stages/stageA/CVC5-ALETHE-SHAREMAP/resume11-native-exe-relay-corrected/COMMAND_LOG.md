# Command Log

- Assignment: `SAFE-RECOVERY-L1-20260816-CVC5-RESUME11-NATIVE-EXE-RELAY-CORRECTED`
- Mode: resource recovery only; no claim-bearing/preclaim/Stage B.
- Resume10 canonical manifest: `17/17` exact.
- Network, retries, variants and further relay correction are prohibited.

Sequential gates: corrected relay compile once → POSIX relay smoke once → clean locked offline Carcara build once, jobs≤2. Any failure closes all downstream gates.

Preflight revalidation:

- Assignment hash: exact.
- Control and localized corrected relay source: both `A9185EFE4CDC0953638FC6823305941F3162C5DD5DEA40422003F9A5F753F752`.
- Trivial smoke source: `9B8044C13CC843FE16795FD957E3EDE9DA9C5C12F3104E538396EA98230389B2`.
- Frozen GCC: `AB37C11763FDCB3BF6F809B5D033A31EBEB77F10BA5934C72FA37287EE56144F`, 3,302,709 bytes.
- Resource-root reparse points: 0.

Status: `PRE_RELAY_COMPILE_PASS`.

## Gate 1 — corrected relay compile

- Attempt: `1/1`.
- Exact command: `gcc.exe -O2 -pedantic -fomit-frame-pointer -m64 native_tool_relay.c -o native_tool_relay.exe`.
- Started: `2026-08-16T01:42:06.0845345+08:00`.
- Finished: `2026-08-16T01:42:06.5331055+08:00`.
- Wall: `448.571 ms`.
- Exit: `0`.
- stdout/stderr: empty.
- Output: `259,735 B`; SHA-256 `78978515A5F2A14F733A4B689272438336075B3876A878F1DB66B7341B418E8C`.
- Exact binary copied to process-local `resources/env/relay/native_tool_relay.exe`; hash unchanged.
- Result: `PASS`.

## Gate 2 — POSIX relay smoke

- Gate-harness attempt: `1/1`; native smoke invocations: `0`.
- The outer PowerShell parser rejected the command string before `ProcessStartInfo` was created.
- No `sh.exe`, relay, GCC, or smoke executable process started.
- Exact failure class: `OUTER_POWERSHELL_PARSER_ERROR_BEFORE_PROCESS_CREATION`.
- Per the assignment's fail-closed one-attempt boundary, no correction or retry was made.
- Result: `FAILED_CLOSED_AT_HARNESS__NO_NATIVE_SMOKE_OBSERVATION`.

## Downstream gates

- Carcara clean locked offline build: `NOT_ENTERED__UPSTREAM_GATE_FAILED`.
- Version/help/checker smoke: `NOT_ENTERED__BUILD_NOT_RUN`.
- Network bytes: `0`.
- Claim-bearing/preclaim/Stage B: not entered.
