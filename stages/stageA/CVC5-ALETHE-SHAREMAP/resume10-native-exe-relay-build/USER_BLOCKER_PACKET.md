# User Blocker Packet

## Exact blocker

The mainline-frozen relay source does not compile under the frozen GCC 16.2 toolchain. Its `_spawnv` call passes `char **` where the frozen MinGW API requires `const char * const *`. The one authorized relay compile attempt returned `1`; no relay executable was produced.

## Executed / not executed

- Executed: input/hash preflight and one relay compile.
- Not executed: relay smoke, Carcara source/cache localization, Carcara build, version/help, checker smoke, preclaim, claim-bearing work and Stage B.

## Evidence

- Frozen source: `control/native_tool_relay.c`, SHA-256 `230E34FCA66924F92F741DB44EE61D8058D22BD4F8C25DBE218156749DB24E40`.
- Compile stderr: `resources/logs/relay-compile.stderr.log`, SHA-256 `2CEF4CBE803615E28218B0869CF38E1B3D883DC89D1AA98ADF48F7073E0B064F`.
- Compile status: `resources/logs/relay-compile-status.json`, SHA-256 `F05F22AA8EBE8FB258B8826B6899975CB8C4D47FE79D5A31815623B574A0FB7B`.

## Minimum recovery action

Issue a new immutable assignment containing a corrected, newly hashed relay source and a fresh one-attempt compile boundary. The correction must preserve the existing selector allowlist, absolute frozen tool targets, unchanged argument forwarding, wait semantics and child exit propagation. Resume10 may not be retried or overwritten.

Evidence ceiling: `RESOURCE_FAILURE_ONLY__NO_SCIENTIFIC_INFERENCE`; this is not scientific evidence against the topic.
