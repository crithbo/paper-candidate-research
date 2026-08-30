# LLVM-APX-PREFIX-PRESSURE-PARETODP A4 Stage A Preclaim Report

## 中文摘要

- A4 按唯一绝对路径 RoboCopy 完成资源复制：8,183 files、512,139,455 bytes、0 reparse，未重试。
- 无 PYTHONPYCACHEPREFIX、`PYTHONDONTWRITEBYTECODE=1`、`-B` 的静态编译一次通过；复制时既有的 A2 `.pyc` 保持不变，本次未产生字节码。
- C4 tiny 独立 oracle 与 preclaim、C5 结果无关的 16 selected + 4 reserve 冻结、C6 未执行的 32-row R8 plan 均通过；C3/C4 formal 未重跑。
- 本交付仅是 preclaim 方法/资源控制证据，不支持自然、性能、full-cost 或论文 claim，也不作科学 PASS/STOP 判断。
- A3 资源复制 blocker 与原始证据已保存在 `preserved_a3/`；不执行 cleanup、Stage B 或共享状态转换。

- Lane id: `CANDIDATE_EXECUTION_LANE_3`
- Assignment id: `STAGEA-L3-20260829-LLVM-APX-R7C-A4-EXPLICIT-RESOURCE-COPY`
- Decision: `PASS_PRECLAIM_CONTROLS_ONLY__AWAITING_MAINLINE_ACCEPTANCE`
- Evidence ceiling: `PRECLAIM_METHOD_CONTROL_ONLY__NO_NATURAL_PERFORMANCE_OR_CLAIM_EVIDENCE`
- Claim-bearing run started: `false`
- Selected/reserve tool invocations: `0`
- Stage B authorized: `false`
