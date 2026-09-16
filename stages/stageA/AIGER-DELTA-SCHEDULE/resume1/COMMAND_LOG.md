# AIGER-DELTA-SCHEDULE Resume1 Command Log

- Assignment: `RESOURCE-STAGEA-L2-20260811-AIGER-DELTA-SCHEDULE-RESUME1-R3E`
- Authorization: `AIGER-EXACT-TOOLCHAIN-RESUME-20260811-R3E`
- Write root: `<LEGACY_LOCAL_PROJECT_ROOT>\stages\stageA\AIGER-DELTA-SCHEDULE\resume1`
- Global PATH/system environment modified: `no`

## Entry and freeze

1. Frozen control hashes were recomputed and matched the assignment.
2. Initial Stage A manifest verified `13/13`; Stage0 PRIMARY `4/4`; confirmation `2/2`.
3. First PowerShell hash-table formatting probe failed harmlessly with `EmptyPipeElement`; the corrected read-only command succeeded.
4. The authorized `resume1` directory was confirmed absent, then created once with resource, source, build, verified, artifact, log, and script subdirectories.
5. The registered portable MSYS2 bootstrap was invoked by absolute path. Observed tools: Clang `22.1.8`, CMake `4.4.2`, Ninja `1.13.2`, GNU Make `4.4.1`, MSYS `3.6.7`.

Further commands are appended only within this assignment directory.

## Official provenance and immutable assets

6. A sandboxed read-only GitHub API request failed while receiving the response. The same exact official API reads were retried with the required network escalation; no source or endpoint substitution was made.
7. Official commit API results pinned AIGER `039ec1a2cc37d3093ac35c4b6df65336b346f409` (unsigned), Yosys `0f2bcb94b7dc8310a52abf6eef3a7e1a9f09b552` (valid signature), and ABC `6c51a9238544bce6eb300b7b1c3e5bb4215bec84` (unsigned). Unsigned status was recorded and was not treated as a blocker.
8. Exact official GitHub codeload archives were downloaded once and checked before extraction:
   - AIGER: 197,327 bytes; SHA-256 `37803A6F64D824930715D6FC70AB3A1644304BBFBD5676B746AFA83855985D8B`.
   - Yosys: 3,696,972 bytes; SHA-256 `2B313F3DA8C3695219097F75676E909D2B9C8EFD1D43060C0C09C7DB84CDAE39`.
   - ABC: 7,710,210 bytes; SHA-256 `657CC9053527EA1E25EC32A2D03D07A1681C36EFB0FD1AA120399C7183C6D2F2`.
9. The first direct MSYS tar listing lacked the process-local gzip lookup and failed without modifying an extracted tree. The corrected absolute `bash.exe` invocation used `PATH=/usr/bin:/clang64/bin`, and gzip/tar validation and extraction passed.
10. The exact Yosys tree was queried for required gitlinks. Four official exact-revision archives were fetched, checked, and extracted into their initially empty source locations: cxxopts (160,673 bytes, `6A198FDD59E95FE8D4E4BA2A5583E72E610E725192E9CCC2A06A23DFC8243A13`), fmt (742,164 bytes, `360099778B1BF7088769D07B51B59474450DFAE3CD63C333D2E3F3903D666A52`), toml++ (1,303,578 bytes, `46995DDC5BAFF656A2D527D4329A382C14412F963FA0EDF418319280E8435C40`), and Boost.Regex (514,450 bytes, `5674D9802E115D3ED12C9A1301716F7F0DEBABF46478449F1112E2A21E6EEECF`).
11. License files were read and hashed without modification: AIGER `CE1F46EC59457DD33714439E222B31F53C331BFA65D269F6FFC408CAEFCE3014`, Yosys `6998B5724D4CB3F459D1C12B6BD0CDBFA9C949EF14D0FB6D7D97D97404E5B5F3`, and ABC `819151B8F059A48F806C75732EF62B1F873B49B6A04FB128AED28BF87D3DCD6C`.

