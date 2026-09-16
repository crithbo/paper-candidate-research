# AARCH64-HWASAN-STACKTAG-REGISTER-PRESSURE-PARETODP — Q1/Q2 Paper Calibration

- Stage: `STAGE0`
- Candidate venue family: compiler construction, program analysis and memory-safety tooling
- Calibration status: `PARITY_CONDITIONAL_WITH_EXECUTABLE_GAP`
- Quality tier: `TIER_B_Q2_VIABLE` conditional on the sole revision gate
- Search/cutoff date: 2026-08-14

## Reference set

| Role | Paper / source | Venue/status | Read scope | Why selected |
|---|---|---|---|---|
| CONTRIBUTION_SHAPE_ANCHOR | Serebryany et al., *Memory Tagging and how it improves C/C++ memory safety* | arXiv:1802.09517, 2018 | abstract and official linked design context | Establishes the AArch64 compiler-based memory-tagging domain, not the candidate DP. |
| EVALUATION_ANCHOR | Clang HWASan Design Documentation | current official design documentation | stack, short-granule, access and reporting sections | Defines the real detector semantics and shows that stack tag/register-pressure tradeoffs are first-party concerns. |
| DOMAIN_NEIGHBOR | current LLVM `HWAddressSanitizer.cpp` and AArch64 stack-tagging sources | current upstream source | methods/options and stack instrumentation paths | Strongest same-object implementation comparator. |
| BOUNDARY_OR_NEGATIVE_ANCHOR | current LLVM codegen pipeline documentation | official documentation | pipeline boundary only | Separates an HWASan-specific planner from generic post-instrumentation register allocation. |

## Comparator matrix

| Dimension | Candidate if gate closes | Anchor evidence | Gap | Current disposition |
|---|---|---|---|---|
| Problem importance | sanitizer overhead while preserving detection | HWASan is a deployed compiler-based memory-tagging design | none | plausible |
| Contribution type | target-specific N2 frontier algorithm | native implementation already has base/re-tag and lifetime logic | must show joint residual | open |
| Nearest-prior delta | legal two-plan divergence beyond B0–B2 | current source fixes the primitive actions | high | revision gate |
| Algorithm substance | FPT/certified Pareto state preserving future native actions | generic RA/ILP is insufficient | recurrence absent | revision gate |
| Baseline fairness | full current HWASan + AArch64 frame/RA | current sources expose these components | action catalog must be complete | executable |
| Natural workload | stack-heavy sanitizer tests and public C/C++ functions | LLVM/Clang provide a natural test carrier | corpus not yet frozen | Stage A |
| Full cost | compile/RSS, frame, spills, tag ops, runtime | source establishes real paths | no measurements yet | Stage A |
| Failure boundary | changed tag/report, ABI, or generic residual | design doc defines detection constraints | clear | pass |
| Artifact/reproducibility | pinned LLVM + test/witness pins | public upstream | pins not yet chosen | finite |

## Reviewer-shape assessment

- Editor/venue-fit view: conditional Q2 relevance exists only for a nontrivial target-specific construction, not a tuning paper.
- Methodology view: same-report semantics and full-cost must be specified before measurements; that is the present critical gap.
- Domain-contribution view: current upstream directly implements the motivating base-tag/ReTag tradeoff, so novelty must be an algorithm over a genuinely remaining action dimension.
- Devil's-advocate view: a two-plan witness that changes tag assignment but not the full checked report vector may be impossible or may collapse to generic RA. The revision is designed to falsify exactly this risk.

## Decision

- Quality tier: `TIER_B_Q2_VIABLE` conditional
- Status: `PARITY_CONDITIONAL_WITH_EXECUTABLE_GAP`
- Closed gaps: frozen function-level object, current-source base-tag/Retag reality check, strong composition baseline, full-cost dimensions.
- Executable next gap: the single same-report two-plan frontier certificate.
- Human/resource-dependent gaps: none at Stage 0.
- Bounded near-Q1 gaps: broad natural corpus, rigorous comparative results, and a guarantee that remains useful beyond the minimal witness.
- Gap that would invalidate the paper: no legal union-external two-plan action or a generic post-pass RA formulation.
- Why this is calibration rather than novelty evidence: anchors assess paper shape and comparator rigor; they do not prove the residual exists.

