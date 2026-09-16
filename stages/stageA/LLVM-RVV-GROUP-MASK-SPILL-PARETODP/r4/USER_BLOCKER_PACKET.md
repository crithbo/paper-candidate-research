# LLVM-RVV-GROUP-MASK-SPILL-PARETODP r4 blocker

## 中文摘要

- F1 当前 LLVM action catalog 已通过。
- F2 两次 MachineVerifier replay 均 exit 0 且字节一致，但 greedy 输出仍保留 virtual-register records，并对两个 fractional parent 产生 `split-from` children。
- 这违反冻结要求“排除 split/rematerialization escape”，因此 F2 fail closed；F3–F5 未运行。
- 没有自然、性能、full-cost 或 claim 观察，也没有科学负结论。

- Status: `BLOCKED_USER_ACTION_REQUIRED`
- Blocker kind: `INVALID_PRECLAIM_CONSTRUCTION`
- Evidence ceiling: `PRECLAIM_CONTROL_ONLY__NO_SCIENTIFIC_INFERENCE`
- Scientific revision consumed: `no`
- Automatic retry / second build / upstream patch: none

## Resume boundary

当前 r4 不得修改 witness/checker 或重跑。后续需要 MAINLINE 另行判断并冻结新的精确 assignment；不得由 owner 自行把正常 greedy split 解释为通过或降低 F2 门。
