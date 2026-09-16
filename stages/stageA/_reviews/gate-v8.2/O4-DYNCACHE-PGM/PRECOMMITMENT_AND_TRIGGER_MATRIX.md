# O4-DYNCACHE-PGM 独立 Stage A Gate 预承诺与触发矩阵

- reviewer role: `STAGEA-GATE-REVIEW`
- protocol: `gate-v8.2/REVIEW_PROTOCOL.md`
- reviewed object: frozen `O4-DYNCACHE-PGM` Stage A handoff only
- decision vocabulary: `PASS | REVISE_ONCE | HUMAN_RESEARCH_RESERVE | STOP`
- positive evidence ceiling: `NOT_FALSIFIED / PRELIMINARY_SUPPORT`

## Highest-risk premise

冻结题目的最高风险前提不是“能否写出一个叶页 copy-on-write 插入器”，而是：在 exact predecessor / output-sensitive range 的同一研究对象上，PDEC 的证书与双版本信用机制是否产生普通 COW B+tree 叶页（包括附加同类仿射提示）不能直接吸收的、可测或可证明的机制性增量，并留下有限、可证伪、可复现的 Stage B 路线。

## Falsifier and minimum controls

1. 若当前 probe 的成功由固定页容量、分片规则和计数定义直接保证，而不依赖 PDEC 特有性质，则它不能单独支持机制性前提。
2. 若在相同信息、容量、原子发布语义和局部完整计价下，普通 COW B+tree 叶页或 `B+tree + affine hint` 能产生同一可达转移与同一上界，则当前正证据被基线吸收。
3. 若没有任何预声明可达或自然输入实例使 PDEC 证书改变合法状态、转移、保证或成本，则应触发一次原子修订；修订后仍无法给出非吸收残差，则触发 `STOP`。
4. 若需要不可公开资源或 AI 无法执行决定性核心工作，而题目学术潜力仍成立，则触发 `HUMAN_RESEARCH_RESERVE`，不是学术性 `STOP`。

## Decision triggers

- `PASS`: probe 逐字节可复现；最高风险前提获得非空、非循环、未被最小公平控制吸收的 `NOT_FALSIFIED/PRELIMINARY_SUPPORT`；且 Stage B 路线有限、可证伪、可复现。
- `REVISE_ONCE`: 结构性论文潜力仍在，但当前 probe 对最高风险前提不具区分力；存在一个可在 Stage A 内完成的原子证据修订门。
- `HUMAN_RESEARCH_RESERVE`: 学术形状仍成立，但决定性核心步骤当前不能由 AI 在授权资源内执行。
- `STOP`: 出现决定性负结果、对象漂移、强基线吸收且无非空残差、不可复现、仅为普通调参/包装，或没有非空 Stage B 路线。

本矩阵约束 reviewer 的证据解释；它不授权修改候选包、补跑实验或启动 Stage B。
