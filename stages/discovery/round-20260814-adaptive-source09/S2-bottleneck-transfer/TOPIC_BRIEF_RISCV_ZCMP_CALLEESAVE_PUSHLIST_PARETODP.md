# RISCV-ZCMP-CALLEESAVE-PUSHLIST-PARETODP — Joint Zcmp callee-save allocation and push/pop-list construction

## 中文摘要

RISC-V Zcmp 的 cm.push/cm.pop 是以受限 callee-save 寄存器列表和 stack_adj 为原子 ABI 动作的压缩过程入口/出口指令。固定 RV32/RV64 ABI、MachineIR、程序输出、unwind 与相同 Zcmp target 后，普通寄存器分配的局部选择会决定能否形成合法连续 push/pop 列表；而 LLVM 当前 PushPop 优化在后期消费 frame lowering 已选出的列表。候选不是开启 Zcmp、改 ABI 或任意寄存器分配，而是在有限跨调用 live-range 接口上联合选择 callee-save 颜色与合法 push-list/frame realization，返回代码字节、spill 与栈帧成本的精确 Pareto 前沿。

## Research question

对固定 RISC-V ABI、Zcmp 可用目标和同一 MachineIR，是否可在参数为跨调用 live-range/interface 宽度 w 的情形下，以 f(w) poly(n) 时间构造当前后置 union 未直接表达的 callee-save allocation 与 cm.push/cm.pop register-list/stack-adjust 联合 Pareto 前沿，同时保持 stock assembler、unwind 和可执行语义？

## Canonical research claim package

- Route: N2 target-specific compiler algorithm.
- Exact object: fixed C/C++ source and MachineIR, RV32 or RV64 ABI, target extension set including Zcmp, output, call behavior, callee-save convention and unwind semantics.
- Complete atomic action: jointly choose (i) which cross-call live values receive ABI-callee-save colors, (ii) a Zcmp-legal contiguous push/pop list, (iii) legal stack_adj/frame realization, and (iv) spill/reload alternatives. The action is not a flag, list selector, generic RA, source rewrite or alternate reader.
- Information parity: candidate and union receive the same liveness, interference graph, frame objects, ABI/target/optimization flags and no profile oracle.
- Candidate guarantee: exact Pareto frontier for code bytes, prologue/epilogue instruction count, stack bytes and spill/reload count under a bounded interface w. It never claims arbitrary graph-coloring optimality.
- Strong fair union: current Clang RISC-V target options and ABI; RISCVFrameLowering callee-save/frame actions; current RA alternatives; Zcmp PushPop optimizer; pseudo expansion; stock assembler/linker and unwind.
- Native oracle: stock LLVM verifier/assembler/disassembler/linker plus ABI/unwind checks and semantic test output.
- Natural route: versioned LLVM RISC-V codegen tests plus public embedded C/C++ corpus functions that already have ordinary callee-save frames.
- Full cost: compile CPU/RSS/temp; text bytes; prologue/epilogue count; static frame bytes; spill/reload bytes; later runtime cycles only if measured against same target.

## Current-upstream reality check

- Official RISC-V ISA material defines cm.push/cm.pop and their stack_adj/register-list semantics. LLVM's current user guide marks Zcmp supported.
- Current LLVM source facets: RISCVFrameLowering has determineCalleeSaves, assignCalleeSavedSpillSlots and prolog/epilog; RISCVMachineFunctionInfo records PushPopKind, push-register count and stack size; RISCVPushPopOptimizer identifies a list picked during frame lowering and is scheduled at addPreEmitPass2 before pseudo expansion.
- Source snapshot date is 2026-08-14. Stage A must pin a concrete llvm-project commit and enumerate all default/non-default target, ABI, RA, frame-pointer, shrink-wrap and Zcmp paths. This is a finite closure step, not a source-absence claim.

## Minimal action-divergence witness

A single fixed RV32/RV64 MachineIR function has ra plus two or more cross-call values that can legally use either a Zcmp-list-compatible contiguous CSR assignment or a non-compatible CSR/spill realization. Plan A and Plan B must both assemble, pass ABI/unwind and return the same output. A uses a legal cm.push/cm.pop list and its matching stack_adj; B uses ordinary saved-register sequence or a different legal spill. If the complete current union already generates both Pareto points under equal information, the claim is directly absorbed.

## Collision and no-go region

Bounded official/current-source and primary search did not locate a direct claim for this exact joint, fixed-ABI FPT/Pareto construction. It is SEARCH_BOUNDED_OPEN, not novelty proof. The nearby RVC register-compression family is a different atomic action: Zcmp has specified multi-register push/pop and frame stack-adjust semantics. Direct absorption, generic graph-coloring/ILP reduction, use of a changed ABI, or lack of a two-plan witness are all STOP predicates.

## Fidelity closure plan

- Status: FINITE_FIDELITY_GAP.
- First 72 hours: pin source; reconstruct full frame/RA/push-pop option union; derive one static two-plan witness; verify stock assembler/disassembler and unwind; compare the bounded DP frontier with all legal union outputs.
- Falsifier: stop if the optimizer's current union realizes every legal frontier point, the witness changes ABI/unwind/behavior, no list-compatible action survives, or the state decomposition becomes generic RA.
- Readiness: E1_STATIC_PREFLIGHT. No implementation, headroom measurement, or positive experimental result is asserted.

## Q2 potential

Conditional TIER_B_Q2_VIABLE: a non-absorbed bounded frontier would yield a target-specific compiler algorithm, exact guarantee, fair stock union and complete cost denominator. The no-gain region is explicit. Recommendation: PROPOSE_STAGE0 only; no Stage 0 creation is authorized here.
