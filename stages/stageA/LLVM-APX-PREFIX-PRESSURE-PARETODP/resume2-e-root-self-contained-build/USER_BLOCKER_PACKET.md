# LLVM-APX-PREFIX-PRESSURE-PARETODP User Blocker Packet

## 中文摘要

- 卡在哪里：E 盘为 exFAT，唯一 LLVM build 在 266 字符对象目录上失败；required APX tools 未生成。
- 已经完成什么：官方 exact source、LLVM-MinGW、CMake、Ninja 的获取与哈希闭合；exact CMake 配置闭合；唯一 build 到 2407/3156。
- 需要用户做的最小动作：二选一——批准新 immutable resume 使用短路径命名空间并增加一次 build；或提供 exact commit 的已哈希 Windows x86-64 预构建工具包。
- 解阻后的第一步：MAINLINE 冻结新 context/assignment，复核 retained archives/env 哈希，再在新写目录运行 preclaim 之前的资源 build gate。
- 该阻塞是否包含科学负结论：否。

- Stage and assignment: Stage A resource gate / `STAGEA-L1-20260825-LLVM-APX-RESUME2-E-ROOT-SELF-CONTAINED-BUILD`
- Status: `BLOCKED_USER_ACTION_REQUIRED`
- Blocker kind: `TOOLCHAIN / FILESYSTEM_PATH_CAPABILITY`
- Exact failure: Ninja exit 1 at `2407/3156`; exFAT could not create a 266-character `SharedLexicalRepresentation` object directory.
- Claim-bearing observation obtained before failure: `no`
- Scientific inference allowed: `none`
- Evidence ceiling: `RESOURCE_FAILURE_ONLY__NO_SCIENTIFIC_INFERENCE`
- Scientific revision consumed: `no`
- Immutable failure directory: this assignment; hashes in `HASH_MANIFEST.sha256`.

## Exact resource needed

- Existing exact source archive: 278,674,752 bytes, SHA-256 `F90FFC22BF3B220B726C2E4D7953076520C4188ED4409213AFB9829B98254747`.
- Existing portable bootstrap: LLVM-MinGW 20260616, CMake 4.4.2, Ninja 1.13.0; exact hashes in `BUILD_PROVENANCE.yaml`.
- Missing capability: a build namespace with sufficiently short full paths, or an exact-commit prebuilt bundle containing `llc`, `llvm-mc`, `llvm-objdump`, `llvm-readobj`, `opt`, `FileCheck`, and `clang`.
- License/ownership: public open source; LLVM Apache-2.0 WITH LLVM-exception and bundled notices retained.
- Accepted alternative A: a new user-authorized short-drive/process namespace that still persists all bytes under this topic's E-root resource boundary, plus one new build attempt.
- Accepted alternative B: user-provided unmodified exact-commit Windows x86-64 prebuilt bundle with archive/executable hashes, official provenance, build configuration and licenses.

## Minimum user action

Authorize MAINLINE to freeze a new immutable resume with the exact namespace/build permission, or provide alternative B. The current assignment cannot reuse its exhausted build attempt.

## Resume contract

- Frozen source assignment SHA-256: `FCF62E2E75A9084F019C6609739A589BA65A0D77441B443E1F6336A17DB722A9`
- New resume directory: MAINLINE must assign it; do not overwrite `resume2-e-root-self-contained-build`.
- First step after unblocking: rehash retained archives/env, verify short-path containment and process-local redirects, then issue the newly authorized build command.
- Natural/candidate/baseline/benchmark/full-cost/claim-bearing work remains forbidden until a separate preclaim assignment.

## Work and cost

- Network: 508,822,273 persisted bytes, 6/6 attempts.
- Storage: 4,703,991,763 bytes before MAINLINE GC.
- Build: 1/1 clean build, two jobs, 1355.388 s wall, exit 1.
- Exact process-tree CPU and total assignment wall were unavailable and were not estimated.
- Explicitly not executed: required-tool smokes, natural inputs, candidate, baselines, benchmarks, full-cost, Stage B and cleanup.
