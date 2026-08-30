# 规则文件体系盘点快照

- `audit_id`: `RULE-AUDIT-20260823-RULESET-TEXT-COMPACTION-A1`
- 日期：2026-08-23
- 范围：`AGENTS.md`、`plan.md`、`registry.yaml`、`rules/`、`templates/`、项目级 `.agents/skills/`
- 权限：proposal-only；未修改任何共享规则、模板、registry、plan 或 skill。

## 体量

| 区域 | 文件数 | 非空行近似数 | 字节数 |
|---|---:|---:|---:|
| `rules/` | 21 | 1,980 | 241,890 |
| `templates/` | 28 | 1,726 | 68,135 |
| `.agents/skills/` | 13 | 403 | 32,888 |
| `registry.yaml` | 1 | 24,807 | 1,682,391 |
| `history.md` | 1 | 1,859 | 532,087 |

`rules/_shadow_v9/`、`templates/_shadow_v9/` 与 `rules/CORE_POLICY.md` 合计 14 个 preview/shadow 文件、68,861 字节，占 `rules+templates` 的 22.2%。

## 典型最小入口体量

| Lane | 现行最小入口字节数 | 其中 registry 占比 |
|---|---:|---:|
| Discovery | 1,784,782 | 94.3% |
| Stage 0 | 1,748,848 | 96.2% |
| Stage A owner | 1,745,471 | 96.4% |

## 决定性观察

1. V9 shadow 仍为非生产：`CORE_POLICY.md` 标记 `SHADOW_P1__NOT_YET_PRODUCTION_AUTHORITY`，`AGENTS.md` 明确 V9 OFF。
2. 九个 shadow role 都固定旧 `CORE_POLICY` hash `30B24D...`；当前 `CORE_POLICY.md` hash 为 `C3E764...`。因此该 bundle 已不适合作为可直接读取的自洽 live policy，只适合作为版本化历史参考。
3. `ROLE_DISCOVERY.md` 同时保留完整前端流程、三遍发现法、dormant R7 和 claim-pack 条款；项目 skill 又完整描述了同一操作漏斗，存在职责重复。
4. `AGENTS.md` 与各 role 重复 Q2、same-object、current union、full-cost、STOP、blocker、revision、资源本地化与汇报规则。
5. `TOPIC_BRIEF.md`、`STAGE0_REPORT.md`、`STAGEA_REPORT.md` 和通用 `HANDOFF.yaml` 重复大量 role-level policy reminders；模板本应以字段/schema 为主。
6. `templates/HANDOFF.yaml`、`DISCOVERY_METHOD_BACKTEST.md`、`USER_REVIEW_PACKET.md` 没有清晰的当前 exact-path 读取入口，疑似 compatibility-only；在完成 frozen-assignment 反向引用核查前不能删除。

## 非结论

- 文件不在最小读取入口不等于可以删除；历史 assignment 可能依赖路径与 hash。
- 没有发现字节级完全相同的重复文件；主要问题是语义重复、历史兼容内容混入 live 文件，以及全量 registry 读取。
