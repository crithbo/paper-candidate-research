# 用户批准：六路 Discovery 直接并行

- approval_id: `DISCOVERY-SIX-LANES-DIRECT-20260811`
- approved_at: `2026-08-11T00:57:00+08:00`
- authority: `USER_EXPLICIT_OVERRIDE`
- exact_user_instruction: `discovery直接并行六个吧，不用轮转了`

## 权威解释

1. 现有六个长期来源任务 `S1`–`S6` 同时保持 active，不再以两个热槽做 least-recently-served 轮转。
2. 只复用现有长期任务；不得创建逐题 Discovery 任务，也不增加第七个生产 Discovery 来源。
3. 六路必须冻结不同 assignment、唯一写目录和去重边界；同一候选仍只能由一个来源提交 canonical brief。
4. 当前 `DISCOVERY_QUALITY_MODE=OFF`、v8.7+R5-P0 科学裁决、same-object、最新碰撞、公平强基线、自然对象、full-cost、可复现性与证据诚实性保持不变。
5. 本批准只覆盖调度并发，不批准 R7/v8.8 production cutover、Stage B、实验、自动化、共享 writer 或终态 STOP 复活。
6. 已经运行的 S2/S4 assignment 保持其冻结规则；S1/S3/S5/S6 从下一安全 assignment 边界接受新冻结包。
7. 完成的 brief 继续复用长期 Stage0、candidate owner 与 StageA gate lane；不得因为六路 Discovery 而延迟已完成科学 handoff 的机械验收。

## 并发边界

- `DISCOVERY_ACTIVE_SOURCE_LANES=6`
- `DISCOVERY_PER_STAGE_MAXIMUM=6`
- `DISCOVERY_ROTATION=DISABLED_BY_USER`
- `NEW_PER_TOPIC_THREAD=false`
- `SHARED_FILE_WRITER=MAINLINE_ONLY`
- 回测仍为同 packet `PACKER -> EXECUTOR -> AUDITOR` 严格串行。
