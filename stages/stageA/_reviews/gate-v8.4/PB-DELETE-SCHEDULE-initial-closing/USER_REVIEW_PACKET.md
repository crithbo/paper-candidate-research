# PB-DELETE-SCHEDULE 独立 Gate 用户包

- Assignment: `STAGEA-G2-20260809-PB-DELETE-SCHEDULE-INITIAL-CLOSING`
- 独立结论: `REVISE_ONCE`
- 当前质量判断: `TIER_B_Q2_VIABLE`，仅表示论文结构仍有条件成立；现有 Stage A 结果不能支持 PASS。
- Stage B: `false`
- 用户批准: `null`

## 为什么不能接受 owner 的 STOP

owner 的数值与文件均可复现：24/30 trace 命中一个已验证的非原序选择，240/240 行通过 VeriPB 与 CakePB，双重重放哈希无差异；candidate 的 p50/p90 分别为 260.117/813.385 ms，明显慢于 original 的 138.997/422.363 ms。24 个命中可作为“至少存在一个合法替代顺序”的有效下界，但不能代表完整 action space 的 choice density。

但这只是单次相邻交换 proxy。冻结合同要求的是完整 legal ordered partition/batching scheduler。实现从 31,181 个 frontier pair 中只测试 57 个，每条 trace 最多四个候选，最终每种非原方法至多交换一对相邻删除；它没有实现完整 partition、batch 或多步 schedule。因此该负结果只能淘汰当前 one-swap control，不能否定冻结 N2。

此外还有三个 pre-claim 硬缺口：

- comparator 也是相邻交换 proxy，不是同一完整 action interface 上的 stable/greedy；candidate 还从更宽的已验证 trial 集合中选择。
- Pareto 只聚合 time 与 certificate bytes，未把已预登记的 RSS/I/O 纳入；选择依赖 verifier 探索，却只计一个 selected trial 的探索成本。
- 30 条 corpus 中包含明确命名为 `ConsistentQueryAnswering-synthetic-15` 的成员，与合同“No synthetic trace”直接冲突；去掉后不足 30 条已闭合自然 trace。

## 唯一允许的 revision

原子门名：`PRE_CLAIM_CONTRACT_FIDELITY_GATE__FULL_ORDERED_PARTITION_NATIVE_COMPARATORS_AND_COMPLETE_COST`。

revision 必须一次性完成：30 条可证明为自然的 corpus；完整 ordered-partition/batching action；candidate/stable/greedy 共用同一信息与 action interface；原生 proof/checker/format；小 witness 合法性与等价性；完整计入 planning/exploration、RSS、I/O、两 checker、证书与 fallback；choice-rate 明确区分 trace-level existence 下界与完整 action 的 choice density。

本报告签发时 scientific revision 尚未消耗；只有 owner 实际实现并执行修正构造时才消耗。修正后若 full-cost 仍被吸收，可以形成真实 STOP；若出现正结果，最高也只是 Stage A `PRELIMINARY_SUPPORT`，仍需停在 `PENDING_USER_STAGEB_REVIEW` 等待用户逐题批准。

## 机械可信度

- Discovery manifest: 4/4
- Stage 0 PRIMARY manifest: 4/4
- Stage 0 confirmation manifest: 2/2
- Owner manifest: 38,525/38,525；manifest 自身哈希与主线冻结值一致
- Owner 指定四个主哈希: 全部一致
- 独立重算: 240 rows、120/120 双重重放、checker/output closure 全部一致

无需当前用户资源解阻；主线只需登记独立 gate 的 `REVISE_ONCE` 建议并按原子门回投 owner。此决定不授权 Stage B。
