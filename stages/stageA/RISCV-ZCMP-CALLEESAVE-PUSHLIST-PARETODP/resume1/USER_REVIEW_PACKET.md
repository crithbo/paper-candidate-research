# 用户审阅包

## 得到什么

资源阻塞已完全解除，保真门也通过了。候选算法和 18 个当前 LLVM 配置都在同一 exact commit、同一 RV32IMAC+Zcmp 对象上真实运行；所有 83 个自然 pilot 原生管线点均通过验证、汇编、链接和读取。

owner 建议 `STOP`：在最终 4 个合格自然函数上，候选最佳代码大小/栈帧均被当前 union 原样匹配，候选还增加规划成本。有效 residual 为 `0/4=0%`，低于预登记 10% 门槛。这个判断是科学负证据，不是下载、工具或权限失败。

## 为什么可信

- 小 witness 的两种完整方案都通过 MachineVerifier 和 unwind 检查。
- 候选 DP 与独立小规模穷举在 `w=0..4` 完全一致。
- canonical 分母来自 official Embench-IoT 固定 commit：23 modules、273 functions；结果出来前按固定规则筛选。
- 11/11 candidate plans、72/72 union arms 全部原生可执行。
- p50/p90 代码与 frame 改善都是 0；candidate 规划后的 CPU、wall 均更高。

## 边界

这只否定本冻结候选在 bounded one-call scalar class 上的论文 residual，不否定 Zcmp 本身，也不外推到任意 CFG 或所有 RISC-V 程序。目标运行时未获可执行环境，因此没有测量 cycles/ns，也没有估算。

## 下一步与用户动作

不需要用户提供资源。请由主线投递独立 Stage A gate；只有独立 gate 可确认 `STOP` 并更新共享状态。Stage B 未授权，也不应启动。
