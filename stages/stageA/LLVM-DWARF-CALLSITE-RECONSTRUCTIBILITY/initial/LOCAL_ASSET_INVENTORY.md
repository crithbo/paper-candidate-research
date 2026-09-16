# Local asset inventory

Observation time: `2026-08-14T11:26:47.3097323+08:00`.

This is a resource/provenance inventory, not a witness run and not scientific evidence about the candidate.

## Required exact route

The frozen route requires LLVM commit `e72ba6cf366a3180cbf5a8690d9e50665880ab76`, an X86-enabled native writer/verifier and native DWARF/object readers, plus a way to validate the `x86_64-unknown-linux-gnu` executable/ABI observation. No locally discoverable asset satisfies that conjunction.

## Read-only observations

| Asset | Version/provenance observation | Bytes | SHA-256 | Disposition |
|---|---|---:|---|---|
| `LLVM-BITCODE-ABBREV-PLANNER/.../clang.exe` | LLVM 22.1.8, upstream identity printed as `ca7933e47d3a3451d81e72ac174dcb5aa28b59d1`, Windows MSVC host | 108434432 | `8BBE086DFB0F9543A41EC470EEFFFE42FE15A29D40E88D4BA5DD068B0A05C63D` | commit mismatch; not executed on witness |
| `WEBGRAPH-REFERENCE-FOREST/.../llc.exe` | LLVM 22.1.8, MSYS2 identity `6e4e79c2f86eeb534e324e583f2057dc9fd5ecab`, X86 target present | 270336 | `FF7C49B4B021AC9E71C1C5E0220324D8FA2BE40FAEFEAFE8F7C2B82ADEED5A04` | commit mismatch; not executed on witness |
| `WEBGRAPH-REFERENCE-FOREST/.../llvm-dwarfdump.exe` | LLVM 22.1.8 | 275968 | `0B6C298ACC4E3E922540FCE71D44875DCB8892B30A7B9621C5068E3C783A5220` | commit mismatch; not executed on witness |
| `S5-OCCUPANCY-CLIFF-JOINTCODEGEN/resume3-r3d/verified/tools/llc.exe` | LLVM 24.0.0git assertions build; recorded source commit `1f112d62e1fa2c4f1a04887abd72da1ed61cf791`; registered targets only AMDGPU/R600 | 102064128 | `50B2889F0BE87D5FB0B9F11AE9C35A2A6A5745DFB723F4060A27D5C686C79C24` | wrong commit and no X86 target |
| only located `DwarfDebug.cpp` source copy | under source archive directory named for `1f112d62e1fa2c4f1a04887abd72da1ed61cf791` | 173205 | `0CE7A207AD47A4CB4F26E10896C07DA8DABB5FBF082AA8B6855EE445E7DA0F8D` | wrong commit; cannot close exact-pin source audit |

Additional observations:

- `clang`, `llc`, and `llvm-dwarfdump` are absent from `PATH`.
- A workspace file-name scan found zero paths containing the exact frozen commit.
- The only located copies of `DwarfDebug.cpp`, `LiveDebugValues.cpp`, and `X86RegisterInfo.cpp` belong to the different `1f112d…` source archive.
- `HKCU\Software\Microsoft\Windows\CurrentVersion\Lxss` is absent, and `wsl.exe` reported that WSL is not installed. No existing local Linux execution route was found.
- Network requests, downloads, source builds, installations, environment edits, and witness inputs were all zero.

## Why substitution is invalid

The action boundary depends on the exact pinned allocator, debug lifecycle, `DwarfDebug` recognizer and target hooks. A 22.1.8 or different LLVM-main build could accept, reject, or print a different MIR/DWARF action and therefore cannot establish either fidelity-gate PASS or a scientific STOP. Likewise, the AMDGPU-only exact build for another candidate cannot materialize the frozen X86 witness.

