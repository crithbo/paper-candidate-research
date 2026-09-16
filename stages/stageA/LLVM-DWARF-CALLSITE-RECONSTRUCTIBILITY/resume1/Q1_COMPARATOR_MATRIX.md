# LLVM-DWARF-CALLSITE-RECONSTRUCTIBILITY Q1/Q2 Paper Calibration

- Stage: `STAGEA__RESOURCE_BLOCKED_BEFORE_PRECLAIM`
- Calibration status: `PARITY_CONDITIONAL_WITH_EXECUTABLE_GAP__UPSTREAM_TIER_ONLY`
- Quality tier: `TIER_B_Q2_VIABLE` from independent Stage 0; not re-adjudicated
- Search cutoff: 2026-08-14

No scientific comparator arm ran. The exact source/tool resource gap is closed, but the Linux executable-behavior denominator is not. The initial comparator matrix therefore remains authoritative except for this mechanical resource update.

| Dimension | Frozen candidate/comparator | Resume1 evidence | Remaining gap |
|---|---|---|---|
| Same object | identical pre-RA MIR, SysV ABI, behavior, unwind and legal DWARF | exact Windows X86 tool and ELF/DWARF smoke only | actual Linux behavior/witness replay |
| Candidate action | target-specific bounded call-cut Pareto DP | not run | complete implementation and atomic mapping |
| Strongest union | pinned allocator/coalescing/spill/CSR + InstrRef/LDV + DwarfDebug + legal grid | not run | executable current-union audit |
| Generic exact method | ceiling only | not run | tiny exact comparison |
| Natural workload | frozen minimum 30 optimized debug functions | not frozen or run | full denominator after gate |
| Full cost | reconstructibility, text/DWARF, CSR/CFI/spill, compile CPU/wall/RSS, runtime, verification/fallback | only resource-build cost measured | all scientific full-cost coordinates |
| Paper anchors | initial package has none loaded | no scientific literature search added | at least three current Q1/equivalent anchors |

## Decision

- Status: `PARITY_CONDITIONAL_WITH_EXECUTABLE_GAP`.
- Closed gap: exact commit source, minimal X86 toolchain and native reader availability.
- Blocking gap: authorized Linux SysV executable-behavior runner.
- Invalidating scientific gaps remain untested: native Plan B legality, Plan A availability, current-union absorption, full-cost dominance and natural residual.
- This calibration does not support novelty, PASS or STOP.
