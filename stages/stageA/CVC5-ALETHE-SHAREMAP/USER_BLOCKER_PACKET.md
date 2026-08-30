# CVC5-ALETHE-SHAREMAP User Blocker Packet

- Stage and assignment: `Stage A / STAGEA-L1-20260809-CVC5-ALETHE-SHAREMAP-INITIAL-V8.7`
- Status: `BLOCKED_USER_ACTION_REQUIRED`
- Blocker kind: `TOOLCHAIN`
- Exact failure and timestamp: `2026-08-09T21:32:00+08:00` — the host has no C/C++ compiler, MSYS2 shell, CMake, Make/Ninja, GMP development toolchain, Rust, or Cargo. The official cvc5 1.3.4 Windows executable runs but is immutable and cannot execute the frozen printer-side candidate. Carcara 1.1.0 publishes only a Linux executable; this host has neither WSL/container/QEMU nor a Rust toolchain with which to build the pinned checker for Windows.
- Claim-bearing observation obtained before failure: `no`
- Scientific inference allowed: `none`
- Evidence ceiling: `RESOURCE_FAILURE_ONLY__NATIVE_THRESHOLD_FAMILY_REPLAY_ESTABLISHED__CANDIDATE_BUILD_CARCARA_FULL_PRECLAIM_UNESTABLISHED__NO_SCIENTIFIC_INFERENCE`
- Scientific revision consumed: `no`
- Immutable failure directory and hashes: `stages\stageA\CVC5-ALETHE-SHAREMAP`; canonical file hashes are in `HASH_MANIFEST.sha256`.

## Exact resource needed

- Name/version/commit:
  - cvc5 tag `cvc5-1.3.4`, full commit `f3b21c4483d3b88dc63cb7cd3e5eb092eee5e341`.
  - A Windows-native MSYS2 `CLANG64` build environment compatible with the release instructions: `bash`, `make`, `mingw-w64-clang-x86_64-cmake`, `mingw-w64-clang-x86_64-clang`, `mingw-w64-clang-x86_64-gmp`, `zip`, and Python >=3.7; or a Linux/WSL environment with GCC >=10 or Clang >=12, CMake >=3.16, Make/Ninja, Python >=3.7, and GMP.
  - Carcara tag `carcara-1.1.0` and a Rust/Cargo toolchain compatible with its release (release notes state Rust 1.72), or a trusted Windows x86_64 Carcara 1.1.0 executable built from that tag.
  - Preferred exact Windows build profile if a toolchain archive is supplied: MSYS2 `CLANG64`, Clang/Clang++ `19.1.4` (matching the official cvc5 binary build identification), CMake `>=3.16`, GNU Make `>=4.0` or Ninja `>=1.10`, GMP `6.3.x`, ZIP, Python `>=3.7`, plus Rust/Cargo `1.72.x` for Carcara 1.1.0. A different version is acceptable only if mainline freezes its exact executable hashes and an unmodified cvc5/Carcara smoke replay passes before candidate work.
- Expected size and SHA-256/signature:
  - The already acquired official cvc5 Windows static archive is `47,661,597 B`, SHA-256 `279FE7E95810CFB62433FCFC2932F35325A665F32D3697FF33F75E31D5C6A179`.
  - The already acquired exact cvc5 source archive is `12,868,680 B`, SHA-256 `434E43F68073CDEF4AE3CFF63A828E973EC27AEADA0B01F481F2E2DC92A96662`.
  - The already acquired Carcara tag archive is `1,382,442 B`, SHA-256 `FCD42C4ED6501B690E3F363E980B2B1403A1A7C9DF262FECC0A4C831B8960F30`.
  - For a user-provided build environment or checker binary, record the complete archive/binary SHA-256 before use; no unverified executable is acceptable.
  - No honest SHA-256 can be preregistered for a not-yet-provided portable toolchain or user-built Windows Carcara binary. Before resume, mainline must register the actual byte size and SHA-256. Expected upper bounds are `<2 GiB` for the portable build tree/toolchain and `<20 MiB` for a standalone Windows Carcara binary; exceeding either requires a new resource check against the 4 GiB cap.
