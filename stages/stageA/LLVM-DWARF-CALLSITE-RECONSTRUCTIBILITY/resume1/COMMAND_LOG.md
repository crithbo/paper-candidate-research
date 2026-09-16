# Command log

All paths are under `<LEGACY_LOCAL_PROJECT_ROOT>`; only `resume1` is written. The immutable `initial` package and shared control files are read-only.

| ID | Phase | Command/action | Result |
|---|---|---|---|
| C01 | intake | Full read of `AGENTS.md`, `plan.md`, machine read of `registry.yaml`, candidate-owner rule, assignment, ARS experiment workflow and minimal frozen upstream | contract identity and lane boundary agree |
| C02 | integrity | SHA-256 of control, assignment and immutable initial canonical files | initial assignment/handoff/manifest match frozen hashes; live shared-control drift recorded mechanically |
| C03 | route R1A1 | PATH exact-tool lookup, exact-commit workspace search, WSL/container/QEMU read-only probes | no exact X86 toolchain and no existing Linux SysV runner; no scientific inference |
| C04 | bootstrap discovery | Read-only discovery of portable CMake/Ninja/LLVM bootstrap assets in prior immutable packages | usable only as hashed process-local bootstrap; no scientific fact inherited |
| C05 | route R2A1 | official GitHub commit API request in the default sandbox | TLS failure, curl exit 35, zero bytes; safe bounded retry used |
| C06 | route R2A2 identity | approved retry of official commit API and exact-commit GitHub archive | API 6,185 bytes, archive 280,594,592 bytes; exact commit/tree and SHA-256 frozen |
| C07 | source extraction | `tar.exe -xzf` into `resume1/resources/src` | exit 1 from unsupported symlinks/long test paths; all decisive core files present; 7/7 archive-member parity |
| C08 | source audit | `scripts/audit_archive.py` over archive members and extracted decisive files | license/build roots/DWARF/LDV/X86 source hashes match |
| C09 | bootstrap audit | SHA-256 and version checks for portable CMake 4.4.2, Ninja 1.13.2 and llvm-mingw Clang 22.1.8 | accepted as process-local build resources only |
| C10 | first configure | CMake Release/assertions/Clang/X86-only configure | failed on Python autodetection; no source change |
| C11 | corrected configure | same CMake configuration with pinned bundled Python 3.12.13 | exit 0, wall 90.366 s; cache and Ninja hashes frozen |
| C12 | first compile | Ninja `-j2` for six required tools | interrupted after generated bootstrap executable could not load `libc++.dll`; no source or contract change |
| C13 | corrected compile | identical Ninja targets with hashed bootstrap runtime on process-local PATH | 3137/3137, exit 0, wall 2,284.686 s |
| C14 | runtime sealing | copied hashed `libc++.dll` and `libunwind.dll` into `resume1/build/bin` | tools launch without host/global PATH mutation |
| C15 | tool audit | version, registered-target, bytes and SHA-256 checks for Clang/llc/dwarfdump/objdump/readobj/opt | 24.0.0git, optimized with assertions; x86/x86-64 registered |
| C16 | resource smoke | compile generic C to Linux ELF/object+bitcode; run `opt -passes=verify`, `llvm-dwarfdump --verify`, `llvm-readobj`, `llvm-objdump` | all exit 0; non-claim control only; frozen Plan A/B witness not run |
| C17 | route R3A1 | read-only WSL/container/VM/QEMU runner audit | no existing Linux SysV runner |
| C18 | route R3A2 | official QEMU user-mode and build-platform semantics review | qemu-user on Windows cannot supply a Linux syscall ABI; route fails closed |
| C19 | route R4 | exact portable prebuilt applicability check | not attempted: exact toolchain already succeeds and a prebuilt cannot supply the missing Linux runner |
| C20 | disposition | ordered resource-gate evaluation | 3/4 predicates PASS; Linux execution predicate blocked; PRE_CLAIM not started |

No witness, candidate, comparator, natural corpus or Stage B command ran. The resource gate is fail-closed on the Linux SysV runner; PRE_CLAIM was deliberately not started.
