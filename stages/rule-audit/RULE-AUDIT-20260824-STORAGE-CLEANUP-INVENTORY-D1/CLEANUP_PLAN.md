# 项目存储逐目录清理计划（支线只提案）

## 结论

当前工作根 `D:/project/writing/reserch` 的可见内容约为 `41.17 GB`（约 `38.34 GiB`）。其中：

| 目录 | Bytes | 约 GiB | 文件数 | 结论 |
|---|---:|---:|---:|---|
| `stages/` | 41,171,107,485 | 38.344 | 1,019,083 | 几乎全部占用 |
| `stages/stageA/` | 39,568,944,964 | 36.852 | 1,005,128 | 主要来源：源码、构建、工具链、resume/revision 副本 |
| `stages/stage0/` | 1,400,984,741 | 1.305 | 1,285 | 主要为 Rust 工具链下载、extract 与 prefix 重复副本 |
| `stages/discovery/` | 198,819,846 | 0.185 | 11,944 | 规模次要 |
| `stages/rule-audit/` | 2,211,504 | 0.002 | 682 | 规则报告与 ACK，非空间问题 |

`STOP` 表示科学终态，不代表存储自动删除。当前至少约 `22.51 GB` 的 STOP 相关目录仍在磁盘；保留科学结论与复核证据是正确的，但其中大量 build、toolchain、下载包和重复 source checkout 可进入单独清理复核。

本清单没有执行删除、移动、压缩或共享状态修改。

## 动作标签

- `KEEP_CANONICAL_EVIDENCE`：必须保留。包括 assignment/context、报告、结果表、handoff、manifest、关键命令日志、最小 witness、resource inventory、版本/许可证/provenance 和决定终态的原始小证据。
- `DO_NOT_TOUCH_NONTERMINAL`：blocked、reserve、pending gate、pending Stage B 或状态歧义的题目；不得因占空间破坏恢复入口。
- `DELETE_CANDIDATE_REBUILDABLE`：只表示可以进入删除前复核，不表示已获删除授权。必须先确认不被 canonical manifest、结果或复现合同依赖，并确认可重新获取或无需恢复。
- `DEDUP_REVIEW_REQUIRED`：存在两份相同用途的大目录；先用 exact commit、manifest、内容哈希和下游引用确定 canonical 副本，再删除另一份。
- `ARCHIVE_OPTIONAL`：可考虑压缩或迁移，但仍需用户批准精确目标。

## Stage A 逐题目录清单

