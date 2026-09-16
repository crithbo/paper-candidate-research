# CVC5 / Carcara resume6 single compiler diagnostic

## Outcome

Decision: `RESOURCE_DIAGNOSTIC_COMPLETE__RETURN_EXACT_MECHANICAL_BLOCKER_TO_MAINLINE`.

The one authorized non-claim-bearing diagnostic was executed once. It did not reach compilation: the direct MSYS2 `sh` process observed the Codex host PATH instead of the frozen resume5/MSYS2 PATH, so `gcc` was not resolvable and returned 127. No executable was produced and loader status is `NOT_RUN`.

This result is specific and reproducible from the retained logs, but it does **not** explain resume5's original `gcc` exit 1 because the compiler was never invoked in resume6. No Carcara/dependency build is authorized or supported by this result.

## Frozen continuity

- Assignment: `SAFE-DIAGNOSTIC-L1-20260816-CVC5-RESUME6-GMP-COMPILER-PROBE`
- Assignment SHA-256: `86263EF696A4BA381EC49954347FDC6D5C1528269528CB1B001928C45DD3E439`
- Resume5 handoff SHA-256: `0905EAD5DE69FAD99AAA7201BFA1F8449A1F9701D85B0667F712578F2E0B8A79`
- Resume5 manifest SHA-256: `31CF128747C98CB1EA2A8D9A14876EA4582F8CC6D83CC26A2C2BC126C6D1AF2C`; 17/17 entries exact
- Resume5 build log SHA-256: `71DBC0354F6554BE3FCA3111CA10D7169F9DE0971E98A1C407BD36628A7AD720`
- Resume5 GMP config log SHA-256: `A7FE0A9A6723513034A5676A6E6EBA8E331FB92030B044D800B7AAB9808990B6`
- Frozen controls remained unchanged through closure.

## Exact diagnostic

The input was the exact GMP trivial source body:

```c
int main () { return 0; }
```

The single compiler invocation was:

```text
gcc -O2 -pedantic -fomit-frame-pointer -m64 conftest.c -o conftest.exe
```

It was embedded in one `sh` invocation that recorded environment, compile exit, and—only on successful compilation—one loader execution. No alternate flags or second variant were attempted.

- Start: `2026-08-16T00:44:06.4576328+08:00`
- End: `2026-08-16T00:44:06.8686756+08:00`
- Wall: 0.411 s
- Shell exit: 1
- Compile exit: 127
- Loader exit: `NOT_RUN`
- Output exists: false
- Output SHA-256: `NOT_PRODUCED`
- Stdout SHA-256: `A59031BE4DBD1636885A30B9ACC75F7A791C247007654EDA09BBEEE827AA4675`
- Stderr SHA-256: `EB9F69CF94EDB4FC50FB342AC9D0A2474049D5D20B0429FB942356BD8136F15C`
- Status SHA-256: `7FD90B0B6F839C27069688DD9F6EEFC79C9E6804B664A89D7074952830F7708A`

Exact stderr:

```text
/usr/bin/sh: line 6: gcc: command not found
```

The retained stdout PATH omits both `/mingw64/bin` and `/usr/bin` and instead contains the converted Codex host PATH. The intended parent-side process-local PATH therefore was not the PATH visible to direct MSYS2 `sh`.

## Single evidence-supported correction

If mainline chooses to continue, issue a new immutable **diagnostic-only** assignment that exports the exact POSIX PATH inside the sole shell command before the same compiler probe. This is the narrow correction directly supported by the observed failure. It must again allow only one compile/link and conditional loader execution; it must not authorize a Carcara/dependency build.

The required POSIX PATH is the resume5 config-log sequence:

```text
/d/project/writing/reserch/stages/stageA/CVC5-ALETHE-SHAREMAP/resume5-safe-recovery/resources/build/carcara-target/release/deps:
/d/project/writing/reserch/stages/stageA/CVC5-ALETHE-SHAREMAP/resume5-safe-recovery/resources/build/carcara-target/release:
/d/project/writing/reserch/stages/stageA/CVC5-ALETHE-SHAREMAP/resume3/toolchain/rustup-home/toolchains/1.72.0-x86_64-pc-windows-gnu/lib/rustlib/x86_64-pc-windows-gnu/lib:
/d/project/writing/reserch/stages/stageA/CVC5-ALETHE-SHAREMAP/resume3/toolchain/rustup-home/toolchains/1.72.0-x86_64-pc-windows-gnu/bin:
/mingw64/bin:/usr/bin:/c/Windows/System32:/c/Windows
```

The physical line must be joined with colons and exported inside `sh`; no new PATH component, compiler variant or retry is justified.

## Boundaries and cost

- Network: 0 B; no request attempted
- New persisted data before final inventory snapshot: 2,437 B
- CPU ceiling: 120 s; exact process CPU unavailable and not estimated
- Wall ceiling: 600 s; diagnostic wall 0.411 s
- Processor limit: 1
- Carcara/dependency build: not run
- System/WSL/global changes: none
- Claim-bearing observation: false
- Scientific revision consumed: false
- Stage B: false
- Evidence ceiling: `RESOURCE_DIAGNOSTIC_ONLY__NO_SCIENTIFIC_INFERENCE`

