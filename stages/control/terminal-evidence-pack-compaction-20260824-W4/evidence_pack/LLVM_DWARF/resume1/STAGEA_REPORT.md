# LLVM-DWARF-CALLSITE-RECONSTRUCTIBILITY Stage A Resume1 Report

## 中文摘要

- 得到什么：成功恢复 exact LLVM commit 的 X86/Clang 工具链并通过原生 ELF/DWARF reader smoke。
- 为什么仍未进入科研实验：宿主没有冻结合同允许的 Linux SysV 执行 runner；Windows object 检查不能替代真实可执行行为。
- 当前结论：`BLOCKED_USER_ACTION_REQUIRED`，不是 PASS/STOP/REVISE。
- 证据上限：`RESOURCE_FAILURE_ONLY__NO_SCIENTIFIC_INFERENCE`。
- 下一步：新的 `resume2` 提供现成 Linux runner，或精确授权隔离 full-system QEMU+Linux image 路线。

- Lane: `CANDIDATE_EXECUTION_LANE_3`
- Assignment: `RESOURCE-STAGEA-L3-20260814-LLVM-DWARF-CALLSITE-RECONSTRUCTIBILITY-RESUME1`
- Decision: `BLOCKED_USER_ACTION_REQUIRED`
- Quality tier: upstream `TIER_B_Q2_VIABLE`, not re-adjudicated
- Novelty route: `N2`
- Claim-bearing observations: `0`
- Scientific revision consumed: `false`
- Stage B authorized: `false`

## Resource gate

Three of four predicates pass: exact commit/blob identity, registered X86, and native DWARF/object readers. The Linux SysV executable-behavior predicate fails closed. Full details and hashes are in `RESOURCE_ACQUISITION_LEDGER.yaml`, `BUILD_PROVENANCE.yaml` and `ENVIRONMENT_LOCK.yaml`.

## Pre-claim contract fidelity gate

- Gate status: `NOT_STARTED__RESOURCE_GATE_FIRST`
- Atomic-action mapping: not evaluated
- Comparator semantics/current union: not evaluated
- Native writer/reader parity for the frozen witness: not evaluated
- Common denominator/full cost: not evaluated
- Small witness legality/equivalence: not replayed
- Claim-bearing run started only after PASS: `false`; none started

The generic ELF/DWARF smoke is explicitly a non-claim resource control.

## Frozen scientific contract

Unchanged from `initial`: LLVM `e72ba6cf…`, x86_64 Linux SysV, `-O2 -g` instruction-reference-compatible LiveDebugValues, identical pre-RA MachineIR/value/call regmask, executable behavior, ABI, unwind and native DWARF reader contract. Candidate and strongest union were not run.

## Supported / unsupported

Supported only: exact public source identity, unmodified minimal build, X86 availability, native generic ELF/DWARF reader functionality, and absence of an authorized Linux runner on this host.

Unsupported: every scientific proposition about the RAX/RBX witness, current-union absorption, residual action coverage, the bounded Pareto DP, natural corpus, full-cost dominance or paper conclusion.

## Integrity and resource audit

- Source archive: 280,594,592 bytes, SHA-256 `643B7011…814C`.
- Decisive blob parity: 7/7.
- Build: 3137/3137, Release+assertions, X86 only, six required tools, no source patches.
- Native smoke: ELF64 x86-64 System V; opt/dwarfdump/readobj/objdump all exit 0.
- Storage before report sealing: 4,761,703,433 bytes (<12 GiB).
- Successful build wall: 2,284.686 s at `-j2`; exact aggregate CPU/RSS unavailable, not estimated; concurrency upper bound remains below 2 CPU-hours.
- Network asset bytes: 280,600,777 (<2 GiB).
- System installs/global environment changes: none.

## User action and resume

See `USER_BLOCKER_PACKET.md`. The lowest-risk unblock is an existing local Linux runner. If none exists, mainline/user must freeze a new `resume2` route for portable full-system QEMU plus a public, hashed Linux kernel/rootfs. Resume by verifying runner hashes and replaying the generic behavior/unwind smoke, then restart PRE_CLAIM. Do not reuse any scientific result because none exists.

## Mandatory Stage B boundary

Independent Stage A gate: not requested for scientific judgment; this is a resource blocker. `PENDING_USER_STAGEB_REVIEW=no`; `stageb_user_approval_id=null`; Stage B=false.
