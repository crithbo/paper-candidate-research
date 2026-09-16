# STAGEA-GATE-REVIEW Progress

更新时间：2026-08-09（Asia/Shanghai）

## 当前状态

`WAITING_FOR_MAINLINE_FROZEN_HANDOFF`

协议初始化已经完成；当前队列为空。尚未接收任何由主线逐题发送的冻结 Stage A handoff，未预读任何未完成候选，也未运行实验、复算或 replay。

## 已完成

- 完整读取项目入口：`AGENTS.md`、`plan.md`、`registry.yaml`。
- 完整读取唯一角色规则：`rules\ROLE_STAGEA_REVIEW.md`。
- 完整读取通用独立审查模板：`templates\INDEPENDENT_REVIEW_REPORT.md`。
- 读取 `academic-research-suite` 根路由，并按本任务需要读取 reviewer、methodology review、source verification、experiment validation、reproducibility、hardware evidence 和 NPU/NDP evidence 边界。
- 建立 `REVIEW_PROTOCOL.md`，固化 Stage A 新语义、四类结论、证据/claim ceiling、复现边界和 Stage B 用户审批硬门。
- 建立 `REVIEW_QUEUE.yaml`；未把 `registry.yaml` 中的活跃候选自动视为已排队题目。

## 不可越权事项

- 不修改候选 Stage A 原件、上游材料、主控文件或其他目录。
- 不替候选补实验，不联系候选负责人，不自行创建新正证据。
- 独立 PASS 只可建议主线登记 `PENDING_USER_STAGEB_REVIEW`。
- 在用户逐题查阅并由主线记录非空 `stageb_user_approval_id` 前，不得启动 Stage B。

## 下一步

等待主线逐题发送已完成且冻结的 Stage A handoff。收到后先执行路径、哈希、对象一致性和授权边界的只读 intake，再在本 review 根下创建该题的独立审查记录。
