# Resource Unblock Report — CVC5 resume2 R2BC

## Outcome

`resource_ready: false` and `BLOCKED_USER_ACTION_REQUIRED`.

The official GitHub release API for `carcara-1.1.0` lists one binary asset:
`carcara-linux`, 5,402,048 bytes. It publishes no Windows x86_64 executable.
The D-root filename-only scan and registry contain no supplied `carcara.exe`,
byte count, SHA-256 or build provenance. Therefore the Windows checker resource
contract cannot pass.

The release tag resolves to commit
`5d817d86bd18ea2a850a580d602f17f36959ee99`; GitHub reports its commit
verification as valid. The official repository license API reports Apache-2.0.
These provenance facts close metadata only; they do not manufacture the missing
Windows executable.

## Component results

| Component | Result | Evidence |
|---|---|---|
| Release/tag provenance | PASS | Official release API, exact verified commit |
| License | PASS | Official repository API: Apache-2.0 |
| Windows x64 asset availability | **FAIL_CLOSED** | No official release asset and no supplied incoming file |
| Exact binary bytes/SHA-256 | NOT AVAILABLE | No file exists |
| Unmodified version/help | NOT RUN | No executable exists |
| Stock checker smoke | NOT RUN | No executable exists |
| Resource readiness | **false** | Required conjunction is incomplete |
| Automatic StageA resume | NOT TRIGGERED | R2C requires resource PASS |

The Linux asset was not downloaded or executed because it is outside the frozen
platform contract. The old resume1 source build was not retried, patched or
feature-modified; R2B authorizes acquisition/receipt of the unmodified Windows
asset, not another build-route experiment.

## Cost and safety

- Network payload: `0 B` (official metadata queries only)
- New executable/archive payload: `0 B`
- CPU-intensive work: none
- GPU/exclusive device: none
- System/global modification: none
- Writes: resume2 only
- Claim-bearing observation: false
- Scientific revision consumed: false
- StageB: false

Evidence ceiling is `RESOURCE_FAILURE_ONLY__NO_SCIENTIFIC_INFERENCE`. This
failure says nothing about the candidate, native threshold union, exact expansion,
Carcara correctness on a future valid binary, natural action rate or full-cost
Pareto residual.

