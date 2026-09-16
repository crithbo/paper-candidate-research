# Resource Gate Report

## Executive result

`resource_ready=false`.

The assignment closed at the second sequential gate. The corrected relay itself is mechanically viable under the frozen GCC: its one permitted compile succeeded and produced a stable executable. POSIX relay visibility and the downstream locked offline Carcara build remain unobserved because the smoke harness was rejected by the outer PowerShell parser before process creation. The no-retry boundary was honored.

## Frozen inputs

- Assignment SHA-256: `5C382AC3BA5243D9F59DC7671126AC3D30DC488A9CB4AE614A534C2CDFCDAD0E`.
- Corrected relay source SHA-256: `A9185EFE4CDC0953638FC6823305941F3162C5DD5DEA40422003F9A5F753F752` (control and localized copy match).
- Frozen GCC SHA-256: `AB37C11763FDCB3BF6F809B5D033A31EBEB77F10BA5934C72FA37287EE56144F`.
- Resume10 manifest validation: `17/17 exact`.
- Resource-root reparse points before execution: `0`.

## Gate accounting

### Gate 1: relay compile

- Command: `gcc.exe -O2 -pedantic -fomit-frame-pointer -m64 native_tool_relay.c -o native_tool_relay.exe`.
- Attempts: `1/1`.
- Exit: `0`.
- Wall: `448.571 ms`.
- stdout/stderr: empty.
- Executable: `259,735 B`, SHA-256 `78978515A5F2A14F733A4B689272438336075B3876A878F1DB66B7341B418E8C`.

### Gate 2: POSIX relay smoke

- Harness attempts: `1/1`; native smoke invocations: `0`.
- Failure: `OUTER_POWERSHELL_PARSER_ERROR_BEFORE_PROCESS_CREATION`.
- Loader status: not reached.
- No retry or variant was attempted.

### Gate 3: Carcara build

`NOT_ENTERED__UPSTREAM_GATE_FAILED`. No source/lock/feature/test changes occurred.

## Resource and safety accounting

- Network: `0 B`.
- New resource files at closure before canonical-package generation: `11` files, `522,217 B` logical.
- CPU: exact aggregate CPU was not exposed by this run environment; no estimate is made. The successful compiler process completed within 0.449 s wall time, and no smoke/build child process started.
- Maximum jobs requested: `2`; Carcara build not started.
- Global/system changes: `false`.
- Claim-bearing/scientific/stage action: `false`.

## Disposition

`BLOCKED_USER_ACTION_REQUIRED`. This is a mechanical resource-harness failure only; it does not support PASS, STOP, reserve, archive, or any scientific conclusion.