## Clean builds and native smoke

12. AIGER clean attempt 1 copied the exact extracted source to `build/aiger-attempt1` and invoked upstream configure with the absolute Clang executable. Upstream's sed template did not quote the slash-containing compiler path; the attempt failed. Log: `artifacts/logs/aiger-build-attempt1.log`, SHA-256 `8A8D9458A3C738D79EBB28326EEB2F1FD22BCC513FD0DD93D5B84A54126FDE87`.
13. AIGER clean attempt 2 copied the exact source anew and exposed the same compiler only through the process-local MSYS PATH (`CC=clang`). Configure and `make` succeeded without a source, lock-file, or test change. Log: `artifacts/logs/aiger-build-attempt2.log`, SHA-256 `491FC5524432416C4F91D59254CA73AED319C7CBD4CBFD0EB19DF982038B0CA8`.
14. The resulting `aigtoaig.exe` was checked: 113,152 bytes, SHA-256 `C074052C66DA92B3062EDD5A9BBD3B7CD0D4BDD29B011EC738CCBF9683257811`; `-h` exited 0.
15. The required unmodified stock smoke used upstream `examples/and.aag`: AAG to native AIG exited 0 and emitted 20 bytes (`D1CE42CC4D0BDD5D4CEB2E750BA988891CCB2C126E321F5F2902C1122A89BAE0`), but native AIG readback exited 1 with `expected space or new line after number of and gates 1`. A read-only byte inspection found CRLF in the binary header. Exact upstream source opens output with `fopen(file_name, "w")` and input with `fopen(file_name, "rb")`; under the authorized Windows CRT this makes the unmodified binary roundtrip fail. The executable was not promoted to `verified`.
16. ABC clean attempt 1 copied exact source to `build/abc-attempt1` and ran upstream make with `CC=clang CXX=clang++ ABC_USE_NO_READLINE=1`. It failed after dependency generation on LLP64 pointer/word narrowing because generated configuration selected a 64-bit `long`. Log: `artifacts/logs/abc-build-attempt1.log`, SHA-256 `C5FA2EBB414A27850DAC7B2196E5851C3B708218B63A11B34294659F908AAF42`.
17. A read-only Makefile audit identified upstream-supported switches `ABC_USE_STDINT_H=1` and `ABC_MAKE_NO_DEPS=1`.
18. ABC clean attempt 2 copied exact source anew and used those official build switches. It progressed further but failed in bundled CaDiCaL because `getc_unlocked` and `putc_unlocked` are undeclared in this toolchain. Log: `artifacts/logs/abc-build-attempt2.log`, SHA-256 `126A4DAF2FF8E79714E992400D133CE3D4B3E3AA80CAA8B2C398ED807E85A3F0`. ABC's 2/2 clean-build allowance was exhausted; no `abc.exe` exists.
19. Yosys had exact source and required gitlinks acquired but received 0/2 build attempts. Once AIGER's mandatory stock smoke and ABC's mandatory build had independently failed their final approved routes, the conjunctive resource gate could no longer pass. Starting a Yosys build could not alter the decision and was omitted to preserve the frozen budget.

## Fail-closed termination

20. No six-AND replay, `PRE_CLAIM_CONTRACT_FIDELITY_GATE`, HWMCC acquisition, natural trace, candidate, baseline, full-cost, or Stage B command was run.
21. Four harmless PowerShell formatting/parsing probes during read-only inspection produced `EmptyPipeElement`; corrected forms were used. They did not write evidence or alter results.
22. Terminal disposition: `BLOCKED_USER_ACTION_REQUIRED`, `ROUTES_EXHAUSTED`, `resource_ready=false`, `claim_bearing=false`, `scientific_revision_consumed=false`, and evidence ceiling `RESOURCE_FAILURE_ONLY__NO_SCIENTIFIC_INFERENCE`.
