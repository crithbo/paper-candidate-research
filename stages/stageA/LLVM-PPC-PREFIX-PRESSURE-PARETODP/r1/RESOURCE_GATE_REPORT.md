# LLVM PPC r1 exact toolchain resource-gate report

## 中文摘要

- 得到什么：long-path preflight 通过；exact commit metadata 与 source archive 各一次成功并固定哈希。
- 卡在哪里：第三个冻结资产 LLVM-MinGW 的官方 GitHub URL 返回 HTTP 302。control 明确 `followed_redirects_max=0`，因此没有跟随、没有保存响应体、没有重试。
- 未执行什么：CMake/Ninja 未尝试；safe-member preflight、source/tool extraction、configure、build、package、smoke、PPC F1–F5 与所有 claim action 均未启动。
- 下一步：MAINLINE 在新的 immutable resume 中冻结允许的官方 redirect chain，或提供 exact LLVM-MinGW asset/manifest；不得重试或覆盖 r1。
- 科学含义：无。该结果仅是官方资产 transport-policy blocker。

## Mechanical record

- Long-path capability: PASS at 473 logical characters; no persistent probe or reparse.
- Network attempts: 3/5.
- Persisted response bytes: 280,173,064 / 671,088,640.
- Commit metadata: PASS, exact commit `f127b4c19c63b0492fb924934e37e032c17ea35b`, valid signature.
- Exact source archive: PASS, 280,166,423 bytes, SHA-256 `C7871896611513E3E850818A7E5C6B0C600BE60BA46260105602EB9BFBD651CF`.
- LLVM-MinGW: HTTP 302 observed, 0 redirects followed, 0 response bytes persisted.
- Partial files: 0; reparse entries: 0; active related processes: 0.

## Closeout

- Resource root: 281,845,866 bytes / 84 files.
- Resume-critical downloads/logs/scripts retained: 280,198,868 bytes.
- MAINLINE-only cleanup candidate: `resources/cache`, 1,646,998 bytes / 74 files.
- Owner cleanup: not performed.

Decision is limited to `BLOCKED_USER_ACTION_REQUIRED__RESOURCE_FAILURE_ONLY__NO_SCIENTIFIC_INFERENCE`.

