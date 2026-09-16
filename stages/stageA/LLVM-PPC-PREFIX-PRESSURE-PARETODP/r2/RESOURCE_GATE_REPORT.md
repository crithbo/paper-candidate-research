# LLVM-PPC r2 exact resource gate report

## 中文摘要

- 得到什么：固定 commit `f127b4c19c63b0492fb924934e37e032c17ea35b` 的 PowerPC + lld、Release + assertions 工具链已在题内 E-root 完成一次 configure 与一次 `-j2` clean build；Ninja 为 `2826/2826`、exit 0。
- 资源闭合：r1 两项 exact inputs 复制/hash 2/2；剩余三项官方资产各一次下载并 exact hash 3/3。LLVM-MinGW 只跟随一次批准的 `github.com → release-assets.githubusercontent.com` HTTPS redirect，签名 query 未持久化或记录。
- 路径闭合：473-character process-local long-path probe PASS；生成 Ninja 图最长对象目录 `178<240`，2,498 个 object outputs、0 violations；全资源树 0 reparse。
- 可交付工具：`resources/env/ppc-toolchain` 包含 7 个 required tools、2 个 runtime DLL、90 个 notices、10 个 provenance files 与 23 个 nonclaim smoke evidence files；package manifest SHA256 `39CF76C8DA10D645F26789C3FF1A4E3A47839C70DBDAC3D5A4AED73C6792094C`。
- 非 claim smoke：7 个版本/target 检查、generic tiny PPC64LE MIR MachineVerifier、generic Power10 prefixed MC→object→readobj/objdump→lld link 全部 PASS。两个 wrapper-only 日志缺陷发生在相应工具 exit 0 之后，失败记录均保留；实际工具命令重跑数为 0。
- 科学边界：没有运行 PPC F1–F5、direct witness、自然输入、candidate/baseline、performance、full-cost 或 claim-bearing action；没有科学推断、revision、状态转换、Stage B 或 owner cleanup。
- 下一步：等待 MAINLINE 验收 package/handoff；验收后只能由 MAINLINE 执行 exact lifecycle GC，并由独立 assignment 决定是否进入 PPC preclaim。

## Frozen identity and authority

- Assignment: `STAGEA-L1-20260826-LLVM-PPC-R2-OFFICIAL-REDIRECT-COMPATIBLE-EXACT-TOOLCHAIN`
- Context SHA256: `066EFDF482150A63956C204AAADB905E4F9FCCED663547EB6B03076A702E577C`
- ACK SHA256: `221E03C2BE28B6955A07B764FA4BCF16C08E3E3E63E3A976D47C5AC903CD785B`
- START SHA256: `4A35ED20F25B9BEA491A46C2D09A4A64F2A46E9858EA0C0EBB6349D05ED401A8`
- Claim ceiling: `RESOURCE_GATE_ONLY__NO_PPC_PRECLAIM_NATURAL_OR_PERFORMANCE_CLAIM`

## Resource and build results

- Network: 3 asset attempts, 230,139,347 persisted bytes, one approved redirect, zero retry.
- Extraction: source 1/1 PASS; tools 1/1 PASS. The official source tar's 19 contained archive symlinks were materialized at identical logical member paths as ordinary files/directories; target content was unmodified and no symlink/reparse was created.
- Configure: 1/1 PASS, CMake 4.4.2, Ninja 1.13.0, LLVM-MinGW Clang 22.1.8.
- Clean build: 1/1 PASS, `-j2`, 2,826/2,826.
- Resource root: 198,767 files, 17,970 directories including root, 6,252,479,385 logical bytes, 0 reparse, 0 related active processes at closeout.
- Exact CPU and wall seconds: this run environment did not provide canonical exact totals; no estimate was made.

## Required tool hashes

- `llc.exe`: `706EACEC5579CE3B1FD09AA57B0CCB0442B9B9182C4938081F033CC2A076A7CB`
- `llvm-mc.exe`: `A8CDF6776E681C28652F8019DAA312D209CC88B0D2C5A0AB09ACAAC4F9AE974F`
- `llvm-objdump.exe`: `AD4B570AC01C0E30A69012740DC9E04322100C12D5D12343F7B051BED315FFCE`
- `llvm-readobj.exe`: `485FAC4BC5B262BCB980D35DD912C3D3D24D5EB7F57B45D7DFCAE85078947A94`
- `opt.exe`: `7A7A1A2B80D5FCD6B618B679AB4DDFCB2682C151097894E046D1B982607143B9`
- `FileCheck.exe`: `281C52B21118259E92EB290340522530AD8FC45DB8FF105420EAB5842AB1E809`
- `ld.lld.exe`: `DA0B35A697D3354E276377EA21925BE9FBE4E1C237F4800FA75ED93751B0259C`

## Evidence ceiling

`EXACT_BUILD_AND_TOOL_CAPABILITY_VALIDATION_ONLY__NO_SCIENTIFIC_INFERENCE`
