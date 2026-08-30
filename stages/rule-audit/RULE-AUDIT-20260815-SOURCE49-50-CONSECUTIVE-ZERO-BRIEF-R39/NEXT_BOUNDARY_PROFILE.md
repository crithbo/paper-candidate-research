# 下一安全边界唯一建议

## `PRE_RQ_SINGLE_ANCHOR_CLOSURE_V1`

在 Source51 完成后的第一个未冻结六路 assignment，只运行一个周期。Source51 不暂停、不回写、不读取本审计建议改变其判断。

### 唯一行为变化

Typed residual role 在 pre-RQ 阶段改为**诊断清单**，不再要求完整 carrier/action/estimand tuple 已经由证据闭合后才允许 source closure。现行 raw、current-union、same-object、Q2 与 full-cost 门完全不变。

复用 Source50 未使用的选择性深审规模：全周期仍最多两个 `gpt-5.6-sol/high` packet，不增加 slot、lane、检索或资源预算。packet 改为 `PRE_RQ_ANCHOR_CLOSURE_PACKET`，按第一个、第二个机械合格的 append-only chronological commitment 分配。

### Packet 资格

在读取决定性材料前必须冻结：

1. 一个 exact public anchor：project/dataset/benchmark/spec + version/date；
2. object envelope、不可改变的 semantic/quality guarantee 与 contribution type；
3. 一个 counterfactual decision consequence；
4. 全历史五字段预检未命中 exact/terminal containment，且没有已知 direct fatal；
5. 一个 outcome-blind anchor question；该问题可由一份、最多两份具名公开一手来源，闭合或否定一个共同定义的 `carrier/action/estimand bundle`；
6. 关闭后的三种固定出口：`CLOSED_TO_EXACT_TYPED_RQ / EARLY_FATAL / UNRESOLVED_BACKLOG`。

不要求 exact final RQ 已冻结，也不按 carrier/action/estimand 的字段个数机械拒绝；要求的是这些字段必须由同一具名 anchor artifact 共同定义，不能靠跨对象拼接。

### Strong role ceiling

Strong closure 只可：读取预承诺来源，填入或否定 anchor bundle，列最明显 generic/current-union 反方，判断是否存在有限 witness/falsifier。它不得选择新 project、替换 anchor、改 object/guarantee/contribution type、查看结果补位、宣称新颖性/Q2、形成 raw/brief 或代替 Stage0。

### Canonical continuation

- `CLOSED_TO_EXACT_TYPED_RQ`：交回原 breadth lane，从 exact typed RQ 开始执行现行 Question Card、identity/current/source、raw 与 ownership bridge；strong 输出不自动录取。
- `EARLY_FATAL`：记录具名 subtractor，正常结束，不占用替换 slot。
- `UNRESOLVED_BACKLOG`：保留 backlog，不重试、不替换 packet。

### 验收与停止

1. 两个 packet 都必须有 pre-evidence hash、唯一 anchor question 和不可变出口。
2. 至少一个 packet闭合为 exact typed RQ，或提前形成具名 fatal，才算 source-closure 有信息增益。
3. 若仍为 0 eligible，或两个 packet 都只是复述输入/对象漂移/无法闭合，则停止 selective-depth 路由；下一周期回到届时 canonical profile。
4. raw、brief、Stage0 PASS 数只作描述，不设产出配额。

### 回滚

下一周期删除 assignment-local profile 即可；所有输出保持 immutable。不得删除历史材料、复活 STOP、重开 bounded identities 或改变 Source49/50/51 状态。
