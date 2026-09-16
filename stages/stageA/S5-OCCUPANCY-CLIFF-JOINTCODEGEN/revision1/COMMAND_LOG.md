# Revision 1 Command Log

All writes were confined to `<LEGACY_LOCAL_PROJECT_ROOT>\stages\stageA\S5-OCCUPANCY-CLIFF-JOINTCODEGEN\revision1\`. No Stage B command, GPU command, or shared-project mutation was issued.

## Pre-execution checks

| Check | Result |
|---|---|
| Registry authorization | `STAGEA_REVISION1_ACTIVE`; 4 GiB / 4 CPU-hours; Stage B false |
| Existing revision directory | absent before this run |
| Native `llc`, `FileCheck`, `llvm-calc-occupancy` | absent |
| Native build tools | CMake, Ninja, MSVC, clang-cl, GCC, Zig absent |
| Container/WSL route | no usable WSL distribution, Docker, or Podman |
| GitHub exact-period LLVM CI | build existed, but published artifacts were small test-result artifacts, not a reusable toolchain |
| Git HTTPS | bundled Git with `http.sslBackend=openssl` can contact GitHub |
| Frozen inputs | `REVISION_EXPERIMENT_CONTRACT.yaml`, `SOURCE_MANIFEST.yaml`, and `PREACQUISITION_MANIFEST.sha256` verified before execution |

## Executed command

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "<LEGACY_LOCAL_PROJECT_ROOT>\stages\stageA\S5-OCCUPANCY-CLIFF-JOINTCODEGEN\revision1\scripts\build_exact_toolchain.ps1" -RevisionRoot "<LEGACY_LOCAL_PROJECT_ROOT>\stages\stageA\S5-OCCUPANCY-CLIFF-JOINTCODEGEN\revision1"
```

## Failure

The first bootstrap download terminated with exit code 1. Exact stderr core:

```text
urllib.error.ContentTooShortError: <urlopen error retrieval incomplete: got only 187480016 out of 187504083 bytes>
download failed: https://github.com/mstorsjo/llvm-mingw/releases/download/20260616/llvm-mingw-20260616-ucrt-x86_64.zip
```

The script stopped at `Download-Verified`; it did not proceed to hash acceptance, extraction, wheel installation, source checkout, configuration, build, corpus fetch, experiment, verifier, or replay. Per the frozen no-retry rule and experiment-agent safety boundary, no automatic retry was made.

## Full-cost observation

| Cost item | Observed |
|---|---:|
| Partial download | 187,480,016 bytes |
| Partial SHA-256 | `a8155db381a8dd945cd68fe009565a967d3ba5ec28442ddc7ce8d844f750afcb` |
| Total revision directory after failure | 187,497,398 bytes (178.81 MiB) |
| Observed command wall time | approximately 60 seconds |
| CPU time | not measured; no compilation began |
| Peak storage | 187,497,398 bytes, below 4 GiB |
| Source checkout/build/corpus bytes | 0 |
| Exclusive hardware/GPU use | none |

The frozen source manifest recorded the release-page rounded size as 187,695,104 bytes; the downloader's HTTP length was 187,504,083 bytes. This discrepancy is disclosed. The authoritative acceptance condition was the published SHA-256, and it was never satisfied.

## Read-only collision checks

- GitHub exact-commit source read confirmed `GCNSchedStrategy` already exposes occupancy/latency bias, AMDGPU pressure trackers, high-register-pressure rescheduling, and critical/excess pressure thresholds.
- Current LLVM documentation confirms `llvm-calc-occupancy` uses the backend's own occupancy math.
- Bounded search found no exact fixed-budget multi-bank joint schedule/allocation certificate; status remains `SEARCH_BOUNDED_OPEN_WITH_DIRECT_SUBTRACT`.

