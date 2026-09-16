# S5-OCCUPANCY-CLIFF-JOINTCODEGEN User Blocker Packet

- Stage and assignment: `STAGEA_REVISION1_RESUME_FROM_BLOCKER`; `STAGEA-L2-20260809-S5-OCCUPANCY-CLIFF-JOINTCODEGEN-BLOCKER-RESUME1`
- Status: `BLOCKED_USER_ACTION_REQUIRED`
- Blocker kind: `DOWNLOAD / NETWORK`
- Exact failure and timestamp: `2026-08-09T16:01:34+08:00`; one official release request advertised `187,504,083` bytes but delivered `133,887,242`, short by `53,616,841`.
- Claim-bearing observation obtained before failure: `no`
- Scientific inference allowed: `none`
- Evidence ceiling: `RESOURCE_FAILURE_ONLY__NO_SCIENTIFIC_INFERENCE`
- Scientific revision consumed: `no`
- Immutable failure directory and hashes: this `revision1-resume1` directory; see `HASH_MANIFEST.sha256`

## Exact resource needed

- Name/version/commit: exact LLVM `1f112d62e1fa2c4f1a04887abd72da1ed61cf791` AMDGPU tools (`llc`, `FileCheck`, `llvm-calc-occupancy`) and 8-16 complete natural `amdgpu11.00` MIR.
- Frozen bootstrap asset: `llvm-mingw-20260616-ucrt-x86_64.zip`.
- Expected size and SHA-256: exactly `187,504,083` bytes; `b9b68a4d276e16fa25802aaba458e4638f64b3884c290aaccdc2d87083b6ca35`.
- Failed partial: `133,887,242` bytes; SHA-256 `4ec2b9f6de4fadfd6864041faeefbc1df2fa07508dda80b850dbff501f40cb4e`; it is not acceptable and must not be resumed or extracted.
- Required files/capabilities: exact-commit executable tools; natural corpus manifest with repository commit, source path/hash, IR hash, MIR hash, and kernel name; verifier-legal MIR.
- License/ownership: public LLVM/ROCm sources and their licenses; no proprietary substitution.
- Accepted alternatives: (1) a complete copy of the frozen bootstrap asset with matching size/SHA from the official release; or (2) a verified exact-commit AMDGPU bundle and natural MIR corpus with equivalent immutable provenance. Proxy LLVM versions are not accepted.

## Minimum user action

- Provide or locally place the complete verified bootstrap archive, or the complete verified exact tool/corpus bundle, in a newly authorized resume directory; do not overwrite `revision1` or `revision1-resume1`.
- Exact handoff fields: filename, byte count, SHA-256, source URL or owner-provided provenance, exact LLVM commit attribution, tool `--version` output, and corpus manifest.
- Safe checks before extraction: `Get-Item -LiteralPath <asset>` and `Get-FileHash -Algorithm SHA256 -LiteralPath <asset>`; require the values above.

## Resume contract

- Frozen pre-acquisition controls: `PREACQUISITION_MANIFEST.sha256` verifies `4/4`.
- New resume directory: mainline must allocate it; never overwrite the immutable failure records.
- First action after unblocking: verify exact byte count and SHA-256 before extraction/execution, then verify exact source/tool commit identities.
- Resource/time/device ceiling: at most 4 GiB, at most 4 CPU-hours, no exclusive device, no AMD GPU required, no Stage B.

## Work already performed and cost

- Network bytes/time: `133,887,242` asset bytes; about 30 seconds for the sole download command, plus small metadata requests.
- CPU/storage/device use: zero build/experiment CPU-hours; about 128 MiB partial plus text; no GPU/device use.
- Explicitly not executed: extraction, exact checkout/build, corpus fetch, MIR derivation, GCNSchedStrategy+greedy baseline, candidate, verifier, full-cost scientific probe, and double replay.

