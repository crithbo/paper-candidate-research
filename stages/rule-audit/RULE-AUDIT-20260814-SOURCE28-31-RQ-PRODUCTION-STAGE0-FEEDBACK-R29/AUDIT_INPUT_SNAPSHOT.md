# Audit input snapshot

- Audit ID: `RULE-AUDIT-20260814-SOURCE28-31-RQ-PRODUCTION-STAGE0-FEEDBACK-R29`
- Snapshot date: `2026-08-14 Asia/Shanghai`
- Scope: Source28–31 在 `RQ_REFINEMENT_STAGED_EVIDENCE_V1 / PRODUCTION` 下形成的真实 `CLEAN_STAGE0_BRIEF` 与独立 Stage 0 反馈。
- Evidence method: 使用 academic-research-suite 的来源分级、逐案证据矩阵、交叉案例综合和反方攻击；没有联网、下载、实验或接触运行 lane。

## Control-plane inputs read in full

| File | SHA-256 at audit read |
|---|---|
| `AGENTS.md` | `7B4C3D9F6F66CB241333ADF724508C7470416F05F39E28C0F5E3D3A9427E76C3` |
| `plan.md` | `5A37D10A07FA3B8D54DB0DE5C8C4B353EC7BC7FE892118E64D41CFD018663BBD` |
| `registry.yaml` | `725E3985D746516EEB4E8701AEB4F2CBF5CED274D83F75850008DA6F36759A47` |
| `rules/ROLE_RULE_AUDIT.md` | `D952A706080ED5DE1CFB2E007D8C4672539D9152580F6CA61516E185A52E41ED` |
| `rules/ROLE_DISCOVERY.md` | `51C3A99050B43DCD99F5499B6EE40F346FF83724A0E83A1723838E114115A5D9` |
| `templates/DISCOVERY_RQ_CANDIDATE.md` | `8293148BB113E0C973F2FA831842A37723FBDBCE992596471C60D954A8A132DA` |
| `templates/DISCOVERY_QUESTION_CARD.md` | `C1B3883C178D67A2DBE01ABE03FED159B45A893911217C6A125D0A13F0A707AD` |

`registry.yaml` 是并发主线文件；上述哈希只冻结本审计实际读取的版本，不声称阻止主线后续合法更新。

## Claim and outcome inputs

| Object | Canonical input | SHA-256 | Audit use |
|---|---|---|---|
| AMX | Source28 S6 clean brief | `DA3B8A638FB946D0A9FC8279E9F91A85F55F621C064E697DC301D58EB4469864` | Accepted case |
| AMX | Stage 0 revision report | `E1AFDB12722F36F3805B50DF6FFF9C416836E02DA3677EB43A5307056762E6F8` | Accepted terminal feedback |
| SME | Source29 S6 clean brief | `CC23A12D5653DD6D9648F478F39ECCF8CB5C42F70E7CA495B11A1B775288C578` | Accepted case |
| SME | Stage 0 PRIMARY report | `CBF4A06629400D86422520F160DE887D7984BAC67307FEFFAAF9F773AFA8B61A` | Accepted terminal feedback |
| MVE | Source30 S6 clean brief | `A4087015629B716E1C2F4289187399483B21FBDDF2435C49E960E7987AD346CB` | Pending case |
| PPC-MMA | Source31 S6 clean brief | `E92732A2C6FBAE80B18C789E6C2AD4AB81DB2083395445ACB473CD556FAEC61E` | Queued case |

审计时目录中可见一份 MVE PRIMARY 报告，哈希为 `F933AFA95161EEF0408CD95E7213F701FAC39221C98623DE8A1F743FEA8ECB7D`；但本快照的 registry 状态仍为 `PRIMARY_DISPATCHED`，主线尚未登记验收。因此该文件只用于确认“反馈即将到来”，不计入本报告的已接受结果分母，也不据此改变候选状态。

## Frozen denominator

- Source28–31：4 个完整六路轮次，共 24 个 lane-round。
- `CLEAN_STAGE0_BRIEF`：4 个，全部来自 S6；S1–S5 同期 20 个 lane-round 为 0 brief。
- 已被主线接受的独立 Stage 0 科学结果：2 个，AMX 与 SME；二者均因非直积耦合不成立、退化为当前目标构造与通用 RA/allocation 的组合而 STOP。
- MVE 与 PPC-MMA 不计入已接受结果分母。故“2/2 同类失败”是强过程预警，不是对全部 S6 或全部 target-specific 联合算法的总体统计结论。

## Explicit exclusions

- 未读取未登记的 lane 临时判断，也未联系 Discovery/Stage 0。
- 未运行检索、下载、构建、实验、Stage A/B 或 V9。
- 未修改 `AGENTS.md`、`plan.md`、`history.md`、`registry.yaml`、`rules/`、`templates/` 或任何候选目录。

