# Resume1 Environment Freeze

- Host: Windows x64, PowerShell orchestration.
- Reused bootstrap: `D:\project\writing\reserch\stages\stageA\CVC5-ALETHE-SHAREMAP\resume1\toolchain\msys64` (mainline-registered read-only reuse).
- Invocation: absolute `bash.exe`; process-local `PATH=/usr/bin:/clang64/bin`; no global PATH, registry, service, package, or system installation change.
- Compiler: Clang `22.1.8`, target `x86_64-w64-windows-gnu`, POSIX thread model.
- CMake: `4.4.2`; Ninja: `1.13.2`; GNU Make: `4.4.1`; MSYS: `3.6.7`.
- GPU/exclusive device: none.
- Build concurrency: `-j2`.
- Source patches, generated source edits, lockfile edits, and test edits: none.

The bootstrap is not a claim tool. No executable from another topic was copied into `verified/`; that directory remains empty because the conjunctive resource gate failed.

