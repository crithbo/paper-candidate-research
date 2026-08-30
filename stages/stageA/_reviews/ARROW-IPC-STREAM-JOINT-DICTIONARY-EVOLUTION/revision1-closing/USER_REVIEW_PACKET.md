# 用户终审包：ARROW-IPC-STREAM-JOINT-DICTIONARY-EVOLUTION

## 决定

`CONFIRM_STOP`，confidence `0.99`，quality tier `BELOW_Q2_STOP`。

这不是因为 Adult 运行未完成或内存不足而 STOP。决定性原因是：修正后的 solver 已经通过 exactness gate，但两次冻结 32-window NYC 执行都得到 `0 useful / 0 strict / 30 infinity / 2 ratio-2.0`。余下 8 个窗口即使全部理想，也无法达到 `10 useful / 20 strict`；40-window median 的实际最低值仍为 `infinity`，预登记 product-sized killer 已不可逆成立。

## Fidelity 是否修好

是。

- Delta-disabled adversary：17/17 boundaries 完整 cost+signature exact。
- Delta-enabled adversary：11/11 boundaries 完整 cost+signature exact，DELTA/INITIAL/NO_EVENT/REPLACEMENT 全部 live。
- Tiny preclaim：6/6 arms every-boundary exact。
- 两次自然执行：32/32 feasible windows 的完整 boundary projection 与 final signature 相等。

修订没有换对象或机制；唯一 scientific revision 已在首次 corrected execution 前消耗，当前为 `1/1 CONSUMED`。

## Adult 事件如何处理

8 个 Adult window 的 product upper states 经独立静态复算全部超过 4096；按原合同，它们都必须省略 product 且不得计 candidate superiority，因此 Adult residual 上界是 0/8。

Adult window 0 的 4 GiB 终止只作为补充 scale observation。包内没有 raw monitor trace，所以本 gate 不依赖其精确 memory 数字，也不把它当 user resource blocker。

## Full-cost

两次执行中所有 comparator/candidate arm 的总 stream bytes 都是 30,104 B。Candidate planning p50 约 113–114 ms，明显高于 grid 13 ms、independent 29 ms、product 38–39 ms；temporary memory 也更高。Timing-sensitive Pareto residual 为 8/32 与 6/32，不稳定且不能满足独立 Adult 条件。

## 结论边界

STOP 仅指：

`statewise-signature-aware RP-FDP + Arrow 25.0.0 frozen native action catalog + frozen 40-window corpus + frozen rank/full-cost thresholds`。

它不证明所有 Arrow dictionary evolution algorithm 都不可能，也不禁止未来用新 topic ID 研究不同表示或不同问题。但本 topic 不得通过改名、第二 revision 或 mechanism pivot 复活。

## 权限

- Stage B: `false`
- `stageb_user_approval_id: null`
- Pending user Stage B review: `false`
- Projects/automation/shared-control write: `false`

Lane 已回到 `IDLE_REUSABLE_AWAITING_MAINLINE`。
