# Results — CVC5 resume6 diagnostic

| Item | Result |
|---|---|
| Resume5 continuity | PASS: handoff/build/config hashes exact; manifest 17/17 |
| Single diagnostic attempts | 1/1 consumed |
| Shell wall / exit | 0.411 s / 1 |
| Shell-visible PATH fidelity | FAIL: host PATH observed; `/mingw64/bin` and `/usr/bin` absent |
| Compile/link | NOT REACHED; `gcc` command-not-found, exit 127 |
| Output hash | `NOT_PRODUCED` |
| Loader status | `NOT_RUN` |
| Resume5 gcc-exit-1 cause resolved | No; diagnostic harness failed before compiler execution |
| Evidence-supported correction | Export exact frozen POSIX PATH inside the single shell command |
| Network / build / claim / science / Stage B | 0 B / none / false / false / false |
| Decision | `RESOURCE_DIAGNOSTIC_COMPLETE__RETURN_EXACT_MECHANICAL_BLOCKER_TO_MAINLINE` |

