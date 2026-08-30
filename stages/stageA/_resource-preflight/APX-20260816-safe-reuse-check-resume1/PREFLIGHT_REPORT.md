# APX exact-asset safe-reuse preflight — resume1

## Outcome

`PREFLIGHT_COMPLETE__LARGE_OR_HEAVY_RESOURCE_REQUEST_REQUIRES_MAINLINE_REVIEW`

No existing workspace or standard preinstalled asset can be proven to be an unmodified LLVM build/source tree at exact commit `a1194be1baefa99d20a09bd04b16056be0ab7225` with APX and MachineVerifier-capable X86 code generation. The next legal route therefore exceeds the user's autonomous-safe threshold and requires a newly frozen mainline resource assignment.

This is a resource-preflight result only. It does not support PASS, STOP, reserve, archive, novelty, correctness, or performance inference.

## Control and scope closure

- Assignment SHA-256: `1C0FF7656CA5083BF34092CF2DD27026A56B6D8565B5BE81253AEDF5FF18FA78` — PASS.
- Frozen AGENTS, plan, registry and candidate-owner hashes: PASS `4/4` both before and after inventory.
- Prior plan-drift handoff/manifest: `4F1D5CBB…A125F` / `059F6D07…50D32` — PASS; used only as mechanical provenance.
- Network: `0 bytes`; no request attempted.
- No copy, extraction, build, compile, link, LLVM tool execution, LLVM test, claim-bearing observation, system/WSL/PATH/registry change, or shared-control modification.
- No RVV/PPC material was read.

## Read-only inventory result

### Exact-commit source/provenance search

- A workspace-wide fixed-string scan for the 40-hex pin found only control, Stage0/StageA reports, and acquisition-script references. It found no asset manifest, source archive, build provenance, or executable bound to the pin.
- No workspace file or directory path contains the exact pin as an asset identity.
- No `llvm-project*.tar.gz`, `.tgz`, `.tar.xz`, or `.zip` source archive was found by filename inventory.
- Hidden Git-head inventory found only one LLVM checkout, under the older S5 directory. Its `HEAD` points to `refs/heads/master`, but that ref is absent; read-only `git rev-parse HEAD` failed with `unknown revision`. It is not an exact source asset.

### Existing `llc.exe` candidates

| Existing path | Bytes | Static provenance | Disposition |
|---|---:|---|---|
| `stages/stageA/LLVM-DWARF-CALLSITE-RECONSTRUCTIBILITY/resume1/build/bin/llc.exe` | 78,334,976 | exact commit `e72ba6cf366a3180cbf5a8690d9e50665880ab76`; SHA-256 `7773641C…F5844` in its build provenance | reject: wrong commit |
| `stages/stageA/S5-OCCUPANCY-CLIFF-JOINTCODEGEN/resume3-r3d/verified/tools/llc.exe` | 102,064,128 | exact commit `1f112d62e1fa2c4f1a04887abd72da1ed61cf791`; SHA-256 `50B2889F…9C24` | reject: wrong commit |
| `stages/stageA/S5-OCCUPANCY-CLIFF-JOINTCODEGEN/resume3-r3d/build/attempt2/bin/llc.exe` | 102,064,128 | build-tree copy of the same `1f112d62…` tool | reject: wrong commit and duplicate identity |
| `stages/stageA/RISCV-ZCMP-CALLEESAVE-PUSHLIST-PARETODP/resume1/b/bin/llc.exe` | 90,613,760 | exact commit `ba5bccfe01368f76e74d6ff4c35f1330e155b4ba` | reject: wrong commit |
| `stages/stageA/WEBGRAPH-REFERENCE-FOREST/toolchain/msys64/clang64/bin/llc.exe` | 270,336 | MSYS distribution wrapper; no `a1194…` commit binding | reject: no exact-commit provenance |
| `stages/stageA/CVC5-ALETHE-SHAREMAP/resume1/toolchain/msys64/clang64/bin/llc.exe` | 270,336 | MSYS distribution wrapper; no `a1194…` commit binding | reject: no exact-commit provenance |

Other workspace LLVM executables were present only inside the same non-exact toolchains. They cannot be combined across commits to manufacture an exact APX toolchain.

### Preinstalled locations

- `llc` was absent from PATH; `where.exe llc` returned no file.
- No `llc.exe` was found under the bounded standard roots `C:\Program Files`, `C:\Program Files (x86)`, `C:\Users\15383\AppData\Local\Programs`, or `D:\tools`.
- Standard LLVM and Visual Studio LLVM directories checked under `C:\Program Files` did not exist.
- Git was present, but Git alone is not the required resource.

No discovered binary was executed for `--version`, help, APX assembly, MachineVerifier, or any witness. APX/MachineVerifier capability therefore remains untested, as required by this preflight's prohibition; lack of exact identity was already decisive.

