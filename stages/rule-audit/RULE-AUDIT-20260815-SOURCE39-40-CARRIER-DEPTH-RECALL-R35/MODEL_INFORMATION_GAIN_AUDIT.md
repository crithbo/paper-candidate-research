# Source40 选择性 `sol/high` 信息增益审计

## 实际执行分母

- 预留 slot：2 个（S3、S4）。
- 实际触发：1 个（S4 Depth-02）。
- S3 因没有合法 RQ-complete packet，slot 未触发且未结果后转派。
- 没有 paired `terra/medium` 或 `terra/high` 对照 packet。

因此样本量是 `n=1`，只能做案例级信息审计，不能估计模型 uplift。

## 新增了什么

S4 packet 在 targeted evidence 前冻结了一个 fixed SPEC CPU 2017 public result artifact、full-cost estimand、三项问题和 falsifier。`sol/high` 随后新增并闭合了：

1. exact artifact `cpu2017-20260112-50922`、suite v1.1.9、日期与 rate endpoint；
2. 官方 throughput/energy semantics，并指出 energy 为可选且本 artifact 为 `--`；
3. 官方 metric 不等于 setup+compile+execution+energy+memory+teardown 的 full-cost endpoint；
4. 同对象有限 falsifier：固定 artifact 缺 claim-critical denominator 字段，无法实例化 estimand。

这些是 breadth packet 中不存在的具体证据，因而存在 **信息增量**。它还阻止了把 fixed artifact 悄悄扩大成新的 instrumentation study，提升了对象保真和前端 precision。

## 没有证明什么

- 没有新增 canonical raw 或 clean brief；
- 没有证明 `sol/high` 比相同证据下的 `terra/high` 更好；
- 没有独立 Stage0 评审，也没有 novelty/Q2 判断；
- 没有证明固定 S3/S4 预留优于全局中性 selector；
- 没有证据支持把强模型升级扩大到六路或变成必经门。

## 建议

不把 Source40 的固定 `S3/S4 sol/high` 预留永久化为生产默认。保留其 packet schema 和安全边界作为 dormant escalation pattern；先观察已经运行的 Source41 `terra/high` 在同类 carrier/action/estimand 闭合上的表现。只有未来出现“breadth-high 已完成预承诺但仍有具体、有限、非结果感知 closure gap”的可识别 packet，才单独建议是否重新启用强模型；不得自动沿用 Source40 的两个 slot。

这不是降低模型能力，而是避免把一次成功的 precision closure 误当成已证实的 recall 方法。
