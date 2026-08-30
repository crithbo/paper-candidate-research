# 九个已冻结 DROP briefs

这些是独立对象，不是对保留项的改名；均先冻结 same-object、strongest-union、自然 artifact、paper-kernel、完整成本和 falsifier。它们不建候选目录，因为 paper-kernel 已被 hard gate 否决。

## ONNX-QDQ-LATENCY-SELECT

- **问题/对象**：在 ONNX Q/DQ 图上选择 placement、fuse 与 provider kernel；artifact 是 ONNX Runtime quantization tests。
- **current primary-source strongest-union**：ONNX Runtime Q/DQ conversion + provider/kernel/fusion 的完整笛卡尔组合；计入 Q/DQ、layout conversion、compile、fallback、latency与精度。
- **拟议核/证伪**：只是 selector；若 union 可枚举同一动作即 fatal，已满足。`DROP`。

## TVM-REUSE-SCHEDULE-SELECT

- **问题/对象**：为 TVM workload 选择历史 schedule reuse 与重新搜索；artifact 是 [TVM MetaSchedule](https://tvm.apache.org/docs/how_to/tune_with_metaschedule/index.html) 与公开 tuning tasks。
- **current primary-source strongest-union**：MetaSchedule database reuse、cost model、search budget 和 fallback 的同对象联合；计入 compile/tune/cache/build/measurement。
- **拟议核/证伪**：没有超出已有搜索空间的新算法或保证；union 表达同一决策，故 `DIRECT_FATAL`、`DROP`。

## ROCKSDB-FILTER-BUDGET

- **问题/对象**：按 level/file 分配 RocksDB Bloom/ribbon filter bits；artifact 为 [RocksDB filter policy](https://github.com/facebook/rocksdb/wiki/RocksDB-Bloom-Filter) 与 db_bench。
- **current primary-source strongest-union**：native filter policy、level-aware allocation、cache/compaction 共同 sweep；计入 filter bytes、build CPU、false positives、IO、compaction与cache。
- **拟议核/证伪**：budget allocation 是普通资源 selector；完全联合已给同一决策。`DROP`。

## CXL-CACHE-ADMISSION

- **问题/对象**：CXL-tier page cache admission；artifact 为 Linux DAMON/tiering trace 与 CXL memory emulator。
- **current primary-source strongest-union**：LRU/admission、promotion/demotion、prefetch、page migration/fallback union；计入 migration、TLB、bandwidth、NUMA/CXL latency和metadata。
- **拟议核/证伪**：无新数据结构、算法界或语义保证，只加 admission score；complete union 同决策，`DROP`。

## NPU-DYNAMIC-SCALE-CACHE

- **问题/对象**：动态 shape NPU graph 的 quantization-scale cache 复用；artifact 为 ONNX Runtime QDQ graphs。
- **current primary-source strongest-union**：shape/profile cache、scale materialization、compile cache、fallback 的全成本组合；计入 guard、compile、scale bytes、conversion与失败回退。
- **拟议核/证伪**：与第15波 XLA shape cache / QNN admission 停止核相邻，只是 cache selection；无独立 residual，`DROP`。

## PIM-BITSLICE-CERT

- **问题/对象**：PIM bit-slice precision choices 附加一个 correctness certificate；artifact 是开源 PIM simulator。
- **current primary-source strongest-union**：所有合法 bit-slice、quantize/dequantize、software fallback及现有范围/误差分析；计入 metadata、conversion、communication和checker。
- **拟议核/证伪**：certificate 不改变合法 action、保证或成本；正是禁止的 wrapper，`DROP`。

## RTL-RESET-CUBE-SELECT

- **问题/对象**：reset reachability BMC 中选择 cube split；artifact 是 Yosys/SymbiYosys RTL tests。
- **current primary-source strongest-union**：第15波 `RTL-RESET-REACHABILITY` 的同对象 BMC/partition union；计入 SAT encoding、solver time、proof/witness validation与memory。
- **拟议核/证伪**：同一决策只是 selector，且会复活已提出对象；`DIRECT_FATAL`、`DROP`。

## APPROX-SQL-REUSE-SELECT

- **问题/对象**：近似 SQL sample reuse 的阈值选择；artifact 是公开 TPC-H/approx-query workloads。
- **current primary-source strongest-union**：第15波 `APPROX-SQL-SAMPLE-REUSE` 的 sample/cache/recompute union；计入 sample storage、refresh、estimator error、latency与fallback。
- **拟议核/证伪**：没有新 estimator、误差界或数据结构，故是该对象的 policy wrapper；`DROP`。

## LLVM-POISON-HEURISTIC

- **问题/对象**：LLVM poison transformation 的 heuristic ranking；artifact 是 [LLVM poison semantics](https://llvm.org/docs/LangRef.html#poison-values) 和 regression tests。
- **current primary-source strongest-union**：第15波 `LLVM-POISON-PARTITION` 的 same-object partition/analysis union；计入 IR analysis、compile-time、proof/counterexample、code quality和fallback。
- **拟议核/证伪**：只换 heuristic、未改变决策语义或保证；为历史对象的改名，`DIRECT_FATAL`、`DROP`。
