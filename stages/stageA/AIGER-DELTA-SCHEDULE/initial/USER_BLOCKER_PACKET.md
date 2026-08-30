# AIGER-DELTA-SCHEDULE User Blocker Packet

- Stage and assignment: Stage A / `STAGEA-L1-20260810-AIGER-DELTA-SCHEDULE-INITIAL-R3P0`
- Status: `BLOCKED_USER_ACTION_REQUIRED`
- Blocker kind: `TOOLCHAIN`
- Exact failure and timestamp: on 2026-08-10, before any natural run, no C/C++ compiler/build system or exact pinned AIGER/Yosys/ABC executable was found; sandbox Git TLS also returned `SEC_E_NO_CREDENTIALS`, while an approved read-only elevated retry reached all three official GitHub endpoints.
- Claim-bearing observation obtained before failure: `no`
- Scientific inference allowed: `none`
- Evidence ceiling: `RESOURCE_FAILURE_ONLY__NO_SCIENTIFIC_INFERENCE`
- Scientific revision consumed: `no`
- Immutable failure directory: `D:\project\writing\reserch\stages\stageA\AIGER-DELTA-SCHEDULE\initial`

## Exact resource needed

- Name/version/commit:
  - native AIGER reader/re-encoder utilities built from commit `039ec1a2cc37d3093ac35c4b6df65336b346f409`;
  - Yosys executable built from commit `0f2bcb94b7dc8310a52abf6eef3a7e1a9f09b552` with a working `write_aiger` backend;
  - ABC executable built from commit `6c51a9238544bce6eb300b7b1c3e5bb4215bec84` with standard `write_aiger` and `-u` support;
  - all runtime DLLs, build metadata, and upstream license files.
- Expected size and SHA-256/signature: preferred prebuilt bundle no more than `1 GiB` compressed and `3 GiB` extracted. The provider must supply byte size and SHA-256 for every archive/executable/DLL; no trustworthy binary hash can be invented before a concrete build is supplied.
- Required files or capabilities: `aigtoaig` or equivalent native reference parse/re-encode path, `yosys`, `abc`, exact commit provenance, Windows x64 execution without system installation, and enough metadata to replay the build.
- License/ownership constraints: official open-source upstream licenses must accompany the exact build; no private/proprietary binary is acceptable.
- Accepted alternative forms:
  1. a portable Windows x64 bundle containing the exact pinned binaries and dependencies; or
  2. a portable, non-system MSYS2/UCRT64 build tree with exact package versions, archive hashes, licenses, and the dependencies required to build those three pins inside the new resume directory; or
  3. another user-provided reproducible execution environment that runs the exact pins without WSL/system installation/global PATH changes and writes only inside the resume directory.

## Minimum user action

- Provide one accepted bundle/environment with its size, SHA-256, license files, and exact provenance.
- Mainline should create and authorize a new assignment writing only `D:\project\writing\reserch\stages\stageA\AIGER-DELTA-SCHEDULE\resume1`; do not overwrite `initial`.
- Suggested placement: `D:\project\writing\reserch\stages\stageA\AIGER-DELTA-SCHEDULE\resume1\resources\pinned-native-toolchain\`.
- Safe verification: compute SHA-256 for all supplied files, run read-only version/smoke commands, then re-run the six-AND files through the native reference reader before any HWMCC download.

## Resume contract

- Frozen contract: `EXPERIMENT_CONTRACT.yaml` in this immutable directory; its final SHA-256 is recorded in `HASH_MANIFEST.sha256`.
- New resume directory: `D:\project\writing\reserch\stages\stageA\AIGER-DELTA-SCHEDULE\resume1`.
- First command after unblocking: hash/size/license inventory of the provided bundle, followed by native version/smoke only.
- Resource/time/device ceiling: CPU-only; no GPU or exclusive device; no system install, registry/service/global PATH change, Stage B, automation, or corpus expansion before preclaim PASS.

## Work already performed and cost

- Network: no downloads; three official Git endpoint probes only. Exact transferred bytes were not exposed by Git and are recorded as unmeasured, not zero.
- Disk before final reports: about 21 KiB across five generated files.
- Control execution: 6.84 ms wall, 15 ms user CPU, 40,374,272 B peak RSS, 73 B emitted AIGER data.
- Explicitly not executed: exact native tools, candidate natural corpus, HWMCC download, current-union comparison, claim-bearing full cost, Stage B, or scientific revision.