- Required files or capabilities:
  - Build a modified cvc5 from the exact commit so `SCOPE_FOREST_WEIGHTED_GLOBAL_SELECTION` runs in the same `AletheProofPrinter/AletheLetBinding` construction path.
  - Run `carcara check <proof> <same-input.smt2>` on Windows or in an authorized Linux/WSL environment against the unchanged input.
  - Preserve the 4 GiB workspace and 4 CPU-hour ceiling.
- License/ownership constraints: public open-source only; cvc5 BSD-style license, Carcara Apache-2.0, and public Alethe/SMT-LIB inputs. No private corpus or exclusive device is required.
- Accepted alternative forms:
  1. Point the resumed lane to an already installed, read-only MSYS2 CLANG64 plus Rust/Cargo environment whose versions and paths can be hashed and recorded.
  2. Provide a portable, checksum-frozen toolchain archive inside the new resume directory.
  3. Provide a user-built Windows Carcara 1.1.0 binary plus a cvc5-capable compiler environment.
  4. Authorize a Linux/WSL execution environment while retaining all artifacts under `D:\project\writing\reserch` and using no E-drive path.

## Minimum user action

- What the user should provide, approve or place: provide one accepted toolchain form above, or explicitly authorize a bounded portable MSYS2 CLANG64 + Rust 1.72 acquisition into the new resume directory.
- Exact destination or handoff method: `D:\project\writing\reserch\stages\stageA\CVC5-ALETHE-SHAREMAP\resume1\toolchain\` (create only after mainline issues a `RESUME_FROM_BLOCKER` assignment).
- Preferred executable paths after placement: `resume1\toolchain\msys64\clang64\bin\clang++.exe`, `cmake.exe`, `ninja.exe` or `usr\bin\make.exe`, `resume1\toolchain\rust\bin\rustc.exe`, `cargo.exe`, and `resume1\toolchain\carcara\carcara.exe`; equivalent paths must be declared in the resume handoff.
- Safe verification command/read-only check: resolve `bash`, `clang++`, `cmake`, `make` or `ninja`, `rustc`, and `cargo`; print versions; compute SHA-256 of every executable/archive; then build a no-change cvc5 smoke target and run `carcara --version` before applying the frozen candidate patch.

## Resume contract

- Frozen contract SHA-256: `27CDF36933F93B0C096AA73DA6A9DC49505872B0D0A7A565EE959F5EF7331FA3`
- New resume directory; never overwrite failure record: `stages\stageA\CVC5-ALETHE-SHAREMAP\resume1`
- First command after unblocking: toolchain version/hash audit, followed by an unmodified cvc5 1.3.4 fixed-witness build/replay and Carcara smoke check. Do not start the 60-instance corpus until the full preclaim gate passes.
- Resource/time/device ceiling: `<=4 GiB`, `<=4 CPU-hours`, CPU only, no GPU or exclusive device.

## Work already performed and cost

- Network bytes/time: acquired 62,308,703 bytes of official cvc5/Carcara/Alethe assets; four downloads completed in about 26 seconds after approved transport escalation. In-sandbox curl had `SEC_E_NO_CREDENTIALS`; approved official downloads succeeded, so network is not the remaining blocker.
- CPU/storage/device use: 130 native cvc5 fixed-witness executions consumed `4,821,824,600 ns` summed child wall time (about 4.82 s); current package before final reports was 302,394,432 bytes across 7,376 files; no GPU/device use.
- What was explicitly not executed: no printer-side candidate build, no Carcara check, no candidate proof, no expanded-AST equivalence claim, no coupling/decomposition claim, no 60-instance natural corpus, no Stage B, no formal large-scale experiment, and no project/shared-control write.
