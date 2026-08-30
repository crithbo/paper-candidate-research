# 其他题目与 Markdown 存储复核

## Markdown 不是当前空间主因

`stages/discovery/` 当前共有 11,944 files、198,819,846 bytes（约 189.61 MiB）。其中 5,829 个 Markdown 合计仅 10,321,098 bytes（约 9.84 MiB）。它们主要是 seed/RQ/source closure/raw gate/handoff 的审计链，正确归属是 `stages/discovery/`，不是 `rules/`。把这些文件迁入 `rules/` 会混淆“共享规范”和“历史执行证据”，并破坏 manifest/registry 路径。

Discovery 体积主要来自 PDF（约 89.09 MiB）、JSON（约 52.50 MiB）和 HTML（约 13.82 MiB），而非 Markdown。已完成历史轮可在未来建立 immutable content-addressed archive，但必须保留 canonical 路径映射与 manifest 语义，不能直接批量删文档。

## 当前最大题目及处置

| 题目 | 当前状态 | 主要体积 | 当前动作 |
|---|---|---:|---|
| PARQUET-PAGE-COSEGMENT | Stage A exceptional owner complete，等待独立 gate | 约 1.98 GiB；assets 939 MiB、resume1 839 MiB、artifacts/closing 约 246 MiB | `DO_NOT_TOUCH_PENDING_GATE`；重复 replay 与输入仍是 gate/negative-result 证据 |
| ROCKSDB-DICT-COVER | user-directed resource-blocked reserve | 约 1.33 GiB；tools 1.05 GiB、sources 105 MiB、build 71 MiB | `DO_NOT_TOUCH_RESERVE`；只有用户明确退役或重新冻结共享工具资产后才能压缩 |
| AIGER-DELTA-SCHEDULE | user-directed resource-blocked reserve | 约 194.61 MiB，集中于 resume1 | `DO_NOT_TOUCH_RESERVE`；保留 exact failure/recovery entry |
| QREFINE-TRITON-W4A16 | Stage A reboot pending | 约 28.55 MiB | 体积小且恢复依赖明确，不值得清理 |
| LLVM Bitcode / LLVM DWARF / Arrow / WebGraph | terminal STOP | 合计约 1.15 GiB | 已删除明显 build/toolchain；剩余多为结果、输入、witness 或依赖未闭合资产，若继续需另做 terminal evidence-pack compaction |

## 精确重复大文件扫描

对 `stages/` 中大于等于 1 MiB 的文件做只读 SHA-256 扫描：1,274 个大文件中发现 306 个 exact-duplicate groups，逻辑重复上限为 `1,536,805,890 bytes`。这是逻辑上限，不等于可实际回收空间，也不代表这些副本可直接删除。

主要重复来源：

- PARQUET pending-gate 的多次 replay 输入、candidate/baseline/boundary-oracle 结果；当前 claim-critical，不能删。
- RocksDB reserve 与 Occupancy 历史包中的同一 187,504,083-byte llvm-mingw archive；跨题共享前必须 refreeze inventory/manifest，当前不动。
- Arrow STOP 与 PARQUET pending-gate 的 PyArrow wheel/DLL；PARQUET 仍需，Arrow 一侧可作为未来 terminal compaction 候选。
- WebGraph STOP 的 matched-pair 重复 graph；属于决定性结果证据，只有先形成最小 witness/result pack 后才能压缩。
- Discovery backtest 中重复 PDF/HTML；历史 sealed pack 的角色隔离和哈希路径仍有审计价值，不能直接合并。

## 建议的下一安全波次

1. 暂不清理 PARQUET、RocksDB、AIGER、QRefine 等 pending/reserve/blocked 题。
2. 如继续降空间，优先冻结 `TERMINAL_EVIDENCE_PACK_COMPACTION_WAVE4`，只针对 Arrow/LLVM/WebGraph 等 STOP 题，将报告、manifest、关键结果与最小 witness 组成不可变保留包后，再删除经逐路径验证的重复输入/expanded result copies。
3. 跨题 toolchain、wheel、PDF 的去重应使用 MAINLINE 登记的 content-addressed shared asset 或 archive mapping；在所有引用与恢复路线重写完成前，不用硬链接替换、路径搬移或直接删副本。

