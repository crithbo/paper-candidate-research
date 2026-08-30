# LLVM MachineOutliner target-cost global candidate selection — independent confirmation

## 裁决

`CONFIRM_REVISE_ONCE`；质量档维持 `TIER_B_Q2_VIABLE`（条件性），Stage A/B 均不授权。

PRIMARY 收缩后的问题是可审计的：不是再做全局候选发现，而是在一个冻结 target/ABI 下，对已经由 LLVM 原生钩子判为合法的 MachineOutliner 候选，求 target-cost 完整兼容选择的 Pareto 前沿。该问题尚未被 current union 直接吸收，但也尚未静态闭合：没有固定 target 的同-MachineIR 多候选冲突见证，没有完整动作目录或 target-specific recurrence。因此应当只允许 PRIMARY 已登记的唯一 revision gate，不能直接 PASS，也没有科学 STOP 依据。

## 独立核验

### 当前对象与吸收边界

冻结 commit `ca7933e47d3a3451d81e72ac174dcb5aa28b59d1` 可由 LLVM 官方 GitHub commit 页面确认。该版本的 `MachineOutliner.cpp` 明确将候选映射到 suffix tree，并且目标必须提供 `getOutliningCandidateInfo`、`buildOutlinedFrame`、`insertOutlinedCall` 与 `isFunctionSafeToOutlineFrom` 等原生语义钩子。[LLVM pinned source](https://github.com/llvm/llvm-project/blob/ca7933e47d3a3451d81e72ac174dcb5aa28b59d1/llvm/lib/CodeGen/MachineOutliner.cpp)

CGData 已是同对象强基线：Write 模式记录本地 outlined hash tree，Read 模式从 `.cgdata` 初始化全局 tree 并生成跨模块候选；`llvm-cgdata` 还会合并对象中的 codegen data。故“全局发现”或跨模块 hash catalog 不能再作为新动作。[LLVM global-outlining commit](https://lists.llvm.org/pipermail/all-commits/Week-of-Mon-20240909/178821.html) [llvm-cgdata guide](https://llvm.org/docs/CommandGuide/llvm-cgdata.html)

同时，源码并非完整优化器：global path 为每个 hash-tree 匹配建立候选并交给 `TargetInstrInfo`，而 local path 会在单一重复串内按起点预丢弃重叠位置；它仍须由 `outline()` 的标量受益/优先级路径决定实际替换。这支持一个很窄的 residual，但也给 revision 增加硬要求：所谓 complete catalogue 必须说明早期 local overlap discard、CGData match enumeration、rerun 与所有非默认 flag 是否仍保留每个将进入候选组件的合法原子动作。不能只把当前 `FunctionList` 当作“complete”。

### 原子门攻击

原子门 `PINNED_MACHINEOUTLINER_GLOBAL_CANDIDATE_CATALOG__TARGET_COST_CONFLICT_COMPONENT_PARETO_CERTIFICATE` 是恰当且有限的，但只在以下四项同时成立时才能关门：

1. 固定一个已支持的 target、subtarget、ABI、unwind/relocation 与完整 flag/CGData mode union；目标 hook 接受的 candidate、frame 和 call 是唯一动作来源。
2. 给出一个同一 MachineIR 的至少两类 individually profitable 且互斥的候选组，并逐项保留 MachineInstr、call-frame、ABI、unwind、relocation 与对象语义。仅靠抽象冲突图或修改 IR/ABI 的示例无效。
3. frontier state 必须含有组件边界、已占用 native occurrence、hook 给出的 frame-construction identity、call/frame/object metadata 与两维已声明成本；状态等价必须保持后缀所有 native actions、合法性和完整成本。若仅以候选 id/权重集合为状态，则是 generic weighted set packing/ILP，不构成 N2。
4. 给出显式退化图：当 target costs 降为可分的单标量且组件是 interval 时，方法退化为 ordinary interval/现行贪心控制；若组件必须保留高树宽或状态上限即无 gain，必须诚实报告。随后以小穷举 native oracle、object/unwind/relocation 比对和全成本 ledger 作为有限 Stage-A fidelity killer。

这不是要求已运行 native output 或性能正结果；它是把“target-specific”与“generic solver wrapper”区分开的静态证书。

### 结论与边界

当前源码直接吸收 global discovery，未直接表达 target-cost complete-component Pareto optimizer；外部同对象碰撞仍为 `SEARCH_BOUNDED_OPEN`，未从任何获取限制推断 absence。PRIMARY 也没有把其尚未构造的 witness/算法当作既成结果。因此本次确认既不改为 PASS，也不以缺实现/实测而 STOP。

唯一允许的下一步是上述原子静态 revision；其 failure sentinel 保持：`BELOW_Q2_STOP__CURRENT_MACHINE_OUTLINER_GLOBAL_SELECTION_ABSORPTION_OR_GENERIC_CONFLICT_GRAPH_PACKING`。若 revision 不能给出 native-legal witness、完整 catalogue 与非通用保证，则应 STOP；若能给出，则送交未参与者 closing。不得新建第二次 revision。

## 完整性与权限

- PRIMARY canonical payload 4/4 已与合同哈希一致。
- 本次仅使用指定 confirmation 目录；未写共享控制、未引用 E 盘。
- 未实现、build、下载、实验、benchmark 或启动 Stage A/B。
- Evidence ceiling：`E1_STATIC_CURRENT_SOURCE_AUDIT`; `stageA_authorized=false`; `stageB_authorized=false`。
