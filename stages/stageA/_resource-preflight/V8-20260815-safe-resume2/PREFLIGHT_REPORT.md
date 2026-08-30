# V8 safe-resume2 resource preflight

## Outcome

`PREFLIGHT_COMPLETE__LARGE_RESOURCE_REQUEST_REQUIRES_MAINLINE_REVIEW`

The ordinary exact-commit Windows x64 route remains technically feasible, but it is not safe-autonomous under this assignment. The host has adequate CPU, RAM, NTFS disk and free space, yet no Visual Studio C++/MFC/ATL installation, Windows SDK, GN/Ninja, exact `d8`, exact `mksnapshot`, or candidate-capable V8 source/build was found.

The inherited bounded route requests 35 GiB network, 120 GiB workspace high-water, 24 CPU-hours and six wall-hours. These exceed the automatic 512 MiB cumulative download, 2 GiB persisted-data, one CPU-hour and two wall-hour limits. The assignment therefore stops before any V8 body download or build and freezes `NEXT_RESOURCE_REQUEST.yaml` for mainline review.

## Continuity and integrity

- Assignment SHA-256: `BBF0DBED2BA7DCFB4E9B934F604089F5D363C677B76509940FABBD868210ED34`.
- Control table SHA-256: `560E0733D320CC5E968A7B0103F6723C56DA96F2E6098E82A4544BB869C4A61E`; all listed candidate-lane controls matched.
- R3F1 manifest: 9/9 PASS, SHA-256 `A322EB7AE1DFA8411695B027C93B2668DCE1D3C1C95567508CE47761DC42C2FF`.
- Initial manifest: 10/10 PASS, SHA-256 `416B9CA75C5AAC97F6FF8D63A3509021949BADBCDB995C83EBD877D1C1A1D301`.
- No AIGER/RocksDB queue material was read.

## Current host

- Windows x64 `10.0.26200.0`, 32 logical processors, 31.69 GiB RAM.
- D: NTFS, 287.13 GiB free; 17.78 GiB less than R3F1 reported, but still above the requested 120 GiB high-water.
- `vswhere`, VS 2022/2026 standard roots, Windows Kits roots, `cl`, `clang-cl`, `link`, `msbuild`, GN, Ninja and CMake were absent.
- `py.exe` exists but reports no installed Python interpreters.
- Git 2.53.0.windows.3 is available.
- Node 24.15.0 embeds V8 13.6.233.17-node.48; it is not established as commit `c635f0d...` and has no candidate-capable `mksnapshot` path.
- The two authorized read-only input directories contain no V8 source files or candidate binaries.

## Official-route reconciliation

The official V8 workflow still requires source checkout, `gclient sync`, GN generation, Ninja compilation and tests. Current Chromium Windows documentation continues to require Windows x64, at least 8 GiB RAM, more than 16 GiB recommended, at least 100 GiB free NTFS storage, and Visual Studio 2026 with Desktop C++ plus MFC/ATL.

R3F1 recorded a more specific VS/SDK combination than the currently surfaced HEAD documentation. A future exact build must therefore audit the exact checkout's build scripts and effective toolchain rather than silently choosing either mutable documentation snapshot. This does not change the V8 commit or scientific object.

Official references:

- https://v8.dev/docs/build
- https://v8.dev/docs/build-gn
- https://chromium.googlesource.com/chromium/src/+/master/docs/windows_build_instructions.md
- https://chromium.googlesource.com/v8/v8.git

## Threshold decision

| Dimension | Safe autonomous limit | Frozen route request | Result |
|---|---:|---:|---|
| Cumulative download | 512 MiB | 35 GiB | STOP before action |
| New persisted data | 2 GiB | 120 GiB high-water | STOP before action |
| CPU | 1 hour | 24 CPU-hours | STOP before action |
| Wall | 2 hours | 6 hours | STOP before action |
| System/global mutation | Forbidden | Local prerequisite absent; install would be needed unless user provides it | STOP before action |

Exact transfer bytes cannot be known before the Git/gclient closure is materialized; the ceiling is deliberately conservative. Single-response size below 256 MiB also cannot be guaranteed. This uncertainty is a reason for explicit authorization, not a reason to execute speculatively.

## Evidence boundary

- V8 body/archive/CAS/toolchain download: none.
- Source checkout/build: none.
- Candidate/baseline/natural experiment: none.
- Claim-bearing observations: 0.
- Scientific revision consumed: false.
- Scientific inference: none.
- Evidence ceiling: `RESOURCE_AND_ROUTE_PREFLIGHT_ONLY__NO_SCIENTIFIC_INFERENCE`.
- Stage B: false.

Recommended next step: mainline reviews `NEXT_RESOURCE_REQUEST.yaml`. If approved, it must create a new unique resume directory with a frozen large-resource envelope; this preflight directory remains immutable.
