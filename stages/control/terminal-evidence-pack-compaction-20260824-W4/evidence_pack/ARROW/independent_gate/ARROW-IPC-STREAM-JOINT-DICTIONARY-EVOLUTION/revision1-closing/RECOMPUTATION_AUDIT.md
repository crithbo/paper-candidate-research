# 独立复算与反攻审计

## 只读边界

本审计只执行：哈希复算、JSON 聚合、源码 static diff、冻结公式重算。未运行 solver、writer benchmark、自然 candidate experiment、Stage B 或任何新 claim-bearing workload。

## Owner 包

- Manifest self: `E0F2AF062D840B460D558010FEF7C9F73593EBFAE3655F0D25DF56AAF3A91A36`
- Canonical format: uppercase SHA-256 + two spaces + relative path
- Verification: `614/614 PASS`
- Covered bytes: `122,533,243`
- Missing/hash mismatch: `0/0`

首次 parser 预期 `sha256sum -b` 星号格式，因此产生 614 个 parse-only mismatch；按 owner manifest 的实际 canonical 双空格格式重新解析后全部通过。该机械 parser 偏差没有改变文件或科学审查。

## Corrected exactness

- `preclaim.py` SHA-256: `C86F8E0D00FCE0186826CC885AA5FE3434E8871DE3A20305275D99B682DC0789`
- Exactness result SHA-256: `38F1A4BA874E6B48DC6405731925EBA666CFEC3F84D69BEDB5DE04FFDBC3FB73`
- Delta-disabled: 17/17 boundary projection hashes、state counts、label counts 与 full labels 相等。
- Delta-enabled: 11/11 boundary projection hashes、state counts、label counts 与 full labels 相等。
- Delta-enabled live branches: `DELTA, INITIAL, NO_EVENT, REPLACEMENT`。
- Complete tiny preclaim: 6/6 arms every-boundary exact。
- Natural feasible windows: 32/32 both delta arms compare complete boundary projection and final signature equal in both executions。

源码 diff 只在 component dominance/dedup 引入 gate 要求的 statewise full-signature ordering；没有 objective、transition kernel、catalog 或 backpointer guarantee 的变化。

## 两棵原始结果树

| Metric | Primary | Attempt1/replay |
|---|---:|---:|
| JSON windows | 32 | 32 |
| useful | 0 | 0 |
| strict | 0 | 0 |
| infinite ratio | 30 | 30 |
| ratio 2.0 | 2 | 2 |
| full-cost residual | 8 | 6 |
| RP/product exact | 32 | 32 |
| all-arm native equivalent | 32 | 32 |
| all-arm deterministic stream | 32 | 32 |

每个 execution 的八个 arm ledger 均重算为 stream bytes sum `30,104`。

## 40-window bound

令余下 8 个 Adult 全部同时 useful 与 strict：

- useful upper bound = `8 < 10`；
- strict upper bound = `8 < 20`。

现有 rank multiset 是 30 个 `+∞` 与 2 个 `2.0`。加入任意 8 个非负 ratio 后，40 个排序值的中位位置仍落在 `+∞` 区间。因此真正的最低可能 median 是 `+∞`；`>=2.0` 只是较松但有效的下界。冻结 `median >= 1` killer 必然触发。

## Adult above-cap 静态复算

对冻结 UCI Adult 的 workclass/education、16-row windows 与 offsets，按 `sum_{k=0}^n P(n,k)` 计算每字段 reduced-state count：

| Window | Offset | Universe sizes | State counts | Product upper | Above 4096 |
|---:|---:|---:|---:|---:|---|
| 0 | 0 | 3, 9 | 16, 986410 | 15782560 | yes |
| 1 | 4649 | 3, 6 | 16, 1957 | 31312 | yes |
| 2 | 9298 | 4, 4 | 65, 65 | 4225 | yes |
| 3 | 13947 | 6, 7 | 1957, 13700 | 26810900 | yes |
| 4 | 18597 | 5, 7 | 326, 13700 | 4466200 | yes |
| 5 | 23246 | 4, 6 | 65, 1957 | 127205 | yes |
| 6 | 27895 | 5, 6 | 326, 1957 | 637982 | yes |
| 7 | 32545 | 5, 7 | 326, 13700 | 4466200 | yes |

因此 8/8 都触发原合同的 product ceiling omission 与 zero superiority eligibility；independent-carrier residual upper bound 为 0。

## Full-cost 反攻

Residual 8/32 与 6/32 不稳定，说明部分 Pareto labels 由环境敏感 timing 维度决定，不能作为稳定正证据。与此同时：

- bytes 完全相同；
- candidate planning p50 明显高于全部三类 comparator；
- candidate temporary 最大值明显更高；
- full-cost support 需要 10/40 且 Adult 2/8，而 Adult upper bound 已为 0/8。

因此 full-cost PASS 不成立。审计不声称每个 NYC window 都被严格 Pareto dominated；STOP 由更强、更稳定的 preregistered rank killer 决定。

## Adult resource observation 限定

包内无 raw process-monitor trace；3,553.5 MiB RSS / 4,305.1 MiB private 数字来自 command narrative 与 summary generator。该 observation 被降为 supplementary/censored，不参与决定性 STOP proof。即使完全移除它，rank 与 Adult above-cap eligibility 上界仍独立闭合 STOP。

## 复算结论

`CONFIRM_STOP`，限定为 frozen RP-FDP mechanism。不存在 resource-only STOP、对象漂移、隐藏 second revision 或 incomplete-run inference。
