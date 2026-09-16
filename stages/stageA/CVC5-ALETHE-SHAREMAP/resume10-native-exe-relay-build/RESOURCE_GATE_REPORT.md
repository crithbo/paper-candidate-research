# CVC5 / Carcara resume10 native executable relay gate

## Outcome

The first sequential gate failed, so all downstream gates remained closed. The frozen relay source was compiled exactly once with the frozen native GCC and returned exit `1`; no relay executable exists.

Decision: `BLOCKED_USER_ACTION_REQUIRED__RESOURCE_FAILURE_ONLY__NO_SCIENTIFIC_INFERENCE`.

## Frozen continuity

- Assignment SHA-256: `1637F2F392F6910589CFCC44A3ADA2B33814E86E50682F59B36E53C6088C2929`.
- Relay source SHA-256: `230E34FCA66924F92F741DB44EE61D8058D22BD4F8C25DBE218156749DB24E40`; control and localized copy match.
- Resume9 manifest: `20/20` exact; handoff and blocker hashes match the assignment.
- Frozen GCC SHA-256: `AB37C11763FDCB3BF6F809B5D033A31EBEB77F10BA5934C72FA37287EE56144F`.

## Exact failure

The sole command was:

`gcc.exe -O2 -pedantic -fomit-frame-pointer -m64 native_tool_relay.c -o native_tool_relay.exe`

GCC 16.2 rejected the third `_spawnv` argument at line 31. The frozen source supplies `&argv[1]` with type `char **`; the MinGW header declares the argument as `const char * const *`. GCC exit was `1`, wall was `0.1845883 s`, and no output executable was produced.

The contract forbids changing the source or retrying. Therefore no relay smoke, Carcara input localization, Carcara build, version/help, checker smoke, preclaim or scientific action was run.

## Boundary

- Network: 0 B
- Source mutation: false
- Claim-bearing observation: false
- Scientific revision consumed: false
- Evidence ceiling: `RESOURCE_FAILURE_ONLY__NO_SCIENTIFIC_INFERENCE`
- Stage B: false

Recovery, if continued, requires a new immutable assignment with a corrected and newly hashed relay source. Resume10 cannot be overwritten or retried.
