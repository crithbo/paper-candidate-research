# AIGER-DELTA-SCHEDULE Command Log

- Assignment: `STAGEA-L1-20260810-AIGER-DELTA-SCHEDULE-INITIAL-R3P0`
- Write root: `D:\project\writing\reserch\stages\stageA\AIGER-DELTA-SCHEDULE\initial`
- Shell: Windows PowerShell
- Network download: none
- Natural corpus execution: none
- Claim-bearing execution: none

## Input and manifest verification

1. Read `AGENTS.md`, `plan.md`, `registry.yaml`, `rules\ROLE_CANDIDATE_OWNER.md`, the academic-research-suite instructions, the frozen Discovery brief/handoff/manifest, both complete Stage0 packages, and the owner templates.
2. `Get-FileHash -Algorithm SHA256` independently matched Discovery `4/4`, PRIMARY `4/4`, and confirmation `2/2`. Manifest-self hashes matched the registry freeze.

## Resource probes

The following read-only probes were run before any natural or claim-bearing work:

```powershell
Get-Command git,cmake,make,gcc,g++,clang,clang++,python,py,node,curl,tar,7z
Get-Command yosys,abc,aigtoaig,aigstrip,aigsim,aigunroll,tcc,clang-cl,cl,msbuild
py -0p
wsl --status
wsl --list --verbose
```

Observed:

- available: Git `2.53.0.windows.3`, Node.js `v24.15.0`, Windows `tar`;
- unavailable: CMake, Make, GCC/G++, Clang/Clang++, MSVC/Build Tools, TCC, Python runtime, Yosys, ABC, and AIGER executables;
- `py -0p`: `No installed Pythons found!`;
- WSL executable exists but no distribution/platform is installed; its message asks for `wsl.exe --install`, which is prohibited by the assignment;
- Docker and Podman are unavailable;
- CIM OS/CPU/RAM queries failed with `Access denied`; this does not affect the blocker determination.

## Official endpoint probe

Command form:

```powershell
git ls-remote <official-github-repository> <frozen-commit>
```

Targets were the official AIGER, Yosys, and ABC GitHub repositories. The sandboxed attempt failed for all three with:

`schannel: AcquireCredentialsHandle failed: SEC_E_NO_CREDENTIALS (0x8009030e)`

The required elevated read-only retry was approved. All three repository endpoints then returned exit code `0`, but the raw-SHA query emitted no matching ref line. Therefore this attempt establishes endpoint/TLS reachability outside the sandbox only; it does not independently re-prove the commit objects. No clone, archive, binary, package, or HWMCC bytes were downloaded.

## Non-claim-bearing witness control

First run:

```powershell
node scripts\witness_control.js
```

Result: exit `1`, `ReferenceError: minDeltaBytes is not defined` at output formatting. No scientific observation was produced. The local script was corrected without changing the frozen object, workload, recurrence, or comparator contract.

Second run, identical command: exit `0`.

- legal schedules: `48`;
- S1: `12` payload B, `36` whole-file B, SHA-256 `C532E0AC5A22E4733A0759B937EABB2DB9B488038FA2847FEA7E017D670C9A9D`;
- S2: `13` payload B, `37` whole-file B, SHA-256 `18D5067D33E3D44113D322814829326503ED9D6BC9C531541FB3DD3FE19F4A6C`;
- structural identity: `48/48` under the independent control parser;
- wall: `6,836,100 ns`; user CPU `15,000 us`; system CPU `0 us`; peak RSS `40,374,272 B`; emitted AIGER bytes `73 B`.

This control is explicitly `CODEC_OR_IMPLEMENTATION_CONTROL__NON_CLAIM_BEARING`. Native reader validation remains false.

## Stop boundary

No compiler/toolchain bundle and no exact pinned native executables are present. Building the complete exact-pinned AIGER/Yosys/ABC union would require a portable build environment or a prebuilt bundle not currently authorized/provided. Per the owner rule, execution stopped before HWMCC acquisition and before any candidate/natural claim-bearing observation.
