# LLVM-DWARF-CALLSITE-RECONSTRUCTIBILITY User Blocker Packet

## 中文摘要

- 卡在哪里：exact LLVM/X86/reader 已在 `resume1` 成功构建并通过非科研 smoke；唯一缺少的是不需要系统安装或全局改动的真实 Linux SysV 可执行行为 runner。
- 已经完成什么：官方 commit/archive/license/decisive blobs 核对、最小 X86+Clang assertions build、六个工具哈希、ELF64/DWARF/reader/opt smoke。
- 需要用户做的最小动作：在新的 `resume2` 提供一个已存在、可哈希且可运行 x86_64 Linux ELF 的本地 WSL/container/VM runner；或者精确授权“便携 full-system QEMU + 冻结 Linux kernel/rootfs”新路线。
- 解阻后的第一步：只读核对 runner/kernel/rootfs 哈希，运行现有 `reader_smoke` 可执行行为与 unwind smoke，然后重新从 PRE_CLAIM 开始。
- 该阻塞是否包含科学负结论：否。

- Stage/assignment: Stage A / `RESOURCE-STAGEA-L3-20260814-LLVM-DWARF-CALLSITE-RECONSTRUCTIBILITY-RESUME1`
- Status: `BLOCKED_USER_ACTION_REQUIRED`
- Blocker kind: `TARGET_EXECUTION_ENVIRONMENT`
- Exact failure: resource gate predicate `LINUX_SYSV_EXECUTABLE_BEHAVIOR_ROUTE_WORKS` is false.
- Claim-bearing observation obtained before failure: `no`
- Scientific inference allowed: `none`
- Evidence ceiling: `RESOURCE_FAILURE_ONLY__NO_SCIENTIFIC_INFERENCE`
- Scientific revision consumed: `no`
- Immutable resume directory after handoff: `stages\stageA\LLVM-DWARF-CALLSITE-RECONSTRUCTIBILITY\resume1`

## Exact missing resource

Required capability: execute and observe an `x86_64-unknown-linux-gnu` ELF under a real Linux syscall/ABI environment, including return behavior and unwind/CFI observation, without changing the frozen commit, target, object or guarantee.

Accepted forms for a new assignment:

1. An already installed and running WSL distribution or local Linux container, with no new registration/system change.
2. A portable local Linux VM/runner whose executable, kernel and root filesystem hashes and licenses are frozen.
3. A newly authorized isolated full-system QEMU route, with a verified public Windows binary, frozen Linux kernel/rootfs, bounded bytes/attempts and no host installation.

Object-only inspection, Windows execution of PE/COFF, qemu-user on a Windows syscall host, remote execution and a different LLVM commit are not acceptable substitutes.

## Routes exhausted

| Route | Attempt | Result |
|---|---:|---|
| Local exact asset / runner recheck | 1/1 | no exact tool and no WSL/container/QEMU-user; exact tool later built |
| Official exact source/minimal X86 build | 2/2 transport attempts | first API request hit sandbox TLS exit 35; approved retry and official archive/build succeeded |
| Portable Linux execution | 2/2 | existing runner absent; official qemu-user contract cannot supply Linux syscalls on Windows |
| Exact portable prebuilt fallback | 0/2 | not attempted because exact toolchain is already successful and a prebuilt cannot create the missing runner |

No approved route remains that can satisfy the missing predicate. Full-system QEMU is outside the frozen allowed forms and requires a new exact authorization, not an automatic retry.

## Resume contract

- Frozen scientific object/commit/target/guarantee remain unchanged.
- New write directory: `stages\stageA\LLVM-DWARF-CALLSITE-RECONSTRUCTIBILITY\resume2`.
- Reuse the immutable exact build in `resume1/build/bin`; verify hashes from `BUILD_PROVENANCE.yaml` before use.
- First scientific action remains PRE_CLAIM only after the Linux resource smoke passes.
- Stage B remains unauthorized.
