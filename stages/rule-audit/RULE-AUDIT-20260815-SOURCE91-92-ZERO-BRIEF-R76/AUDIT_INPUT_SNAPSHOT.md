# R76 审计输入快照

- 合同：`stages/rule-audit/_assignments/RULE_AUDIT_SOURCE91_92_ZERO_BRIEF_R76.yaml`
- SHA-256：`83DDDEE46A4AC8A5128A425F097254EE06F262281AB033C9584F8D5D43891897`
- 只读 Source91–92；Source93、指定 closure 与全部 held/terminal queue 不作为审计输入。

| 周期 | raw | clean brief |
|---|---:|---:|
| Source91 | 1 | 0 |
| Source92 | 1 | 0 |

CPython `S2-91-CQ01`、Ruby YJIT `S2-92-CQ01` 均 `PENDING_UNEXECUTED`、0 attempts。Source91/92 的机械路径或封包延续没有改变 scientific denominator 或 resource attempt。
