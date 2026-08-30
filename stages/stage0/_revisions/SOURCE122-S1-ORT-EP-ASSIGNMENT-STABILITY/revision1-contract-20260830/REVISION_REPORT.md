# SOURCE122-S1-ORT-EP-ASSIGNMENT-STABILITY Stage 0 Revision 1 Contract Report

## 结论

本次唯一 Stage 0 revision `1/1` 已在首次写入 `REVISED_STAGE0_CONTRACT.yaml` 时消费并完成静态合同修订。它没有产生新的科学结果，也没有自行把候选改判为 PASS；当前处置为 `REVISION_CONTRACT_COMPLETE__AWAIT_INDEPENDENT_CLOSING`。

## 保持不变的部分

- Exact object：语义等价 ONNX 表示与当前 ORT optimizer-level assignment/full-cost stability。
- RQ：在 source representation 上选择的部署 optimizer level，是否在 held-out 等价表示上仍保持有效。
- Claim endpoint：冻结输出质量阈值下的 held-out full-cost regret。
- Evidence ceiling：公开 canonical benchmark 与公开 ORT/CUDA+CPU 路线。
- 禁止变更：没有切换到 EP selection、generic bug finding、私有 QNN、per-representation retuning 或 result-aware corpus。

## 本次唯一修订

PRIMARY 与 SENTRY 确认的首个缺口是双 endpoint 与未冻结 legality/lineage/all-cell denominator。本次 revision 仅做以下合同闭合：

1. 单一 endpoint：`onnxruntime_gpu==1.26.0`，provider order 固定为 CUDA 后 CPU；只在 `BASIC / EXTENDED / ALL` 中按 source representation 的冻结 full-cost 与输出质量门选一次，随后在所有 held-out 等价表示上测 regret。`DISABLE_ALL` 仅作诊断。
2. 四个 relation families：Function expansion/inlining、inverse Transpose/Reshape identity、Split→Concat reconstruction、受限 Gemm→MatMul+Add。
3. 三层 legality：L0 proto legal、L1 relation justified、L2 numeric oracle；未过任一级的 cell 仍保留在分母。
4. Semantic-region quotient：显式记录 zero/one/many 映射，以及 normalized、fused、expanded、unmatched、unsupported、session fail、illegal、unproven、numeric fail。
5. All-cell denominator：`model × source representation × held-out relation instance × optimizer action × repetition × process-control arm`；失败、ambiguous、unsupported 与 normalized-away 均禁止删除。
6. Q2 breadth：至少 12 个公开模型、3 个模型族、4 个 relation family、held-out models/relations，并增加独立的第二 release 或同版本公开 EP external-validity stratum；不同 stack 不混入 primary denominator。
7. Strong baselines：output-only、raw timing、simple structure、native assignment、full per-representation grid oracle、公开且版本兼容的 Mobius/QNN lineage。
8. Stage A killer：2 个模型族 × 2 个 relation family，加 normalized-away negative，覆盖 BASIC/EXTENDED/ALL 与成对 instrumentation process controls。

## 审稿式一致性检查

- 同对象：通过；revision 没有移动 object、RQ 或 ceiling。
- 单一可证伪缺口：通过；所有新增字段都服务于同一个 endpoint/denominator 缺口。
- 结果无关：通过；本 assignment 没有 search、network、resource、implementation、build、experiment 或 candidate observation。
- Full-cost：合同已要求 session/cache/instrumentation/fallback/failure/oracle/lineage 成本，但数值 repetition `R` 与 failure penalty 必须在未来 Stage A assignment 的首个 run 前一次性冻结。
- Claim honesty：本报告只证明合同字节已闭合，不证明 optimizer-level rank instability、assignment feature value 或论文主 claim。

## Independent closing 必须核验

1. 单一 endpoint 是否完全消除 PRIMARY/SENTRY 所指出的双 decision endpoint。
2. 四个 relation family 的 L1 preconditions 与 L2 oracle 是否足以保持同对象语义。
3. Semantic-region zero/one/many quotient 是否对 fused/expanded/unmatched/unsupported 提供无遗漏分类。
4. All-cell denominator 是否机械禁止 failed-cell exclusion、结果后换 holdout 和 per-representation retuning。
5. Q2 breadth与 baseline union 是否达到 Tier-B 下限，且第二 stack 只作独立 external-validity stratum。
6. Stage A killer 是否会在 assignment features 不优于 timing/structure、flip 消失于 process controls 或 negative 同样翻转时停止。

Independent closing 接受前不得进入 Stage A。revision 已消费，若 closing 发现新缺口，本会话无权自行进行第二次 revision。

## 权限与执行记录

- Model route：`gpt-5.6-sol/high`，本命令临时覆盖。
- Search/network：0。
- Resource action：0。
- Implementation/build/experiment：0。
- Stage A/B：0。
- Shared write/state transition：0。
- Claim-bearing observation：false。
- Current usage-reset cycle confirmed：false。

