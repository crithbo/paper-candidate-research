# TORCHDYNAMO-GUARD-COVER-CACHE-REV0 Stage 0 Revision 1 Contract Report

## 结论

唯一 Stage 0 revision `1/1` 已在首次写入 `REVISED_STAGE0_CONTRACT.yaml` 时消费并完成静态合同闭合。它没有产生新科学结果，也没有自行把候选改判为 PASS；当前处置为 `REVISION_CONTRACT_COMPLETE__AWAIT_INDEPENDENT_CLOSING`。

## 保持不变的部分

- Exact object：PyTorch 2.13 的一个 `torch.compile` code-object/frame 与一个 isolate bucket 内的 guarded compile units。
- Stream：结果无关、顺序预冻结的 online exact-signature stream。
- Information：只允许过去 signatures、guards 与已发生 costs。
- Guarantee：完整 PyTorch observable semantics，不删除任意 guard，也不使用 unsafe filter 作为 primary。
- Endpoint：累计 compile、execution、guard dispatch、fallback 与 artifact/residency full cost。
- Resource ceiling：公开 CPU 与单张公开 CUDA GPU 路线。

## 本次唯一修订

PRIMARY 与 SENTRY 确认的首个缺口是“任意 guard implication 不可靠，且 Dynamo entry 的逻辑退役不能推出下游物理字节释放”。本次 revision 仅闭合该同对象 soundness/ownership 缺口：

1. Restricted quotient：只有 code/bucket、backend/options、dtype/device/layout/rank/alias、Python identity/global/module state、mutation/side effects、output/autograd/recompute signature、graph-break/fallback 与 downstream cache context 全部 exact-equal 的 entries 才可比较 shape guards。
2. Shape relation：只接受带可复核 certificate 的 ShapeEnv implication；unknown、timeout、unsupported 或不可复核一律 `INCOMPARABLE`。A covers B 的方向固定为 `B_guard ⇒ A_guard`。
3. Compatibility oracle：除 outputs 外，必须覆盖 pytree、dtype/shape、alias/mutation、Python side effects、backend options、graph-break/fallback、autograd saved tensors 与 activation-checkpoint recompute identity。
4. Logical/physical split：logical retirement 只作用于 Dynamo dispatch entry，并以 native invalidate 为 baseline；physical reclamation 是独立可选动作，必须有稳定 artifact identity、完整 reference graph、sole-owner refcount 与可观察 bytes/residency change。
5. All-cell denominator：`model × frame × signature stream × policy × cache temperature × process-control arm`；所有 failure、solver unknown、compatibility mismatch、ownership unknown 与 unreclaimable cells 都保留。
6. Q2/native baselines：至少 12 个公开模型、3 个 workload families、CPU+single CUDA、positive/negative streams，以及完整 PyTorch 2.13 dynamic/PGO/MRU/limits、dynamic grid、isolate/limits、eager stances、ordering、exact guard、simple cache 与 offline oracle。
7. Stage A killer：两个不同 family 的真实 frames，每个 4–8 个预登记 signatures；一个 certified-overlap positive 和一个 recomputation negative；claim 前必须冻结 exact source-pinned hook 与完整 ownership ledger。

## 审稿式一致性检查

- 同对象与 endpoint：保持；没有切换到 generic caching、set cover、任意 guard 删除或物理 memory-only 题。
- 单一可证伪缺口：保持；全部新增字段服务于 restricted comparability、interchangeability 与 ownership。
- 结果无关：保持；本 assignment 的 search、network、resource、implementation、build、experiment 与 candidate observation 均为 0。
- Full-cost：逻辑 entry、policy/solver、reacquisition、持久/加载 artifact 与 CUDA Graph residency 分层计价；不可精确观测时标记 unavailable，不估算。
- Claim honesty：本报告只证明静态合同字节已闭合，不证明 natural workloads 存在有利 overlap，也不证明性能或物理内存收益。

## Independent closing 必须核验

1. Exact non-shape quotient 是否充分阻止 arbitrary-guard 泛化。
2. `B_guard ⇒ A_guard` 的 cover 方向、solver certificate 和 `INCOMPARABLE` 规则是否无歧义。
3. Compatibility oracle 是否闭合 output、side-effect、alias、autograd 和 recomputation 可互换性。
4. Logical retirement 是否与 physical reclamation 完全解耦，且 ownership unknown 永不计为释放收益。
5. All-cell denominator、Q2 breadth 与完整 native baseline union 是否达到 Tier-B 下限。
6. Stage A killer 是否会在无真实 pair、任何语义 mismatch、无安全 hook、无独立 logical gain 或 native/simple 接近 offline frontier 时停止。

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

