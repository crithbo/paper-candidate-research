# Command Log — CVC5 resume4 safe recovery

- Assignment: `SAFE-RECOVERY-L1-20260815-CVC5-RESUME4`
- Lane: `CANDIDATE_EXECUTION_LANE_1`
- Authorization: `USER_AUTONOMOUS_SAFE_BLOCKER_RECOVERY_20260815`
- Unique write directory: `<LEGACY_LOCAL_PROJECT_ROOT>\stages\stageA\CVC5-ALETHE-SHAREMAP\resume4-safe-recovery`
- Claim-bearing: `false`
- Scientific revision consumed: `false`
- Stage B: `false`

## Entry and frozen input

1. Read the assignment controls, candidate-owner rule, resource-localization rule and academic-research-suite experiment/reproducibility protocol.
2. Verified every current control hash and the assignment SHA-256 against `CONTROL_HASHES.yaml`.
3. Verified resume3 top-level handoff, manifest, report, routes and blocker hashes. Resume4 did not exist at entry.
4. Confirmed the exact prior mechanical failure was missing GNU link archives in the prior CLANG64 route. No prior artifact was modified and no other candidate directory was read.
5. Selected the official portable MSYS2 20260611 base archive plus the official MINGW64 GCC package route. The current official package metadata identifies GCC 16.2.0-3, open-source licenses, dependencies, package bytes and SHA-256.
6. Created the unique resource root, the eight mandatory subdirectories, this authorization freeze and canonical inventory before any download, copy, extraction, environment creation or build.

## Pending bounded actions

- Run redirect/root/reparse/content-length preflight.
- Download the official base archive and detached signature into `resources/downloads`.
- Verify hashes/signature/provenance, extract into `resources/env/msys64`, and install only the official MINGW64 GCC route into that isolated prefix.
- Copy and verify the frozen Carcara archive/source into this assignment.
- Pass C and Rust GNU link smokes, then execute at most one clean unmodified `cargo build --release --locked -p carcara-cli`.
- If built, run version/help and a non-claim-bearing stock checker smoke only; no natural corpus or candidate run.

## Redirect and budget preflight

7. Resolved the literal resource root under the assignment directory, confirmed all eight mandatory directories, found zero reparse points and verified the child process temp API resolves to `resources\tmp`.
8. The first sandboxed official HEAD request failed with Schannel `SEC_E_NO_CREDENTIALS`; the tool-authorized retry to the identical `repo.msys2.org` URL returned HTTP 200 and exact `Content-Length: 53555380`, below the 256 MiB single-file and 512 MiB cumulative limits. No payload was downloaded by either HEAD request.
9. Redirect/root/budget preflight passed. The next resource-producing action remains the single official archive plus its detached signature.
10. Downloaded the base archive and detached signature from the two frozen official URLs into `resources\tmp`, then verified before retention. Archive: 53,555,380 B, SHA-256 `A2D047E8EE213C3C6A49A8DE427EB1069DF12207C0422FF1B3CBB5C905C34221`; signature: 566 B, SHA-256 `076F5623B702D5016CF0253E1D14A6BD4870A90243243E96409B227F0D5BF70F`.
11. Audited all 16,581 archive paths before extraction: one `msys64/` root and zero absolute or `..` traversal entries. Moved the verified payloads to `resources\downloads`; cumulative payload is 53,555,946 B.
12. Extracted the archive into `resources\env\msys64`; the environment contained 15,528 files before updates and zero Windows reparse points. The first login bootstrap attempted an automatic key refresh at `keyserver.ubuntu.com` before the requested command; no user credentials were supplied and no key was imported. All subsequent commands used `--noprofile --norc`; the unexpected attempt is recorded and was not repeated.
13. The detached signature identifies MSYS2's documented signing subkey `E0AA0F031DBD80FFBA57B06D5A62D0CAB6264964`, but the package keyring is not the installer-release keyring, so `pacman-key --verify` reported `No public key`. Following the official MSYS2 installer documentation, fetched the 100 B checksum sidecar from the official `msys2/msys2-installer` GitHub release; it asserts `A2D047E8...C34221`, exactly matching the archive. Sidecar SHA-256 is `B098A55E...347EA`.
14. Updated the isolated `msys2-keyring` to `1~20260814-1`, then completed the expected two-step isolated base update. No system/user keyring or environment was changed.
15. Installed official signed `mingw-w64-x86_64-gcc 16.2.0-3`, `make 4.4.1-3`, `m4 1.4.21-1`, `diffutils 3.12-1` and their complete declared dependencies. One mirror throughput timeout was handled internally by pacman and the transaction completed with package signature/integrity checks.
16. Verified GCC `16.2.0`, GNU ld `2.47`, GCC binary SHA-256 `AB37C117...6144F`, `libgcc_eh.a` SHA-256 `9F2A47DD...F46E`, and `libgcc.a` SHA-256 `2FB177D0...ED2`. Package metadata records GPL-3.0-or-later and the GCC runtime exception where applicable.
17. The native C link smoke passed in 0.751 s and emitted `c-link-smoke-ok`; executable SHA-256 `B186DE9D...AB30`. The frozen Rust 1.72 GNU link smoke through this GCC passed in 0.724 s and emitted `rust-gnu-link-smoke-ok`; executable SHA-256 `F1736CA0...433C`.
18. Copied the frozen Carcara archive into `resources\archives` and extracted it into `resources\src`. Archive SHA-256 remained `FCD42C4...0F30`; all 72 paths and content hashes exactly equal resume3; `Cargo.lock` remained `0E9C953C...7378`; Apache-2.0 license SHA-256 remained `62C7A1E3...636A`.
19. Cargo 1.72 `fetch --locked` into `resources\cache\cargo-home` succeeded in 71.716 s from official crates.io. One crate transfer timeout was retried internally by Cargo and succeeded; the lock hash remained exact.
20. Confirmed the clean target directory did not exist and 883,901,325 B remained under the storage ceiling. Executed the assignment's only clean build: `cargo build --release --locked --offline -p carcara-cli`, two jobs, unmodified source/lock, current isolated GCC route.
21. The build exited 101 after 26.192 s in `gmp-mpfr-sys 1.6.1`. Exact `config.log` evidence shows the POSIX configure shell consumed backslashes in the Windows absolute `CC` value, attempted `D:projectwriting...gcc.exe`, and returned command-not-found 127 for all ABIs. Build log SHA-256 `8A2AB4E5...6E22`; config log SHA-256 `776222AA...D11E`; no `carcara.exe` exists.
22. Source remains 72/72 byte-identical to the frozen input and `Cargo.lock` remains exact. No retry, source/lock patch, feature change, system/global mutation, WSL, claim-bearing corpus, preclaim experiment, Stage B or shared-control write was performed.
23. Final disposition: `BLOCKED_USER_ACTION_REQUIRED__NO_SCIENTIFIC_INFERENCE`; `resource_ready=false`; claim-bearing=false; scientific revision consumed=false; lane returns idle after handoff.
24. Final validation corrected one inventory-only label: the failed target subtree metadata index is `4A2862EE...D9B6`; the earlier `618A3390...84DC` value covered the whole `resources/build` directory including two smoke executables. No resource or evidence file changed.
25. Closure audit found mainline-only control drift after assignment entry: `plan.md` now `FB9DC7A1...22E6` and `registry.yaml` now `D2688717...06F5`; AGENTS, role and resource-localization hashes remain frozen matches. The lane did not read the changed semantics into this assignment and did not modify any shared control.
