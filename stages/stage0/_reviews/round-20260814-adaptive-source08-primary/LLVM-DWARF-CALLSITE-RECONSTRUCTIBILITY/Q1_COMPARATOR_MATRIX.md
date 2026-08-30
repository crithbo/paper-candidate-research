# LLVM-DWARF-CALLSITE-RECONSTRUCTIBILITY Q1/Q2 Paper Calibration

- Stage: `STAGE0`
- Candidate venue family: compiler and programming-languages systems
- Calibration status: `PARITY_CONDITIONAL_WITH_EXECUTABLE_GAP`
- Quality tier: `TIER_B_Q2_VIABLE`
- Search/cutoff date: 2026-08-14

## Reference set

| Role | Paper / artifact | Venue/status | Quartile/equivalent basis | Year/source | Read scope | Why selected |
|---|---|---|---|---|---|---|
| CONTRIBUTION_SHAPE_ANCHOR | Unison: Combinatorial Register Allocation and Instruction Scheduling | peer-reviewed compiler research | top compiler venue equivalent | 2018, author paper | abstract/method boundary | strong generic joint-optimization subtractor |
| EVALUATION_ANCHOR | LLVM instruction-referencing + `LiveDebugValues` | current upstream implementation | production compiler baseline | LLVM official docs/source | current source/docs | exact debug-location propagation baseline |
| DOMAIN_NEIGHBOR | LLVM DWARF call-site parameter implementation | LLVM upstream review/source | production DWARF implementation | LLVM official source/review | source/test route | exact call-site semantics subtractor |
| BOUNDARY_OR_NEGATIVE_ANCHOR | Generic CP/ILP register allocation | theory/solver methods | oracle, not deployment parity | primary literature | method boundary | rejects generic solver repackaging |

## Comparator matrix

| Dimension | Candidate | Anchor evidence | Gap | Current disposition |
|---|---|---|---|---|
| Problem importance/readership | optimized debug correctness/fidelity | LLVM maintains dedicated instruction-reference and call-site machinery | real compiler concern | plausible |
| Contribution type | target-specific N2 frontier DP | Unison establishes generic joint allocation optimization | must avoid generic collapse | revision required |
| Nearest-prior delta | allocation-time call-site preservation | LLVM post-RA propagation and emission | action boundary unclosed | revision required |
| Algorithm/mechanism substance | bounded clobber state / recurrence | generic RA and current dataflow | need exact target-specific state | revision required |
| Baseline strength/fairness | full LLVM pipeline + finite knobs + oracle | official current components | specified, not run | adequate plan |
| Natural workload/platform | fixed target; LLVM test-suite/projects | public CPU toolchain | corpus not yet exercised | readiness only |
| Full-cost coverage | code/debug/compile/frame/unwind | production codegen norm | frozen ledger | adequate plan |
| Main result/statistics | non-dominated Pareto points | not yet measured | Stage A only | no claim |
| Ablation/mechanism evidence | two-plan MIR witness | not yet supplied | gate-bearing static artifact | revision required |
| Scale/generalization | one target first; later multi-target | LLVM generic docs warn target hooks matter | Q2 one-target ceiling | conditional |
| Failure boundary | all points reproduced by current composition | explicit | strong | adequate |
| Artifact/reproducibility | MIR, commit, verifier/dwarfdump | public | package still needed | finite |

## Reviewer-shape assessment

- Editor/venue-fit view: a target-specific exact/certified planner plus public reproduction route can reach credible Q2; it is premature for Q1.
- Methodology view: valid only if the planner controls native allocation actions, not just debug annotations.
- Domain-contribution view: LLVM's existing robust post-RA tracker raises the bar but leaves a conditional pre-RA decision problem.
- Devil's-advocate view: without a full two-plan native witness this is indistinguishable from a debug-aware weight in a conventional allocator.

## Decision

- Quality tier: `TIER_B_Q2_VIABLE`.
- Status: `PARITY_CONDITIONAL_WITH_EXECUTABLE_GAP`.
- Closed gaps: same object, baseline identities, source-reality boundary, full-cost ledger and finite verification route.
- Executable next gaps: same-MIR complete two-plan witness, current action catalog, target-specific recurrence/guarantee.
- Human/resource-dependent gaps: none decisive.
- Bounded near-Q1 gaps: multi-target evidence and a broader theorem.
- Gap that would invalidate the paper: the candidate's frontier being merely generic allocation tuning or being entirely expressed by current LLVM composition.
- Why this is calibration rather than novelty/baseline evidence: reference items set expected paper shape and comparator roles; direct coverage remains separately audited in the Stage 0 report.
- Why Tier B still closes hard gates conditionally: same target/object, current-source reality check, strong fair baseline, natural corpus path, full cost and reproducibility are all frozen; their actual outcome is deferred to Stage A after the static gate.

