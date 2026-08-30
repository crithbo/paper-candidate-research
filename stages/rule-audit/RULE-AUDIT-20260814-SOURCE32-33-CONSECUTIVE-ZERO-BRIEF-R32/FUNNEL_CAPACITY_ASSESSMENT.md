# 漏斗与容量对账

## 当前状态

- 总目标仍是 5 个独立 Stage A gate PASS，当前 1/5。
- Source33 六路 canonical handoff 已全部存在，结论为 0 clean brief。
- Source32 同样为 0 clean brief；两轮连续零产出触发本 R32，但零本身不是错误。
- Source33 保留一个 `NVPTX-TCGEN05-TENSORMEM-ALLOC-COPY-STATE-CONSTRUCTION` bounded unresolved raw；它没有被判为科学负例。
- 最近 Source28–31 的四个 clean brief（AMX、SME、MVE、PPC-MMA）均已完成 Stage0 处理，全部 STOP；当前 Stage0 PRIMARY 与 confirmation 没有 brief 积压。
- `LLVM-DWARF-CALLSITE-RECONSTRUCTIBILITY` 的 Stage A 资源门已经通过，正在进入 PRE_CLAIM 前检查；还没有新的 claim-bearing observation。

## Source32–33 分母

| 指标 | Source32 | Source33 | 合计 |
|---|---:|---:|---:|
| 六路 assignment | 6 | 6 | 12 |
| raw>0 的 lane | 2 | 1 | 3 |
| raw=0 的 lane | 4 | 5 | 9 |
| retained evidence-qualified raw | 2 | 1 | 3 |
| clean brief | 0 | 0 | 0 |
| 已独立确认 structural drop | SystemZ 1 | 尚无独立闭合；S6 内部 control 1 | 至少 1 独立确认 |
| bounded unresolved | RVV 1 | NVPTX tcgen05 1 | 2 |

主要损失发生在 seed/locator→raw：12 个 lane-cycle 中 9 个没有 raw。non-product 检查只作用于少数 joint/composed 对象，因此不是连续零产出的唯一或首要原因；但它使所有保留下来的 joint raw 都没有进入 clean brief，已经成为第二个可测的 admission bottleneck。

## Discovery 与审查速度是否匹配

以真正进入审查的 clean brief 为分母，当前审查能力高于输入速度。

- Source28–31 的四个 S6 brief handoff 分别约在 22:15、22:32、22:40、22:46 完成。
- Stage0 PRIMARY 对应 handoff 约在 22:28、22:44、22:51、22:58 完成，即初审通常在 brief 后约 11–13 分钟交付。
- AMX 和 MVE 需要 confirmation/revision，最终也在约 21–23 分钟内闭合。
- 到 Source32/33 连续零 brief 时，Stage0 已清空队列。

因此，短时四题突发曾让单 PRIMARY 槽位出现小队列，但没有形成持续积压；当前无需增加 Stage0 并行数。真正失配是“六路筛得很快，但可审查题很少”：下游审查槽位空闲，上游 9/12 lane-cycle 没有形成 raw，最近四个 brief 又全部在 Stage0 暴露结构性问题。

增加 Discovery lane 数只会扩大浅层筛查和界面开销。下一步应提高每个 raw 的对象/动作质量，并让 Stage0 承担其应承担的有界 non-product 终裁，而不是继续把更多判断前移到 Discovery。
