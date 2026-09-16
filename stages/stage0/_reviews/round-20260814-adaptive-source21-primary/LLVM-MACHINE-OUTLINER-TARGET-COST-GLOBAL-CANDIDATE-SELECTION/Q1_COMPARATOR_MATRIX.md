# LLVM MachineOutliner — Q1/Q2 paper calibration

- Stage: `STAGE0`
- Candidate venue family: compiler construction / code generation
- Quality tier: `TIER_B_Q2_VIABLE` conditional
- Calibration status: `PARITY_CONDITIONAL`
- Search cutoff: 2026-08-14

| Role | Reference | Venue/status | Why selected |
|---|---|---|---|
| Contribution anchor | Optimistic Global Function Merger | LCTES 2024 | global code-size transformation with real LLVM deployment boundary |
| Domain neighbor | Post-Link Outlining for Code Size Reduction | CC 2025 | modern outlining/code-size evaluation shape, but post-link object differs |
| Native anchor | Reducing Code Size Using Outlining | LLVM Dev Mtg 2016 | original current outliner design and suffix-tree baseline |
| Boundary anchor | LLVM CGData Global Outlining | upstream 2024/current | already absorbs global candidate discovery |

| Dimension | Conditional candidate | Gap / disposition |
|---|---|---|
| Problem | target-specific code-size/runtime tradeoff in native outlining | credible compiler niche |
| Contribution | bounded-component target-cost compatible-set Pareto algorithm | must be non-generic at revision |
| Nearest prior | global candidates plus greedy scalar sort/prune | clear source-level distinction |
| Semantics | existing target frame/call hooks, object/unwind/relocation preserved | must be shown in same-MIR witness |
| Baselines | complete current local/global/CGData/target-hook union | frozen, unmeasured |
| Natural route | LLVM Test-Suite/Clang MachineIR | finite Stage A route |
| Full cost | compile/RSS/CGData/object/frame/call/unwind/runtime | ledger frozen |
| Paper shape | Q2 plausible if exact/FPT certificate + natural evidence close | Q1 requires broad targets/evidence |

Decision: Tier B is possible only after the single static gate exhibits a native legal conflict witness and target-specific recurrence.  This calibration does not establish novelty or a measured gain.
