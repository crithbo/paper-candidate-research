# User blocker packet — CVC5 resume6 diagnostic harness

## Blocker

The only permitted diagnostic did not reproduce resume5's child PATH. Direct MSYS2 `sh` observed the Codex host PATH, so `gcc` was unavailable and compilation returned 127. Because the compiler and loader were not exercised, resume5's original compiler-exit-1 failure remains unresolved.

## Minimum next action

Mainline may issue a new immutable diagnostic-only resume assignment that exports the exact resume5 POSIX PATH inside the single `sh` command, then runs exactly the same one `gcc -O2 -pedantic -fomit-frame-pointer -m64` compile/link and conditional one-time loader check. No compiler variant, retry loop, Carcara/dependency build or scientific work should be authorized at that boundary.

Expected network is 0 B, persistent data is under 64 MiB, CPU under 120 s, wall under 600 s, and one processor. Resume6 must remain immutable.

## Evidence

- Command: `resources/logs/diagnostic-command.sh.txt` (`49A0FA1B2DDEAA02128B5FF68614A7A6BB84F45C3F3717F18D9AD48232A50F6B`)
- Stdout: `resources/logs/diagnostic.stdout.log` (`A59031BE4DBD1636885A30B9ACC75F7A791C247007654EDA09BBEEE827AA4675`)
- Stderr: `resources/logs/diagnostic.stderr.log` (`EB9F69CF94EDB4FC50FB342AC9D0A2474049D5D20B0429FB942356BD8136F15C`)
- Status: `resources/logs/diagnostic-status.txt` (`7FD90B0B6F839C27069688DD9F6EEFC79C9E6804B664A89D7074952830F7708A`)

Evidence ceiling: `RESOURCE_DIAGNOSTIC_ONLY__NO_SCIENTIFIC_INFERENCE`.

