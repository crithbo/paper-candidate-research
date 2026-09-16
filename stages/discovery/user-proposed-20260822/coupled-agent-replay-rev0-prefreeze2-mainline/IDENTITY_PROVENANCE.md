# COUPLED-AGENT-REPLAY-REV0 身份冻结来源记录

本包只固定研究对象，不判断新颖性、论文质量或是否进入 Stage 0。

- OpenHands：按预先登记的官方 GitHub `refs/heads/main` API 只解析一次，得到 commit `4bf8dd3aaf1217916b2ce8a6f9168fa7633a26f8`、tree `2d8abc2cd08afe0fe80ebaa31c8f31892e20a4fe`。先前官方网页显示的 `ab23be62...` 在 API 请求前已前进；按冻结选择器，以 API 返回值为准，只记版本漂移，不作科学推断。
- 模型：Hugging Face 官方元数据固定 `Qwen/Qwen2.5-Coder-7B-Instruct@c03e6d358207e414f1eca0bb1891e29f1db0e242`，许可证 `Apache-2.0`，架构 `Qwen2ForCausalLM`。本轮未下载权重。
- 数据集：Hugging Face 官方元数据固定 `princeton-nlp/SWE-bench_Verified@c104f840cc67f8b6eec6f759ebc8b2693d585d4a`。固定 Parquet 为 2,096,679 bytes，SHA256 `A45B1FE4E2F0C8390B2B2938AC83E92ED5979000856808F3679C07812E9E6DCD`。
- 任务选择：先冻结“test split 的 `instance_id` 按 Unicode code point 升序、取前 16、不得替换或按结果过滤”，再读取 500 行。因本地 Python 无 Parquet reader 且禁止安装软件，使用同一官方数据集查看接口并显式带上固定 revision；得到 500/500 唯一 ID。此前未带 revision 的五页响应与固定 revision 五页逐字节同哈希，仅保留为传输遥测。
- 处理环境：只使用 Codex 随附的 Node 运行时进行 HTTPS 获取和 JSON 解析；没有安装软件、修改系统或用户环境、下载模型/源码/容器、运行 Agent 或 benchmark。

本包封存后，任何碰撞、基线或机制审查都必须把这些身份、16 个任务、状态边界、I0/I1 文本和解码配置视为不可变输入。

