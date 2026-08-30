# S5-OCCUPANCY-CLIFF-JOINTCODEGEN User Blocker Packet — R2A

- Stage/assignment: `STAGEA_RESUME_FROM_BLOCKER`; `STAGEA-L1-20260811-S5-OCCUPANCY-CLIFF-JOINTCODEGEN-RESUME2-STAGEA-R2A`
- Status: `BLOCKED_USER_ACTION_REQUIRED`
- Blocker kind: `NETWORK / TOOLCHAIN / DATA`
- Exact failure: official exact-source sparse checkout ended with curl 28, 5,450 missing response bytes, unexpected disconnect, early EOF and invalid index-pack output
- Timestamp: `2026-08-11T13:16:31.1153127+08:00`
- Claim-bearing observation before failure: `no`
- Scientific inference: none
- Evidence ceiling: `RESOURCE_FAILURE_ONLY__NO_SCIENTIFIC_INFERENCE`
- Scientific revision consumed: `no`

## Exact resources needed

Preferred alternative A:

- a complete archive or local Git bundle for `llvm-project` commit `1f112d62e1fa2c4f1a04887abd72da1ed61cf791` containing at least the full `llvm/` tree and commit metadata;
- its exact byte count, SHA-256, creation command, public LLVM Apache-2.0-with-LLVM-exception license, and a read-only placement path;
- expected compressed size is provider-dependent and must be declared and frozen before acceptance; the unpacked source plus build must keep the new resume below 4 GiB.

Accepted alternative B:

- a portable Windows x86_64 bundle built from exactly that commit, with `llc.exe`, `FileCheck.exe`, and `llvm-calc-occupancy.exe` (if the exact commit/build target provides it), AMDGPU registered, assertions/build flags recorded, and no system installer;
- per-file SHA-256, total bytes, `llc --version`, target list, build log/recipe, source-commit attestation and LLVM license;
- a different LLVM commit or a bootstrap-only release is not accepted.

Natural-input resource, required with either alternative:

- frozen ROCm examples commit `269e9068d6fd6e68b1cc5a76eb77744f88af42ec`, or 8–16 complete public natural-kernel-derived `amdgpu11.00` pre-scheduler MIR objects;
- manifest fields: repository commit, source path/hash, derived IR hash, MIR hash, kernel name and license;
- regression/synthetic MIR is not accepted as claim evidence.

## Minimum user action

Ask mainline to allocate a new immutable resume directory, then place one exact tool/source alternative and the natural-input resource there or provide read-only local paths. Supply byte counts and SHA-256 values before extraction/execution. Do not overwrite this directory or any older S5 package.

Safe first checks are `Get-Item -LiteralPath <asset>` and `Get-FileHash -Algorithm SHA256 -LiteralPath <asset>`, followed by archive traversal/size inspection and exact tool `--version`/target smoke in the new directory.

## Resume contract and limits

- unchanged object and preclaim gate: `EXPERIMENT_CONTRACT.yaml`
- first scientific command: forbidden until exact tools, 8–16 MIR, real baseline/candidate, verifier and full-cost paths all pass preclaim
- maximum new resume storage: 4 GiB
- maximum CPU: 4 hours
- no GPU/exclusive device, system install, global environment change, Stage B or automation
- scientific revision consumption remains deferred until immediately before the first valid claim-bearing corrected-mechanism observation

## Work already performed

- reused verified local bootstrap asset; no bootstrap network bytes
- extracted 740,825,211 bytes in 176.968 seconds
- downloaded and verified 37,847,576 bytes of CMake/Ninja wheels
- preserved 187,851,937 bytes of exact-source/Git failure state
- did not configure/build LLVM, fetch the natural corpus, derive MIR, or run baseline/candidate/verifier/replay
