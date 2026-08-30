# PPC-MMA-JOINT-ACCUMULATOR-CONSTRUCTION — PPC MMA accumulator/state constructor

## 中文摘要

- 研究机会：固定 PowerPC MMA MachineFunction、ABI 与矩阵结果，联合决定 accumulator/subregister binding、FMA pressure form 与专用 spill/restore，而非让通用 RA 与局部 combiner 分开处理。
- 为什么可能成立：当前 LLVM PPC 源码明确有 ACC/UACC 与 VSR 输入绑定 hints、专用 accumulator spill/restore，以及 FMA register-pressure reduction；这构成具有真实原生语义的有限目标状态。
- 论文形状：target-specific N2，给出按 live accumulator interface 参数化的 exact/FPT 或认证 Pareto 构造，并生成 PPC legality certificate。
- 下一步：独立 Stage0 只需攻击最小两 accumulator witness、current union frontier 与同对象直接文献；若归约为 generic RA 或无双合法计划，立即淘汰。

- Status: `PROPOSE_STAGE0__FINITE_FIDELITY_GAP`
- Quality tier: `TIER_B_Q2_VIABLE`
- Origin/type/route: `O7` / `COMPILER_TOOL` / `N2`
- Method: v8.7 canonical; RQ frontend `PRODUCTION`; V9 off.
- Exact object: same MMA enabled LLVM MachineFunction, target feature set, ABI and numerical semantics.

## Canonical claim package

- Intervention: bounded-state whole constructor jointly selects ACC/UACC/WACC binding, permitted FMA reassociation pressure form and native spill/restore action.
- Comparator: current LLVM PPC register allocation hints + machine-combiner pressure reduction + PPC spill/restore lowering, same flags and source function.
- Mechanism: pairing accumulator and VSR constraints makes an MMA-specific interference state which ordinary RA does not model as a single certified frontier.
- Guarantee: FPT/certified Pareto in maximum live MMA interface; every transition is checked against PPC accumulator/subregister and target instruction legality.
- Cost: compile CPU/RSS/temp, bytes, accumulator moves/spills/restores, stock object/semantic checks; hardware speed excluded.
- Falsifier: current composition expresses same frontier; no legal source-level two-plan witness; direct same-object collision; state erasure yields generic RA.

## Current evidence and finite closure

Current official [PPC register-info source](https://llvm.org/docs/doxygen/PPCRegisterInfo_8h_source.html) specifies allocation hints linking accumulators and VSR inputs. Current [PPC instruction-info source](https://www.llvm.org/docs/doxygen/PPCInstrInfo_8h_source.html) enumerates accumulator spill/restore forms, while [PPC register implementation](https://llvm.org/doxygen/PPCRegisterInfo_8cpp_source.html) documents expensive accumulator moves and controls. These sources establish native actions; they do not establish residual novelty.

`FINITE_FIDELITY_GAP`: Stage0 must pin the exact pass sequence/default and non-default controls, select a public PPC MMA regression, generate a legal two-plan witness, and run direct same-object paper subtraction. No current implementation/result is claimed.
