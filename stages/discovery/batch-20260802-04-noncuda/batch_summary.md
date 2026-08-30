# Batch 20260802-04-noncuda — 非 CUDA Discovery 补充

日期：2026-08-02。范围：AIE/NPU 编译运行时、稀疏加速器 Pareto 与 PIM 架构；不含 CUDA/GPU。所有 `PROPOSE_STAGE0` 仅为 `SEARCH_BOUNDED_OPEN`，并非新颖性或效果结论。

| ID | 机会图 | 首选竞争机制 | 决定 | 排序 |
|---|---|---|---|---:|
| IREE-GRAPHTUNE | 独立 dispatch tuning 忽略跨 dispatch 临时量与 layout | interface-layout coordination | `PROPOSE_STAGE0` | 1 |
| SPARSE-METASWITCH | 稀疏收益常未付格式切换/元数据账 | amortized residency threshold | `PROPOSE_STAGE0` | 2 |
| AIE-ROBUSTFIFO | ObjectFIFO 深度是实际 SRAM/lock 资源，局部 worst case 可能重复预留 | cut-coupled robust credits | `PROPOSE_STAGE0` | 3 |
| PIM-REDUCECHAIN | PIM GEMV 的 partial sum 归约边界仍有命令/数值耦合 | fan-in/width-aware hierarchy cut | `PROPOSE_STAGE0` | 4 |
| PIM-ROWSTRIDE | row-hit PIM GEMV 是明确瓶颈 | stride remapping | `DROP` | — |

## Collision and boundary notes

- `IREE-GRAPHTUNE` is static graph-level tuning, not `NPU-SHAPEBUDGET`'s dynamic-shape compile/variant/guard portfolio.
- `SPARSE-METASWITCH` is a stateful representation-residency policy with conversion/metadata accounting, not generic dataflow tuning.
- `AIE-ROBUSTFIFO` is not a checker: its research decision is robust graph-wide reservation/placement under burst envelopes.
- `PIM-REDUCECHAIN` excludes the active PRAC security scheduling object and excludes RH+'s row-hit decision.
- `PIM-ROWSTRIDE` is dropped as `DIRECT_FATAL` due to RH+; it must not be revived by renaming.

## Recommended Stage 0 order

Start `IREE-GRAPHTUNE` and `SPARSE-METASWITCH` first because their public artifacts can produce an auditable 72-hour model-level killer. Then audit `AIE-ROBUSTFIFO`; retain `PIM-REDUCECHAIN` only after confirming public command-model support for legal reduction boundaries.

This Discovery branch created no Stage 0 directories and modified no project-control file.
