# RVV-VXRM-INTERPROCEDURAL — Stage 0 Revision 1

## 结论

- 唯一原子门：`SAME_RVV_INTERNAL_CALL_DAG_TWO_NATIVE_PLAN__CALL_AWARE_VXRM_TRANSFER_FRONTIER_CERTIFICATE`
- Gate result：`NOT_CLOSED`
- Scientific disposition：`BELOW_Q2_STOP__NO_NON_GENERIC_CALL_EDGE_VXRM_FRONTIER_RESIDUAL`
- Scientific revision：`1/1 CONSUMED`
- Evidence ceiling：`E1_STATIC_STAGE0_REVISION_ONLY__NO_IMPLEMENTATION_NO_NATIVE_REPLAY_NO_RESULT_CLAIM`
- Stage A/B：均未授权、未启动。

本次修订确实闭合了较窄的静态事实：冻结 LLVM 存在同一 IR、同一 ABI/VLEN/数值语义的两份 native-legal 计划，current union 因 call→`Unknown` 不能表达较少 VXRM 写的计划。失败发生在论文贡献门，而不是实现 readiness：对固定 internal call DAG 的完整精确求解自然且充分地化为五态加权 summary/min-plus 跨过程数据流；加入 LLVM 程序点只产生普通 product graph，加入完整未来机器状态则退化为 identity enumeration。没有剩余的 RVV/LLVM-specific 非通用 quotient、recurrence 或保证。因此按预登记 sentinel 停止。

## 冻结身份与输入

- Assignment：`STAGE0-P1-20260815-RVV-VXRM-INTERPROCEDURAL-REVISION1-V8.7`
- Assignment SHA-256：`9A472EC92997AD39D17B01B3693DFE99551D4759369160DD8440AC2F190044F3`
- LLVM：`10b4fa5b79eb9d27b4928ad82afa3847762bc72f`
- PRIMARY report：`34CB0CA1BA349975504BD83E6722BBC633FA03D2C6F425D26CD7EFA9DD5135F0`
- Confirmation review：`8D180B0DE5F399B57124AB4BF25F013710FBC1A654339CF80B304D6997B8D854`
- 独立 confirmation 裁决：`CONFIRM_REVISE_ONCE`；本 owner 未参与该 confirmation。

冻结对象保持不变：`riscv64-unknown-linux-gnu`、RVV `+v`、固定 VLEN=128 的执行合同、标准 ABI、同一 non-recursive internal call DAG、同一 call/unwind/code-object 语义、无显式 `vcsr/vxrm/vxsat` 观察。RNE 编码固定为 1。禁止 external/indirect calls、recursion、inline asm、显式 CSR intrinsics、改变 ABI、inline/clone/remove call 或改变数值结果。

## 可机械定义的 same-object witness

以下为冻结 carrier 的规范 LLVM IR 形状；它是静态证书，不声称已由本 assignment 编译：

```llvm
define internal <vscale x 1 x i8> @rne_helper(
    <vscale x 1 x i8> %x, <vscale x 1 x i8> %y, i64 %vl)
    noinline nounwind {
  %r = call <vscale x 1 x i8>
    @llvm.riscv.vaadd.nxv1i8.nxv1i8(
      <vscale x 1 x i8> poison, <vscale x 1 x i8> %x,
      <vscale x 1 x i8> %y, i64 1, i64 %vl)
  ret <vscale x 1 x i8> %r
}

define <vscale x 1 x i8> @carrier(
    <vscale x 1 x i8> %x, <vscale x 1 x i8> %y,
    <vscale x 1 x i8> %z, i64 %vl) nounwind {
  %a = call <vscale x 1 x i8>
    @llvm.riscv.vaadd.nxv1i8.nxv1i8(
      <vscale x 1 x i8> poison, <vscale x 1 x i8> %x,
      <vscale x 1 x i8> %y, i64 1, i64 %vl)
  %b = call <vscale x 1 x i8> @rne_helper(
      <vscale x 1 x i8> %a, <vscale x 1 x i8> %y, i64 %vl)
  %c = call <vscale x 1 x i8>
    @llvm.riscv.vaadd.nxv1i8.nxv1i8(
      <vscale x 1 x i8> poison, <vscale x 1 x i8> %b,
      <vscale x 1 x i8> %z, i64 1, i64 %vl)
  ret <vscale x 1 x i8> %c
}
```

