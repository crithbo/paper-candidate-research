# RISCV-ZCMP-CALLEESAVE-PUSHLIST-PARETODP — Q1/Q2 Shape Calibration

- Stage: `STAGE0`
- Calibration status: `PARITY_CONDITIONAL`
- Conditional quality tier: `TIER_B_Q2_VIABLE`
- Cutoff: 2026-08-14

## Reference set

| Role | Reference | Venue/status | Why it calibrates shape |
|---|---|---|---|
| Contribution-shape anchor | Castañeda Lozano et al., *Combinatorial Register Allocation and Instruction Scheduling* | ACM TACO, 2018 | Integrates code-generation decisions with an explicit optimization formulation; it is a generic-method subtractor, not same-object coverage. |
| Domain neighbor | RISC-V Zc/Zcmp ratified specification | Official ISA specification | Fixes the finite register-list and stack-adjust grammar; no compiler-planner claim. |
| Evaluation anchor | LLVM RISC-V backend and codegen test corpus | upstream source/tests | Establishes stock-native validation and target-code denominator. |
| Boundary anchor | LLVM current RISCVPushPopOptimizer | upstream source | Late POP/RET rewrite is a direct baseline action and rules out claiming a late peephole as N2. |

## Matrix

| Dimension | Candidate if gate closes | Current gap | Disposition |
|---|---|---|---|
| Contribution | target-specific bounded Pareto DP | static witness/frontier missing | revision gate |
| Guarantee | exact/FPT bounded interface | no recurrence yet | revision gate |
| Strong baseline | complete stock RA/frame/Zcmp union | source pin/config enumeration missing | revision gate |
| Natural evidence | LLVM + embedded functions | not yet run | Stage A, non-fatal |
| Full cost | bytes/frame/spills/compile/ABI/unwind | ledger frozen, not measured | Stage A, non-fatal |
| Reproducibility | stock tools, current pin | immutable pin needed | revision gate |

## Assessment

The topic can reach credible Q2 parity only as a target-specific construction with an actual non-absorbed static two-plan certificate. A generic RA solver, frame packing method, or a configuration sweep would be below parity. This is shape calibration, not novelty proof or experimental evidence.
