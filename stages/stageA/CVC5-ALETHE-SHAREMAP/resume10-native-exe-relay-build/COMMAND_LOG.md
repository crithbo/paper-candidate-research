# Command Log

- Assignment: `SAFE-RECOVERY-L1-20260816-CVC5-RESUME10-NATIVE-EXE-RELAY`
- Mode: resource recovery only; no claim-bearing or preclaim activity.
- Resume9 canonical manifest: `20/20` exact.
- Network: prohibited; retries and variants prohibited.

## Sequential gates

1. Compile frozen `native_tool_relay.c` once with frozen native GCC.
2. Only if compile succeeds, run one POSIX-shell-visible relay compile/link/load smoke.
3. Only if smoke succeeds, localize frozen resume5 source/cache and run one clean locked offline Carcara build with at most two jobs.
4. Only if build succeeds, run version/help and one frozen non-claim-bearing checker smoke.

## Preflight

- Relay control/source copy SHA-256 both equal `230E34FCA66924F92F741DB44EE61D8058D22BD4F8C25DBE218156749DB24E40`.
- Frozen trivial source SHA-256 equals `9B8044C13CC843FE16795FD957E3EDE9DA9C5C12F3104E538396EA98230389B2`.
- Frozen GCC SHA-256 equals `AB37C11763FDCB3BF6F809B5D033A31EBEB77F10BA5934C72FA37287EE56144F`.
- Resource root: four files / 1,265 bytes; zero reparse points.

Status: `PRE_RELAY_COMPILE_PASS__GATE_1_OPEN`.

## Gate 1 execution and fail-closed stop

- Consumed the sole relay compile attempt at `2026-08-16T01:32:17+08:00`.
- Exact frozen command returned exit `1` after `0.1845883 s` wall; measured GCC process CPU `0.015625 s`.
- GCC 16.2 rejected line 31: `_spawnv` requires `const char * const *`, while frozen source passes `char **` via `&argv[1]`. Stderr SHA-256: `2CEF4CBE803615E28218B0869CF38E1B3D883DC89D1AA98ADF48F7073E0B064F`.
- No relay executable was produced.
- Per sequential gate contract, relay smoke, Carcara source/cache localization, Carcara build, version/help and checker smoke were not executed.
- No source correction, retry, variant, network, preclaim, scientific or Stage B action occurred.

Final decision: `BLOCKED_USER_ACTION_REQUIRED__RESOURCE_FAILURE_ONLY__NO_SCIENTIFIC_INFERENCE`.
