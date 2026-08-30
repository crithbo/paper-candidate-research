# User Review Packet

## 得到什么

旧 blocker 要求的 8 个自然 GFX11 MIR 已经闭合：8 个不同源码目录、8 个完整 MIR、8/8 MachineVerifier、8/8 双重重放一致。

## 为什么可信

- LLVM commit、四个工具哈希、ROCm corpus commit、gfx1100/wave32 均未改变。
- 新增资源仅为官方 Alpine 的便携 C/C++ 头文件，所有下载都小于 4 MB，累计 9,466,511 B。
- 没有修改自然源码，没有裁剪 host 代码，没有用 synthetic 或 LLVM regression MIR 补数。

## 还没有做什么

没有运行候选、强基线、自然 corpus 比较、full-cost 科学观察或 Stage B。因此本结果不表示论文机制成立，也不形成 PASS/STOP。

## 用户是否需要动作

不需要资源动作。主线只需验收本包，并决定何时把原冻结 Stage A 科学运行重新投递给长期 candidate lane。

