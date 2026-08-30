# Resource acquisition and provenance gate

- Assignment: `RESOURCE-STAGEA-L3-20260814-RISCV-ZCMP-CALLEESAVE-PUSHLIST-PARETODP-RESUME1`
- Decision: `PASS`
- Exact LLVM commit: `ba5bccfe01368f76e74d6ff4c35f1330e155b4ba`
- Scientific observation before this gate: none
- Scientific revision consumed: no

The two missing exact blobs were obtained from immutable official raw URLs and match both their frozen Git blob IDs and retained SHA-256 values. The exact official source archive is retained; all 13 decisive RISC-V source files match the frozen blob manifest. No acceptable prebuilt arbitrary-commit Windows toolchain existed in the checked official Actions/assets route, so the authorized isolated source-build route was used.

The successful build is LLVM 24.0.0git at the exact commit, Release with assertions, RISC-V/X86 targets and LLD. It produced `llc` with RISC-V and MachineVerifier, `llvm-mc`, `llvm-objdump`, `llvm-readobj` and `ld.lld`. Binary hashes are frozen in the final manifest. A full archive extraction first encountered Windows symlink/path incompatibilities and one configure attempt lacked the `libc` support subtree; both are retained as engineering evidence. Selective exact extraction to the short path then configured and built without source modification. One actual build completed all 2160 Ninja steps; a follow-up target integrity run returned `no work to do` and exit zero.

Build wall time was 1360.1584 seconds, conservative two-job CPU upper bound 2720.3168 seconds, peak observed working set 3,471,986,688 bytes and peak private bytes 3,570,847,744. The current resume directory is approximately 6.28 GiB because the immutable failed long-path extraction is retained; this is below the authorized 35 GiB. No system installation, global PATH mutation, private asset, source patch, commit substitution or Stage B action occurred.

