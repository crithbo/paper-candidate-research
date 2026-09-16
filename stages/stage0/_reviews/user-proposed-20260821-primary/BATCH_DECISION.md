# Stage 0 PRIMARY batch decision — user-proposed-20260821

## Scope and independence

只审 QREFINE-TRITON-W4A16 与 PATCHYIELD-CALL。没有读取 QNN；两题证据、基线和裁决
完全隔离，未继承 Discovery 的 `READY` 标签，也没有运行任何上游脚本、构建、solver、
kernel、模型、agent、容器、数据下载或 H100/NPU 工作。

## Per-topic decision

| 题目 | PRIMARY decision | Quality / readiness | 下一步 |
|---|---|---|---|
| QREFINE-TRITON-W4A16 | `PASS_RECOMMENDED` | `TIER_B_Q2_VIABLE`; `E1_STATIC_PREFLIGHT` | 仅独立 confirmation；随后仍需 Stage A fidelity gate。 |
| PATCHYIELD-CALL | `REVISE_ONCE` | 潜在 Q2，算法残差未闭合；`E1_STATIC_PREFLIGHT` | 仅确认一个原子 revision；不授权 H100 或 Stage A。 |

## Batch hard gates

- QRefine：独立核实了 target MLIR capture boundary；高层 MLIR TV、通用 TV 与 LLVM
  backend TV 尚未结构性吸收它的冻结 mixed BV/IEEE 双 target relation。Stage A 必须以
  12-mutant/fidelity gate 防止 scope inflation。
- PatchYield：live re-execution 和 arrival-relative deadline 修复了 replay 伪因果，但
  current vLLM extension surface、VTC/DLPM 和 Justitia 使普通 priority/plugin 不成立。
  仅一个 action/guarantee certificate revision 可决定其是否有剩余。

## Resource and provenance

4 个小型官方 source blob 共 88,437 bytes 留在本 assignment 的 `resources/` 下。首个
Triton blob 的 pre-call ledger 漏记是已记录的机械 provenance 缺陷；文件具 pin/hash，
仅支持正向 capture-boundary 事实，不支持任何 absence inference。没有 claim-bearing
计算或资源 blocker。

## Routing

两项均需未参与本题的 confirmation sentry：QRefine 的 PASS 推荐需确认；PatchYield 的
唯一 revision 推荐需确认。任何 confirmation 之前，Stage A/B 均为 false。
