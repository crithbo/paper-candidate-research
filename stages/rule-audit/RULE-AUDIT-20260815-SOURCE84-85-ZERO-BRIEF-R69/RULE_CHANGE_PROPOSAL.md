# R69 规则变更提案

## 提案

`NO_CHANGE`

两条 raw 的价值是将“尚缺 current/source/action 证据”的状态明确暴露出来，而不是让模型用自信评分或未验证的 current absence 补全。此时的最小安全措施是继续维持 raw、closure queue 与 clean brief 三者的独立分母。

## 不做的事情

- 不执行 `S2-84-CQ01`、`S2-85-CQ01`、S81 queue 或任何 queue；
- 不将 0 attempts 写成 exhausted、Stage 0 debt、current absence 或新颖性；
- 不因两个 S2 raw 改变 lane 数、模型、资源预算、提案配额或科学门；
- 不读取或影响 Source86。

无需应用或回滚。若两项 closure 有实际、独立冻结的执行结果，再单独比较其闭合率与 Stage 0 precision。

`USER_POLICY_DECISION_REQUIRED=false`
