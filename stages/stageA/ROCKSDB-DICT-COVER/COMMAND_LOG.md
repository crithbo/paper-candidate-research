# ROCKSDB-DICT-COVER command log

- Lane: `CANDIDATE-EXECUTION-LANE-1`
- Assignment: `STAGEA-L1-20260809-ROCKSDB-DICT-COVER-INITIAL`
- Unique write directory: `<LEGACY_LOCAL_PROJECT_ROOT>\stages\stageA\ROCKSDB-DICT-COVER`
- Cross-assignment contamination: `false`
- Stage B: `false`; approval: `null`

## Pre-claim preparation

All entries in this section precede the first claim-bearing observation.

1. Fully read the required project entry, current plan, registry, candidate-owner role, ARS experiment workflow/roles, requested templates, and only the registry-listed Discovery/PRIMARY/confirmation packages.
2. Recomputed frozen package manifests: Discovery `4/4 PASS`, PRIMARY `4/4 PASS`, confirmation `5/5 PASS`.
3. Host toolchain preflight: Windows Git available; CMake, Ninja, C/C++ compiler, Python on PATH, Docker, Podman, and WSL distribution unavailable. Codex bundled Python is available at the recorded runtime path.
4. Network preflight: default Git Schannel failed before any data or scientific run with `SEC_E_NO_CREDENTIALS (0x8009030e)`; `git -c http.sslBackend=openssl` succeeded against official GitHub remotes. The successful bounded alternative means no blocker is declared at this point.
5. Official upstream HEADs observed for pinning before checkout: RocksDB `1dfa7297933df05237ac11376d6cb69d32591b1d`; Zstd `82d322c4973d9e2968d94047a40892bc6d9a9bdf`.

No candidate, baseline, equality, dictionary-effect, compression, timing, RSS, or frontier result had been observed when this lock and log were written.

## Official source and portable toolchain preparation

6. `git -c http.sslBackend=openssl clone --filter=blob:none --no-tags https://github.com/facebook/rocksdb.git sources\\rocksdb` completed; checked-out HEAD `1dfa7297933df05237ac11376d6cb69d32591b1d`.
7. The corresponding Zstd clone completed at `82d322c4973d9e2968d94047a40892bc6d9a9bdf`.
8. Official release API metadata pinned and verified these archives:
   - `llvm-mingw-20260616-ucrt-x86_64.zip`, 187,504,083 bytes, SHA-256 `B9B68A4D276E16FA25802AABA458E4638F64B3884C290AACCDC2D87083B6CA35`.
   - `cmake-4.4.2-windows-x86_64.zip`, 54,405,968 bytes, SHA-256 `E8139D85B3813BC38833142AE1940472E9A587E9B5D2718AC1804C60F4E57A64`.
   - `ninja-win-1.13.2.zip`, 291,570 bytes, SHA-256 `07FC8261B42B20E71D1720B39068C2E14FFCEE6396B76FB7A795FB460B78DC65`.
9. The initial CMake download reached 54,382,016/54,405,968 bytes. A bounded HTTP Range continuation requested exactly `bytes=54382016-` and received strict `206 bytes 54382016-54405967/54405968`; the final official digest matched. This was a tool-resource continuation, not a scientific run.
10. Extracted tool versions: Clang/LLVM-MinGW `22.1.8`, CMake `4.4.2`, Ninja `1.13.2`.

## Build preflight (non-claim-bearing)

11. Configured pinned Zstd from `sources\\zstd\\build\\cmake` as Release static library with programs/tests/shared library disabled, installed under `build\\prefix`, and built with two jobs. Result `build\\prefix\\lib\\libzstd.a`: 864,652 bytes, SHA-256 `04DEC078758D0FDF9449D6D3E76FB220174A82527ADC3146323B0C081C60DE91`.
12. Configured pristine pinned RocksDB with the portable Clang/MinGW+CMake+Ninja toolchain, `WITH_ZSTD=ON`, other compression libraries/tests/tools/benchmarks/gflags disabled, Release static library, and two build jobs. Build completed `367/367`. Result `build\\rocksdb-pristine\\librocksdb.a`: 35,942,230 bytes, SHA-256 `AE87CCEF4719219EC423D880CD0FC5C027CF08683F07BC1EAF4C4F4F7D74ABEC`.
13. This build was unmodified upstream source. It produced no database, SST, selector, trainer input, dictionary, timing, RSS, equality, or frontier result.

## Frozen natural-manifest acquisition and fail-closed stop

14. Hashed `scripts\\prepare_manifests.py` before execution: `E93D8D7A7AB47B2A65751064F5114FCD9E919813F2A7F810123FDCAF7FD7E244`. The script freezes ten NVD annual feeds and ten PyPI package JSON endpoints, one manifest per source, with a 4 MiB hash-ranked natural-record cap followed by key sorting. It contains no automatic retry and refuses overwrite.
15. Exact command: bundled Python runtime followed by `scripts\\prepare_manifests.py` in the assigned directory.
16. `nvd-2015` and `nvd-2016` downloaded and converted. They were not passed to RocksDB or inspected for scientific outcomes.
17. At `nvd-2017`, the GET response declared `7,706,425` bytes but reached EOF after `7,686,831` bytes. The script emitted `PRECLAIM_PREPARATION_FAILURE: short download ... observed=7686831 expected=7706425`, exited `1`, and did not retry.
18. Incomplete asset SHA-256: `972E334A0D7B2B8F97B95A7ACD4DEB7ED4F8F370F41ED88DE244F015ECD82E32`; it is inadmissible.
19. At failure: claim-bearing observation `no`; candidate/baseline/trainer/SST/equality/cost/frontier execution `not started`; scientific revision consumed `no`; disposition `BLOCKED_USER_ACTION_REQUIRED`.

## Finalization-only checks

After item 19, no network, data continuation, implementation, or scientific command is authorized. Remaining commands are limited to local file hashes, YAML/text checks, and manifest verification for the blocker delivery.

20. Final blocker-package verification recomputed `25/25` manifest entries with zero hash failures; all required deliverables existed, the prohibited-path scan found zero E-drive references, boundary fields were present, workspace size was below 4 GiB, and no resume directory had been created.
21. Full YAML parser validation was attempted with the bundled Python and Node runtimes. Python lacked `yaml`/PyYAML and Node lacked the `yaml` module. This is recorded as a **validation-boundary limitation**, not a blocker-package failure and not a scientific/resource blocker. No dependency was installed and no network access was used. Hash, required-field, boundary-field, indentation/text, and manifest checks remain the performed validation scope.
22. Mainline independently recomputed the blocker package `25/25` and accepted the pre-finalization top hashes: report `DEAB85A78D059B3971CD825C25BEA12F5568CBBCF90B8CA25605DA51992C4E0E`, blocker `CFDC394809DCEDCAA36E6EE655FF64C10CD7AE420F6A98CC97B7382002ECDA09`, handoff `AFE3290A111485DF690F6AB31C738185E30B6F7C3EF2219CEF79EBF67164569D`, and manifest `0CF6AFD2C738EB5FC73F2A71D193002CF9E589E13473631D2F88B050C4A35C35`.
23. The only post-acceptance delta is this explicit validation-boundary record plus synchronized handoff/manifest hashes. No data, source, build, contract, result, blocker evidence, or scientific disposition changed.
