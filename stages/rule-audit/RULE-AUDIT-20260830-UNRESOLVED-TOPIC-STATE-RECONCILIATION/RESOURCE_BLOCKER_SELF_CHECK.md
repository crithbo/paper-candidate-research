# 暂停课题资源与解除条件自查

## 本机实际条件

- Windows：RTX 4070 Laptop、驱动 591.74、8 GiB 显存可用。
- WSL2：Ubuntu 24.04 正在运行；WSL 内可以识别 RTX 4070。
- Windows 缺少：Visual Studio C++/MSBuild/Windows SDK、CMake、Ninja、CUDA Toolkit、ADB。
- WSL 缺少：gcc/g++、CMake、Ninja、CUDA Toolkit、cuDNN、Yosys、ABC；只有 Python 3 和 WSL GPU driver bridge。
- E 盘空闲约 1.03 TiB。

因此 WSL/GPU 基础设施已部分具备，但没有形成可直接运行编译器、ChampSim、vLLM、ORT CUDA 或 AIGER 的完整执行栈。

## 最值得优先解除的项目

1. **S5 Occupancy**：已经没有资源 blocker，可直接重新排 Stage A，同一冻结合同继续。
2. **QRefine**：旧记录中的“等待重启”已经过时；WSL2/Ubuntu 已运行。下一步应是 post-restart resume，随后补齐 exact Triton/CUDA/Linux 工具栈。
3. **LeRobot**：磁盘足够，只缺用户批准的 2 GiB 网络、4 GiB 存储和一次 A0 correction；成功概率较高。
4. **ORT EP stability**：GPU/驱动存在，但缺 CUDA 12/cuDNN 9 运行库，特别是 `cublasLt64_12.dll`。批准 assignment-local 4 GiB runtime 路线即可继续。
5. **CauseCase / vLLM CUDA-Graph**：WSL GPU 已可见，但仍缺 Linux 编译/CUDA/vLLM/ChampSim 工具与题目级合同。它们不再是“没有 WSL”，而是“WSL 执行栈未配置”。

## 不应当按资源问题处理

RocksDB、PPC、RVV、VHLO、TorchDynamo，以及 S4-SLO、GIN、KALLSYMS、AArch64，主要是普通 correction/revision 已耗尽或实验合同无效。给更多磁盘、GPU 或下载额度不能解除；必须有题目级 exceptional revision/budget，或新 ID 重新进入 Discovery/Stage0。

完整逐题解除条件见同目录 `RESOURCE_BLOCKER_SELF_CHECK.yaml`。

