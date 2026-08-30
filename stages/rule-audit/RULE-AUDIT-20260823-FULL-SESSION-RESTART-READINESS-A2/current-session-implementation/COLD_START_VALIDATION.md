# 冷启动与 Stage B 最小验证

## 结果

- 必需入口/角色/skill/template 文件：`22/22 PASS`。
- 非主线角色的 `ASSIGNMENT_CONTEXT.yaml` + `BOOTSTRAP_ACK.yaml` 覆盖：`8/8 PASS`；九个 live 角色均有资源本地化入口。
- P0 context/ack 必需字段（source assignment、revision/pivot、terminal/current digest、STOP non-revival、mainline fallback、old-chat independence、contamination 与 READY/REFUSE）：PASS。
- Stage B canonical templates：`6/6 PASS`。
- 新增 YAML 模板：9 份通过标准库级无 tab、偶数缩进、mapping/list shape 检查。
- hardware initializer：Python AST 解析通过。
- hardware skill：官方 quick validator 因当前只读 Python runtime 缺少 PyYAML 而不可运行；未安装依赖，改用等价的标准库 frontmatter/name/description/TODO 检查，结果 PASS。
- 合法目录 `stages/stageB/DRYRUN-TOPIC/DRYRUN-ASSIGNMENT-1`：dry-run PASS，未写文件。
- 非法题目根 `stages/stageB/DRYRUN-TOPIC`：返回 `AUTHORIZATION_REFUSAL__WRITE_DIRECTORY_MUST_BE_ASSIGNMENT_BELOW_TOPIC_ROOT`，PASS。
- 合法目录但缺 mainline 预置 context/合同/已接受 ack：返回 `AUTHORIZATION_REFUSAL__MISSING_PREEXISTING_AUTHORITY_FILES`，且没有创建目录，PASS。

## 验收边界

本次验证确认启动链、文件存在性、角色覆盖、模板 shape 和初始化写边界。没有运行科研检索、queue、下载、构建、实验或候选状态转换。context slice 尚未做真实多 lane full-registry 对照回放，因此保持 `DUAL_READ_SHADOW`；该限制是有意的 fail-closed 边界。
