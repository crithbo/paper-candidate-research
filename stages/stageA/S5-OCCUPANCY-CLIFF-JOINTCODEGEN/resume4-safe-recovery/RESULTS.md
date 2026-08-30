# Results

## Outcome

`RESOURCE_RECOVERY_PASS__PRECLAIM_FIDELITY_PASS`. The frozen minimum is closed with eight complete natural gfx1100/wave32 pre-machine-scheduler MIR objects from eight distinct directories of the official ROCm examples commit. No synthetic input, source trimming, source patch, fake API, candidate run, baseline run, or Stage B work occurred.

## Decisive checks

| Check | Result |
|---|---|
| Exact Clang/llc/FileCheck/occupancy tool hashes | 4/4 match the immutable resume3 values |
| Natural source directories | 8 distinct directories |
| Complete pre-scheduler MIR | 8 |
| Machine functions | 8 total, one per MIR |
| Exact MachineVerifier replay | 8/8 exit 0 |
| Deterministic second replay | 8/8 byte hashes identical |
| Claim-bearing observations | 0 |

The new portable sysroot used unmodified official Alpine `musl-dev` and `libc++-dev` headers. It is a host parsing environment only; target, LLVM commit, ROCm corpus commit, gfx1100/wave32 semantics, and MIR construction remained frozen.

## Evidence boundary

This closes a resource and fidelity prerequisite. It does not test whether the candidate improves on `GCNSchedStrategy+greedy`, does not consume the scientific revision, and supports no PASS/STOP scientific recommendation. The existing Stage A may resume only after mainline accepts this handoff.

## Cost

- Network bytes persisted: 9,466,511.
- Assignment resource bytes at the pre-report snapshot: 31,191,051.
- GPU/exclusive device: none.
- System install/global environment/source patch: none.
- Exact aggregate CPU and wall counters were not provided by the runner and were not estimated. All individual compilation and verifier commands completed in seconds and remained far below the frozen stop thresholds.

