# RVV-VXRM-INTERPROCEDURAL Stage 0 PRIMARY Report

## 中文摘要

- 结论：`REVISE_ONCE`，允许且只允许一次静态、原子修订。
- 为什么：当前 LLVM 已有 `RISCVInsertWriteVXRM`，在单个 `MachineFunction` 内以正反向数据流消除冗余写；但它把任意 call 置为 `Unknown`，没有使用固定、非递归、同一编译单元 internal callee 的 VXRM exit summary。ABI 的“不保留/入口未指定”不等于该固定实现必然破坏状态。因此尚未发现直接同对象吸收。
- 下一道门：`SAME_RVV_INTERNAL_CALL_DAG_TWO_NATIVE_PLAN__CALL_AWARE_VXRM_TRANSFER_FRONTIER_CERTIFICATE`。
- 是否需要用户操作：否。

- Lane id: `STAGE0-P1-RVV-VXRM-INTERPROCEDURAL`
- Assignment id: `STAGE0-P1-20260815-RVV-VXRM-INTERPROCEDURAL-PRIMARY-V8.7`
- Input freeze SHA-256: `BDB49A081E50FB02A40A4E5BF9D2DF2ECCB9199DF6E0C084B4E9451CA1EFBF26`
- Cross-assignment contamination declaration: 未读取其他候选包；Discovery clean brief 仅作线索，未继承其中的新颖性、Q2 或结果结论。
- Decision: `REVISE_ONCE`
- Quality tier: `TIER_B_Q2_VIABLE`（仅条件性、待原子门闭合）
- Confidence: `0.76`
- Evidence ceiling: `E1_STATIC_STAGE0_ONLY__NO_IMPLEMENTATION_NO_NATIVE_REPLAY_NO_PERFORMANCE_CLAIM`
- Novelty route: `N2`
- Candidate Q1 venue family: compiler / code generation / PLDI-CGO-CC 类；现阶段只够 conditional Q2 shape。
- Stage semantics: conditional paper-potential screen; this report does not establish the main claim.

## 冻结对象、对象等价与两计划

对象限定为固定 RISC-V V 版本、固定 LLVM commit、固定 `riscv64` target triple、`+v`、固定 ABI、固定 VLEN contract、固定数值结果的内部 call DAG。排除 external/unknown callees、递归、inline asm、`vsetvxrm/vgetvxrm` 或其他显式 `vcsr` 观察、动态 rounding、改变 VLEN/ABI 与任意接口重写。

LLVM pin：`10b4fa5b79eb9d27b4928ad82afa3847762bc72f`（official `llvm/llvm-project` HEAD，2026-08-15 读取）。修订必须锁定实际 compiler command、`-march/-mabi/-O`、inlining/LTO/IPRA/机器 pass 入口，并报告默认和显式非默认开关；不可用“关闭优化”制造残差。

目标 witness 是 caller 需要 RNE、调用仅有 RNE 固定点 RVV intrinsic 的 `internal`、non-recursive、保持 call 的 callee、且 caller 之后仍需 RNE。两条完整计划必须都由 stock-native 指令构成：

1. **local plan**：caller 在 call 后重新写 RNE，符合当前 pass 把 call 当 `Unknown` 的结果；
2. **summary plan**：callee 末次必需操作/显式 `WriteVXRMImm` 留下 RNE，caller 仅在可证明该 call edge 的完整 summary 为 RNE 时省去后写。

两计划必须保持同一 caller/callee IR、call 行为、ABI、VLEN、vector 数值结果、无显式 CSR observation；并列出 callee 内为建立 RNE 所付出的全部 write、code-size、寄存器/调度以及 edge cost。psABI 不保证 `vxrm` 跨调用保存，故外部 caller 不能依赖它；但这不禁止封闭 fixed internal DAG 中编译器证明的实现内 exit state。若该隔离或 call-preservation 不能机械证明，witness 失效而非可放宽 ABI。

## 已独立复核的 current union

| 联合成员 | 独立事实 | 对残差的影响 |
|---|---|---|
| `RISCVInsertWriteVXRM.cpp` | 每个需要 VXRM 的 MI 带所需值；pass 使用 forward available 与 backward anticipated dataflow 插入 `WriteVXRMImm`。 | 强基线；修订不得重新包装函数内 CSR 消冗。 |
| 同 pass 的 call handling | `MI.isCall()`、inline asm 或修改 VXRM 的指令把状态设为 `Unknown`；pass 为每个 `MachineFunction` 单独运行。 | 确认固定 internal call-edge summary 不是当前表达的动作，但也暴露 generic-interprocedural 风险。 |
| `RISCVInsertVSETVLI` + vector lowering/RA | LLVM RVV codegen 还包括 intrinsics lowering、RA 后的 `RISCVInsertVSETVLI` 与默认/非默认 codegen choices。 | 全部必须进入 revision 的 strongest composition 与 full cost；不得把 VL/VTYPE 写节约冒充 VXRM residual。 |
| explicit read/write intrinsics | LLVM/RVV 提供 `llvm.riscv.vsetvxrm`、`llvm.riscv.vgetvxrm`。 | 它们是 union 一部分，但冻结对象排除显式观察；修订须证明测试没有该类操作。 |
| RISC-V psABI / intrinsic contract | `vxrm` 和 `vxsat` 不跨 call 保留、入口未指定；VXRM 枚举有 4 个常数模式，intrinsic 的 `vxrm` 为常量参数。 | four-state summary 有有限语义，但 ABI 不能被改成 preserved-state 假设。 |

