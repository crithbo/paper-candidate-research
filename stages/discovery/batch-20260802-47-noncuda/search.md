# 搜索与碰撞范围

检索于 2026-08-02。优先使用作者/会议页面、Apache/LLVM/PostgreSQL 官方文档和官方 issue；搜索是有界的，不声称全局新颖性。

查询簇：`late event CEP negation watermark retract`, `dynamic temporal triangle counting batch deadline`, `LLVM PGO stale profile incremental recompilation`, `LSM compaction tail latency scheduling`, `adaptive query optimization plan reoptimization`, `incremental outer join maintenance`。

硬碰撞检查：历史停止核（plan regret、k-core、quantile late certificate、IR change frontier、semantic join、JIT cache）逐一排除；SILK 与 HATS 作为 LSM 联合调度的 primary collision。三个提议没有发现同一对象、同一在线信息、同一 action 与同一保证同时成立的 `DIRECT_FATAL`，但均保留 Stage 0 closure obligation。
