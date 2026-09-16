# 全会话重开 bootstrap P0 实施报告

## 结论

已按用户直接授权在本会话实施，不再等待主线转交。项目现在具备统一冷启动链：

`AGENTS.md → plan.md 当前 lane 看板 → ASSIGNMENT_CONTEXT.yaml → 角色规则 → 必要 skill/templates → 最小上游材料 → BOOTSTRAP_ACK.yaml`

旧任务只能在新任务 ack 被接受后归档。registry slice 仍为 `DUAL_READ_SHADOW`，没有提前切换 production，也没有改变科学门、候选状态或既有 assignment 裁决。

## 已实施

1. `AGENTS.md`：压缩成明确角色路由和全会话重开协议；显式列出各 lane 的规则与必需 skill。
2. `plan.md`：增加当前 lane/重启看板，区分 QRefine 重启 blocker、QNN 资源 blocker、空闲 review lane 与未授权 Stage B/正式项目。
3. `registry.yaml` 与 `history.md`：登记 bootstrap P0、双读 shadow、ack 后归档、正式项目双模式和硬件 Stage B skill 门。
4. 所有九个 live 角色规则：统一接入 assignment context、bootstrap ack 与资源入口；普通分支仍双读本题 registry 记录。
5. 正式项目：拆为 `FORMAL_PROJECT_OWNER` 与 `INDEPENDENT_MANUSCRIPT_REVIEW`，补齐 academic suite 路由、模板映射和状态链。
6. Stage B：补齐 `STAGEB_WORK_BREAKDOWN.yaml`、`ENVIRONMENT_LOCK.yaml`、`AUTONOMOUS_RECOVERY_LEDGER.yaml`、`RUN_INDEX.yaml`，并扩展 claim matrix。
7. `$hardware-stageb-runner`：改为强制 exact assignment write directory，题目根目录 fail closed；mainline 预先冻结 context+合同、ack 获接受后，初始化器才从 workspace templates 补其余 ledger 和八个本地化资源子目录，不再自行生成权限工件或以 `TASK_CONTRACT.yaml` 冒充权威合同。

## 未改变

- Q1/Q2、same-object、latest/current collision、公平强基线、自然/canonical 证据、full-cost、可复现性与 claim ceiling；
- revision、STOP、Stage B/正式项目逐题用户门；
- 任何候选的科学状态、证据或 assignment 冻结裁决；
- Discovery、Stage 0/A/B 的容量、模型、预算或调度。

## 后续使用

真正重开任务时，先按当时 plan/registry 生成逐 lane context；新任务只做读取和 ack，ack 被接受后再归档旧任务并授权开始。不要提前生成长期有效的 context，因为它会在当前状态变化后变陈旧。

active role/template 的进一步文字压缩仍须先做 actionability-equivalence replay；本次没有用“精简”名义删除拒绝条件或 mandatory fields。
