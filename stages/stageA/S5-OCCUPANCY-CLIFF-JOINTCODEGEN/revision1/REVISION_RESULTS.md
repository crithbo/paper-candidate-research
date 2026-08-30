# S5-OCCUPANCY-CLIFF-JOINTCODEGEN Revision 1 Results

## Outcome

- Acquisition: `FAILED_FAIL_CLOSED`
- Exact-commit toolchain: `NOT_OBTAINED`
- Complete natural MIR: `0 / 8 required`
- Real current LLVM baseline runs: `0`
- Verifier-legal candidate runs: `0`
- Non-dominated tier/spill/compile-cost points: `0`
- Double replay: `SKIPPED_BLOCKED_BEFORE_EXPERIMENT`
- Result meaning: resource/acquisition failure only; neither positive nor negative mechanism evidence
- Recommendation: `RESERVE_RECOMMENDED`

## Frozen acquisition result

The pre-acquisition manifest verified four immutable files before the command ran. The first asset was the published `llvm-mingw-20260616-ucrt-x86_64.zip`, used only as a bootstrap compiler. GitHub/Python reported a 187,504,083-byte transfer, but only 187,480,016 bytes arrived. The 24,067-byte shortfall triggered `ContentTooShortError` and exit code 1.

The partial file is preserved as failure evidence:

- bytes: 187,480,016
- SHA-256: `a8155db381a8dd945cd68fe009565a967d3ba5ec28442ddc7ce8d844f750afcb`
- expected publisher SHA-256: `b9b68a4d276e16fa25802aaba458e4638f64b3884c290aaccdc2d87083b6ca35`

It was not extracted or accepted. No approximate LLVM version was used.

## Gate ledger

| Gate | Required | Observed | Disposition |
|---|---|---|---|
| Exact LLVM commit | executable tools from `1f112d62…` | no source checkout/build | blocked |
| Same subtarget/wave | `amdgpu11.00`, wave32 | no MIR execution | blocked |
| Same allocator | greedy | no MIR execution | blocked |
| Natural corpus | 8–16 complete public source-derived MIR | 0 | blocked |
| Current staged baseline | real GCNSchedStrategy + greedy | 0 runs | blocked |
| Candidate | actual bounded frontier + greedy | 0 runs | blocked |
| Legal verifier | every output passes | no outputs | blocked |
| Pass evidence | ≥1 replayable tier/spill improvement | none | not met |
| Replay | two exact non-timing replays | skipped | not met |

## Full cost

The failed command consumed approximately 60 seconds wall time, 187.48 MB of network transfer, and a peak candidate-directory size of 187,497,398 bytes (178.81 MiB). No compilation or GPU work began, so compile CPU-hours, build memory, and experimental compile cost are zero/not applicable rather than estimated.

## No-gain and failure region

There is no workload-level no-gain region because no legal MIR was produced. The observed failure region is infrastructure-specific: a large GitHub release asset was truncated during the only authorized no-retry acquisition attempt. Small Git/PyPI metadata requests had succeeded, so the failure cannot be generalized to all network access.

## Collision result

[Frozen LLVM GCNSchedStrategy source](https://github.com/llvm/llvm-project/blob/1f112d62e1fa2c4f1a04887abd72da1ed61cf791/llvm/lib/Target/AMDGPU/GCNSchedStrategy.cpp) already implements multi-stage occupancy/pressure scheduling and exposes bias/tracker controls. [Current LLVM occupancy-tool documentation](https://www.llvm.org/docs/CommandGuide/llvm-calc-occupancy.html) states that the tool uses the backend's occupancy math. These remain direct subtractors against broad claims. No exact fixed-budget joint certificate was found in the bounded scan, but the scan is not complete enough for Stage B.

## Evidence ceiling

`RESOURCE_ACQUISITION_FAILURE_ONLY`. There is no analytical result beyond source/design inspection, no trace result, no exact software result, no AMD GPU result, and no hardware result.

