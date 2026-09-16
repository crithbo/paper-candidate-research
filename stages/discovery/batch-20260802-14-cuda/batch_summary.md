# CUDA/GPU Discovery 第14波：强基线前置筛查

日期：2026-08-02。范围为 CUDA/GPU 与同对象开源生态；只写本批目录。14 个非同义对象均先按 same-object、current primary-source strongest-union、自然 artifact、paper-kernel、full-cost、falsifier 检查。未运行 GPU。

| ID | 冻结 exact object | 决定 | 关键结论 |
|---|---|---|---|
| GPU-CUSOLVER-IR-PRECISIONCERT | cuSOLVER/cuSPARSE 上稀疏线性系统的 mixed-precision iterative-refinement inner-solve precision/tolerance | `PROPOSE_STAGE0` | 残差演化可形成可证伪的在线 certificate，而非一次性 precision 菜单；自然 SuiteSparse 矩阵与开源 solver 路径存在。 |
| GPU-CUB-SEGMENTED-RADIX-ADAPT | CUB stable segmented radix sort 的 pass-local digit-width/segment coalescing | `DROP` | 官方对象只公开 bit-subrange，不公开候选所需 pass-local digit-width/coalescing 动作；添加动作会改变对象。 |
| GPU-CUBLASLT-HEURISTIC-PORTFOLIO | cuBLASLt heuristic/workspace algorithm portfolio | `DROP` | 同信息、算法和 workspace 动作的完整联合 selector 可逐项表达；没有独立机制。 |
| GPU-CUFFT-PLAN-PREWARM | cuFFT plan/JIT cache prewarm | `DROP` | 原生 driver cache 与普通 cache/admission 完整联合覆盖。 |
| GPU-CUFFT-CALLBACK-FUSE | cuFFT callback 与额外 kernel 的融合选择 | `DROP` | factorization/共享内存限制下只剩受约束 fusion selector，且没有自然 callback corpus。 |
| GPU-CG-PERSISTENT-GRID | cooperative-group persistent CG launch partition | `DROP` | CUDA sample 是演示，不是自然输入；合法 action 是既有 launch/resource Cartesian DSE。 |
| GPU-CUTLASS-DSL-COMPILEBUDGET | CUTLASS DSL specialization compile portfolio | `DROP` | 编译预算下的 variant 组合是普通 selector；与 torch.compile guard/动态编译邻接且无独立核。 |
| GPU-TENSORRT-SHAPE-PROFILECUT | TensorRT dynamic-shape profile cut | `DROP` | profile/engine/fallback portfolio 被完整 joint selector 表达，并与既有 guard/graph 失败核相邻。 |
| GPU-CUSPARSE-FORMAT-TRANSITION | sparse format conversion transition | `DROP` | format、conversion、kernel choice 的全成本联合策略直接覆盖。 |
| GPU-CUB-SCAN-LOOKBACK | decoupled-lookback scan synchronization adaptation | `DROP` | 改变 look-back/warp policy 是已知实现参数直积；无自然触发语料。 |
| GPU-COOPGROUP-PARTITION-REPAIR | Cooperative Groups conditional partition repair | `DROP` | legal-edit grammar + sanitizer/oracle 复活已 STOP 的 repair 核。 |
| GPU-CUDAMEMCPY-ENGINE-ORCHESTRA | copy-engine stream overlap | `DROP` | 是普通依赖调度，且无额外机制/保证。 |
| GPU-CUDA-GRAPH-FFT-REPLAY | FFT CUDA Graph replay/update | `DROP` | 属于已停止 graph replay/lifecycle/capture 核。 |
| GPU-NCCL-SKEW-COLLECTIVE | data-skew collective remapping | `DROP` | 缺自然、可审计 channel-demand trace；不得用 nccl-tests 扫描代替。 |

## 边界结论

- 直接排除历史 STOP 核的改名重包装：CUDA graph、mempool/allocator、NCCL trace、PTXAS spill、mbarrier repair、CUPTI 反事实、MoE/VMM、UVM、EVT、普通联合 selector。
- 唯一保留题只是 `SEARCH_BOUNDED_OPEN`；Stage 0 必须以当前论文/官方源码构造 strongest-union，并先跑决定性 falsifier。若 union 可复现所有行为，立即 `DIRECT_FATAL`。
- Discovery 建议不更改 registry，不创建 Stage 0/A/B，也不授权正式实验。
