# LLVM APX exact resource/build gate report

## 中文摘要

- 得到什么：五个官方资源均完成身份、长度和 SHA-256 验证；LLVM exact commit `a1194be1baefa99d20a09bd04b16056be0ab7225` 的 X86+Clang assertions 配置成功，唯一 clean build 运行到 `2407/3156`。
- 为什么未通过资源门：E 盘是 exFAT。Ninja 在 266 字符的对象目录 `.../SharedLexicalRepresentation` 上返回 `No such file or directory`，唯一 build 以 exit code 1 结束。
- 下一步：需要新的明确授权，允许在新 immutable resume 中使用短路径命名空间并增加一次 build，或由用户提供 exact-commit 预构建 Windows x86-64 工具包。
- 是否需要用户动作：是。当前 assignment 已用完 6 次网络请求、1 次 clean build 和 1 次 corrected reconfigure，不允许自行重试。

## Frozen identity and scope

- Assignment: `STAGEA-L1-20260825-LLVM-APX-RESUME2-E-ROOT-SELF-CONTAINED-BUILD`
- Topic: `LLVM-APX-PREFIX-PRESSURE-PARETODP`
- Exact commit: `a1194be1baefa99d20a09bd04b16056be0ab7225`
- Scope: official acquisition, exact build and non-claim resource smoke only.
- Decision: `BLOCKED_USER_ACTION_REQUIRED`
- Evidence ceiling: `RESOURCE_FAILURE_ONLY__NO_SCIENTIFIC_INFERENCE`
- Claim-bearing or natural run: `0`
- Scientific revision consumed: `false`
- Stage transition or Stage B: not authorized and not performed.

## Acquisition result

All five persisted assets passed official URL, response completeness, content-length when available, and content SHA-256 checks. GitHub commit metadata resolved the exact 40-hex identity with `verification_verified=true` and `verification_reason=valid`.

| Asset | Bytes | SHA-256 | Result |
|---|---:|---|---|
| LLVM commit metadata | 8,174 | `21813151E583064407035F9194C4E85A91ACC41776456803F2B85D8076415E6F` | PASS |
| LLVM source archive | 278,674,752 | `F90FFC22BF3B220B726C2E4D7953076520C4188ED4409213AFB9829B98254747` | PASS |
| LLVM-MinGW 20260616 | 187,504,083 | `B9B68A4D276E16FA25802AABA458E4638F64B3884C290AACCDC2D87083B6CA35` | PASS |
| CMake 4.4.2 win_amd64 wheel | 42,325,289 | `C28388FE95298486169C45C0EC8BDF067AABCB59273B98A4CDAE8BE5CD9C74F3` | PASS |
| Ninja 1.13.0 win_amd64 wheel | 309,975 | `FB8EE8719F8AF47FED145CCED4A85F0755DD55D45B2BDDAF7431FA89803C5F3E` | PASS |

The frozen preferred Ninja `1.13.2` was absent from official PyPI; the official current `1.13.0` Windows x86-64 wheel was used. No unofficial mirror or TLS bypass was used.

Network accounting: one `.NET HttpClient` metadata request failed before response headers; the bundled Python HTTPS route then closed the metadata fallback and four remaining assets. Total attempts were `6/6`; persisted response bytes were `508,822,273 / 671,088,640`.

## Extraction and source identity

- Archive-member safety preflight: PASS after resolving symlink targets relative to their parents; no path escaped the single top-level archive root.
- All regular source files and directories are present with archive sizes; four APX-critical files match the source archive byte-for-byte.
- E: is exFAT and cannot represent symlinks. Nineteen archive symlinks under Clang/LLDB test fixtures and `llvm/utils/mlgo-utils` could not be materialized.
- Configuration froze `LLVM_INCLUDE_TESTS=OFF`; the generated Ninja graph contains zero references to those 19 paths. No symlink was replaced by copied content and no source file was patched.

## Configure and build

Configuration: Release, assertions ON, X86 only, Clang enabled, utilities/FileCheck enabled, tests/benchmarks/examples/docs disabled, optional external libraries disabled where build semantics permit. The first configure stopped before compiler tests because a backslash RC path was serialized as `\p`; the single allowed corrected reconfigure normalized tool paths to `/` and completed `Configuring done` and `Generating done`. `build.ninja` SHA-256 is `27E1455BFDEB23CC54A22164A0C7C3991CB4FBEBC52162BF043833FCA9779AFE`.

The only clean build used Ninja `-j2` for `llc llvm-mc llvm-objdump llvm-readobj opt FileCheck clang`. It ran for `1355.388 s` and stopped at `2407/3156`:

```text
ninja: error: mkdir(tools/clang/lib/ScalableStaticAnalysis/Analyses/CMakeFiles/obj.clangScalableStaticAnalysisAnalyses.dir/SharedLexicalRepresentation): No such file or directory
```

The resolved directory path is 266 characters. CMake had already emitted object-path warnings; exFAT reports maximum component length 255 and lacks symlink support. None of the required seven tools was produced, so version/target/APX MC/tiny MIR MachineVerifier smokes were not run. Partial TableGen binaries are non-claim, non-deliverable build residue.

## Resource and cost closure

- Resource root: `4,703,991,763 bytes / 8,589,934,592`, 197,428 files.
- Build directory: 1,085,043,570 bytes, 3,112 files.
- Exact process-tree CPU and full assignment wall telemetry were not provided by this environment and were not estimated. The build used two jobs and its measured wall duration is recorded above.
- GPU, WSL, system install, global PATH/registry changes, cross-topic resources, natural inputs, candidate/baseline/benchmark/full-cost work, cleanup and scientific actions: none.

## Closeout

The owner performed no deletion. Claim-critical failure evidence was copied to `resources/logs/build_failure_capsule/`. MAINLINE-only cleanup candidates are the exact leaves `resources/src/llvm`, `resources/build/llvm-apx`, and `resources/cache`, gated by accepted handoff and retained archive/capsule verification. Projected retained bytes after those deletions are 1,368,471,200, under the 2 GiB closeout budget.
