# ARM-MVE-MULTIBLOCK-TAILPRED-LOOP-CONSTRUCTION Q1/Q2 Paper Calibration

- Stage: `STAGE0`
- Candidate venue family: CGO / CC / TACO
- Calibration status: `PARITY_CONDITIONAL`
- Quality tier: `TIER_B_Q2_VIABLE` (conditional pending one static revision)
- Search/cutoff date: 2026-08-14

## Reference set

| Role | Paper / authoritative artifact | Venue/status | Quartile/equivalent basis | Year/source | Read scope | Why selected |
|---|---|---|---|---|---|---|
| CONTRIBUTION_SHAPE_ANCHOR | Meijer & Parker, *Code-Generation for the Arm M-Profile Vector Extension* | LLVM Developers' Meeting | authoritative compiler implementation disclosure, not a Q-rank claim | 2019, LLVM | slides / source context | establishes the MVE/LOB lowering problem shape |
| EVALUATION_ANCHOR | LLVM `MVETailPredication` and `ARMLowOverheadLoops` current sources | upstream implementation | current strongest same-object baseline | 2026 pin | relevant symbols | defines actual native constraints and fair baseline |
| DOMAIN_NEIGHBOR | LLVM vector-predication discussion | LLVM Developers' Meeting / llvm-dev | compiler research community anchor | 2020, LLVM | primary text | separates generic vector predication from MVE-specific lowering |
| BOUNDARY_OR_NEGATIVE_ANCHOR | current `IsTailPredicationLegal` single-block rule | LLVM source | direct current boundary | 2026 pin | exact function | shows the candidate must exceed a known implementation restriction, not restate it |

## Comparator matrix

| Dimension | Candidate | Anchor evidence | Gap | Current disposition |
|---|---|---|---|---|
| Problem importance/readership | MVE embedded vector loops and tail handling | LLVM/Arm codegen artifact | plausible but narrow | Q2 plausible |
| Contribution type | target-specific FPT/certified native-plan construction | current code is a legality/lowering implementation | no recurrence yet | revision required |
| Nearest-prior delta | multi-block action outside `getNumBlocks()==1` | current path uses one-block eligibility | real boundary | conditional |
| Algorithm/mechanism substance | joint VPT/VCTP/LOB/fallback state | generic CFG scheduling is insufficient | no state certificate | revision required |
| Baseline strength/fairness | current pipeline + flags + fallback | current source fixed | adequate | closed |
| Natural workload/platform | public MVE IR/MIR/CMSIS-like route | no corpus frozen | finite route only | Stage A |
| Full-cost coverage | compile, legality, code size, pressure, runtime | not yet executed | ledger is specified | Stage A |
| Main result/statistics | none claimed | E1 static only | intentionally open | not a Stage0 failure |
| Ablation/mechanism evidence | exact action-divergence witness | missing | decisive | revision required |
| Scale/generalization | loops satisfying explicit grammar | unknown | bounded | Tier B ceiling |
| Failure boundary | semantic mismatch / no two-plan / B0 reachability | current source supports concrete checks | good | retained |
| Artifact/reproducibility | current source blobs + future pinned MIR | MIR missing | finite | revision then Stage A |

## Reviewer-shape assessment

- Editor/venue-fit view: a narrow compiler algorithm can fit Q2 only with an explicit native construction and nontrivial proof/guarantee.
- Methodology view: same-function and current-union baselines are adequate; two-plan native legality is the key missing prerequisite.
- Domain-contribution view: the single-block source restriction gives a credible question, not yet a contribution.
- Devil's-advocate view: without a future-action-preserving MVE state, this is merely “allow multi-block loops”, an implementation patch rather than a paper.

## Decision

- Quality tier: `TIER_B_Q2_VIABLE` conditional
- Status: `PARITY_CONDITIONAL`
- Closed gaps: exact object, current source pin, current configuration envelope, strongest baseline union.
- Executable next gaps: one static native two-plan witness plus target-specific state/recurrence certificate.
- Human/resource-dependent gaps: none required for the revision.
- Bounded near-Q1 gaps: broad corpus, performance/energy data, formal proof scope, and comparison beyond LLVM.
- Gap that would invalidate the paper: candidate action reduces to generic CFG scheduling or is entirely B0/B2-reachable.
- Why this is calibration rather than novelty or baseline evidence: it evaluates expected contribution/evidence shape; current source remains the actual baseline evidence.
- Why Tier B, if applicable, still closes same-object, latest-collision, fair-baseline, natural-evidence, full-cost and reproducibility gates: Tier B is only conditional pending the static revision; no promotion or Stage A authorization is implied.