| 题目目录 | Bytes | 约 GiB | 当前状态 | 建议 |
|---|---:|---:|---|---|
| `CVC5-ALETHE-SHAREMAP` | 7,637,436,194 | 7.113 | `STAGEA_BLOCKED_USER_ACTION_REQUIRED` | `DO_NOT_TOUCH_NONTERMINAL` |
| `S5-OCCUPANCY-CLIFF-JOINTCODEGEN` | 6,983,590,194 | 6.504 | `STAGEA_BLOCKED_USER_ACTION_REQUIRED` | `DO_NOT_TOUCH_NONTERMINAL` |
| `RISCV-ZCMP-CALLEESAVE-PUSHLIST-PARETODP` | 6,774,121,460 | 6.309 | independent Stage A gate `STOP` | 保留证据；复核 rebuildable descendants |
| `WEBGRAPH-REFERENCE-FOREST` | 6,217,214,424 | 5.790 | `BELOW_Q2_STOP` | 保留证据；复核 build/toolchain/download 重复项 |
| `LLVM-DWARF-CALLSITE-RECONSTRUCTIBILITY` | 5,318,304,919 | 4.953 | independent Stage A gate `STOP` | 保留证据；优先复核 build，源码另作可恢复性检查 |
| `PARQUET-PAGE-COSEGMENT` | 2,122,267,692 | 1.977 | valid negative pending independent gate | `DO_NOT_TOUCH_NONTERMINAL` |
| `LLVM-BITCODE-ABBREV-PLANNER` | 1,455,366,090 | 1.355 | `STOP / BELOW_Q2_STOP` | 保留结果；复核 portable tools |
| `ROCKSDB-DICT-COVER` | 1,429,853,385 | 1.332 | `HUMAN_RESEARCH_RESERVE` | `DO_NOT_TOUCH_NONTERMINAL` |
| `FLATBUFFERS-PROFILED-WHOLE-BUFFER-LAYOUT` | 962,877,653 | 0.897 | independent Stage A `STOP` | 保留 revision/results；复核 initial toolchain |
| `ARROW-IPC-STREAM-JOINT-DICTIONARY-EVOLUTION` | 364,808,993 | 0.340 | independent Stage A `BELOW_Q2_STOP` | 保留 artifacts/results；复核 large assets |
| `AIGER-DELTA-SCHEDULE` | 204,114,753 | 0.190 | `HUMAN_RESEARCH_RESERVE` | `DO_NOT_TOUCH_NONTERMINAL` |
| `QREFINE-TRITON-W4A16` | 29,932,752 | 0.028 | `BLOCKED_USER_ACTION_REQUIRED` | `DO_NOT_TOUCH_NONTERMINAL` |
| `S6-EGRAPH-LIVEEXTRACT` | 14,522,395 | 0.014 | `STOP / BELOW_Q2_STOP` | 体积小，保留全部 |
| `S4-SLO-PAGEPACK` | 14,169,906 | 0.013 | policy-hold reserve | `DO_NOT_TOUCH_NONTERMINAL` |
| `GIT-PACK-FOREST` | 11,654,827 | 0.011 | `STOP / BELOW_Q2_STOP` | 体积小，保留全部 |
| `COH-REGION-LIFECYCLE` | 9,706,580 | 0.009 | `STOP / BELOW_Q2_STOP` | 体积小，保留全部 |
| `PB-DELETE-SCHEDULE` | 7,485,592 | 0.007 | `STOP / BELOW_Q2_STOP` | 体积小，保留全部 |
| `_reviews` | 6,037,130 | 0.006 | canonical independent reviews | `KEEP_CANONICAL_EVIDENCE` |
| `S1-O6-MOBILE-TRAFFIC-CRITICALITY` | 4,747,734 | 0.004 | `HUMAN_RESEARCH_RESERVE` | `DO_NOT_TOUCH_NONTERMINAL` |
| `S6-JS-PREFIXBOUND` | 239,255 | <0.001 | `PENDING_USER_STAGEB_REVIEW` | `DO_NOT_TOUCH_NONTERMINAL` |
| `O4-DYNCACHE-PGM` | 227,790 | <0.001 | `STOP / BELOW_Q2_STOP` | 体积小，保留全部 |
| `_resource-preflight` | 81,809 | <0.001 | control evidence | `KEEP_CANONICAL_EVIDENCE` |
| `V8-SNAPSHOT-CONSTRAINT-SCHEDULER` | 59,624 | <0.001 | `BLOCKED_USER_ACTION_REQUIRED` | `DO_NOT_TOUCH_NONTERMINAL` |
| `LLVM-PPC-PREFIX-PRESSURE-PARETODP` | 37,251 | <0.001 | reserve/recovery records coexist | `DO_NOT_TOUCH_STATE_AMBIGUITY` |
| `LLVM-RVV-GROUP-MASK-SPILL-PARETODP` | 33,967 | <0.001 | reserve/recovery records coexist | `DO_NOT_TOUCH_STATE_AMBIGUITY` |
| `LLVM-APX-PREFIX-PRESSURE-PARETODP` | 29,392 | <0.001 | reserve/recovery records coexist | `DO_NOT_TOUCH_STATE_AMBIGUITY` |
| `_assignments` | 23,203 | <0.001 | assignment contracts | `KEEP_CANONICAL_EVIDENCE` |

## 精确清理候选

以下均需在执行前重新核对绝对路径、当前大小、manifest 引用、资源 inventory、恢复路线和用户授权。

### 1. RISCV STOP 题

| 绝对路径 | Bytes | 类型 | 建议 |
|---|---:|---|---|
| `D:/project/writing/reserch/stages/stageA/RISCV-ZCMP-CALLEESAVE-PUSHLIST-PARETODP/resume1/b` | 1,616,913,835 | build tree | `DELETE_CANDIDATE_REBUILDABLE` |
| `.../resume1/resources/downloads` | 526,503,118 | downloaded archives/assets | 验证 URL/hash/license 后 `DELETE_CANDIDATE_REBUILDABLE` |
| `.../resume1/s` | 1,454,235,029 | source checkout A | 与 `resources/source` 做 `DEDUP_REVIEW_REQUIRED` |
| `.../resume1/resources/source` | 2,270,752,593 | source checkout B | 保留 exact canonical 一份；另一份预计至少可回收 1,454,235,029 bytes |
| `.../resume1/resources/toolchain` | 884,698,799 | portable toolchain | 保留版本、hash、license、构建合同后 `ARCHIVE_OPTIONAL/DELETE_CANDIDATE_REBUILDABLE` |
| `.../resume1/resources/exact_blobs` | 40,613 | exact evidence inputs | `KEEP_CANONICAL_EVIDENCE` |
| `.../resume1/resources/corpus` | 1,032,631 | natural/canonical corpus | 默认 `KEEP_CANONICAL_EVIDENCE` |

### 2. LLVM DWARF STOP 题

