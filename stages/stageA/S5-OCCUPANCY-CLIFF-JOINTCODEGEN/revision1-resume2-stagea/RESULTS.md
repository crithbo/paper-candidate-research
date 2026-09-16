# S5-OCCUPANCY-CLIFF-JOINTCODEGEN Stage A R2A Results

## Outcome

- Decision: `BLOCKED_USER_ACTION_REQUIRED`
- Preclaim gate: `FAIL_CLOSED_RESOURCE_TOOLCHAIN`
- Claim-bearing observation: `no`
- Scientific revision consumed: `false`
- Evidence ceiling: `RESOURCE_FAILURE_ONLY__NO_SCIENTIFIC_INFERENCE`
- Exact evaluated tools: `0/3`
- Complete natural MIR: `0/8` minimum
- Baseline / candidate / verifier / replay: `0 / 0 / 0 / 0`
- Scientific PASS/STOP/reserve inference: none

## Established resource facts

The named 187,504,083-byte bootstrap archive matches its frozen SHA-256 and safely expands to 740,825,211 bytes. Its Clang identifies as LLVM 22.1.8 at commit `ca7933e…`, lacks the AMDGPU registered target, and contains none of the required evaluated executables. It is therefore correctly classified as bootstrap-only.

CMake 4.1.0 and Ninja 1.11.1.4 were obtained from the frozen PyPI assets and passed version smoke. The filtered Git commit fetch established that `FETCH_HEAD` and the local commit object equal the frozen LLVM SHA. The required `llvm/` blobs could not be checked out because the official GitHub transfer stopped with curl error 28 and an early EOF. Consequently, exact tools could not be configured or built.

## Preclaim ledger

| Gate | Required | Observed | Disposition |
|---|---|---|---|
| Exact LLVM source/tool identity | complete commit `1f112d62…` and exact tools | commit metadata only; no worktree/tools | fail closed |
| `llc` | executable, AMDGPU target | missing | fail closed |
| `FileCheck` | executable | missing | fail closed |
| `llvm-calc-occupancy` | executable if frozen build exposes target | missing | fail closed |
| Natural corpus | 8–16 complete public MIR | 0 | not reached |
| Real current baseline | GCNSchedStrategy + greedy | 0 runs | not reached |
| Frozen candidate | bounded tier frontier + greedy | 0 runs | not reached |
| MachineVerifier | every output legal | no outputs | not reached |
| Double replay | two deterministic non-timing replays | 0 | not reached |
| Full-cost science | all construction and comparison costs | no science | not reached |

## Resource cost

Before final text closure the assignment directory used 1,053,455,557 bytes across 13,459 files. Bootstrap extraction took 176.968 seconds. Verified new wheel payload totaled 37,847,576 bytes. Git/source state used 187,851,937 bytes; exact protocol network bytes were not directly exposed, so no fabricated network total is reported. No configure, build, natural-MIR, baseline, candidate, verifier, GPU or scientific command ran.

## Scientific meaning

None. The failure occurred before the first claim-bearing observation, so it neither tests natural occupancy-cliff prevalence nor compares the frozen candidate against current LLVM. It cannot support `PASS_RECOMMENDED`, `STOP`, or reserve. The Stage A scientific revision remains available after a new mainline-authorized resume with the missing exact resources.
