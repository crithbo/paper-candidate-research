# Rule Audit Report — Luna xhigh and Blind-Test Fallback

## 中文摘要

- 用户授权：论文项目中凡模型为 `gpt-5.6-luna` 的路由，统一使用 `xhigh` reasoning。
- 官方能力：GPT-5.6 Luna 支持 `none / low / medium / high / xhigh / max`，因此该配置合法。它会比 Luna/low 或 medium 使用更多推理计算；本修改是用户明确选择，不把它描述为零成本升级。
- 双盲当前状态：首位独立 Stage 0 reviewer 在读取第 `1/16` 个输入时识别身份，按协议立即停止；污染 `1/1`，科学判断 `0`。这证明污染保护有效，但没有产生任何 Stage 0 召回率或严格度证据。
- v2 状态：PACKER 已用唯一预登记替补重封 16 项；其余 15 项 byte-exact，禁词/身份扫描 0 命中；尚未投递第二名 fresh reviewer。
- 建议：再进行一次且仅一次 fresh-reviewer v2 双盲尝试。若第二名 reviewer 再次识别任一身份，则以“两名独立 reviewer 连续污染”触发停止双盲，切换为非盲规则兼容性测试。

## Identity

- `audit_id`: `RULE-AUDIT-20260826-LUNA-XHIGH-BLIND-FALLBACK-R1`
- `requested_by`: `USER`
- `date`: `2026-08-26`
- `shared_files_modified: false`

## Frozen evidence

- Model routing compatibility receipt: `stages/rule-audit/RULE-AUDIT-20260826-MODEL-REASONING-COST-ROUTING-R1/MODEL_ROUTING_COMPATIBILITY_RECEIPT.yaml`, SHA256 `9732A98ED79CD943D688E17ED4B2C207838A898D79C02FC2993F2C9D6428312D`.
- PACKER v2 handoff: `stages/discovery/_method-backtests/STAGE0A_Q2_LOCAL_RESOURCE/R1/packer/handoff.yaml`, SHA256 `5EAE7F60702542A2F82B5FFF1D3ACAA59CF0D842E37CCCE81D7B91CB8AA7F77D`.
- PACKER final manifest: SHA256 `E86E400AD3938CB7227E8BE793E6AFBFD18B27F4283AF7B6C54DCA60FF5545A3`.
- v2 blindness audit: SHA256 `AE81620E57BD99DC250D79AA7A3A3F30A2809113A9DF161F9C4610108CC061A1`.

## Double-blind assessment

| Metric | Current value | Interpretation |
|---|---:|---|
| independent reviewers attempted | 1 | too small to infer persistent failure |
| reviewers contaminated | 1 | observed contamination rate 100%, but n=1 |
| cases read before stop | 1/16 | batch scientific evaluation never began |
| scientific decisions | 0 | no Stage 0 strictness evidence |
| v2 leakage scan | 0 matches | packet text/path scrubbing passed |
| fresh v2 reviewers attempted | 0 | one clean retry remains justified |

当前不能说双盲“效果好”或“效果差”：只知道协议能检测并阻断身份先验。识别可能来自模型记忆和机制本身的知名度，而不是文件泄漏；继续无限换 reviewer 会浪费预算，也不能保证独立性。

## Recommendation

- `LUNA_XHIGH`: `PATCH_RECOMMENDED__USER_APPROVED`。
- `BLIND_TEST`: 保留一次 fresh-reviewer v2 尝试。
- `FALLBACK_TRIGGER`: 第二名独立 reviewer 若再次产生 `BLINDING_CONTAMINATION`，立即停止双盲 arm，不再请求第三名 blind reviewer。
- `FALLBACK_MODE`: `NONBLIND_RULE_COMPATIBILITY_AUDIT`。
- 非盲结果只能回答“现行文字规则是否会把这些已知成果判成存活/停止”，不能估计无偏的 blind recall、false-negative rate 或是否达到 75%。

## Scientific invariants

- 无论盲或非盲，same-object、历史 cutoff、强基线、自然/canonical 证据、full-cost、可复现性和负控均保留。
- 非盲 reviewer 必须逐案先写规则 checklist 和 tentative decision，再查看 gold disposition；若身份本身已使 gold 显然，则明确登记 unavoidable prior。
- 正控与负控结果分别报告；负控误放行不能被正控高通过率抵消。
- blind 与 nonblind 指标绝不合并。

