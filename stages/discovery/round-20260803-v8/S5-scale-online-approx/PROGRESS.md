# S5 生产性 Discovery 收敛记录

- 日期：2026-08-03（Asia/Shanghai）
- 方法门：O5 discovery method v2 已由独立 AUDITOR 判为 `CALIBRATED`；该判定只校准来源方法，不构成任何候选证据或 Stage 0 授权。
- 写入边界：仅本目录；未创建或写入 `stages/stage0/`、`stages/stageA/`、`stages/stageB/`，未改动主控文件。

## 三遍收敛结果

| Raw | 谱系/seed-distance | 当前机制与同对象碰撞 | artifact/自然输入/AI 执行 | 结论 |
|---|---|---|---|---|
| S5-RAW-01 JIT-GAP-SCHEDREG | 将 general joint codegen 收窄为 AMDGPU multi-bank occupancy-tier feasibility；不是仅换后端 | Unison、MLGO、RL4ReAl、LLVM 均扣除，但未定位同一 tier-budget object | LLVM MIR 和 backend test 可复现；实机 timing 为条件缺口 | `PROPOSE_STAGE0`，见 `S5-OCCUPANCY-CLIFF-JOINTCODEGEN.md` |
| S5-RAW-02 MOE-ONLINE-BMATCH | streaming token assignment 仍是同一对象 | Capacity-Aware、Stable-MoE，及 [SGLang/DeepEP Waterfill+LPLB](https://www.lmsys.org/blog/2026-06-26-waterfill-lplb) 已覆盖 dispatch-time balance/LP 动作；残余会退化为 controller | 开源模型可跑，但不能修复同对象碰撞 | `DROP` |
| S5-RAW-03 DYN-PGROUP-COLL | incremental repair 没有独立自然动作，易是 static synth + controller | [ForestColl, NSDI 2026](https://www.usenix.org/conference/nsdi26/presentation/zhao-liangyu) 覆盖 general topology optimal synthesis；[Dynamic hierarchical BvN](https://arxiv.org/abs/2602.22756) 覆盖在线层次 All-to-All | simulator 可做，但新对象不足 | `DROP` |
| S5-RAW-04 PREFIX-DAG-ONLINE | placement/eviction/routing 的组合没有独立 seed-distance | Preble、SAECache、Strata 与 [DualMap](https://arxiv.org/abs/2602.06502) 已分别或联合覆盖 cache affinity、load balance、online eviction/scaling；只剩万能 union | traces 可获得，不足以弥补贡献核 | `DROP` |
| S5-RAW-05 DYN-REMAT-CERT | online + hierarchical 已被直接占据；certificate 单独不足 | DTR 与 [HiRemate, ICML 2025](https://proceedings.mlr.press/v267/gusak25a.html) 覆盖动态/层次并近似最优 | 可复现但没有自然 headroom 证据 | `DROP` |
| S5-RAW-06 STREAM-ANN-MAINT | 原 exact object 与动态 adaptive index 重合 | [Quake, OSDI 2025](https://www.usenix.org/system/files/osdi25-mohoney.pdf) 直接联合动态维护、query parameter 与 recall target | artifact 存在但这是 `DIRECT_FATAL` | `DROP` |

## Devil's-advocate checkpoint

最强反方意见是 S5-RAW-01 也可能只是把 LLVM 已有 occupancy-aware scheduler 与 allocator 的启发式重新合并。故 brief 的最快 killer 不是追求平均提速，而是验证离散 tier cliff 是否在自然 region 中出现、同预算 staged pipeline 是否已匹配 ceiling；任一条件失败即 DROP。`S5-RAW-01` 的 `PROPOSE_STAGE0` 仅由独立 Stage 0 裁决，不能自审升级。
