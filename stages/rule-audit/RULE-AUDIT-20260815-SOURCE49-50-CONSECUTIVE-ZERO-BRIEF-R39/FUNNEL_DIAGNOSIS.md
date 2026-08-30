# Source49/50 Funnel Diagnosis

## 结论先行

Typed routing 提高了过程精度和责任边界，但没有证明 usable-raw precision 提高；它同时暴露并部分制造了 pre-RQ recall 损失。Source50 的两个 strong slots 为 0/2，不是强模型失败，而是 packet eligibility 与实际缺口错位：规则要求先有 exact same-object RQ、exact public identity，且 carrier/action/estimand 最多缺一项；真正需要帮助的 S3/S4/S5 路线恰好停在这些前置条件之前。

## 精度增益

1. Source49 没有为类型覆盖制造 filler；S1 三条带 ISA 名称的状态题被 label-stripping 后识别为 generic dynamic FP environment。
2. S2/S6 正确执行历史 exact/terminal/current collision，不复活旧题。
3. Source50 S2 的两个 raw 都获得唯一 `KNOWN_FATAL` ownership disposition，没有把已知 current union 债务推给 Stage0。
4. 两轮均没有把“缺资料、未实现、无 strong packet”写成科学 STOP。

这些是 accountability/false-positive control 增益。由于 0 个 brief 进入独立 Stage0，不能据此声称 clean-brief precision 或 Stage0 pass rate提高。

## Pre-RQ recall 损失

重复信号集中在 S3/S4/S5：

- S3 两轮都有 4 个 locator，却始终是 0 RQ、0 closure item。
- S4 从 Source49 的 8 个 seed clusters 到 Source50 的 3 个 pre-evidence frames，仍是 0 exact RQ、0 closure item。
- S5 两轮都形成 3 个 RQ 表述，但因 project/instance/oracle/skeleton 不能同时在 evidence 前冻结而全部判为 non-answerable，仍是 0 closure item。

这不证明其中存在应当录取的真实课题，也不能把 backlog 当 false negative；但它证明当前流程无法对最可能需要资料闭合的 pre-RQ 方向产生可执行调查分母。换言之，类型合同把“最终要闭合什么”误当成“允许开始闭合前必须已经知道什么”。

## 为什么 strong slots 是 0/2

Source50 的资格合同要求：

1. exact same-object RQ 与 exact public identity 已冻结；
2. 不存在 direct fatal/terminal containment；
3. 有 finite public source route；
4. carrier/action/estimand 三元组最多缺一项。

实际路线分成两组：

- **前置不足组**：S3/S4/S5 未冻结 exact RQ/identity，或三元组缺件超过一项，因此机械不合格；正是最需要 source closure 的组。
- **后置已决组**：S2 已冻结完整三元组并进入 raw，但随后发现 direct current-union fatal，因此也不合格；S1/S6 则在历史 containment/current collision 前已经结束。

因此没有任何 packet 落入 eligibility 的狭窄中间区。0/2 只能判定当前资格规则没有可用触发面，不能判定 `gpt-5.6-sol/high` 没有信息增益，因为它一次都没有运行。

## 责任分类

- 主问题：assignment-local eligibility/阶段顺序缺陷。
- 次问题：题源持续集中于成熟 compiler/runtime/product surface，导致 S1/S2/S6 健康高淘汰。
- 非主问题：lane 执行违例。两轮在 frozen contract 下总体执行一致。
- 尚不能判断：强模型能力。0 个实际 packet，没有模型效果分母。
- Stage0 门过严：无证据支持；本次没有 brief 进入 Stage0。