它以 frozen in-tree `llvm/test/CodeGen/RISCV/rvv/vxrm-insert.ll::test3` 为 public anchor：该测试在同 rounding mode 的 call 前后明确检查第二个 `csrwi vxrm`。`vsmul.ll`、`vxrm.mir` 与 `vxrm-insert-out-of-loop.ll` 分别锚定 fixed-point intrinsic→`csrwi`、`WriteVXRMImm` 的 implicit `$vxrm` 使用和 pipeline-flush-aware placement。

### Plan L — current call-unknown plan

完整决定性 VXRM 动作序列：

1. `carrier` 入口状态 `UNKNOWN`；在首个 RNE `vaadd` 前 `csrwi vxrm, 1`。
2. call 进入 `rne_helper`；current `RISCVInsertWriteVXRM` 将 caller 状态置 `UNKNOWN`。
3. helper 入口按 `UNKNOWN` 处理，在 RNE `vaadd` 前 `csrwi vxrm, 1`；指令后物理 VXRM=RNE；直接 return。
4. caller 的 current state 仍为 `UNKNOWN`；第三个 RNE `vaadd` 前再发 `csrwi vxrm, 1`。

VXRM 写总数=3；在无 C 扩展的冻结 action accounting 中，每个 `csrwi` 为 4 bytes，VXRM 写字节=12。call、vector spills/reloads、VSETVLI、RA、frame/CFI 与数值指令均按 pinned current pipeline 原样计入。

### Plan S — private internal-summary plan

1. `carrier` 首个 RNE `vaadd` 前发唯一的 `csrwi vxrm, 1`。
2. frozen internal call edge 以事实 `entry=RNE` 进入唯一 `rne_helper`；helper 的唯一 VXRM-dependent MI 需要 RNE，故不发写，exit=RNE。
3. return edge 带私有实现事实 `exit=RNE` 回 caller；第三个 RNE `vaadd` 不发写。

VXRM 写总数=1、字节=4；相对 Plan L 为 `−2 writes/−8 bytes`。硬件 call/return 本身不改变 VXRM；psABI 的“不保证保存”允许 callee 修改但不要求其必须修改。Plan S 只对该 non-escaping fixed internal edge 使用事实，不向任意 caller 或 external ABI 暴露 preservation。两计划的 IR、call、ABI、VLEN、vector 数值、unwind/CFI、VSETVLI/RA 与所有非 VXRM 指令相同；`vxsat` 可被 fixed-point 指令更新，但 frozen program 不读取它，两计划执行相同 fixed-point 指令序列，故其可观察行为相同。

这证明 action divergence，但不证明自然收益、完整 full-cost Pareto 或论文 N2。

## 五态 transfer 与 UNKNOWN 边界

令 `S={RNU,RNE,RDN,ROD,UNKNOWN}`。对固定 native action：

- `Write(m)`: 任意 `s→m`，cost 为一条 `WriteVXRMImm` 的完整代价向量；
- `Use(m)`: 仅当当前状态 `m` 时合法，状态保持 `m`；否则必须先 `Write(m)`；
- `VSETVLI/ordinary MI`: 对 VXRM 分量为 identity，但其 bytes/RA/frame/full-cost 不得删除；
- arbitrary/external/indirect call、inline asm、显式或隐式 VXRM modifier：`s→UNKNOWN`；
- frozen internal direct call `f`: 按该唯一 code object 的 transfer relation `T_f⊆S×S`；不得把它提升为 ABI promise；
- return：不主动改 VXRM；仅把实际 exit fact 传回 frozen internal caller。函数外入口和可逃逸入口均为 `UNKNOWN`。

`rne_helper` 的两种 static policy 对所有入口分别为：

- local policy：任意 `s` 先保证 RNE，exit=RNE，若 `s=RNE` 可局部省写；
- fixed-edge policy：只在证明 incoming set=`{RNE}` 的 frozen call graph 中省写，exit=RNE；若入口集合包含其他状态或 `UNKNOWN`，该 policy 不合法。

这足以证明 witness 的 legality，但也直接暴露算法归约。

## 为什么原子门未闭合

### 1. 精确 recurrence 是 generic min-plus interprocedural dataflow

