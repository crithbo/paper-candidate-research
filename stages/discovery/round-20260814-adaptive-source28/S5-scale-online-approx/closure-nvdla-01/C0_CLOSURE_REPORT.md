# NVDLA C0 closure 01

## 结论

- Family: `NVDLA_FIXED_CONFIG_LOCAL_GRAPH_EDIT_BOUNDED_RECOURSE_LAYER_BUFFER_CONSTRUCTOR`
- Disposition: `STRUCTURAL_DROP__NO_FROZEN_UNION_EXTERNAL_TARGET_NATIVE_ACTION`
- Clean Stage0 brief: `0`

本次只闭合父包保留的一个 raw，不新增题目或证据分母。该 raw 将“本地改图后的有界 recourse layer/buffer constructor”写成方向，但未能给出一个与当前 NVDLA compiler 的 layer 拆分、surface/buffer 描述和 memory-resolver 动作不同的完整原子算法。把它继续称为 N2 会把现有构造器之外的调度/维护愿望包装成机制，故按结构门淘汰；并非以未实现、未运行或资源不足作负推断。

## C0-1：冻结 current union 与反证

冻结点为 NVIDIA 官方 `nvdla/sw` `master`；官方提交历史在 2026-08-14 可见的 head 短 SHA 是 `79538ba`（2019-09-30）。该仓库长期未继续演化，短 SHA 是本次只读页面可取得的 source locator；没有把它误称为新近 release。

| 维度 | 当前原生动作/配置证据 | 对 raw 的含义 |
|---|---|---|
| 图到 loadable | 官方 Primer 说明 compiler 按 layer 编译，基于 hardware config 决定 convolution mode 或因 convolution-buffer 容量拆分 operation，并分配 weight region。 | layer partition 与 buffer-aware construction 已是 native action space 的组成部分。 |
| memory/surface | `umd/core/src/compiler/DLAResourceManager.cpp` 管理 buffer 与 tensor-surface-descriptor directories；copy constructor 复制 directories，且仅有“suitably clone” FIXME。 | FIXME 只说明某 clone 逻辑未完成，**不能**证明整个 current union 缺少本地重构接口。 |
| memory policy | `umd/core/src/compiler/Memory.cpp`, `MemoryResolver::visitBegin`: `useMemPool`, `useReusePooledMemory`, `useGreedyEviction`, `useCVSRAMAllocate`，并取得 `memoryPools()`。 | memory pool/reuse/eviction/CVSRAM 不是候选的 union 外动作；它们必须进入公平 baseline union。 |
| config/feature boundary | `CompilerFeatures.md` 的 current table 枚举 layer features、FP16/INT8 和 `nv_full,nv_large,nv_small`。 | 任何合法比较必须固定硬件 config 和已支持 layer subset，不能把不支持 feature 当作 residual。 |

默认值与完整 CLI/profile 传播图在只读路线上未能逐项定位；这是一个 closure limitation，但本次淘汰不依赖“某 flag 不存在”的 absence claim。相反，上述 source 反证已表明 raw 所列 layer/buffer 维度是 native union 内的已知动作；raw 没有再指定可独立表达、带 target-specific guarantee 的 known-action 新算法。

## C0-2：同对象 carrier 与 stock oracle

官方 `CompilerFeatures.md` 记录 `MNIST`、`ResNet-18`、`ResNet-50` 在 `nv_full,nv_large,nv_small` 下已验证。官方 `regression/` 当前目录还含 `flatbufs/kmd`、`golden`、`images/digits`、`scripts` 与 `testplan`，可作为后续同对象 carrier/oracle 的确定性选择域。

但在本轮不下载、不 build、不运行的约束下，未能把一个具体 network/config 文件、对应 loadable 及 runtime acceptance observation 完整配对。因此 carrier/oracle 仅达到 `FINITE_ROUTE_IDENTIFIED`，并非 clean-brief 所需的已冻结 same-object runtime oracle。该缺口不是资源性学术否定；它只进一步阻止升级。

## C0-3：独立碰撞

有界的一手检索覆盖 `NVDLA compiler layer partition`, `buffer construction`, `memory allocation`, `recourse` 及 source/artifact locators。没有检得可在本轮确认的同对象、同语义、带 bounded-recourse 保证的独立论文 subtractor；该结果仅为 `SEARCH_BOUNDED_OPEN__NO_GLOBAL_ABSENCE_CLAIM`。不以旧 issue、future-work 或没有搜索命中的情况证明新颖性。

## 四个录取条件

| 必要条件 | 结果 | 原因 |
|---|---|---|
| union 外 target-native action | FAIL | 没有冻结一个区别于 native layer split + surface/buffer management + memory policies 的完整原子算法；“本地维护/有界 recourse”仍是目标标签。 |
| same-object carrier / stock runtime oracle | UNFROZEN | 有官方 network/config verification 与 regression 域，但未冻结单一 carrier 到 loadable/runtime acceptance 的配对。 |
| 无 direct fatal | PASS_WITH_CEILING | 无已确认 same-object direct paper collision；检索有界开放。 |
| finite fidelity plan | CONDITIONAL | 对已命名算法可用官方 regression carrier、stock loadable/runtime and full-cost ledger 闭合；当前没有那个算法。 |

因首项失败且第二项未闭合，不能建议 `PROPOSE_STAGE0`。以后不得以同一 family 改名重开；只有新的 exact object 与已冻结的不同原子 action 才可能构成新 family。

## 来源

- NVIDIA NVDLA official source: [commit history](https://github.com/nvdla/sw/commits/master), [compiler tree](https://github.com/nvdla/sw/tree/master/umd/core/src/compiler), [Memory.cpp](https://github.com/nvdla/sw/blob/master/umd/core/src/compiler/Memory.cpp), [DLAResourceManager.cpp](https://github.com/nvdla/sw/blob/master/umd/core/src/compiler/DLAResourceManager.cpp).
- NVIDIA NVDLA official documentation: [CompilerFeatures.md](https://github.com/nvdla/sw/blob/master/CompilerFeatures.md), [NVDLA Primer](https://nvdla.org/primer.html), [hardware specification](https://nvdla.org/hw/v1/hwarch.html).
- Official carrier locus: [regression directory](https://github.com/nvdla/sw/tree/master/regression).
