# X86-STACKCLASH-FRAME-PROBE-REGISTER-PARETO-FPT Q1/Q2 Paper Calibration

- Stage: `STAGE0`
- Candidate venue family: compiler/code-generation systems
- Calibration status: `PARITY_NOT_PLAUSIBLE`
- Quality tier: `BELOW_Q2_STOP`
- Search/cutoff date: 2026-08-14

## Reference set

| Role | Paper / artifact | Venue/status | Quartile/equivalent basis | Year/source | Read scope | Why selected |
|---|---|---|---|---|---|---|
| CONTRIBUTION_SHAPE_ANCHOR | LLVM x86 stack-clash implementation | current production upstream | production compiler artifact | LLVM current source/blog/review | source/action paths | exact security/prologue semantics |
| EVALUATION_ANCHOR | `RegAllocGreedy` CSR-vs-spill action | current upstream source | production baseline | LLVM official source | source-level method | exact allocator tradeoff |
| DOMAIN_NEIGHBOR | GCC stack-clash documentation/implementation record | official compiler source | mature same-problem comparator | GCC official docs/patch discussion | semantics boundary | confirms page-by-page model is established |
| BOUNDARY_OR_NEGATIVE_ANCHOR | generic RA/frame packing | theory/solver methods | non-deployment ceiling | primary method family | mechanism boundary | surviving abstraction collapses here |

## Comparator matrix

| Dimension | Candidate | Anchor evidence | Gap | Current disposition |
|---|---|---|---|---|
| Problem importance | stack-clash-safe codegen | production security feature | meaningful problem | not sufficient |
| Contribution type | target-specific N2 | pipeline components are established | no unique action | fatal |
| Nearest-prior delta | joint frame/probe/register plan | RA/PEI/probe generator already compose known actions | scalar/generic remainder | fatal |
| Algorithm substance | FPT/Pareto frontier | probe is deterministic given frame size | no non-product state | fatal |
| Baseline fairness | full LLVM union | current pipeline/source tests | correctly frozen | passes |
| Natural workload | compiler tests/public code | finite route | unneeded before structural decision | neutral |
| Full cost | bytes/probes/spills/CFI | native pipeline exposes costs | cannot rescue action gap | fatal |
| Main evidence | expected Pareto | not required at Stage 0 | no valid premise to test | fatal |
| Failure boundary | page threshold/crossing range | scalar threshold | ordinary tuning | fatal |
| Artifact/reproducibility | public compiler | good | no scientific residual | neutral |

## Decision

- Quality tier: `BELOW_Q2_STOP`.
- Status: `PARITY_NOT_PLAUSIBLE`.
- Closed gaps: current action grammar, same-object pipeline order, target/ABI security predicate and full-cost map.
- Gap that invalidates the paper: the required same-object non-product action cannot be named. The proposed scratch option is not a body-liveness action, while the remaining frame-size threshold is ordinary tuning.
- Why calibration is not novelty evidence: it compares paper shape only; the direct structural grounds are in `STAGE0_REPORT.md` and `SOURCE_AUDIT.md`.

