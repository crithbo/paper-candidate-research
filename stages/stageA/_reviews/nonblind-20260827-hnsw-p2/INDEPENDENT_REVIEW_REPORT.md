# HNSW P2 非盲兼容性 probe 独立审查

## 结论

`REJECT_PRECLAIM_FIDELITY__P2_PRIOR_DEFECTS_NOT_CLOSED__NO_GOLD_FINAL_DISPOSITION`。

本报告只审 P2 对 P1 三项 defect 的闭合情况；不登记 production candidate、不输出正式 Stage A PASS/STOP、不进入 Stage B，也不形成 gold final disposition。

## 静态核验

| P1 defect | P2 结论 | 证据 |
|---|---|---|
| distinct replacement / live oracle | FAIL | P2 harness 先执行 `b[17]=r`，随后用已替换的 `b` 计算 oracle、建 HNSW，再 `markDelete(17)` 并以同一 `b[17]` re-add。它从未把旧 base-17 值插入索引后再替换为 `r`，故没有验证冻结的 old-vector→replacement live transition。 |
| delete-replace witness | FAIL | `replacement_distinct_from_base17:true` 与 `delete_replace_witness:true` 是输出常量；代码没有检查旧向量不可检索，也没有在 transition 前后验证 live-label oracle 的变化。 |
| separate oracle/HNSW costs | PARTIAL_ONLY | 三份 P2 JSON 独立给出 oracle 与 HNSW full-query wall time，优于 P1；但未给 construction、delete/replace、generation/normalization、parameter-grid 计价。 |
| fixed grid / full cost | FAIL | JSON 仅含 `M`，没有 `ef_construction` 或 `ef_search`；也没有 P1/F0 冻结所需的完整 component-level full-cost schema。 |

P2 三个 raw JSON 都存在，recall@1 都为 1，且显示 distinct replacement seed `20260829`。这些记录不能补偿上述构造缺口，因为 replacement 已在建索引与 oracle 之前发生。

## Evidence ceiling

`MINIMAL_CANONICAL_PROBE__NONBLIND_COMPATIBILITY_ONLY__NO_PRODUCTION_CANDIDATE_OR_STAGEB` 保持不变。reviewer 未运行新实验/probe、网络、资源创建、生产登记、Stage B 或 gold 结论。

## 可冻结的下一步

若 MAINLINE 继续，需另行冻结同对象工程修正：先以旧 base-17 建 oracle 和 HNSW，随后生成并应用 distinct replacement，更新 live oracle，再验证 old-vector 不可检索及 replacement-label oracle 一致；同时输出完整三格参数和所有冻结成本字段。此报告不授权该执行。
