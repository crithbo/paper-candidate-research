# Rule Change Proposal

## Proposal identity

- `audit_id`: `RULE-AUDIT-20260827-R3-STAGEA-ONLY-IDENTITY-BLIND-CALIBRATION-P1`
- `proposal_id`: `R3_STAGEA_ONLY_IDENTITY_BLIND_CALIBRATION_P1`
- `decision_label`: `CLARIFY`
- `user_policy_approval_required`: `false` — 用户已明确授权这一次校准；MAINLINE 仍须执行 assignment-level freeze。
- `backtest_required`: `this proposal is the bounded backtest`

## Proposed minimum delta

不安装共享规则 patch。MAINLINE 仅可为这一校准创建一个新、隔离的 assignment，实施 `PROPOSED_ASSIGNMENT_CONTRACT.yaml`：fresh 12+4 Stage-A packet、fresh reviewer、blind-only bootstrap card、独立 AUDITOR gold comparison。

## Safety invariants

- Q2 minimum / Q1 priority：不改变。
- Same-object、latest collision、公平强基线、自然输入、full-cost、复现与 claim ceiling：生产规则不改变。
- STOP non-revival：不复活任何终态题。
- User StageB approval：保持；本 assignment 禁止 Stage B。

## State and compatibility migration

- Existing states affected：无。
- Existing assignments affected：R3 blind terminal 与 R3 nonblind fallback 都只读复用 immutable inputs，不改变其状态。
- One-time migration required：无。
- Rollback path：MAINLINE 不 freeze 或在任一预检失败时停止；没有共享状态回滚需求。

## Acceptance threshold

唯一成功定义是获得一份来自 clean reviewer 的 immutable 16-case Stage-A-only decision，并由独立 AUDITOR 完成 gold comparison。若 reviewer 污染、缺少 fresh reviewer、packet 含可搜索身份线索，盲臂失败关闭；不能用非盲结果补写 blind metric。
