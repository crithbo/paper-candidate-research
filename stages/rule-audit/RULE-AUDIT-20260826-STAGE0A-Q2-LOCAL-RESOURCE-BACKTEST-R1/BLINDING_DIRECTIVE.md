# Executor Blinding Directive

## Authority and purpose

用户明确要求：执行支线不得知道案例是既有论文成果，必须把它当作自己发现的普通新候选处理，以避免“已发表/Q2+”先验导致倾向性通过。

## Information partition

| Role | May know existing paper/gold outcome? | Visible material |
|---|---:|---|
| PACKER | yes | full case pool, paper, venue, artifact, cutoff and gold-label evidence |
| MAINLINE mechanical router | only what is necessary to freeze routes; must not repeat it downstream | hashes, opaque pack IDs, lane mapping |
| Stage 0 EXECUTOR/SENTRY/DECISIVE | no | ordinary neutral candidate brief and frozen pre-publication source universe |
| Stage A owner | no | neutral Stage A contract, canonical inputs, comparator interface and local resource envelope |
| Stage A independent gate | no | ordinary owner evidence and contract; no gold label |
| Final AUDITOR | yes, only after executor outputs are immutable | sealed outputs plus full gold-label record |

## Dispatch constraints

1. Executor-visible assignment title、prompt、context、路径和文件名不得包含 `backtest`、`calibration`、`paper`、`published`、`Q1/Q2`、`positive/negative control`、论文名、作者、venue 或预期决定。
2. 使用随机、不含语义的中性 case ID；ID 映射只保存在 auditor-only 密封表中。
3. 中性候选 brief 必须改写技术描述，不复制可检索的标题、摘要、图注、伪代码变量名或独特措辞。
4. Stage A owner 不得获得作者方法实现、作者 artifact 仓库、复现实验脚本或 Git 历史；只获得问题、机制合同、自然/canonical 输入和 comparator 接口，并自行实现最小 probe。
5. 正常的碰撞审查使用 PACKER 冻结的、早于候选最早公开日期的 source universe。执行者不得通过当下互联网搜索论文身份或未来成果。
6. 执行支线输出冻结后，AUDITOR 才可揭盲和打分。

## Contamination handling

若执行者识别出案例，立即输出唯一状态 `BLINDING_CONTAMINATION`，不作 PASS/STOP 判断。PACKER 使用预登记替补重封；污染案例排除出分母但必须计数和说明来源。任何识别后的正面或负面判断均不得作为校准证据。

## Forbidden message example

不得发送：“这是已发表的 Q2/顶会论文，请回测 Stage 0/Stage A 是否会通过。”

## Allowed message shape

可发送：“请按当前角色规则独立审查附件中的冻结候选。不要假设结论成立；完成必要的碰撞、同对象、比较器、证据路线、full-cost 和最小 falsifier 判断，并按 ordinary assignment 输出。”

