# E 盘路径迁移与文件卫生规则补足提案

Status: `PROPOSAL_ONLY__NOT_APPLIED`

## A. 必须先修复的 live authority

只修改 live authority，不改写 `history.md` 和 `rules/_archive/` 中的历史字节：

1. `registry.yaml`
   - `project_root: <LOCAL_PROJECT_ROOT>`
   - live `workspace_root: <LOCAL_PROJECT_ROOT>`
2. `rules/RESOURCE_LOCALIZATION.md`
   - containment root 改为 `<LOCAL_PROJECT_ROOT>`
   - shared asset root 改为 `<LOCAL_PROJECT_ROOT>\projects\_assets\<asset_id>`
3. `AGENTS.md`
   - “不承诺位于 D 盘”改为“不承诺位于 E 盘”；
   - 新增 artifact lifecycle 路由和文件增长规则。
4. `plan.md`
   - 迁移前 D 盘 free-space 数值明确标为 historical；
   - 增加当前 E 盘 root、stages bytes/files baseline 和迁移状态。

## B. 新增 `rules/ARTIFACT_LIFECYCLE.md`

采用已获用户批准的 `PHASE_CLOSEOUT_STORAGE_LIFECYCLE_V1`：

- `OFF / DRY_RUN / PRODUCTION` mode；
- 每个 persisted entry 必须有 retention class、downstream consumer、reacquire route；
- handoff 后封存 phase capsule；
- STOP 封存 minimal terminal evidence capsule，不是 report-only；
- build/cache/tmp 和可重取 source/toolchain 在 gate 后清理；
- blocked/reserve/pending 使用 resume capsule；
- cleanup failure 为 `STORAGE_GC_BLOCKED__NO_SCIENTIFIC_INFERENCE`；
- legacy 独立迁移，不能自动删除。

## C. AGENTS.md 文件增长规则

建议加入：

```markdown
## 文件与存储生命周期

- 项目根为 `<LOCAL_PROJECT_ROOT>`；不得继续创建或登记 D 盘项目路径。
- assignment 临时、缓存、构建和日志只能写入 `<唯一写目录>/resources/{tmp,cache,build,logs}`；主线机械任务在 assignment 冻结前只能使用 `.tmp/<task-id>/`。
- 不得在项目根散落调试文件、中间结果或路径拼接失败文件。
- 可覆盖的中间结果不得按步骤复制为新目录；resume 只保存新增证据和必要恢复包。
- 预计超过 10,000 条记录或 10,000 个小文件时，必须改用 SQLite、Parquet、NDJSON 或压缩归档；不得默认每条记录一个文件。
- handoff 前必须报告新增文件数、逻辑字节、retained bytes、safe-delete bytes、cleanup owner 和恢复方式。
- 完成阶段后执行 `PHASE_CLOSEOUT_STORAGE_LIFECYCLE_V1`；未分类 persisted entry 不得关闭 assignment。
- 未经权限和精确目标确认，不得删除源码、原始/不可再生数据、数据库、上传材料、`.env`、claim-critical evidence 或 resume-critical resources。
- destructive cleanup 必须先 dry-run，并验证 literal path、workspace containment、reparse、active process、inventory 与 downstream consumers。
```

## D. 模板接线

- `templates/RESOURCE_INVENTORY.yaml`：增加 `retention_class`、`downstream_consumers`、`reacquirable`、`delete_after_gate`、`post_close_retained_bytes_max`。
- `templates/HANDOFF.yaml`：`cleanup_status` 不再默认 `NOT_REQUESTED`，改为 required lifecycle state。
- 新增：`PHASE_CLOSEOUT_RETENTION.yaml`、`TERMINAL_EVIDENCE_CAPSULE.yaml`、`CLEANUP_RECEIPT.yaml`。

## E. Worktree 边界

当前 E 盘项目不是 Git repository，项目内没有 Codex-managed worktree。Codex worktree 应由应用 Settings > Worktrees 管理，不纳入项目资源 inventory。项目规则只要求：

- 不把 `$CODEX_HOME/worktrees` 复制进项目；
- worktree 内不得各自持久化未受控的依赖副本到项目目录；
- 永久 worktree 的清理由用户在 Codex 设置/任务归档边界管理。

## F. 上线顺序

1. MAINLINE 修复 E live roots；
2. 安装 lifecycle schema，mode=`DRY_RUN`；
3. 运行已批准的五类历史案例验证；
4. 验收通过后 `PRODUCTION_NEW_ASSIGNMENTS_ONLY`；
5. legacy cleanup 保持 separate exact approval。

