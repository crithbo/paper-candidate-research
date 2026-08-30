# PPC r2 command log

- START authorization: `MAINLINE_START_AUTHORIZATION.yaml`, SHA256 `4A35ED20F25B9BEA491A46C2D09A4A64F2A46E9858EA0C0EBB6349D05ED401A8`.
- Created the eight standard directories under the frozen r2 `resources` root; observed zero reparse entries.
- Process-local writable-surface map for resource commands: `TEMP/TMP/TMPDIR=resources/tmp`, `PYTHONPYCACHEPREFIX=resources/cache/pycache`, `PYTHONNOUSERSITE=1`, `PIP_CACHE_DIR=resources/cache/pip`, `XDG_CACHE_HOME=resources/cache/xdg`.
- Copied only the two context-pinned same-topic r1 inputs after verifying source bytes and SHA256; verified destination bytes and SHA256. No r1 file was overwritten, modified, or deleted.
- Network plan: one invocation of the frozen downloader; one asset attempt each; LLVM-MinGW permits one in-memory HTTPS redirect in the exact `github.com` to `release-assets.githubusercontent.com` chain. Signed query data is forbidden from all persisted output.
- Network invocation completed once: 3/3 exact assets, 230,139,347 persisted response bytes, one approved redirect, zero retry, and zero persisted signed-query markers.
- Repeated the process-local 473-character long-path probe; write/read matched and the probe root was removed without a reparse point.
- Safe-member scan: source 198,257 members and tools 13,922 members; no traversal, Windows-unsafe path, casefold collision, hardlink, or tool symlink. The source tar has 19 contained archive symlinks; 18 resolve to regular files and one to a directory. They are frozen for ordinary-file/directory content materialization at the same logical member paths, creating no symlink or reparse point.
- Source extraction invocation 1/1 PASS: 181,559 archive regular files and 2,265,353,248 bytes; 19 contained archive symlinks materialized as 21 regular files plus one regular directory, with original logical member paths and no symlink/reparse.
- Tool extraction invocation 1/1 PASS: LLVM-MinGW, CMake, and Ninja extracted together to `resources/env/t`; 13,669 regular files and 839,345,887 bytes; no symlink/reparse.
- Tool version preflight: CMake 4.4.2; Ninja 1.13.0; LLVM-MinGW Clang/Clang++ 22.1.8 targeting `x86_64-w64-windows-gnu`.
- Preconfigure path audit PASS: source/tool/build logical roots are 93 chars; predicted longest included object directory is 160 chars. The actual generated Ninja graph remains a mandatory post-configure, pre-build `<240` check.
- Configure invocation 1/1 PASS with Release, assertions ON, PowerPC target, `lld` project, utilities ON, Clang 22.1.8, CMake 4.4.2, and Ninja 1.13.0; no source patch or global environment change.
- Post-configure/pre-build Ninja graph audit: 2,498 object outputs; longest object directory 178 chars and longest object file 215 chars; 0 directory violations of the exclusive 240-char gate.
- Clean build invocation 1/1 PASS at `-j2`: 2,826/2,826 Ninja steps, exit code 0, no configure/build retry.
- Packaged seven required executables plus `libc++.dll` and `libunwind.dll`; copied 39 source notices, 51 bootstrap/CMake/Ninja notices, and provenance records.
- Nonclaim smoke: seven version/target commands PASS; tiny PPC64LE MIR generation and MachineVerifier PASS; generic Power10 prefixed MC object/readobj/objdump/lld link PASS. Two wrapper-only failures after successful zero-stdout commands are preserved; no tool command was retried.
