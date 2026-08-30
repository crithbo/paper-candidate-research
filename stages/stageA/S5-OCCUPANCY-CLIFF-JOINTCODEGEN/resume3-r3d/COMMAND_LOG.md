# S5 R3D Command Log

- Lane: `CANDIDATE-EXECUTION-LANE-2`
- Assignment: `RESOURCE-STAGEA-L2-20260811-S5-OCCUPANCY-CLIFF-JOINTCODEGEN-RESUME3-R3D`
- Authorization: `LLVM-EXACT-COMMIT-MINIMAL-BUILD-BATCH-20260811-R3D + R3A + R3H`
- Sole write directory: this directory
- Claim-bearing work before all gates pass: forbidden

## Intake

1. Read the complete frozen control files mechanically and the candidate-owner role; hashes matched 4/4.
2. Read the minimum S5 closing, latest blocker/contract, handoff and required templates.
3. Recomputed Stage0 closing manifest `16/16` and prior R2A manifest `13,466/13,466`, zero mismatch or missing entry.
4. Confirmed this resume directory did not exist, then created it once.
5. Recomputed registered R3A bootstrap hashes and version smokes. Bootstrap Clang, CMake and Ninja matched their registry hashes; no global PATH was changed.
6. No other running `cmake`, `ninja`, `clang`, or `clang-cl` process was observed at bootstrap preflight.

## Official acquisition and exact build

7. A sandboxed `curl.exe` request to the official GitHub endpoint failed with Schannel `SEC_E_NO_CREDENTIALS`. The same official HTTPS route was retried under the approved network boundary and succeeded; no mirror was used.
8. The GitHub commit API identified LLVM commit `1f112d62e1fa2c4f1a04887abd72da1ed61cf791` with a valid GitHub signature. The API response is `artifacts/llvm-commit-api.json` (15,497 bytes, SHA-256 `B496E4FF49846FCFEA20583065038542BF2ED1ECBA5ED650E3D4D759C3EBD13D`).
9. Downloaded the official codeload archive `llvm-project-1f112d62e1fa2c4f1a04887abd72da1ed61cf791.tar.gz`: 279,920,943 bytes, SHA-256 `467AA7D8315BC5B05CDC796300B20FA0019E91571CF51BEEB13EC862E51AFC9B`. Archive inspection found 198,175 entries, one expected root and zero unsafe paths.
10. Windows `bsdtar` returned exit 1 after 128.748 s because it could not materialize upstream POSIX symlinks in unrelated Clang/LLDB tests and three MLGO utility links. Required LLVM, AMDGPU, FileCheck and occupancy-tool source trees were present. This extraction variance was retained; no source file was patched.
11. Clean build attempt 1 stopped during configure after 8.486 s because CMake selected a user Python executable that was not executable in this environment. No compilation occurred (`artifacts/logs/configure-attempt1.log`).
12. Clean build attempt 2 used the R3A portable MSYS2 Python by absolute path. Configure passed in 75.947 s with Release, assertions, AMDGPU-only target, tools/tests enabled and optional compression/XML/curl/bindings disabled.
13. The first Ninja invocation in attempt 2 stopped at step 223/1955 after 74.043 s because the generated `llvm-min-tblgen.exe` could not locate bootstrap runtime DLLs. The executable itself passed when the bootstrap bin directory was supplied only to that process.
14. Resumed the same attempt-2 build incrementally with a process-local bootstrap bin path; this was not a third clean build. `llc`, `FileCheck` and `llvm-calc-occupancy` completed 1732/1732 in 1164.604 s.
15. Reconfigured the same attempt-2 tree to enable exact-commit Clang in 38.573 s and built target `clang` 1448/1448 in 959.191 s. No source/lock/test file changed.
16. Exact tools were copied with required runtime DLLs into `verified/tools`. Hashes are frozen in `TOOL_MANIFEST.tsv`.

## Resource smokes and harness corrections

17. `llc --version` reported LLVM 24.0.0git, optimized with assertions, with AMDGPU/amdgcn/r600 registered. `FileCheck --version` and `llvm-calc-occupancy --help` exited zero.
18. Early smoke harnesses were invalid but non-destructive: PowerShell `*>` produced UTF-16 text that FileCheck rejected; one `llc` command joined an output argument incorrectly; two `Start-Process` attempts failed before launch due duplicate `Path/PATH`; one `.NET` `ArgumentList` attempt was unavailable. These are harness failures, not tool failures, and their raw files remain under `artifacts/smoke`.
19. Corrected smokes used direct argument arrays and UTF-8 files. `llvm-calc-occupancy` plus exact FileCheck passed for `gfx1030/vgprs=128` and `gfx90a/vgprs=80/sgprs=102`. Exact `llc --verify-machineinstrs` plus exact FileCheck passed the stock AMDGPU `empty-function.ll` witness.

