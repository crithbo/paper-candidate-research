# LLVM-PPC-PREFIX-PRESSURE-PARETODP r3 blocker packet

## 中文摘要

- 卡在哪里：replay 1 的 F2 MIR 生成阶段；`llc` 在解析 assignment-local LLVM IR 时因全局变量修饰符顺序无效而退出 1。
- 已经完成什么：冻结输入接收、选择性源码提取，以及 replay 1 的 F1 汇编、typed relocation、反汇编、链接、链接后反汇编和 unwind 审计。
- 需要用户做的最小动作：无。需要 MAINLINE 接受此 blocker，并决定是否冻结一个新的 resume assignment；r3 不得覆盖或重试。
- 解阻后的第一步：在新目录把两个全局变量声明从 `hidden dso_local ... global` 机械改为合法的 `dso_local hidden ... global`，然后从新 assignment 的首次 planned replay 开始。
- 该阻塞是否包含科学负结论：否。

- Stage and assignment: `STAGEA_PRE_CLAIM_CONTRACT_FIDELITY_GATE_ONLY` / `STAGEA-L1-20260826-LLVM-PPC-R3-PRECLAIM-F1-F5`
- Status: `FAIL_CLOSED_PRECLAIM__NO_SCIENTIFIC_INFERENCE__NEW_MAINLINE_DISPOSITION_REQUIRED`
- Blocker kind: `ASSIGNMENT_LOCAL_INPUT_SYNTAX`
- Exact failure: `ppc_union_input.ll:3:27: error: expected 'global' or 'constant'`
- Claim-bearing observation obtained before failure: `no`
- Valid partial control evidence: one replay contains exactly two non-GOT `R_PPC64_PCREL34` relocations with addend zero, direct PLD, PADDI+LD, linked output, and `.eh_frame`; it is not F1 PASS because replay 2 never started.
- Claims supported so far: none.
- Claims/gates still unresolved: F1 replay equality; MachineVerifier; F3–F5.
- Evidence ceiling: `PRECLAIM_PARTIAL_CONTROL_AND_RESOURCE_FAILURE_ONLY__NO_SCIENTIFIC_INFERENCE`
- Scientific revision consumed: `no`

## Exact failure evidence

- Frozen resource root: `E:/project/writing/reserch/stages/stageA/LLVM-PPC-PREFIX-PRESSURE-PARETODP/r3/resources`
- Error log: `resources/logs/preclaim/replay1.llc.mir_emit.stderr.txt`, SHA-256 `8B479F2252427F503792CD3AC9382960413BBB9E7BB8A25AB2EA93046CE563D2`
- First-failure record: `resources/logs/preclaim/first_failure.json`, SHA-256 `E0F14B84FE0880D7F981971DC81BD25DCAEAA12FD7800D4FD4E32F3989A97ABF`
- Persisted bytes: 575,051,772; network bytes: 0; reparse entries: 0.
- Toolchain: exact r2 PPC package, manifest SHA-256 `39CF76C8DA10D645F26789C3FF1A4E3A47839C70DBDAC3D5A4AED73C6792094C`.

## Resume contract

- Frozen contract SHA-256: `F36E8CD40E719A9CFEEFBB595EEE05A4FDEEDF490C0ABD6AF40C09D635895E82`
- New resume directory required; never overwrite r3.
- No automatic retry, natural function/corpus, performance/full-cost claim comparison, Stage B, state transition, or owner cleanup.
- MAINLINE is the next authority; no user action is currently required.

