# COUPLED-AGENT-SDK-REPLAY-REV0 身份冻结

本包只固定新研究对象，不判断碰撞、新颖性、质量或 Stage 0。

- 新 Topic ID 不复活 `COUPLED-AGENT-REPLAY-REV0`。旧 ID 的 Canvas 对象已经结构性淘汰；这里改为官方 `OpenHands/software-agent-sdk`，这是 OpenHands Agent、工具、工作区和 Agent Server 的源码仓库。
- 按预先登记的官方 GitHub API 路线一次解析 `main`，固定 commit `ddac55697c5d15cf8a34495b5ed6d46c86db092a`、tree `ee9887e03ede5fb4b8fba7c6f65f228afe99c51f`。
- 模型、数据集、16 个任务和 I1 干预都原样复用此前清洁的预证据冻结，未按 Canvas 淘汰结果改动载体或样本。
- 仅下载两份官方 GitHub 元数据，共 2,851 bytes；未下载源码、模型、容器、任务镜像，未运行 Agent、benchmark 或实验，未安装软件或修改系统环境。

后续审查不得改变这里的 commit、模型、数据集、16 个任务、边界、I0/I1、解码或吸收终止语义。

