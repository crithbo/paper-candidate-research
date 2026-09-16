# Results

## Outcome

`BLOCKED_USER_ACTION_REQUIRED` before the first claim-bearing observation. Exact LLVM tools and the official natural corpus asset are ready, but the frozen natural-input fidelity gate is not closed. This is not a scientific negative result.

## Resource results

| Item | Result |
|---|---|
| Exact LLVM commit provenance | PASS; GitHub valid signature and immutable codeload hash |
| Exact `llc` | PASS; SHA-256 `50B2889F...C79C24` |
| Exact `FileCheck` | PASS; SHA-256 `90F1D7D8...35ABF0` |
| Exact `llvm-calc-occupancy` | PASS exact tool; SHA-256 `155A59D3...A1A3A` |
| Exact Clang frontend | PASS; SHA-256 `6433C426...3874` |
| Official ROCm examples commit | PASS asset/provenance/license |
| Small legality/equality witness | PASS, four variants verifier-legal and byte-identical |
| Frozen 8–16 natural complete MIR set | FAIL CLOSED; five source directories reached valid device IR, one complete MIR witness, minimum eight not reached |

## Small witness only

The `module_api/module.hip` witness was compiled to natural AMDGPU IR and exact pre-scheduler MIR. Baseline and the three frozen flag variants all exited zero under MachineVerifier, reported occupancy 16 and produced identical 9,504-byte MIR (`53FB0FF1...016B3`). This result validates command/object parity only. It was deliberately not counted as evidence about natural occupancy cliffs or candidate benefit.

## Scientific results

- Baseline corpus runs: 0
- Candidate corpus runs: 0
- Claim-bearing observations: 0
- Double replays: 0
- Scientific revision consumed: false
- Scientific decision: none
- Evidence ceiling: `RESOURCE_FAILURE_ONLY__NO_SCIENTIFIC_INFERENCE`

## Cost

Official archives total 328,925,998 bytes. Measured configure/build wall time was 2,312.358 seconds; a conservative two-job CPU upper bound is 1.285 CPU-hours. Directory usage before final reports/manifest was 5,674,061,442 bytes (5.2844 GiB), below the 12 GiB ceiling. No GPU or exclusive resource was used. Peak RSS was not captured and is reported as missing, not estimated.