## 碰撞与直接覆盖审计

| 八谓词 | 独立证据/定位 | 结论 |
|---|---|---|
| 同对象/函数 | LLVM `RISCVInsertWriteVXRM.cpp`（pin 上同路径） | 部分覆盖：同一 VXRM 写，但仅函数内。 |
| 同 scenario | pass 对 call 一律 unknown；未找到 internal call DAG exit-summary action | 未覆盖（static source evidence）。 |
| 同/更弱信息 | current pass 不保留 callee exit transfer；candidate 需要固定封闭 call-DAG summary | 未覆盖。 |
| 原子动作 | 当前是 block dataflow placement，不是 call-edge transfer-matrix construction | 未覆盖。 |
| 同 legality/guarantee | current code在任何 call 后失去可用状态；没有证明 ABI-safe interprocedural preservation | 未覆盖。 |
| full-cost | current pass 优化 writes；没有 call-DAG global Pareto/full-cost certificate | 未覆盖。 |
| comparable version/config | commit pin + default/non-default grid 待 revision 冻结 | 可闭合缺口。 |
| 足够深度 | 官方 source 与 ABI/intrinsic docs 可审计；直接论文检索未找到同对象语义/动作/保证的 full-text collision | `SEARCH_BOUNDED_OPEN`，不作 absence 断言。 |

已检索并扣除的宽泛邻近项包括一般 interprocedural optimization、generic finite-state dataflow、GCC rounding operand work与 RVV 代码生成/向量化论文；它们不能单独覆盖相同的 LLVM stock call-edge action、fixed no-observation object 或 target-specific guarantee。相反，它们提高了“普通 callgraph dataflow/finite DP”会被吸收的风险。

## 唯一原子修订门

`SAME_RVV_INTERNAL_CALL_DAG_TWO_NATIVE_PLAN__CALL_AWARE_VXRM_TRANSFER_FRONTIER_CERTIFICATE`

一次修订必须同时、静态地交付：

1. pinned LLVM 源路径、pass pipeline、默认和非默认 option union，以及完整 plan→MachineInstr/CSR-write map；
2. 一个保持 ABI 与 call 的真实 same-program two-plan witness，并逐条核实 RNE/RNE/RNE、四态 VXRM 值、vxsat/no-observation、`VL/VTYPE`、return/call 边、寄存器和所有 write 成本；
3. 对每个 fixed internal callee 的 (4\times4) entry/exit transfer relation（含 unknown/unsafe 类），只在 ABI 与 no-observation 允许时使用 summary；
4. call-DAG recurrence 与 native action-path 双射，证明 quotient 对未来合法动作、数值语义、ABI 和 declared full cost 保持；
5. 一个 **RVV/LLVM-specific** exact、FPT 或 certified-Pareto guarantee，及参数、最坏界、cap fallback/no-gain boundary。不能等价为 ordinary sparse dataflow、generic DAG scheduler/ILP、仅四态笛卡尔枚举、CSR tuning 或 identity enumeration；
6. finite Stage A fidelity/killer：小型 native oracle 与 source-level plan replay，固定 command/config grid，比较 current union，计量 compiler CPU/RSS、text、CSR writes、spill/frame、uop/runtime proxy，及至少一组真实 RVV intrinsic carrier。

若已确认 current LLVM 配置/IPO 表达同一 summary plan，或 native witness 必须改变 ABI/接口，或上述 recurrence 只剩 generic interprocedural finite-state dataflow，则按预登记 sentinel `BELOW_Q2_STOP__NO_NON_GENERIC_CALL_EDGE_VXRM_FRONTIER_RESIDUAL` 停止。不得在修订中改变对象或降级保证。

## Q2 结构与 fidelity 路线

成功时的最小论文核是：在 LLVM 既有 local VXRM write optimization 已存在的前提下，为 fixed internal RVV call DAG 给出 ABI-safe state-transfer summaries、以完整 native 代价为目标的 target-specific frontier construction，并证明其相对于 current conservative-call union 的 Pareto residual。自然入口可为 RVV fixed-point DSP/quantized kernels 中保留内部 helper call 的 `riscv_vector.h` intrinsic call graph；目前未声称收益。

首个 Stage A gate 必须是 `PRE_CLAIM_CONTRACT_FIDELITY_GATE`，而非性能实验：native two-plan legality、source/pass catalog coverage、trace/output equality、same-object comparator 与 full-cost ledger 必须先过。任何自然收益、主结果或完整实证尚未取得，只限制 ceiling，不构成 STOP。

## 评分与风险

- Academic value: `48/70`；AI executability bonus: `15/30`；total `63/100`。
- 主要风险：状态仅 4 值，最自然的 formulation 可能是一般性跨过程 dataflow；call-preservation 与 `vxsat`/hidden CSR side effect 也可能收窄甚至杀死 witness。
- 结论边界：这是一次受控的 `REVISE_ONCE`，不是 PASS，也未消耗 scientific revision；后续必须由未参与者独立 confirmation。
