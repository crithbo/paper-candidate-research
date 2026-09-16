# Discovery batch 20260802-01

- 批次日期：2026-08-02
- 写入权限：仅本目录
- 搜索投入：CUDA/GPU 约 30%，非 CUDA 约 70%；这是检索投入，不是录取配额
- 形成 brief：6 个（CUDA/GPU 2 个，非 CUDA 4 个）
- 结论：`PROPOSE_STAGE0` 4 个，`DROP` 2 个
- 证据上限：规范、论文、代码与静态分析路线；未使用 GPU，未进行昂贵实验

## 结论表

| Topic ID | 赛道 | 精确对象 | 结论 | 最强碰撞/基线 | Stage 0 决胜问题 |
|---|---|---|---|---|---|
| `GPU-TMAPHASE` | CUDA/GPU、验证调试 | 已 lower 的 CUDA/CuTe/Triton TMA–`mbarrier` 多阶段协议 | `PROPOSE_STAGE0` | Compute Sanitizer + GPUVerify/GPUMC + Tawa | 能否静态发现至少 3 类现有组合未覆盖的可达协议错误，并保持可接受误报与状态规模？ |
| `GPU-AUTOWS` | CUDA/GPU、编译器 | 迭代 tile 程序的 warp 角色、缓冲级数与软件流水联合自动选择 | `DROP` | Tawa + Twill + Triton 自动 warp specialization | exact object 已被直接覆盖，未找到独立残余机制 |
| `PIM-PRACCREDIT` | PIM/体系结构安全协同 | 共享 DRAM 中 host/PIM 命令在 PRAC/RFM 约束下的联合调度 | `PROPOSE_STAGE0` | COSM + QPRAC/MOAT + Ramulator2，及 P-PIM | PIM 内部操作是否具有可建模的 activation 语义，且 security-credit 调度是否不等价于基线拼接？ |
| `QCOMP-ERRREF` | 量化编译、验证调试 | TOSA/MLIR 量化 lowering 的误差契约 refinement | `PROPOSE_STAGE0` | First-Class Verification Dialects + MLIR-TV/Practical FV + TOSA reference | 通用验证框架是否已能以相当代价表达并验证同一契约；若能则停止 |
| `THEORY-MXIO` | 理论、近似/量化 | block-scaled GEMM 中 payload 与 scale metadata 的双层存储通信下界 | `PROPOSE_STAGE0` | 经典 GEMM I/O 下界 + “scale 字节相加”模型 + 标准 blocked layout | metadata 是否只贡献低阶 compulsory traffic；若无新渐近区间或不可忽略紧常数则停止 |
| `AQ-ACCUMSTAGE` | 近似/量化 | 逐 tile accumulator 位宽与多阶段 accumulation 的联合量化 | `DROP` | A2Q + AXE + overflow-aware/BFP accumulation | A2Q/AXE 已直接覆盖 accumulator-aware 与 multi-stage exact object |

## 学术主分与 AI 加分

| Topic ID | 学术价值 `/70` | AI 加分 `/30` | 总分 | Discovery 解读 |
|---|---:|---:|---:|---|
| `QCOMP-ERRREF` | 60 | 28 | 88 | 学术 residual 与自动核心路径均强 |
| `PIM-PRACCREDIT` | 57 | 26 | 83 | 高潜力；先核 exact activation semantics |
| `THEORY-MXIO` | 55 | 26 | 81 | 高潜力；72 小时理论反例门必须先过 |
| `GPU-TMAPHASE` | 56 | 24 | 80 | 高潜力；防止退化为普通 checker |
| `GPU-AUTOWS` | 28 | 26 | 54 | `DIRECT_FATAL`，AI 易执行不改变结论 |
| `AQ-ACCUMSTAGE` | 29 | 25 | 54 | `DIRECT_FATAL`，AI 易执行不改变结论 |

评分采用当前规则的学术 `/70` 主分与 AI `/30` 加分。Discovery 不作 Stage 0 PASS/RESERVE 决定；本批四个保留题均为 `AI_CORE_EXECUTABLE`，没有需要仅因 AI 弱而转人工储备的题。若 Stage 0 后出现高学术、低 AI 路径，应建议 `HUMAN_RESEARCH_RESERVE`，不得因 AI 不足 STOP。

## 推荐优先级

1. `QCOMP-ERRREF`：对象和证伪面最清楚；可在 CPU 上用小型 bit-vector/SMT 模型完成 Stage 0。
2. `GPU-TMAPHASE`：真实协议复杂度强，但必须严防变成普通 checker；Stage 0 要证明新的 phase-indexed 抽象与残余故障类。
3. `THEORY-MXIO`：成本最低、理论增量潜力明确，但也最可能被“只多几个字节”反例直接杀死。
4. `PIM-PRACCREDIT`：系统意义强，先决条件是标准/模拟器对内部 activation 的语义可核验；在此之前不应承诺性能结论。

优先级不是正式状态转换；本批只提出 `PROPOSE_STAGE0` 或 `DROP`，是否创建 Stage 0 由主线决定。

## 与当前课题边界

- `GPU-TMAPHASE` 验证同步/异步拷贝协议，不归因寄存器压力，也不生成 codegen decision slice，因此与 `CGPU-RPIV`、`CGPU-DECSLICE` 非同义。
- `QCOMP-ERRREF` 验证量化编译变换的数值 refinement；`AQ-02` 的 exact object 是 CertiSAR-CIM 静态闭包，二者对象、机制与证据路线均不同。
- `PIM-PRACCREDIT` 是 PRAC 安全约束与 host/PIM 调度协同，不是普通 PIM 映射或单一 RowHammer checker。
- `THEORY-MXIO` 是通信复杂度命题，不是 block-scale kernel 调参。
- 当前工作区没有提供课题组公开论文总表或未公开课题清单。因此本批只能冻结对 `registry.yaml` 中活跃对象的边界；更广泛的组内归属必须由主线/研究者在升级前确认。

## 证据与权限声明

- 一手/官方来源优先，预印本均明确按预印本使用；厂商文档仅支持语义或产品能力，不支持优越性结论。
- 未宣称任何题目“首次”；只记录在本批检索范围内未定位到的直接同义工作。
- 所有候选仍处于 Discovery 证据级别。没有性能、正确率、PPA、silicon 或可复现实验结果。
- 没有修改 `plan.md`、`registry.yaml`、`rules/` 或任何 Stage 0/A/B 目录。