固定程序点序列后，令 `D[p,s]` 为程序点 `p` 到达时 VXRM 状态 `s` 的最小代价/非支配代价集。每条 native action 产生一个至多 `5×5` 的转移矩阵；顺序组合为 min-plus matrix product，CFG merge 为逐状态 Pareto union，call 为代入 callee transfer matrix。call DAG 自底向上 composition 即得到 exact optimum。复杂度为普通的 `O(K·|S|^3·F)`（标量代价）或输出敏感 Pareto frontier 版本；其中 `K` 为 call/CFG composition 数，`F` 为 frontier size。

删除术语 `VXRM` 后，这一算法逐字适用于任意五态 CSR/协议 automaton。四个 rounding 值、`UNKNOWN`、`WriteVXRMImm` 的编码及 pipeline-flush cost 只实例化 transition/cost table，不改变 recurrence、复杂度或保证。故它正是 assignment 明确拒绝的 `generic_interprocedural_dataflow_or_four_state_DP_packaging`。

### 2. 试图加入 LLVM 完整未来动作只形成 product/identity enumeration

若把 VTYPE/VL、register allocation、spill/frame、instruction scheduling、unwind、code layout 与所有 future native actions保持可变，则五态 VXRM 不足以保持 future-action legality/full cost；必须把这些 LLVM 状态并入 quotient。得到的是 generic product state，最坏退化为原 MachineFunction/program-point identity enumeration，没有诚实的 RVV-specific bounded alphabet 或 FPT parameter。

若反过来冻结这些动作，使 quotient 仅需 `(program point, VXRM state)`，则 legality 可保持，但算法又回到上一节的普通 product graph shortest path/dataflow。两侧均不能形成冻结要求的 non-generic target-specific theorem。

### 3. full-cost Pareto 只能冻结为待测假设

Plan S 在 action ledger 上少两条 CSR 写和 8 bytes，且在有 `TuneVXRMPipelineFlush` 的 uarch 上存在更强的 runtime 假设。但 interprocedural analysis 的 compile CPU/RSS、summary storage、与 current IPO/IPRA/inliner/outliner composition 的 total cost 没有 E1 证据。可定义 `(-2 writes,-8 bytes,+Δcompile)`，不能静态证明为 complete full-cost Pareto point。Stage0 不要求运行结果，但本次唯一门明确要求 current-union-external **full-cost** point；这里缺的是保证本身，而不只是尚未测量的数值。

## current union 与 collision disposition

- `RISCVInsertWriteVXRM.cpp` 已实现 forward available/backward anticipated、critical-edge/loop placement 和 `HasVXRMPipelineFlush` 相关 speculative placement；candidate 不能认领这些组件。
- current source 对任何 call/inline asm/direct modifier 均置 `Unknown`，所以 Plan S 未被该 pass 直接吸收。
- `RISCVInsertVSETVLI`、intrinsic expansion、call lowering、RA/frame/spill、inlining/LTO/IPRA 和 machine outliner 属公平 union。任何删除/内联 call 的 config 改变 frozen call behavior/code object，不是同对象 comparator point；保留 call 的 union 未提供 VXRM exit summary。
- bounded paper/source search 未找到 exact same-object theorem，但状态保持 `SEARCH_BOUNDED_OPEN`；本 STOP 不依赖 absence，也不依赖任何 transport failure。

## 有限 Stage A killer（仅冻结、未执行）

若题目曾通过，本应先执行：pinned witness 的 llc native replay、Plan L/S exact assembly checker、ABI/no-observation proof、all-entry tiny oracle、current default/non-default union、以及 compile CPU/RSS、bytes、CSR writes、spills/frame、uop/runtime full cost。该路线本身有限；但它不能修复已经确认的 N2/generic-reduction failure，因此不得启动 Stage A。

## 最终建议

唯一 revision 已实际执行并消耗。same-object witness 与 current action gap 成立，但论文核只剩普通五态跨过程 dataflow/DP 和未证 full-cost point，触发冻结 scientific sentinel：

`BELOW_Q2_STOP__NO_NON_GENERIC_CALL_EDGE_VXRM_FRONTIER_RESIDUAL`

不建议第二 revision、mechanism pivot、Stage A/B 或改名复活；只有主线可登记终态。
