# Resource Unblock Report — CVC5 resume4 safe recovery

## Outcome

`resource_ready: false` and `BLOCKED_USER_ACTION_REQUIRED__NO_SCIENTIFIC_INFERENCE`.

The assignment successfully closed the previously missing Windows GNU resource route: an official, process-local MSYS2 MINGW64 GCC 16.2.0-3 prefix was provenance/hash/license checked; `libgcc_eh.a` and `libgcc.a` are present; native C and frozen Rust 1.72 GNU link smokes both pass. The frozen Carcara 1.1.0 archive and all 72 source files remain exact.

The assignment's single allowed clean Carcara build then failed before producing a binary. `gmp-mpfr-sys 1.6.1` invoked GMP's POSIX configure with a Windows absolute `CC` containing backslashes. The shell consumed those backslashes and attempted `D:projectwriting...gcc.exe`, returning command-not-found 127 for every ABI. This is a mechanical compiler-path invocation failure, not a Carcara or scientific result. No retry was allowed or attempted.

| Gate | Result | Decisive evidence |
|---|---|---|
| Official portable MSYS2 archive | PASS | Official checksum exact; archive `A2D047E8...C34221` |
| Package provenance/license | PASS | Pacman signature/integrity validation; GCC GPL-3.0-or-later, runtime exception recorded |
| GCC/link runtime | PASS | GCC `16.2.0`; `libgcc_eh.a` `9F2A47DD...F46E`; `libgcc.a` `2FB177D0...ED2` |
| C link smoke | PASS | Output `c-link-smoke-ok`; executable `B186DE9D...AB30` |
| Rust 1.72 GNU link smoke | PASS | Output `rust-gnu-link-smoke-ok`; executable `F1736CA0...433C` |
| Frozen Carcara source | PASS | Archive `FCD42C4...0F30`; 72/72 exact; lock `0E9C953C...7378` |
| Cargo fetch locked | PASS | 71.716 s; lock unchanged |
| Single clean locked build | FAIL CLOSED | exit 101; build log `8A2AB4E5...6E22`; config log `776222AA...D11E` |
| `carcara.exe` / version / help / checker smoke | NOT RUN | executable count 0 |
| Existing frozen Stage A preclaim | NOT ENTERED | resource PASS is mandatory first |

## Cost and safety

- Resource root: 33,405 files, 1,533,870,899 logical bytes; below 2 GiB.
- Retained network payload lower bound: 184,649,508 bytes; exact failed-request and mirror-retry transport bytes were unavailable. This remains far below 512 MiB.
- Largest single response: 53,555,380 bytes; below 256 MiB.
- Cargo fetch: 71.716 s. Clean build: 26.192 s with at most two jobs. Exact process-tree CPU/RSS telemetry was not provided by this environment and was not estimated; bounded calls remained below the 1 CPU-hour / 2 wall-hour authorization.
- No system install, global PATH/environment, registry, service, WSL, driver, destructive cleanup, source/lock modification, private material, exclusive device, shared-control write, claim-bearing experiment, scientific revision, stage transition or Stage B occurred.

## Evidence boundary

Claim-bearing observation is `false`; scientific revision consumed is `false`. Evidence ceiling is `RESOURCE_FAILURE_ONLY__NO_SCIENTIFIC_INFERENCE`. This package supports neither scientific PASS nor STOP.

## Minimal resumption action

Mainline may issue one new immutable resume assignment that consumes this resume4 package read-only and authorizes exactly one corrected mechanical build with the same source, lock, Rust and GCC, but exposes the compiler to GMP configure as the POSIX-resolvable command `gcc` (and `g++`/`ar`) through the process-local PATH instead of a backslash Windows absolute `CC`. Expected incremental storage is below 700 MiB, no new download is expected, and bounded CPU/wall is below 10/30 minutes. The new assignment must still stop before any claim-bearing run and must use a new write directory.

