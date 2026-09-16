# S4-SLO-PAGEPACK source / collision audit

## Frozen input verification

| Artifact | SHA-256 | Result |
|---|---|---|
| `S4-SLO-PAGEPACK.md` | `A8A90DF02CD8B91241861D635729AB1FF4819A9A6A030B98A42B4CFC610EFA5D` | matches upstream manifest |
| `SOURCE_COLLISION_MATRIX.md` | `96B79AFCDEAC893B05A1FEE3FE543F5513D65CB8B42C418A427FF0D399ECB89B` | matches |
| `DISCOVERY_LOG.md` | `B14CC74714818FBBF2724556693639D6045B22CF4BF0A3E7B2FBEA5B60456139` | matches |
| `handoff.yaml` | `E614C22526377242ED7DBC2C2E7AE781C68B443BE8A93DEA5053713292FF9989` | matches |

## Current first-party verification (cut-off 2026-08-09)

| Source | Verified fact | Collision treatment |
|---|---|---|
| [OBASE, OSDI 2026](https://www.usenix.org/conference/osdi26/presentation/banakar) | object-aware frontend clusters hot/cold objects, uses pointer instrumentation and lock-free runtime migration, supports unmodified page-tiering backends | `DIRECT_SUBTRACT` on object-layout; requires faithful OBASE baseline; does not itself establish a migration-budget/SLO packing objective |
| [MDK, OSDI 2026](https://www.usenix.org/conference/osdi26/presentation/patel) | memory savings under SLO; MPCs and offline optimal policy for policies | `DIRECT_SUBTRACT` on SLO policy/evaluation; requires same-information policy replay; official abstract does not make object layout a variable |
| [HADES, DIMES 2025](https://research.cs.wisc.edu/adsl/Publications/dimes25-banakar.pdf) | pointer-based object relocation into hot/cold heaps; page-utilization problem and safe relocation boundary | closest precursor; source of mobility/concurrency constraints, not proof of candidate residual |
| [BRUMM, ECRTS 2026](https://drops.dagstuhl.de/entities/document/10.4230/LIPIcs.ECRTS.2026.15) | L4Re mapping reclamation-latency accounting budget | `METHODOLOGICAL_ADJACENT`, different object/model; not a numeric baseline |
| [CacheLib / CacheBench](https://github.com/facebook/CacheLib) | public C++ caching library and CacheBench, including production-workload benchmarking route | artifact/infrastructure route only |
| [cacheMon cache_dataset](https://github.com/cacheMon/cache_dataset) | public MetaKV/Twitter operations/object-scale traces | natural operation route; does not alone establish pointer-mobility metadata |

## Collision verdict

`SEARCH_BOUNDED_OPEN_WITH_TWO_DIRECT_SUBTRACTORS`。严格 `DIRECT_FATAL` 需要同一 exact object、主目标、核心方法、主保证/结果、full cost 与主 claim 全覆盖。OBASE 覆盖 dynamic temperature layout；MDK 覆盖 SLO policy/optimal policy；没有已核验的一手来源同时覆盖 migration-aware page-slot packing 与 composition residual。潜在组合不是自动 fatal：只有版本/信息/成本兼容的 faithful `OBASE/HADES → MDK` replay 真实吸收 candidate 才停止。

## Evidence honesty

没有下载、运行 solver、replay、GPU 或正式实验；未宣称 residual、性能、近似保证或 concurrency correctness。Cache traces 是有限执行路线，不能被改造成虚构 pointer-safe object facts。