## Natural-source route and preclaim gate

20. Official ROCm examples commit `269e9068d6fd6e68b1cc5a76eb77744f88af42ec` was verified through the GitHub API with a valid signature. Its official archive is 42,592,017 bytes, SHA-256 `FCA47F62646CEFD2AE7A80F0275906B3D9F6799132F1B94E13E07CA617082DD3`, 5,216 entries, zero unsafe paths.
21. To supply the official HIP headers without installation, fetched official HIP commit `1377114f8220724206f1f5a770501fda11d8d1e1` (4,251,923 bytes, SHA-256 `E8A739248DFDF587EEF7F5E24001C8BA202D630201CD2D0E95A2C48D874C75C8`) and CLR commit `4b824dff90ab4b6e969b53c5bb81e9c9285434c3` (2,161,115 bytes, SHA-256 `DAB52571517BC2F8B43D0A8FBF4493EEC40986E0E2608FFBD4EF031D748D62F0`). Both are the latest official commits found at or before the frozen examples timestamp. No mirror or package installation was used.
22. Mechanically assembled a local include sysroot from unmodified official HIP/CLR header bytes. The only generated file is `hip_version.h`, containing the three macros mechanically transcribed from official HIP `VERSION` (7.13.0); this is outside source trees and is not a source patch.
23. Exact Clang first exposed three honest compatibility failures: missing C++ headers, then missing generated `hip_version.h`, then missing CLR AMD-detail headers. After the official headers were closed, normal MinGW/Windows compilation failed the upstream HIP LP64 assertions because Windows `long` is 4 bytes. An MSVC target instead required unavailable `vcruntime_exception.h`; a Linux target with the Windows libc++/C headers failed its C ABI declarations.
24. The exact Clang compiler-owned HIP runtime wrapper plus official HIP RTC/device-only path successfully emitted natural device IR without changing source for three initially screened files and two extended files. One full natural `module.hip` witness then produced pre-machine-scheduler MIR with exact `llc --verify-machineinstrs`.
25. The small witness ran the real exact-commit `GCNSchedStrategy+greedy` baseline and all three frozen flag variants with identical MIR, `amdgpu11.00`, `gfx1100`, wave32 and MachineVerifier. All exited zero and produced byte-identical 9,504-byte MIR, SHA-256 `53FB0FF12A5ED1BC082A8EA13884F9B1DD6CE73382C2E2419611C4CB9EE016B3`, occupancy 16. This is a fidelity witness only, not a claim-bearing natural comparison.
26. A predeclared 12-directory screen yielded only 3 complete device IR files under the first valid path. Extended official-header routes added graph weighting and the CUDA-porting module file, but could not close eight independent complete natural source directories without either parsing unavailable host ABI/runtime support, trimming host code, injecting fake API definitions or splitting an example. Those forbidden transformations were not used.
27. The preclaim gate therefore failed at `NATURAL_COMPLETE_MIR_SET`: 5 independently sourced natural device IR objects were obtainable, below the frozen 8-directory/8-MIR minimum; only 1 was converted through complete pre-scheduler MIR and verifier for the required small witness. No corpus-wide baseline, candidate, selection, full-cost comparison or double replay was started.

## Closure

28. Claim-bearing observations: 0. Scientific revision consumed: false. Evidence ceiling: `RESOURCE_FAILURE_ONLY__NO_SCIENTIFIC_INFERENCE`.
29. Disposition recommendation: `BLOCKED_USER_ACTION_REQUIRED`. No PASS, STOP, reserve or archive inference is made. R3H is suggested to mainline only after it mechanically confirms the approved resume routes and decides whether to invoke the user-directed fallback; this lane does not change registry state.
30. Stage B was not initialized. `stageb_authorized=false`, `pending_user_stageb_review=false`, `stageb_user_approval_id=null`.
31. The first serial all-file manifest pass was stopped after 43,604 entries because per-file process overhead projected an unnecessarily long closure. Its incomplete output was not treated as evidence. The final pass uses the same GNU SHA-256 implementation with eight bounded workers and a deterministic path sort, followed by an independent `sha256sum -c` verification.
32. The parallel full-directory pass produced 191,739 entries and the independent eight-way `sha256sum -c --quiet` replay returned exit 0 with zero mismatch. Temporary verification chunks were resolved inside `artifacts/manifest-check-temp`, removed after the check, and never treated as package artifacts. After this log line, the manifest is regenerated once so the canonical closure includes the final command log; its final hash and second replay count are reported in the handoff response.
