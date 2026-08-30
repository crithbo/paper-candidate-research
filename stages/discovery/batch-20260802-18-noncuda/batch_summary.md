# 非 CUDA Discovery 第18波：research-shape-first

日期：2026-08-02；仅写本批目录，未运行大实验、未改主控。先读 `registry.yaml`、`history.md` 与现有第15波材料；特别排除了已停的 `QCOMP-ERRREF` 证书核、LSM 边界 selector、QNN session-admission，以及第15波已提出的 LLVM poison / UPMEM owner-set / RTL reset 对象。

筛选冻结项为：same-object、截至本日定位到的 primary-source strongest-union、自然 artifact、paper-kernel、完整成本、独立 falsifier。`SEARCH_BOUNDED_OPEN` 只表示有限检索尚未定位严格五重同一覆盖，不是“首次”主张。

| ID | 赛道 | paper-kernel 判定 | 建议 | 学术 / AI / 总分 |
|---|---|---|---|---:|
| TENSOR-FIBER-DELTAORDER | 稀疏张量编译 / 数据结构 | 动态纤维的增量有序维护算法与 work bound，不是 format selector | PROPOSE_STAGE0 | 55 / 23 / 78 |
| SR-COUPLED-ROUNDING | 近似计算 / 数值算法 | 有限状态耦合随机舍入器及跨算子 bias bound，不是 bitwidth menu | PROPOSE_STAGE0 | 53 / 25 / 78 |
| DDF-PROVENANCE-COMPACT | 数据系统 / 增量计算 | 可删除的递归 provenance compacting data structure，而非 checkpoint 策略 | PROPOSE_STAGE0 | 54 / 22 / 76 |
| FLINK-TIMER-CALENDAR | 流式运行时 / 数据结构 | watermark-aware hierarchical calendar queue 的实现和 amortized bound | PROPOSE_STAGE0 | 51 / 22 / 73 |
| PIM-EMBED-REDUCE-OWNERS | PIM / 分布式 embedding | ownership-changing reduction layout 与可证明通信界；需真实 PIM 平台闭合 | RESERVE_RECOMMENDED | 56 / 9 / 65 |
| ONNX-QDQ-LATENCY-SELECT | 量化系统 | 全部只是 Q/DQ placement + kernel selector 的联合菜单 | DROP | 34 / 24 / 58 |
| TVM-REUSE-SCHEDULE-SELECT | 编译器 | 只是 MetaSchedule 的 reuse / cost-model selector | DROP | 33 / 25 / 58 |
| ROCKSDB-FILTER-BUDGET | 存储系统 | Bloom/filter budget allocation 是既有联合资源分配 | DROP | 35 / 24 / 59 |
| CXL-CACHE-ADMISSION | 内存系统 / runtime | cache admission wrapper，无独立数据结构或保证 | DROP | 35 / 19 / 54 |
| NPU-DYNAMIC-SCALE-CACHE | NPU runtime | scale-cache 选择与第15波 shape/cache 停止核相邻且无余量 | DROP | 32 / 17 / 49 |
| PIM-BITSLICE-CERT | PIM / 近似 | 仅为每行 precision 菜单附 certificate wrapper | DROP | 31 / 18 / 49 |
| RTL-RESET-CUBE-SELECT | 验证 | 是第15波 RTL reset reachability 的同对象 cube selector | DROP | 28 / 22 / 50 |
| APPROX-SQL-REUSE-SELECT | 近似数据系统 | 是第15波 sample-reuse 对象的 policy wrapper | DROP | 29 / 23 / 52 |
| LLVM-POISON-HEURISTIC | 编译器验证 | 是第15波 poison partition 对象的 heuristic 改名 | DROP | 26 / 24 / 50 |

保留的五项都至少有 H2/H3 级的真实残差：可独立陈述的算法/数据结构/误差或复杂度界、与 strongest-union 不同的决定变量，以及可使主张失败的具体观察。PIM 项的学术门通过，但 AI 关键路径不能在同语义公开平台上闭合，因此是人工研究储备建议，绝非资源不足导致的 STOP。

Stage 0 的共同任务不是扩张实验，而是先重建每题 documented strongest-union，并运行下列各 brief 中冻结的最低成本 killer；若 union 已给出同一决策、保证和完整成本，主线应将该题标为 `DIRECT_FATAL`。
