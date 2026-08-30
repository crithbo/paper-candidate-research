# LLVM RVV r3 resource-gate command ledger

All writes were confined to the frozen r3 assignment. Network remained disabled.

| Phase | Command/action | Outcome | Attempt effect |
|---|---|---|---|
| Bootstrap | Verify accepted second ACK and MAINLINE start record | PASS | no resource attempt |
| Directories | Create eight standard r3 resource directories | PASS; 0 files/reparse initially | resource gate started |
| Long-path preflight | Process-local .NET/Win32 extended-length write/read at 474-character logical path, then leaf-by-leaf removal | PASS; no probe persisted | before copy/extraction |
| Same-topic transfer | Copy and SHA-256 verify five exact r2 official assets | PASS 5/5; network 0; parent unchanged | one transfer route |
| Source extraction | Safe preflight then extended-path regular-file extraction to logical `resources/src/s` | PASS 1/1; 181,551 files; 19 links omitted without creation; prior 260-character file present | no retry |
| Tool extraction | One joint exact extraction of LLVM-MinGW, CMake and Ninja to logical `resources/env/t` | PASS 1/1; 13,669 files | no retry |
| Path audit | Freeze exact build root and verify generated graph | PASS; 94 base, projected 225, actual 179 < 240 | configure permitted |
| Configure | Release, assertions ON, RISCV only, build utils ON, tests/optional deps OFF | PASS 1/1, 83.876 s | no retry |
| Clean build | Ninja `-j2 llc llvm-mc llvm-objdump llvm-readobj opt FileCheck` | PASS 1905/1905, 975.624 s | build 1/1; no retry |
| Bundle | Copy six tools, `libc++.dll`, `libunwind.dll`, 93 notices; PE import audit | PASS | no build |
| Non-claim smoke | Tool versions/registered targets plus generic stock RISC-V MIR `-run-pass=none -verify-machineinstrs` | PASS | resource smoke only |
| Closeout | Inventory, provenance, lock, retention, capsule, handoff and manifest | completed; zero active process | owner cleanup not performed |

No RVV F1–F5 or claim action was executed.