| 路径 | Bytes | 类型 | 建议 |
|---|---:|---|---|
| `.../LLVM-DWARF-CALLSITE-RECONSTRUCTIBILITY/resume1/build` | 2,678,702,281 | build tree | `DELETE_CANDIDATE_REBUILDABLE` |
| `.../resume1/src` | 2,271,781,606 | LLVM/source checkout | 仅在 exact commit、patch、hash、license 与可重取路线闭合后 `ARCHIVE_OPTIONAL` |
| `.../resume1/resources` | 296,351,767 | musl/blink source/build resources | 分项复核，禁止整目录直接删除 |
| `.../resume1/results`、`witness`、根部报告/manifest | small | decisive evidence | `KEEP_CANONICAL_EVIDENCE` |

### 3. WebGraph STOP 题

| 路径 | Bytes | 类型 | 建议 |
|---|---:|---|---|
| `.../WEBGRAPH-REFERENCE-FOREST/build` | 2,092,765,095 | three Cargo target trees | `DELETE_CANDIDATE_REBUILDABLE` |
| `.../revision1/build` | 695,840,351 | revision build tree | `DELETE_CANDIDATE_REBUILDABLE` |
| `.../toolchain/cargo-home` | 628,958,939 | Cargo home A | 与 `revision1/toolchain` 做 `DEDUP_REVIEW_REQUIRED` |
| `.../revision1/toolchain` | 628,958,939 | Cargo home B | 只保留一份或仅保留 lock/provenance |
| `.../toolchain/msys64` | 2,018,867,802 | portable MSYS toolchain | exact version/hash/license 固定后 `ARCHIVE_OPTIONAL` |
| `.../downloads` | 53,347,654 | archives | hash/provenance 固定后 `DELETE_CANDIDATE_REBUILDABLE` |
| 根部 `HASH_MANIFEST.sha256`、results、witness/inputs | small | decisive evidence | `KEEP_CANONICAL_EVIDENCE` |

### 4. 其他 STOP 题

| 路径 | Bytes | 类型 | 建议 |
|---|---:|---|---|
| `.../LLVM-BITCODE-ABBREV-PLANNER/tools` | 1,044,762,148 | 7 个大型 portable tools | 保留工具版本/hash/license/命令后 `ARCHIVE_OPTIONAL` |
| `.../FLATBUFFERS-PROFILED-WHOLE-BUFFER-LAYOUT/initial/toolchain` | 933,307,070 | portable toolchain | revision/results 保留；toolchain 可复核清理 |
| `.../ARROW-IPC-STREAM-JOINT-DICTIONARY-EVOLUTION/initial/assets` | 241,287,176 | input/runtime assets | provenance/必要 witness 检查后复核 |
| `.../ARROW-IPC-STREAM-JOINT-DICTIONARY-EVOLUTION/revision1/assets` | 120,121,561 | revision assets | 与 initial assets 做依赖/重复检查 |

### 5. Stage 0 Rust STOP 题

题目 `RUST-HISTORY-AWARE-CGU-PARTITION` 已登记 `BELOW_Q2_STOP`，其 `revision1/resume1` 占 1,370,703,122 bytes：

| 路径 | Bytes | 建议 |
|---|---:|---|
| `.../resume1/acquired` | 197,800,966 | URL/hash/license 已固定且 prefix 可复核后，删除压缩包候选 |
| `.../resume1/toolchain/extract` | 577,871,972 | 与 prefix 内容/依赖核对后，重复解压副本候选 |
| `.../resume1/toolchain/prefix` | 592,200,265 | 当前建议保留 canonical runnable copy，或改为 archive |

## 回收量分层

- STOP 相关目录的理论上限：约 `22.51 GB`；不能整题删除。
- 已精确定位的“删除前复核池”：约 `13.75 GB`。该值包括 build、下载包、明确重复副本和可重建工具链，但仍需逐项证据/恢复检查。
- 若进一步允许归档或移除 LLVM source、MSYS 等 exact toolchain，可回收更多；这会提高未来复核和重放成本，不应默认执行。

## 执行前必须满足的门

1. MAINLINE 只作为最终 shared-file/state single writer 接收本支线结果；本支线不派发主线代做任务。
2. 用户必须批准精确绝对目标列表、预计回收字节、恢复性与保留包。
3. 每个目标必须重新解析绝对路径并机械确认位于 `D:/project/writing/reserch` 内，且不能是 workspace root、`stages/`、候选根目录或模糊 glob。
4. 先生成保留包：canonical report/results/handoff/manifest/witness/inventory/provenance 的路径与 SHA256。
5. 删除只允许针对验证后的 leaf descendant；不得递归删除完整题目目录。
6. blocked/reserve/pending gate 继续 `DO_NOT_TOUCH_NONTERMINAL`。

