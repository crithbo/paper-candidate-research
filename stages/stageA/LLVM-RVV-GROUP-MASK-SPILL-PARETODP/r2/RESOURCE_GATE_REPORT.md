# LLVM RVV r2 exact toolchain resource-gate report

## 中文摘要

- 得到什么：五个冻结官方资源均一次成功，exact commit metadata 与 source archive 已固定哈希，safe-member preflight 通过。
- 卡在哪里：在唯一 source extraction 路线中，Windows/exFAT 无法创建一个长度恰为 260 字符的普通源文件路径。
- 没有执行什么：没有重试 extraction，没有 configure、build、工具封装、smoke、RVV F1–F5、自然/候选/基线/性能/full-cost/claim run。
- 下一步：MAINLINE 验收 blocker 后，在新 immutable resume 中显式授权 long-path-aware extraction，或提供等价的 exact-commit 预解压输入；不得覆盖 r2。
- 科学含义：无。该结果仅是资源平台路径能力失败，不能支持 PASS、STOP、reserve 或任何机制判断。

## Official asset closure

- Official assets: 5/5 PASS, one attempt each, no retry.
- Network: 510,320,698 / 671,088,640 bytes.
- Largest response: 280,166,923 / 335,544,320 bytes.
- Commit: `5bb2565693f062a9e99929db1814a7a076d4dc76`; GitHub verification valid.
- Archive preflight: 198,248 source members, 0 unsupported, 19 contained link entries recorded without creation.

## Decisive mechanical failure

The manual no-reparse extractor created 71,167 regular files (616,586,465 bytes) under `resources/src/s` before `FileNotFoundError [Errno 2]` at:

`resources/src/s/libcxx/test/std/thread/thread.mutex/thread.mutex.requirements/thread.sharedtimedmutex.requirements/thread.sharedtimedmutex.class/try_lock_until_deadlock_bug.pass.cpp`

The full Windows-form path is 260 characters; its parent is 223 characters. The archive member was safe and contained. The failure is therefore a local path-capability blocker, not an archive-integrity or scientific failure.

The frozen build-root projection itself remained `94 / 225 < 240`, but configure was not started because extraction failed first.

## Closeout

- Resource root: 1,128,988,666 logical bytes after failure capture.
- Reparse entries: 0.
- Active related processes: 0.
- Owner cleanup: not performed.
- Exact MAINLINE-only cleanup proposal: partial `resources/src/s` plus `resources/cache`, 618,605,581 bytes.
- Projected retained resume capsule: 510,383,085 bytes, below 2 GiB.

Status recommendation is limited to `BLOCKED_USER_ACTION_REQUIRED__RESOURCE_FAILURE_ONLY__NO_SCIENTIFIC_INFERENCE`.

