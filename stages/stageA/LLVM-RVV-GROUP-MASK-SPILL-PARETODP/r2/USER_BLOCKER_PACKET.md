# LLVM-RVV-GROUP-MASK-SPILL-PARETODP User Blocker Packet

## 中文摘要

- 卡在哪里：safe source extraction 在一个 260 字符普通文件路径上收到 `FileNotFoundError [Errno 2]`。
- 已经完成什么：五个官方资产 5/5 单次下载、哈希和 exact commit verification；所有 archive member 的安全预检。
- 需要的最小动作：MAINLINE/用户在新的 immutable resume assignment 中明确授权一次 long-path-aware extraction（保持逻辑根 `resources/src/s`、不使用 subst/junction/reparse），或提供同 commit、带 manifest 的预解压 source/tool bundle。
- 解阻后的第一步：只复制并哈希接受本题 r2 保留的五个 exact downloads，然后以获批 long-path-aware route 安全解压；不得覆盖 r2。
- 该阻塞包含科学负结论：否。

- Stage and assignment: `STAGEA_RESOURCE_GATE_RESUME_FROM_BLOCKER / STAGEA-L1-20260825-LLVM-RVV-R2-E-ROOT-EXACT-TOOLCHAIN`
- Status: `BLOCKED_USER_ACTION_REQUIRED`
- Blocker kind: `TOOLCHAIN / FILESYSTEM_PATH_CAPABILITY`
- Exact failure: `FileNotFoundError [Errno 2]` at 260-character Windows path during source extraction attempt 1.
- Claim-bearing observation obtained before failure: no
- Scientific inference allowed: none
- Evidence ceiling: `RESOURCE_FAILURE_ONLY__NO_SCIENTIFIC_INFERENCE`
- Scientific revision consumed: no
- Immutable failure directory: `stages/stageA/LLVM-RVV-GROUP-MASK-SPILL-PARETODP/r2`

## Exact resource needed

- Frozen `RESOURCE_ROOT`: `<LOCAL_PROJECT_ROOT>/stages/stageA/LLVM-RVV-GROUP-MASK-SPILL-PARETODP/r2/resources`
- Canonical inventory: `RESOURCE_INVENTORY.yaml`
- Project-controlled bytes persisted: 1,128,988,666
- Exact commit: `5bb2565693f062a9e99929db1814a7a076d4dc76`
- Retained exact source archive: 280,166,923 bytes; SHA-256 `BC0E5CC6B7F4978242749E0FF666DDA851994EFFC178BD782C4799D7C2B52695`
- Required capability: extraction of contained regular members whose full path reaches 260 characters without system install, global change, subst, junction, symlink or reparse.
- Accepted alternative: an exact-commit pre-extracted regular-file source tree and portable bootstrap tools with deterministic manifest, provenance, license notices and no reparse entries.

## Minimum user/mainline action

Freeze one new resume directory and exactly one of:

1. authorize a long-path-aware extraction implementation that uses extended-length Win32 file access while preserving the frozen logical paths; or
2. provide the exact pre-extracted source/tool input described above.

No WSL, system install or global environment change is needed or requested.

## Resume contract

- Do not overwrite r2.
- Reuse only the same-topic retained five assets after exact hash acceptance by the new assignment.
- First resource action after unblock: copy/hash-accept retained official assets into the new assignment's `resources/downloads`.
- Continue to forbid second configure/build, source patch, RVV F1–F5 and all natural/claim actions until a later separate authorization.

## Work already performed and cost

- Network: 510,320,698 bytes, 5/5 attempts, no retry.
- Stored at closeout: 1,128,988,666 bytes.
- Download wall time: 1,202.256 seconds.
- Exact CPU time: unavailable in this environment; not estimated.
- GPU/device use: none.
- Explicitly not executed: tool extraction, configure, build, tool packaging, smoke, F1–F5, natural/candidate/baseline/performance/full-cost/claim run, cleanup.

