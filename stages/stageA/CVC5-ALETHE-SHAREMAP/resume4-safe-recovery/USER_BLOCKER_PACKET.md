# User Blocker Packet — CVC5 Carcara resume4

## Blocker

- State: `BLOCKED_USER_ACTION_REQUIRED__NO_SCIENTIFIC_INFERENCE`
- Phase: resource recovery, single clean unmodified locked Carcara build
- Exact failure: GMP configure received `CC=D:\project\...\mingw64\bin\gcc.exe`; POSIX `sh` removed the backslashes and returned command-not-found 127.
- Build exit: 101 after 26.192 s.
- Binary: no `carcara.exe`; therefore version/help/checker smoke and the existing Stage A preclaim remain unexecuted.

## What is already closed

- Official portable MSYS2 MINGW64 GCC 16.2.0-3 is available in resume4.
- Native C and frozen Rust 1.72 GNU linking both pass.
- Carcara archive, 72-file tree, `Cargo.lock` and Apache-2.0 license are exact and unchanged.
- Locked crates are already present in the assignment-local cache.

## Minimum user/mainline action

Authorize a new immutable resume directory and exactly one corrected mechanical build using:

- same Carcara commit `5d817d86bd18ea2a850a580d602f17f36959ee99`;
- same `Cargo.lock` SHA-256 `0E9C953C2C1B184511E2DFDF19D4BB7C35A6BE55140BC1A3D77179411D7C7378`;
- same Rust `1.72.0-x86_64-pc-windows-gnu`;
- same resume4 GCC 16.2.0-3 read-only;
- process-local PATH containing `mingw64/bin` and `usr/bin`;
- `CC=gcc`, `CXX=g++`, `AR=ar` (or exact `/mingw64/bin/...` POSIX paths), not Windows backslash paths;
- new clean target directory and no source/lock/feature/test modification.

Expected resources: no new network payload; below 700 MiB incremental storage; below 10 CPU-minutes and 30 wall-minutes; no system/global change. After a successful binary build, only version/help and the frozen non-claim-bearing stock checker smoke may run before mainline decides whether to resume the existing preclaim gate.

## Safety and scientific boundary

No retry is permitted in resume4. No scientific negative inference, STOP, reserve/archive, stage transition or Stage B is authorized. Resume from a new directory only.

