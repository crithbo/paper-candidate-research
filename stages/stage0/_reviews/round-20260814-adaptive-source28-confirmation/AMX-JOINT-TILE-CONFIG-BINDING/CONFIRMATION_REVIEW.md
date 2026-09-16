# AMX joint tile-config binding — independent Stage 0 confirmation

## 裁决

`CONFIRM_REVISE_ONCE`；维持 `TIER_B_Q2_VIABLE`（条件性），不授权 Stage A/B。

本次不确认“AMX config sinking、call 后 reload/spill 或 physical TMM shape rewrite”有残差——它们已由 current native union 表达。唯一尚可审计的命题是：在一个冻结的 `ManagedRA` MachineFunction 内，以同一 ABI、数值、call/frame 与对象语义，联合选择现有原生动作能否产生一个不被 optimized+fast union 支配的完整 Pareto 计划，并由 AMX 特定、保持 future native legality/cost 的有限 frontier 证明。PRIMARY 登记的单一 gate 正确覆盖该问题；当前尚无直接吸收或同对象形式反证，因此不 STOP。

## 独立复核

### current native union

PRIMARY 四个 canonical payload 已经按其 manifest 4/4 复算一致。当前官方源码文档独立支持如下组件事实：

- `X86PreTileConfig` 的 contract 要求 `ldtilecfg` 对 variable-shape use 可达；若找不到共同 dominator 会插入多次；config register 是 caller-saved，callee clobber AMX register 后须 reload。[current pre-config source](https://llvm.org/doxygen/X86PreTileConfig_8cpp_source.html)
- `X86TileConfig` 只在 `ManagedRA` 上运行，且在 RA 之后利用 `VirtRegMap` 与 live intervals 填回物理 TMM shape 到 config stack slot。[current tile-config source](https://llvm.org/doxygen/X86TileConfig_8cpp_source.html)
- `X86FastTileConfig` 也是 `ManagedRA` guard 下的 post-RA 原生路径，并逐 basic block 消除 virtual-register shape references。[current fast tile-config source](https://llvm.org/doxygen/X86FastTileConfig_8cpp_source.html)

因此公平基线必须是同一 MachineFunction 的 optimized 与 fast 两条完整流水线、所有相关默认/非默认 native modes、以及相同 `+amx-tile`/x86-64 ABI；不得用改优化级、改 allocator、重写 IR 或只比较其中一路制造“新动作”。配置位置、callee-clobber reload、spill/reload 与 TMM0–TMM7 shape encoding均已被 component union 吸收。

冻结 exact GitHub blob 的独立网页重取出现 cache miss；此传输限制不作 absence 或 STOP 推论。PRIMARY 的 manifest 已验证，且 revision 必须继续以该 pin 的 five-source action catalogue/blob locators 作可重放约束。

### sole atomic gate

确认唯一可执行 gate：

`SAME_MANAGEDRA_MF_TWO_PLAN__UNION_EXTERNAL_CONFIG_BINDING_FRONTIER_CERTIFICATE`

它必须作为一次静态 construction 同时给出，而非将以下项目拆成新题：

1. 固定 LLVM pin、同一 public `ManagedRA` MIR、x86-64 ABI、`+amx-tile`、call regmask、stack/config ownership、TMM shape 和数值/对象语义。
2. 两个**完整** stock-native-legal plans；每个 plan 明列 `LDTILECFG` placement/reload、callee clobber、tile spill/reload、TMM0–TMM7 binding、frame/config writes，且能被原生 verifier/assembler path 检查。抽象 weights 或局部 pass fragment 不算 plan。
3. 一个相对于 optimized+fast complete union 的严格 Pareto point。成本向量至少包含 config stores/loads、spills/reloads、text/object bytes、compile CPU/RSS 和 runtime coordinate；没有已运行结果的要求。
4. AMX-specific finite state：未满足的 config dominance/reload obligations、live shape class、call regmask、TMM occupancy/binding、frame/config-stack status 和累计成本。等价关系必须保持所有后续原生 actions、ABI、legality 与完整成本。候选-id + weight 的普通图 DP、generic RA/scheduling、ILP、pass order 或 flag grid 都不满足。
5. 指明 exact/FPT/certified-Pareto recurrence、parameter/cap、退化和 no-gain 边界：若作用域退化为独立 placement 与 ordinary RA，应返回/受当前 union 支配；若只能 identity enumeration，不能冒充 N2。以同-MIR tiny exhaustive oracle、native legality、optimized+fast parity 和全成本 ledger 作为有限 Stage-A fidelity killer。

上述组合把 action gap 收窄为一个机制；若没有同-MF two-plan witness，或 candidate point 被 current union 支配，或 recurrence 落回 generic RA wrapper，预登记 sentinel `BELOW_Q2_STOP__CURRENT_AMX_SEQUENTIAL_UNION_OR_GENERIC_RA_WRAPPER` 生效。

## 碰撞、质量与边界

`ManagedRA` 本身、config dominance、fast call-sensitive handling 和 post-RA shape materialization都不是 paper contribution；generic integrated RA/scheduling 也不是 same-object direct fatal，除非 revision 无法给出 AMX 特定状态/保证。当前强 union 没有在已核验资料中声明 complete joint Pareto frontier；因此不能将其当 direct absorption。论文端同对象最新碰撞保持 `SEARCH_BOUNDED_OPEN`，不从检索或传输限制推断 absence。

若 gate 静态闭合，才有可信 Tier-B N2 形状；缺实现、实测性能、硬件或 natural result 只限制 evidence ceiling，不能 STOP。本确认只准许 PRIMARY 执行该唯一 revision；其后必须交由未参与构造者 closing，不得自动二次 revision。

## 权限与完整性

- 合同 SHA-256：`96E0AE7BF9FD749B980E96E7C6BE9EA8C2531FE8744EA70CC616BA4FD6545F86`，匹配冻结值。
- PRIMARY canonical manifest：4/4 PASS。
- 本次仅写指定 confirmation 目录；未写共享控制、未引用 E 盘。
- 未执行 revision、实现、build、实验、benchmark、Stage A 或 Stage B。
- `stageA_authorized=false`；`stageB_authorized=false`；lane 返回 `IDLE_REUSABLE_AWAITING_MAINLINE`。
