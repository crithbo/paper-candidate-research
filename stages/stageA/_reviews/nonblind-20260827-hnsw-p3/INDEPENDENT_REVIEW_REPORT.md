# HNSW P3 非盲兼容性 probe 独立审查

## 限定结论

`ACCEPT_P2_GATE_DEFECT_CLOSURE__NONBLIND_COMPATIBILITY_ONLY__NO_GOLD_FINAL_DISPOSITION`。

P3 闭合了 P2 gate 的 runtime transition、live oracle、computed witness 与完整 grid/cost-field 缺口。此接受只适用于最小非盲兼容性 probe；不构成 production candidate、正式 Stage A PASS/STOP、Stage B 或 gold final disposition。

## P2 defect closure

| P2 defect | P3 结论 | 静态依据 |
|---|---|---|
| Runtime old→replacement transition | PASS | Source 先用原始 `b` 建 HNSW；随后 `markDelete(17)`、`addPoint(r.data(),17,true)`，仅之后才把 live-oracle `b[17]` 更新为 `r`。 |
| Live oracle | PASS | 1000-query oracle 在 live `b` 更新后计算；HNSW 检索与该 live oracle 比较。 |
| Computed witness | PASS | `replacement_query_label17` 由 HNSW 对 replacement 的实际查询计算；`old_vector_oracle_not17` 由更新后的 live oracle 对保存的 `old` 向量计算，而非输出常量。 |
| Fixed grid | PASS | 三个 JSON 分别固定为 M16/efC200/efS50、M16/efC200/efS100、M32/efC200/efS100。 |
| Separate cost fields | PASS | 三格均给出 construction、delete/replace、oracle full-query、HNSW full-query、index bytes 与 recall 字段；oracle 不再写死为零。 |

三份 raw 输出都为 recall@1=1、computed witness=true，且被 `P3_HASH_MANIFEST.sha256` 固定。harness hash `FEEAFD701C39D516F8ED2AB207121CAE265BA056E4E0B27FAA2E0ACCB192CA61` 与 receipt/manifest 一致。

## 非放宽残余

F0 的“零向量时重抽”规则在 P3 harness 中仍未显式分支实现；当前三格不会把这一点提升为正面科学或生产证据。本 report 仅接受 P2 gate 已登记的 defect closure，不扩展 claim ceiling。

## 边界

Evidence ceiling 保持 `MINIMAL_CANONICAL_PROBE__NONBLIND_COMPATIBILITY_ONLY__NO_PRODUCTION_CANDIDATE_OR_STAGEB`。reviewer 未运行新实验/probe、网络、资源创建、生产登记、Stage B 或 gold 判断。
