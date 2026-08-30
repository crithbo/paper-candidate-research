## Material Passport

- Assignment: `STAGEA-L1-20260830-LLVM-APX-R12-A0-PRODUCTION-RESUME`
- Topic: `LLVM-APX-PREFIX-PRESSURE-PARETODP`
- Evidence class: Stage A decisive pilot
- Verification status: `EXECUTED_ONCE__RAW_PRESERVED__PENDING_INDEPENDENT_GATE`
- Exceptional revision: user-approved `1/1`, consumed; no second revision permitted

# APX R12 A1 Stage A report

## 得到什么

冻结的 4 个输入各执行两次 replay，共 8 行、每行 9 条命令。唯一 controller attempt 完成了 72/72 条命令，0 retry、0 backfill、0 timeout、0 hash/version drift。S04 的 exact-hash exceptional feature 使其 `prepare/current/tuning` 三步完整执行；所有 raw stdout、stderr、MIR、JSON receipt 与 controller ledger 均保留。

8/8 行的 candidate、labeled、generic 与 independent micro-oracle frontier 完全相同，8/8 legality/checker PASS，native current/tuning arms 均保持分离。S01、S03 的 4 个 replay 有 native action；S02、S04 的 4 个 replay 是显式 no-action identity，未计为 candidate gain。四个输入的 prepared/current/tuning MIR、action options 和 candidate frontier 在两次 replay 间一致。

## Directional full-cost

Controller 从 72 个 child process 与文件系统 receipt 实测：CPU 合计 11.125 s、wall 合计 14.540901 s、peak RSS 22,056,960 bytes、declared input 2,848,026 bytes、output 94,124 bytes；这些数不含 controller 自身开销。

在相同 frontier 下，candidate 相对 labeled、generic、micro-oracle 的 aggregate wall delta 分别为 +0.017376 s、+0.047298 s、+0.037891 s；逐行 wall 更低分别仅为 2/8、2/8、3/8。CPU delta 方向混合。因此冻结分母内没有一致的 candidate full-cost 优势，且不能把 no-action identity 当作收益。

## Owner interpretation

证据支持一个决定性负向 Stage A 建议：当前强基线在 8/8 行吸收 candidate 的 frontier，且 full-cost 未显示一致优势。它不支持 candidate advantage、Q2/Q1 潜力确认或 Stage B 进入。

正式状态转换仍只由 MAINLINE 在独立 Stage A gate 后作出。本 owner 不提出第二 revision，不修改输入、动作、强基线或 72-command 分母，也不执行 cleanup 或 Stage B。
