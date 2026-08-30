# LLVM-DWARF-CALLSITE-RECONSTRUCTIBILITY User Review Packet

## 中文摘要

- 当前结论：`STOP`，仅停止这一个冻结机制/版本/语料下的 Stage A 路线；质量档为 `BELOW_Q2_STOP`。
- 最重要的证据和风险：30 个结果盲自然 sites 中只有 1 个真实原生正例；排除 12 个不可执行/不适用点后仍只有 1/18。两个分母的 p50 与 nearest-rank p90 都是 0。唯一正例的 native DWARF/unwind 与同 harness 行为 replay 通过，所以 STOP 不是否认正例，而是自然边界太稀疏。
- 建议用户选择：无需批准 Stage B；请允许主线按窄边界登记科学 STOP。
- 预计用户投入：无。

- Stage: `Stage A independent gate`
- Lane id: `STAGEA-GATE-REVIEW-LANE-1`
- Assignment id: `STAGEA-G1-20260815-LLVM-DWARF-CALLSITE-RECONSTRUCTIBILITY-RESUME2-CLOSING-V8.7`
- Decision: `STOP`
- Quality tier: `BELOW_Q2_STOP`
- Evidence ceiling: `STAGEA_DIRECTIONAL_RISK_PILOT_ONLY__FROZEN_LLVM_COMMIT_X86_64_SYSV_AND_30_SITE_COMPILER_RT_CORPUS__NO_GENERAL_IMPOSSIBILITY_CLAIM`
- Claim-bearing observation obtained: `yes`
- Scientific revision consumed: `no`
- Pending user Stage B review: `no`
- Stage B authorized: `false`
- Stage B user approval id: `null`

## What is established

- Owner manifest 独立复算 `60/60 PASS`。
- 结果盲冻结的 30-site 分母完整保留；自然结果与 freeze 的 index/input/function/bb/offset 逐行一致。
- 完整 paired subset 为 18 点；分布为 1 个正例、17 个零收益。
- 全 30 点为 1/30；两种分母的 reconstructibility gain p50/p90 均为 0。
- 唯一正例 site 02 增加 1 个 native reconstructible parameter 和 1 个 `DW_OP_breg3` call value；MachineVerifier、DWARF、unwind、disassembly 与同 harness 执行控制通过。
- Preclaim fidelity gate 在 accepted claim-bearing observations 前关闭；未发现看结果后选择自然点或更换机制。

## What is not established

- 没有证明 LLVM 或 DWARF call-site reconstructibility 一般不可能。
- 没有证明所有 compiler-rt、其他 target/ABI、其他 LLVM commit 或其他自然语料都没有收益。
- 3,072-arm current union 只在冻结 witness 上重放，不能声称它吸收了全部 30 个自然 sites 或唯一正例。
- 自然全集没有 native-cycle 性能证据；Blinkenlights wall time 仅是行为执行控制。
- 预登记没有给 `nontrivial boundary` 一个精确数值频率阈值；本裁决依赖 1/30、1/18、17/18 零收益和双分母 p50/p90=0 的联合证据，而不是事后发明阈值。

## Exact object and narrow claim boundary

对象限于 LLVM commit `e72ba6cf366a3180cbf5a8690d9e50665880ab76`、`x86_64-unknown-linux-gnu` SysV、`-O2 -g`、InstrRef/LiveDebugValues、冻结的 compiler-rt builtins 15-TU 来源与 30 个结果盲 call sites。候选仅是 bounded debug-critical call cut 上的 allocation-time value retention 加合法 CSR/CFI 计划。

## Decisive evidence or preclaim boundary

预登记 killer 是 `NATURAL_CORPUS_HAS_NO_NONTRIVIAL_BOUNDARY_AFTER_THE_GATE`。独立重算得到：

| Scope | Positive | p50 | p90 nearest rank |
|---|---:|---:|---:|
| All frozen sites | 1/30 | 0 | 0 |
| Executable paired sites | 1/18 | 0 | 0 |

由于 executable sensitivity analysis 仍是 17/18 零收益，11 个 writer failures 与 1 个 mapper mismatch 不构成 STOP 的假象。该自然边界不足以保持冻结 Q2 claim。

## Fair baseline and full-cost status

同 commit 的 3,072 个 current-union arms 在冻结 witness 上全部可执行且 reconstructible=0；它支持候选不是简单配置重放，但本 STOP 不声称自然全集被 union 吸收。Ledger 覆盖对象/代码/debug/unwind bytes 及 planner/writer/reader CPU/wall/RSS。未观测 native cycles 已明确留空，不作估算。

## Reproducibility and integrity

- Assignment SHA-256: `F6C0854A5616FFD72B183EBBB1FE40BC843CDCA67073DC193A8BD45018B12D7E`
- Owner manifest SHA-256: `75FB92A04BD42A678FC81560E22CED028378B61F3CA965B99D3EB508A5A14C90`
- Owner manifest verification: `60/60 PASS`
- Review actions: 只读 hash、JSON、脚本和静态证据复算；无网络、无新实验、无 owner 修改。
- Cross-assignment contamination: `false`

## User action requested, if any

- Why user action is needed: 不需要用户提供资源或授权。
- Minimum action: 无。
- Acceptable alternatives: 无；新对象、新语料或 importance-weighted rare-event claim 必须作为新研究问题，而不能在本冻结题内事后改写。
- Resume directory and frozen contract: 不适用；建议 STOP，不进入 resume 或 Stage B。

## Recommended next state

- `STOP`
- Lane after delivery: `IDLE_REUSABLE_AWAITING_MAINLINE`

This packet is a review aid. It does not authorize Stage B or a formal paper project.

