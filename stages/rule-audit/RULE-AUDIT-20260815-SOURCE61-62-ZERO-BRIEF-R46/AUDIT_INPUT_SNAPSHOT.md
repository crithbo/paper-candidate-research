# R46 审计输入快照

## 冻结合同与范围

- `audit_id`: `RULE-AUDIT-20260815-SOURCE61-62-CONSECUTIVE-ZERO-BRIEF-R46`
- 合同 SHA-256：`2367D45DB8E2FB6CA4EB9EAA003373C409336BE70B6E47EFF39972F88FF10A6F`
- 只读：Source61、Source62 的 control、canonical handoff、queue/locator telemetry 和当前共享规则。
- 排除：Source63 的目录、结果、联系和回写；任何 queue 执行、外部检索、下载、实验、Stage 或共享写。

## 关键可复核分母

| 周期 | control SHA-256 | raw | clean brief | 可归因的首个主要失败 |
|---|---|---:|---:|---|
| Source61 | `3E3717AA2271EC81225E197C600E3AAA9D92FE32EA95BDF0BF2E605D3BA9FD4D` | 0 | 0 | S3/S4 无 exact anchor；其余为 generic/current 或 locator-only |
| Source62 | `23F35D8B657295DCD20B87D713F22651400A5AE7E353E111A9A2C87CA6A5D83B` | 0 | 0 | S3/S4 无 exact anchor；S1/S6 generic/current；S2/S5 locator-only |

## 解释边界

Source62 的 TypeScript 路线虽有真实 missing-output 边界，但唯一可命名修复仍是通用 manifest/rebuild；这不是 target-specific N1/N2 raw。V8/Julia locator 也没有满足 current union 与非通用保证的最小包。
