# Local asset inventory

This inventory is provenance evidence only. No local non-exact tool was run on the witness.

## Exact metadata closure

The official metadata route resolved `ba5bccf` to `ba5bccfe01368f76e74d6ff4c35f1330e155b4ba` and pinned 13 decisive RISC-V blobs. See `OFFICIAL_METADATA_PIN.yaml`.

## Source-content parity available locally

The only local LLVM source tree is labeled commit `1f112d62e1fa2c4f1a04887abd72da1ed61cf791`. Independent `git hash-object` checks against the official pinned blob IDs gave 11/13 matches:

- Matching: `RISCVExpandPseudoInsts.cpp`, `RISCVFrameLowering.cpp/.h`, `RISCVMachineFunctionInfo.cpp/.h`, `RISCVPostRAExpandPseudoInsts.cpp`, `RISCVPushPopOptimizer.cpp`, `RISCVRegisterInfo.cpp/.h/.td`, and `RISCVTargetMachine.h`.
- Mismatching decisive files:
  - `RISCVInstrInfoZc.td`: required `f802748a5a1dc9c79577896eed4351796ce6ed8f`, local `1beb710e5cdd83227e0a8bdc7d49204692d09061`.
  - `RISCVTargetMachine.cpp`: required `e5ebd2a071d05e147b6bc24cb5e9378bbffabd97`, local `517e48faa104348f5ae22bed6001cfe8deb500a8`.

Therefore the local source cannot be represented as a complete exact-commit source set. No missing blob content was fetched because the assignment permits metadata only.

## Executable toolchains

| Asset | Observed version/target | Representative SHA-256 | Disposition |
|---|---|---|---|
| MSYS2 all-target `clang` | LLVM 22.1.8; package commit `6e4e79c…` | `0054204BC07618CBC06442813B648F396A001B5965C06A3A7D11CDBB29327EA3` | commit mismatch |
| MSYS2 all-target `llc` | LLVM 22.1.8; RISC-V targets present | `FF7C49B4B021AC9E71C1C5E0220324D8FA2BE40FAEFEAFE8F7C2B82ADEED5A04` | commit mismatch |
| MSYS2 `llvm-mc` | LLVM 22.1.8; RISC-V targets present | `5B41F5DA3BD609DDC3030418FFE0656B577179ACD31C2B77E17EB72F8D49129E` | commit mismatch |
| MSYS2 `llvm-readobj` | LLVM 22.1.8 | `040C4CB0740D2A9D9F7B488BC676C0406EB12C7B349ACBA1797C2F58865087CB` | commit mismatch |
| MSYS2 `llvm-objdump` | LLVM 22.1.8; RISC-V targets present | `CA0C43A3D4419A6DDAD3B74AF58ABD9C43B9CF9424B825FADF95C9B4D5399BD0` | commit mismatch |
| MSYS2 `ld.lld` | LLD 22.1.8 | `373C7B9FDF5736F4400571E73E991EB055DD4F9742B7D8F3B53EEBACF4632AF1` | commit mismatch |
| custom assertions `llc` | LLVM 24.0.0git, source commit `1f112d…`, AMDGPU/R600 targets only | `50B2889F0BE87D5FB0B9F11AE9C35A2A6A5745DFB723F4060A27D5C686C79C24` | wrong commit and no RISC-V target |

`clang`, `llc`, `llvm-mc`, `llvm-readobj`, `llvm-objdump` and `ld.lld` are absent from PATH. A filename scan found no local source/archive/tool path containing the resolved full commit.

## Fidelity consequence

LLVM 22.1.8 may have RISC-V and Zcmp support, but its allocator, grammar, frame lowering, CFI, pseudo expansion and reader behavior are not the frozen commit. It cannot establish Plan P/Plan S legality, current-union coverage, PASS or STOP. The local LLVM 24 assertions build cannot target RISC-V. Both remain unexecuted controls.

