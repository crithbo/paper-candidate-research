# APX r3 resource-gate command ledger

All writes were confined to the frozen r3 unique directory. The network remained disabled. Read-only monitoring and hashing commands are summarized.

| Phase | Command/action | Outcome | Attempt effect |
|---|---|---|---|
| Bootstrap | Create the eight standard resource directories | PASS; all under `r3/resources` | no configure/build |
| Same-topic transfer | Copy and SHA-256 verify five frozen official assets from accepted resume2 downloads | PASS 5/5; 508,822,273 bytes; network 0 | one authorized transfer route |
| Path audit | Freeze `src/s`, `env/t`, exact `build`; compute old-suffix projection | PASS; predicted object directory 224 < 240 | configure permitted |
| Archive preflight | Validate tar/ZIP members without traversal or reparse creation | PASS | no configure/build |
| Source preparation | Long-path-aware exact extraction into `resources/src/s` | PASS for 180,546 regular files; 19 archive symlinks recorded/omitted on exFAT | one extraction; no patch |
| Tool preparation | Exact ZIP/wheel extraction into `resources/env/t` | PASS for LLVM-MinGW 20260616, CMake 4.4.2, Ninja 1.13.0 | one extraction per asset |
| Configure | CMake `-S resources/src/s/llvm -B resources/build -G Ninja`, Release, assertions ON, X86, Clang | PASS, exit 0, 92.385 s | configure 1/1; no retry |
| Path postcheck | Inspect generated object directories and omitted-link graph hits | PASS; actual object directory 224; omitted-link hits 0 | no build |
| Clean build | Ninja `-C resources/build -j 2 llc llvm-mc llvm-objdump llvm-readobj opt FileCheck clang` | PASS 3156/3156, exit 0, 1,630.356 s | clean build 1/1; no retry |
| Bundle | Copy seven tools, portable DLLs, licenses into `resources/env/apx-toolchain` | PASS; 7 tools, 2 DLLs, 87 notices | no build |
| Dependency audit | Initial packager stopped when conservatively classifying `WINHTTP.dll`; PE imports showed it is a Windows system DLL | continuation only validated/copied bundle material | packaging-only correction; no build/configure rerun |
| Non-claim smoke | Version/targets, APX MC encode/check/object/disassembly, stock tiny MIR MachineVerifier | PASS | resource smoke only; no claim observation |
| Closeout | Inventory, provenance, lock, retention, capsule, handoff, manifest | completed; zero active processes | owner cleanup not performed |

Raw command arrays, stdout, stderr, timings, hashes, and smoke records are under `resources/logs/`. Reproduction scripts and tiny smoke inputs are under `resources/tmp/`.

