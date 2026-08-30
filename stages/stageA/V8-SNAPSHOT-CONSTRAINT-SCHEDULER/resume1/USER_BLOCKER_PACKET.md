# V8 Stage A 限速恢复：当前用户阻塞

## 已获得的授权

用户已批准采用并行友好的限速方案：最多 8 个逻辑处理器、低优先级、D 盘工作区峰值不超过 120 GiB，并在可用内存低于 12 GiB或 D 盘可用空间低于 150 GiB 时暂停/停止。该授权不包括系统安装、注册表、全局 PATH、驱动或 Stage B。

## 当前阻塞

只读核查未找到 `cl.exe`、`link.exe`、`msbuild.exe`、`vswhere.exe`、`gn.exe`、`ninja.exe` 或 PATH 中的 `python.exe`。因此不能在保持 exact Windows x64 对象的前提下构建 V8 commit `c635f0d160b6e988b5ea5a907511a2929beb5d5e`。

在该工具链缺口解除前不会开始 35 GiB 级源码/DEPS 获取，避免产生无法使用的大型资源。

## 最低用户动作

三选一：

1. 提供现有且许可合适的 Visual Studio C++/MFC/ATL、Windows SDK/Debugging Tools 和 MSBuild 环境；
2. 单独明确授权安装所需的 Visual Studio Build Tools 与 SDK 组件；
3. 提供 exact commit 的 candidate-capable 包，包含完整 source/DEPS、可重建对象或符号、`d8.exe`、`mksnapshot.exe`、`cctest.exe`、`snapshot_blob.bin`、有效 GN args、工具版本、哈希、许可证和 notices。

解阻后的第一步仍只是工具链和资源本地化 preflight；通过后才允许下载、构建和 PRE_CLAIM gate。当前没有科学负结论，也没有消耗科学修订次数。

