# E 盘项目存储卫生 Dry-run

## 结论

- 新工作根：`<LOCAL_PROJECT_ROOT>`。
- 当前 `stages/`：`5,233,776,702 bytes / 77,104 files`。
- 当前 Stage A：`4,980,383,745 bytes / 63,151 files`。
- 根目录 `.tmp/`：0 bytes。
- 当前项目不是 Git repository：无 `.git/`、无 `.gitignore`，因此本项目不能直接采用 `git clean` 工作流。
- 未发现项目级 `node_modules/` 或 `.venv/`；常见依赖膨胀不是当前剩余空间的主因。
- 剩余大目录主要是非终态科研依赖：Parquet pending gate、RocksDB/AIGER reserve、S5/CVC5 blocked，不能按普通临时目录整批删除。
- 唯一清楚满足 inventory `SAFE_TO_DELETE_AFTER_ACCEPTED_HANDOFF` 且存在 pinned 同哈希副本的非零候选：5 个 transport JSON，共 `8,125,013 bytes`。

## 为什么没有直接删除

1. `RULE_AUDIT_SENTRY` 不是共享/候选 cleanup owner；现行权威仍指定 MAINLINE。
2. cleanup safety 要求确认无 active process；当前读取 `Win32_Process.CommandLine` 被系统拒绝，不能伪造 PASS。
3. E 盘 live authority 尚有旧 D 盘根路径，先删除再修权威会扩大恢复歧义。

因此本轮为精确 dry-run 和规则补丁提案：没有删除、移动、压缩或修改共享规则。

## E 盘迁移缺口

- `registry.yaml:4` 的 `project_root` 仍为 `<LEGACY_LOCAL_PROJECT_ROOT>`。
- `registry.yaml` 另有一个 live `workspace_root` 仍为 D 盘。
- `rules/RESOURCE_LOCALIZATION.md` 三处 containment/shared-asset root 仍固定 D 盘。
- `AGENTS.md` 仍写“系统缓存不承诺位于 D 盘”。
- `plan.md` 的 D 盘空闲量属于迁移前历史，应明确标注为历史，并增加 E 盘当前 baseline。
- `templates/HANDOFF.yaml` 仍默认 `cleanup_status: NOT_REQUESTED`。
- `rules/ARTIFACT_LIFECYCLE.md` 尚未安装。

## 建议动作顺序

1. MAINLINE 先在 E 盘安全 assignment 边界更新 live root authority 和 artifact lifecycle schemas。
2. 以 `DRY_RUN` mode 完成历史案例验证。
3. 对五个 JSON 重新检查 active process、literal path、hash/pinned twin、downstream references。
4. 通过后仅删除五个未 pinned 副本并更新原 inventory/cleanup receipt。
5. 新 assignment 才启用 automatic closeout GC；legacy 保持 separate approval。
