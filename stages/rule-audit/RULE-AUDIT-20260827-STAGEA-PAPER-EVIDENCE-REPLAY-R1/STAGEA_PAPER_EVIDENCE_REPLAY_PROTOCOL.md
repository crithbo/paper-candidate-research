# Stage A Paper-Evidence Replay Protocol

## 1. Fixed population

- 使用已经预登记并通过 Stage 0 nonblind compatibility 的 8 个 `LOCAL_STAGEA` 案例。
- 不按结果替换、不新增容易复现的论文、不删除构造困难的案例。
- 此处的 `LOCAL_STAGEA` 只保留为原抽样条件；切换为论文回放后，不再要求每案真正构建。

## 2. PAPER_EVIDENCE_CAPSULE

PACKER 对每案冻结：

1. exact paper identity、版本、发表年份和历史 cutoff；
2. contribution type、exact object、原子动作与机制；
3. Stage A 对应的关键前提，而不是论文全部结论；
4. 论文中支持该前提的页码、section、figure/table、metric、单位和分母；
5. 自然/canonical workload、比较器及其公平性；
6. full-cost 维度：时间、空间、面积、能耗、带宽、编译时间或适用成本；不适用项显式说明；
7. legality/equivalence/small witness 的论文证据；
8. 边界、失败区、置信区间或论文未报告项；
9. artifact/AE 状态与公开定位；
10. evidence label：`PAPER_REPORTED`、`AUTHOR_ARTIFACT_REPORTED` 或已有 `PROJECT_LOCAL_SUPPLEMENT`。

禁止把论文摘要的宣传性结论直接充当证据；必须定位到方法与结果表、图、定理或明确实验段落。

## 3. Gate question

Stage A gate 对每案只回答：

> 假设 capsule 中的论文报告证据按其 provenance 如实存在，但尚未由本项目独立复现，按照当前 Stage A 规则，这一证据形状是否足以支持 Stage A 的有限 PASS、需要一次修订、或证据不足？

可用结果：

- `PAPER_EVIDENCE_STAGEA_COMPATIBILITY_PASS`
- `PAPER_EVIDENCE_STAGEA_REVISE_ONCE`
- `PAPER_EVIDENCE_INSUFFICIENT_FOR_STAGEA_COMPATIBILITY`
- `PAPER_EVIDENCE_STRUCTURAL_FAIL`

只有 same-object、比较器、证据路线或 full-cost 的结构性失败才可用最后一项。无法核验论文数字不能变成科学 STOP。

## 4. Independence

- PACKER 负责抽取和引用，不评分。
- Stage A gate 看 capsule 和现行规则，不看 auditor expected outcome。
- AUDITOR 在 gate 输出 hash immutable 后比较 gold paper qualification 与 gate 结果。
- 已有本地 supplement 可以随 capsule 提供，但必须单独列；gate 要同时给出 `paper-only` 与 `paper-plus-local-supplement` 两个结果，防止少数已运行案例获得不公平优势。

## 5. Metrics

- `paper_only_compatibility_survival / 8`
- `paper_plus_supplement_compatibility_survival / applicable_cases`
- `revise_once_count`
- `evidence_insufficient_count`
- `structural_fail_count`
- `full_cost_missing_count`
- `natural_or_canonical_evidence_missing_count`

这些指标不与 blind recall、Stage 0 nonblind compatibility 或 local operational advancement 合并。

## 6. Resource and lifecycle behavior

- 停止为本回测新增大体量下载、工具链、构建或实验。
- 允许小规模公开论文/附录/AE 元数据获取，并继续受 assignment-local resource localization 约束。
- 已有 artifact、日志和运行结果按原 lifecycle closeout；不因切换而删除决定性失败证据或本地 supplement。

## 7. Acceptance rule

- 试点描述性目标仍可参考 `>=7/8` compatibility survival，但不得称为无偏通过率。
- 若低于 7/8，AUDITOR 必须区分：规则真正过严、论文证据在当前 Stage A 语义下不完整、贡献类型模板不匹配，或 PACKER 抽取缺失。
- 不因某篇论文发表就强制 PASS；已发表是 gold qualification，不替代逐项 evidence contract。

