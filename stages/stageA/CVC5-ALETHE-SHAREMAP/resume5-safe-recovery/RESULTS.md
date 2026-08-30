# Results — CVC5 resume5 resource recovery

| Item | Result |
|---|---|
| Frozen input continuity | PASS: resume4 manifest 27/27; source 72/72; archive/lock/GCC hashes exact |
| Resource localization | PASS: eight directories, process-local redirects, no reparse points |
| Network | PASS: 0 B, no request |
| Single clean build | FAIL: exit 101 after 184.308 s in `gmp-mpfr-sys 1.6.1` |
| POSIX `CC=gcc` repair | PASS: configure invoked `gcc`; prior command-not-found failure removed |
| Native compiler probe | FAIL: all GMP compile probes returned 1; no diagnostic text retained by configure |
| Carcara executable | NOT PRODUCED |
| Version/help/checker smoke | NOT RUN; success-only branch not reached |
| Resource ready | false |
| Claim-bearing / scientific revision / Stage B | false / false / false |
| Decision | `BLOCKED_USER_ACTION_REQUIRED__RESOURCE_FAILURE_ONLY__NO_SCIENTIFIC_INFERENCE` |

