# R34 Model Capability Assessment

## Bottom line

需要提升 **Discovery 深审节点** 的模型能力，但不建议把六路 Discovery 全部无差别升级。

现有六路 `gpt-5.6-terra / medium` 的发散和 RQ 生成速度已经足够。Source36/37 的主要损失发生在“把抽象 RQ 绑定到精确 carrier/current source/atomic action/estimand”这一深审环节。S3/S4 没有检索或 source-closure 调度，属于流程输入缺失；换更强模型不能凭空补齐来源。另一方面，same-object 等价、generic-kernel 排除、current-union 和 oracle 设计是高判断负载，适合用更强模型有界升级。

此前多轮修改主要改变题源、入口或前端措辞，却没有稳定地执行 RQ→source closure。Source40 应冻结为一次完整的可识别试点，期间不再叠加新的题源配比、模板或门槛变化；否则即使产出变化，也无法知道来自哪项调整。

## Recommended routing

| Work | Model route | Reason |
|---|---|---|
| Six-lane divergence seeds, clustering and 2–3 RQ variants | `gpt-5.6-terra / medium` | 速度已足够；更多生成不是瓶颈 |
| Routine locator extraction and mechanical source ledger | current lane model | 主要是证据整理，不需要全面升档 |
| At most two cross-lane frozen carrier-closure packets per Source40 cycle | `gpt-5.6-sol / high` | 聚焦 exact carrier/action/estimand、generic/current adversary 与 finite oracle |
| Full Stage0 and later gates | Existing independent routes unchanged | 不让 Discovery 模型代替独立准入 |

## Packet boundary

Sol/high 只接收：

- frozen RQ、same-object semantic contract 和 contribution type；
- identity-only carrier commitment；
- 最多三个 source questions 及实际 locator/source excerpts；
- initial full-cost boundary、minimum falsifier 和已知反方。

它只返回：

1. exact carrier/version/current locus 是否闭合；
2. atomic action or estimand 是否可命名且非 generic shell；
3. strongest obvious current/generic adversary；
4. finite oracle/falsifier route；
5. `RAW_READY / LOCATOR_ONLY / STRUCTURAL_EXCLUSION` 建议及证据 ceiling。

它不得改 RQ、选择 replacement、补位、主张 novelty/Q2、写 clean brief 或决定候选状态。父 lane 保持 canonical owner；不以多数投票裁决。

## Selection and capacity

- 全六路一个 Source40 周期合计最多 2 个 Sol/high packet，不是每 lane 2 个。
- 选择必须在读取 targeted evidence outcome 前冻结；依据是 exact tentative object、finite route、贡献类型非支配和 closure complexity，不依据模型分数、热度或预期成功率。
- 不新增顶层 task/lane；使用现有 Discovery 允许的一层 bounded subagent/depth call。
- 若 Sol/high 不可用，记录 `MODEL_ESCALATION_UNAVAILABLE__NO_SCIENTIFIC_INFERENCE`；不得无限重试或把较弱输出伪装成独立强审。

## How to decide whether upgrading helped

不看自报置信度，也不要求产出配额。Source40 后比较：

- closure packet 是否补齐 exact carrier/action/estimand；
- 是否更早识别 `OMITTED_CURRENT_SAME_OBJECT / OMITTED_GENERIC_KERNEL / ATOMIC_ACTION_UNCLEAR / NATURAL_CARRIER_GAP / FULL_COST_GAP`；
- raw 是否到达 clean brief，以及独立 Stage0 是否仍需要材料性 repair；
- 每个 useful raw/brief 的额外模型成本和 wall time。

若 2 个 depth packet 都只复述输入、没有新增 source-backed distinction，或引入 RQ drift/弱门，则停止升级并回到现有模型。若至少一个 packet 形成 material closure 或避免一次可预见的弱 raw，才值得提议扩大或永久路由。
