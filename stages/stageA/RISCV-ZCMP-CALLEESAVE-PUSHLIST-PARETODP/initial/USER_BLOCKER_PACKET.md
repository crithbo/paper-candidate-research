# RISCV-ZCMP-CALLEESAVE-PUSHLIST-PARETODP User Blocker Packet

## 中文摘要

- 卡在哪里：完整 LLVM commit/blob 已解析，但本地没有绑定该 commit、启用 RISC-V 的原生 writer/verifier/assembler/linker/reader；两个决定性源码 blob 也不在本地 exact 内容集合中。
- 已经完成什么：8/8 上游哈希、完整 40 位 commit、有效签名、13 个决定性 blob pin、11/13 本地 source parity、现有工具版本/target 盘点及 full-cost 预登记。
- 需要用户做的最小动作：让主线新建 `resume1`，提供一个 exact-commit、RISC-V-enabled 的 portable LLVM toolchain，并提供两个缺失 exact blob 内容；或显式授权在 `resume1` 内做对应的有限官方获取。无需系统安装。
- 解阻后的第一步：只读核对 tool binary hashes/build provenance/registered targets 与两个 blob 的 `git hash-object`，通过后重新从 PRE_CLAIM gate 开始。
- 该阻塞是否包含科学负结论：否。

- Stage and assignment: Stage A / `STAGEA-L3-20260814-RISCV-ZCMP-CALLEESAVE-PUSHLIST-PARETODP-INITIAL-V8.7`
- Status: `BLOCKED_USER_ACTION_REQUIRED`
- Blocker kind: `TOOLCHAIN / SOURCE_CONTENT`
- Exact failure and timestamp: `2026-08-14T11:50:24.2743791+08:00`; exact metadata resolved, exact native replay chain absent.
- Claim-bearing observation obtained before failure: `no`
- Valid evidence already obtained and hashes, if yes: no scientific result; provenance metadata is in `OFFICIAL_METADATA_PIN.yaml`.
- Claims supported so far, if any: none beyond resource/provenance facts.
- Claims/gates still unresolved or unsupported: both native plans, MachineVerifier, assembly/link/unwind, current union, bijection/FPT realization, natural residual and full cost.
- Scientific inference allowed: `none`
- Evidence ceiling: `RESOURCE_FAILURE_ONLY__NO_SCIENTIFIC_INFERENCE`
- Scientific revision consumed: `no`
- Immutable failure directory and hashes: this `initial` directory; canonical hashes in `HASH_MANIFEST.sha256`.

## Exact resource needed

- Name/version/commit: portable LLVM at `ba5bccfe01368f76e74d6ff4c35f1330e155b4ba`, RISC-V target enabled, preferably assertions enabled.
- Expected size and SHA-256/signature: provider must declare archive size, build commands/flags and archive/binary SHA-256 before execution; no unknown build hash is invented.
- Required files or capabilities: `llc` with `riscv32` and MachineVerifier support, `llvm-mc`, `llvm-objdump`, `llvm-readobj`/`llvm-readelf`, `ld.lld`, and any exact pipeline helper required to materialize the frozen MIR; RV32IMAC+Zcmp and CFI/unwind support.
- Required exact source content: `RISCVInstrInfoZc.td` git blob `f802748a5a1dc9c79577896eed4351796ce6ed8f` and `RISCVTargetMachine.cpp` git blob `e5ebd2a071d05e147b6bc24cb5e9378bbffabd97`. The other 11 decisive local blobs already match.
- License/ownership constraints: official LLVM Apache-2.0 WITH LLVM-exception provenance; no private or unverified binary.
- Accepted alternative forms:
  1. User-provided portable exact-commit toolchain plus the two exact files, all with hashes/provenance.
  2. A new bounded authorization to download an official exact-commit portable toolchain and only the two official raw blob contents into `resume1`, without system install or source build.
  3. A new bounded authorization for an exact source build inside `resume1`; this is not authorized now and must remain under a newly frozen resource ceiling.

## Minimum user action

- What the user should provide, approve or place: choose one route above; the smallest route is a ready portable exact toolchain plus two small exact source files.
- Exact destination or handoff method: new immutable `stages\stageA\RISCV-ZCMP-CALLEESAVE-PUSHLIST-PARETODP\resume1`; do not modify `initial`.
- Safe verification command/read-only check: tool `--version`, `llc --version` target enumeration, SHA-256 of binaries, build provenance check, and `git hash-object` for the two files before any MIR replay.

## Resume contract

- Frozen contract SHA-256: `4E4CAEFE58CA335772C5DD80137F354543348BAFA8259BBEFA77D32ABFC90A51`.
- New resume directory; never overwrite failure record: `stages\stageA\RISCV-ZCMP-CALLEESAVE-PUSHLIST-PARETODP\resume1`.
- First command after unblocking: exact provenance/hash/target inventory.
- Resource/time/device ceiling: mainline must freeze the new route; absent expansion, retain 4 GiB, 4 CPU-hours and 24 wall-hours, with no system/global modification.

## Approved finite recovery envelope

- User authorization ID: current local-assets plus official-metadata-only Stage A assignment.
- Approved routes, ordered and bounded: official commit/tree metadata under 10 MiB, then local asset discovery.
- Attempt count and budget per route: metadata body bytes 111,029; one local inventory pass.
- Routes already exhausted with mechanical evidence: short locator, tree/blob pinning, PATH/workspace exact tool discovery, local source blob parity.
- Approved routes not yet attempted: none.
- Routes that succeeded and work resumed: metadata pin succeeded; scientific execution did not resume.
- Total network/storage/CPU/GPU/device cost versus envelope: 111,029 JSON body bytes; no blob/archive/build/install/GPU; diagnostic CPU/RSS unavailable and not estimated.
- Exact envelope expansion now requested, if any: portable exact toolchain and two exact source blobs, or explicit bounded official acquisition/build authorization in `resume1`.
- `USER_DIRECTED_RESERVE_FALLBACK` authorized: `no`
- If yes, exact reversible reserve state: not applicable.
- Required `RESUME_FROM_RESERVE` entry point: not applicable.

## Work already performed and cost

- Network bytes/time: 111,029 successful JSON body bytes; response/TLS overhead unexposed; all requests official metadata only.
- CPU/storage/device use: read/hash/version probes and small text package; no GPU/device; aggregate CPU/RSS unexposed.
- What was explicitly not executed: source/blob/archive download, source build, install, Plan P/S MIR, MachineVerifier, assembler/linker/unwind replay, candidate, current-union grid, natural corpus and Stage B.
- Other approved work packages continuing/completed while blocked: none in this lane.
- Missing gate's consequence for Stage B paper sufficiency: no Stage A scientific evidence exists; independent Stage A PASS review and Stage B are unavailable.

