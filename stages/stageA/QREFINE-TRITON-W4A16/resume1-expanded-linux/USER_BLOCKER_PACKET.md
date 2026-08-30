# QREFINE-TRITON-W4A16 User Blocker Packet

## 中文摘要

- 卡在哪里：本机没有合同允许的现有或便携 Linux executor。
- 已完成什么：initial 30/30 manifest 复核通过；只读检查了 WSL、Docker/Podman、QEMU/proot、便携根和 initial 资源。
- 用户最小动作：提供已可运行的 Linux executor，或另行明确批准安装/启用 WSL 与所需虚拟化组件。
- 解阻后的第一步：在新的 resume 目录只读验证 executor，再下载冻结 LLVM；不能覆盖本目录。
- 科学负结论：无。

- Status: `BLOCKED_USER_ACTION_REQUIRED`
- Blocker kind: `TOOLCHAIN / SYSTEM_AUTHORITY`
- Exact failure: WSL status exit 50 says WSL is not installed; no allowed container or portable executor exists.
- Claim-bearing observation before failure: no.
- Evidence ceiling: `RESOURCE_FAILURE_ONLY__NO_SCIENTIFIC_INFERENCE`.
- Scientific revision consumed: no.

## Exact resource needed

- An already usable Linux x86_64 executor capable of running the official CPython 3.12 manylinux Triton wheel and exact official LLVM package without system/global modification.
- Accepted forms under a new assignment: an already enabled WSL distribution; an already installed working Docker/Podman Linux-container executor; or an assignment-local portable Linux executor with public provenance and no system changes.
- After executor proof: official Triton 3.7.1 CPython 3.12 x86_64 manylinux wheel (197,719,725 B), official LLVM `llvm-1f126a6d-ubuntu-x64-1.tar.gz` (356,721,745 B), and one official compatible Z3 or cvc5 binary.
- Frozen source identities: Triton commit `f797708c0626e5f9840ca5b0a98790e2c7cb09ad`, LLVM `1f126a6dea50d185c0781743a667390037ae88bd`.

## Minimum user action

Provide one allowed executor already in working state, or issue a separate explicit authorization naming the system changes permitted. Installing/enabling WSL or VirtualMachinePlatform, Docker/Hyper-V, drivers, registry/global environment changes, and reboot were not authorized here and were not attempted.

## Resume contract

- Frozen assignment SHA-256: `F0684E81787E1037125125850630DC96C24D34DE3532A39A860D37BE7E4C26C4`.
- New immutable resume directory required.
- First action: repeat the read-only executor proof and record version/runtime capability.
- Only after PASS: retrieve exact LLVM/Triton/solver within the expanded envelope, then rerun PRE_CLAIM gate before any mutant.

## Cost

- Network/download: 0 B.
- Project resource storage: 0 B.
- CPU/GPU experiments: none.
- System changes: none.