## Minimum exact resource request

Mainline should freeze one new resource-only assignment for an unmodified minimal Windows X86 build at the exact pin. The smallest evidenced route is:

### Official identity and source

- Commit metadata: `https://api.github.com/repos/llvm/llvm-project/commits/a1194be1baefa99d20a09bd04b16056be0ab7225`
- Source archive: `https://github.com/llvm/llvm-project/archive/a1194be1baefa99d20a09bd04b16056be0ab7225.tar.gz`
- License: `Apache-2.0 WITH LLVM-exception`; retain `LICENSE.TXT` and required notices.
- Required provenance: immutable 40-hex resolution and GitHub verification status from the official commit response; actual archive byte count and locally computed SHA-256 before extraction. No archive hash is invented here.

The exact archive size is currently unknown because network access was forbidden. Two already verified neighboring LLVM exact-commit archives in this workspace measured `279,920,943` and `280,594,592` bytes. They justify the following authorization envelope without claiming an exact APX archive size:

| Resource | Requested hard ceiling |
|---|---:|
| One source-archive response | `335,544,320` bytes (320 MiB) |
| Commit metadata plus total network | `336,592,896` bytes (321 MiB) |
| New persisted high-water storage | `6,442,450,944` bytes (6 GiB) |
| CPU | `7,200` CPU-seconds (2 CPU-hours) |
| Wall | `7,200` seconds (2 hours) |
| Parallel build jobs | `2` |
| Clean builds | `1`; at most one corrected reconfigure before compilation, no source patch |

The single expected archive is above the autonomous `256 MiB` per-file boundary and the build high-water is above `2 GiB`, so action must not begin without this explicit resource authorization.

### Build contract

- Process-local portable bootstrap only; no system install or global environment change.
- Mainline must explicitly register/authorize reuse of the already hashed portable bootstrap, or provide equivalent pinned inputs. Existing evidenced versions are CMake `4.4.2` (`414AD2A5…70E8`), Ninja `1.13.2` (`E52A7AD9…47B8`), and LLVM-MinGW Clang `22.1.8_ca7933e…` (`A8B7A614…E85`). Cross-topic files must not be silently treated as shared assets.
- CMake: `Release`, assertions enabled, `LLVM_TARGETS_TO_BUILD=X86`, Clang enabled, optional external dependencies disabled where legal, no source/lock/test modification.
- Required build outputs: `llc`, `llvm-mc`, `llvm-objdump`, `llvm-readobj`, `opt`, `FileCheck`, Clang, and generated LLVM lit/MIR support needed by the frozen preclaim contract.
- Build only; do not run candidate, natural inputs, benchmark, or Stage B.

The budget is grounded by an existing exact X86+Clang assertions build in this workspace: official archive `280,594,592` bytes, measured pre-report high-water `4,761,703,433` bytes, two build jobs, successful build wall `2,284.686 s`, and a conservative recorded bound below two CPU-hours. That build is at another commit and is evidence only for budgeting, not reusable scientific or executable identity.

### Required resource-gate checks in the future assignment

1. Validate official commit identity/verification, response byte count, archive byte count, SHA-256, safe members, and license before extraction/use.
2. Establish exact decisive-source parity for APX MC definitions, X86 APX form selection, register information, MachineVerifier path, and relevant tests.
3. Freeze CMake cache, Ninja graph, build command, bootstrap hashes, output sizes/hashes, and runtime DLL hashes.
4. Only if separately authorized, run non-claim-bearing version/registered-target/APX MC/MachineVerifier stock smokes.
5. Stop after resource-gate handoff unless mainline separately restores the original Stage A preclaim contract.

Accepted alternative: the user may instead provide an unmodified Windows x86-64 prebuilt bundle at the exact commit containing the required tools, together with byte sizes, SHA-256 hashes, official provenance, build configuration, commit-binding proof, and license files. A release/version-only binary is not sufficient.

## Audit notes and costs

- One read-only `git rev-parse HEAD` against the incomplete S5 checkout returned an expected identity failure; no file changed.
- Two aggregate PowerShell command-discovery forms emitted no records and were superseded by `where.exe`, direct path checks, and file enumeration; no tool under test was executed.
- Exact process-tree CPU and peak RSS were not provided by this environment and are not estimated. The visible read-only command wall time stayed within the 900-second assignment ceiling.
- Claim-bearing observations: `0`.
- Scientific revision consumed: `false`.
- Stage B authorized or started: `false`.
- Evidence ceiling: `RESOURCE_PREFLIGHT_ONLY__NO_SCIENTIFIC_INFERENCE`.
- Lane after canonical handoff: `IDLE_REUSABLE`.

