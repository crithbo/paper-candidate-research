# User Approval Directive

- `audit_id`: `RULE-AUDIT-20260811-STAGEB-AUTONOMOUS-EXECUTION-R1`
- `approval_date`: `2026-08-11`
- `policy_authority`: `USER`
- `approval_status`: `APPROVED_FOR_MAINLINE_APPLICATION`

## 用户原文

> 好的，先把这些规则写入文件。

## 获批政策范围

该批准承接紧邻上一轮完整 Stage B 建议，允许主线在安全 assignment 边界把以下政策写入共享规则与模板：

1. Stage B 采用 `B0–B6` 冻结执行状态机；
2. 每题一个长期候选执行 lane，父会话唯一写 canonical 工件，最多三个一层子代理在隔离目录内切分机制、基线/评测、重放/审计；
3. 每个逐题 Stage B 批准包同时冻结资源预算、kill-gate 顺序和 `AUTONOMOUS_RECOVERY_ENVELOPE`，范围内 agent 先自主恢复，耗尽后才请求用户；
4. 区分 `ENGINEERING_CORRECTION_IN_CONTRACT` 与 `SCIENTIFIC_REVISION`；冻结合同内工程纠错不消费 scientific revision，但所有受影响结果必须失效并重跑；
5. claim-bearing observation 之后的资源阻塞仍可进入 `BLOCKED_USER_ACTION_REQUIRED`，但必须保留部分有效证据、未闭合 claim 和精确恢复点，不得由资源失败推断科学 STOP；
6. Stage B 默认只运行一个顶层题目；仅当两题均逐题获批、资源互不冲突且有两个独立执行 lane 时可 burst 到两个；
7. 增加 Stage B 执行合同、work breakdown、环境锁、恢复 ledger、claim-evidence matrix 和 run index 等强制工件；
8. Stage B 独立 reviewer 检查实际执行轨迹、失效结果隔离、修复分类和可重放性，但不得修候选或生成唯一正结果。

## 明确未批准

本 generic 规则批准不等于批准任何具体题目的 Stage B。尤其不构成 `S6-JS-PREFIXBOUND` 的 `stageb_user_approval_id`，也不授权实验、下载、设备占用、系统级安装、正式项目、大规模论文实验或外部通信。每题 Stage B 与正式项目仍需现行逐题用户门。

## 单写者执行

用户批准不会改变 `SHARED_FILE_WRITER=MAINLINE`。本审计 lane 只生成 implementation-ready patch；共享文件由主线核对冻结哈希后应用。

