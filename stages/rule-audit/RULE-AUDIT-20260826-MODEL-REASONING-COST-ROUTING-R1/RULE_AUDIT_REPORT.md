# Rule Audit Report — Model and Reasoning Cost Routing

## 中文摘要

- 问题：论文项目的若干长期角色仍把 `gpt-5.6-sol/high` 或 `sol/xhigh` 写成默认；桌面任务若继续继承 Sol 极高设置，会让 bootstrap、哈希、检索铺量、构建和普通跟进都使用不必要的前沿推理预算。
- 结论：不应逐个唤醒 idle 会话“改设置”，那会额外消耗。应由 MAINLINE 在下一安全 assignment/follow-up 边界显式冻结模型，不允许继承任务窗口默认值。
- 建议：以 Terra medium/high 为科研主力、Luna low/medium 为机械与高吞吐工作；Sol high 只用于稀少的最终独立复审或有证据的争议升级。默认禁止 xhigh/max。
- 范围：仅 `E:/project/writing/reserch` 论文项目；不改 ResNet50、经济项目或 ChatGPT 会话。

## Identity

- `audit_id`: `RULE-AUDIT-20260826-MODEL-REASONING-COST-ROUTING-R1`
- `requested_by`: `USER`
- `authorization`: 用户明确要求重新规划所有会话的思考强度和模型，原因是全部 Sol 极高消耗过大。
- `date`: `2026-08-26`
- `shared_files_modified: false`

## Evidence

- `rules/ROLE_MAINLINE.md` 当前将 Stage A/B owner 与 Stage A gate 设为 `gpt-5.6-sol/high`，Stage B 独立复审设为 `sol/xhigh`。
- `rules/ROLE_CANDIDATE_OWNER.md`、`rules/ROLE_STAGEA_REVIEW.md`、`rules/ROLE_STAGEB_INDEPENDENT_REVIEW.md` 重复上述默认值。
- `registry.yaml` 同时存在 Terra 路由与历史 Sol/xhigh 路由，证明 assignment 显式冻结不一致，容易回退到昂贵默认。
- 当前任务盘点中只有 RULE_AUDIT 与 PACKER 正在运行；其余论文长期任务多数 idle/not loaded，因此没有必要为“改模型”而唤醒。

## External model basis

官方 OpenAI 文档把 GPT-5.6 Sol 定位为复杂专业工作的前沿模型、Terra 定位为能力与成本平衡、Luna 定位为高吞吐成本敏感工作；并建议 medium 作为平衡起点，只有测得质量收益才使用 high/xhigh，max 留给最难的质量优先任务。参考：

- https://developers.openai.com/api/docs/guides/latest-model
- https://developers.openai.com/api/docs/models/gpt-5.6-sol
- https://developers.openai.com/api/docs/models/gpt-5.6-terra
- https://developers.openai.com/api/docs/models/gpt-5.6-luna

## Recommendation

- Decision: `PATCH_RECOMMENDED__USER_APPROVED`
- 生效边界：正在运行的 turn 不打断；下一 follow-up/assignment 必须显式 model+reasoning。idle/not-loaded 会话保持休眠，首次恢复时应用新路由。
- 生产默认：`Terra/medium`。
- 禁止：任何角色默认 `xhigh` 或 `max`；不得因任务窗口历史设置继承 Sol。
- 升级：只有满足 `MODEL_ROUTING_POLICY.md` 中的证据条件，才能单 assignment 升到 Sol/high；结束即自动回落。
- 科学硬门：完全不变。模型降档不能降低 same-object、current collision、强基线、自然证据、full-cost、可复现性或 claim ceiling。

## Expected cost effect

按当前官方标价，Terra 的输入/输出单价约为 Sol 的 50%/60%，Luna 约为 Sol 的 5%/6%。实际 Codex 套餐计量可能不是 API 逐 token 账单，因而这里只作为相对资源路由依据，不估算用户实际账单。

## Mainline handoff

- 更新 `rules/ROLE_MAINLINE.md` 的模型表及各角色规则中的默认模型行。
- 在 `registry.yaml` 安装新的项目级 model routing revision，并为所有长期角色记录 `next_assignment_model_route`。
- 活跃 PACKER 当前 A1 不打断；下一次主线 follow-up 使用 `gpt-5.6-terra/medium`。
- 不向 idle/not-loaded 任务发送空消息；恢复时由 MAINLINE 用带 model/thinking override 的真实 assignment 唤醒。
- `shared_files_modified: false`

