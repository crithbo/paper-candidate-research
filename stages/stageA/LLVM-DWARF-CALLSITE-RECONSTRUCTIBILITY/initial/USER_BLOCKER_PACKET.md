# LLVM-DWARF-CALLSITE-RECONSTRUCTIBILITY User Blocker Packet

## 中文摘要

- 卡在哪里：本地没有绑定冻结 LLVM commit `e72ba6cf…`、带 X86 后端且含原生 DWARF/object reader 的可验证 toolchain，也没有现成的 Linux 目标执行环境。
- 已经完成什么：控制与 8 个上游输入哈希核对、完整合同冻结、本地资产/版本/target/源码盘点、full-cost 分母预登记；没有运行 witness。
- 需要用户做的最小动作：通过主线新建 `resume1` assignment，提供一个有 commit/build provenance 的 exact-commit X86 toolchain 和可验证 Linux executable 行为的本地路线；或明确授权在 `resume1` 内获取/构建等价资产。
- 解阻后的第一步：只读核对 tool version/commit、binary hashes、registered X86 target、reader 可执行性和 Linux route，然后重新从 PRE_CLAIM gate 开始。
- 该阻塞是否包含科学负结论：否。

- Stage and assignment: Stage A / `STAGEA-L3-20260814-LLVM-DWARF-CALLSITE-RECONSTRUCTIBILITY-INITIAL-V8.7`
- Status: `BLOCKED_USER_ACTION_REQUIRED`
- Blocker kind: `TOOLCHAIN / TARGET_EXECUTION_ENVIRONMENT`
- Exact failure and timestamp: at `2026-08-14T11:26:47.3097323+08:00`, local inventory found no exact-commit X86 toolchain/source and no existing WSL distro.
- Claim-bearing observation obtained before failure: `no`
- Valid evidence already obtained and hashes, if yes: none; only mechanical provenance observations in `LOCAL_ASSET_INVENTORY.md`.
- Claims supported so far, if any: none.
- Claims/gates still unresolved or unsupported: all PRE_CLAIM predicates, A/B reconstructibility divergence, native legality, current-union residual, natural denominator and full-cost Pareto result.
- Scientific inference allowed: `none`
- Evidence ceiling: `RESOURCE_FAILURE_ONLY__NO_SCIENTIFIC_INFERENCE`
- Scientific revision consumed: `no`
- Immutable failure directory and hashes: this `initial` directory; canonical hashes are in `HASH_MANIFEST.sha256`.

## Exact resource needed

- Name/version/commit: LLVM source/build exactly at `e72ba6cf366a3180cbf5a8690d9e50665880ab76`, with X86 target enabled.
- Expected size and SHA-256/signature: provider must declare bundle size, build provenance and archive/binary SHA-256 before execution; no hash is invented for a build that has not been supplied.
- Required files or capabilities: `llc` with X86 and MachineVerifier support; `clang` or a frozen valid MIR materialization route; `llvm-dwarfdump`; `llvm-objdump` and/or `llvm-readelf`/`llvm-readobj`; `opt` as needed by the frozen pipeline; support for instruction-reference-compatible LiveDebugValues and call-site parameter emission; ELF x86-64 Linux output; unwind/CFI inspection; and a local route to check the frozen executable behavior/call ABI.
- License/ownership constraints: official LLVM Apache-2.0 WITH LLVM-exception source/build provenance; no private or unlicensed binary.
- Accepted alternative forms:
  1. A portable, locally placed exact-commit prebuilt bundle with hashes and build arguments, plus an already available Linux execution route.
  2. Exact-commit official source archive plus a new explicit mainline/user authorization for a bounded source build inside `resume1` (not authorized in this assignment).
  3. Exact-commit Windows cross-tools plus an explicitly authorized, local, reproducible Linux runner/emulator/sysroot route that preserves the same target behavior; object-only inspection is insufficient for the executable-behavior predicate.

## Minimum user action

- What the user should provide, approve or place: choose one accepted route above and have mainline dispatch a new immutable resume assignment. The lowest-intervention route is a portable exact-commit toolchain plus an existing Linux runner.
- Exact destination or handoff method: new directory `stages\stageA\LLVM-DWARF-CALLSITE-RECONSTRUCTIBILITY\resume1\`; never add or replace tools in `initial`.
- Safe verification command/read-only check: run each supplied tool with `--version`, enumerate `llc --version` registered targets, verify all supplied hashes/provenance, then compile/inspect a non-claim smoke before materializing the frozen witness.

## Resume contract

- Frozen contract SHA-256: `4D4835AA13AF26189B3E19C086B091FA1E94CF20EB00863546679D125F93D924` (`MAINLINE_ASSIGNMENT.yaml`).
- New resume directory; never overwrite failure record: `stages\stageA\LLVM-DWARF-CALLSITE-RECONSTRUCTIBILITY\resume1`.
- First command after unblocking: exact toolchain provenance/hash/target inventory; no witness until it passes.
- Resource/time/device ceiling: mainline must freeze the new route; absent expansion, retain 4 GiB, 4 CPU-hours, 24 wall-hours, no GPU or exclusive device.

## Approved finite recovery envelope

- User authorization ID: `STAGEA-L3-20260814-LLVM-DWARF-CALLSITE-RECONSTRUCTIBILITY-INITIAL-V8.7` local-assets-only envelope.
- Approved routes, ordered and bounded: local exact asset discovery only; zero network, zero build, zero install.
- Attempt count and budget per route: one read-only inventory pass.
- Routes already exhausted with mechanical evidence: PATH tools, workspace exact-commit filename/source/tool provenance, representative local LLVM versions/targets, and existing WSL distro route.
- Approved routes not yet attempted: none.
- Routes that succeeded and work resumed: none.
- Total network/storage/CPU/GPU/device cost versus envelope: network/GPU/device zero; only small report storage; diagnostic CPU/RSS was not precisely exposed and is not estimated.
- Exact envelope expansion now requested, if any: exact-commit portable toolchain/Linux route, or bounded official acquire/build authorization in a new resume directory.
- `USER_DIRECTED_RESERVE_FALLBACK` authorized: `no`
- If yes, exact reversible reserve state: not applicable.
- Required `RESUME_FROM_RESERVE` entry point: not applicable.

## Work already performed and cost

- Network bytes/time: 0 bytes; no network request.
- CPU/storage/device use: read-only hashing/search/version probes and this small text package; no GPU/device; exact aggregate CPU/RSS unavailable and not estimated.
- What was explicitly not executed: witness MIR, MachineVerifier, object/link/run, unwind/DWARF replay, candidate DP, current-union grid, exact oracle, natural corpus and Stage B.
- Other approved work packages continuing/completed while blocked: none in this lane.
- Missing gate's consequence for Stage B paper sufficiency: Stage A has no scientific evidence and cannot be sent to Stage A gate as PASS or to Stage B.
