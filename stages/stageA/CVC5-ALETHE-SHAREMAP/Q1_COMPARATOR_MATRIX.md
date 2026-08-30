# CVC5-ALETHE-SHAREMAP Q1/Q2 Paper Calibration

- Stage: `STAGEA`
- Candidate venue family: formal-methods/tool and solver-engineering venues
- Calibration status: `PARITY_CONDITIONAL_WITH_EXECUTABLE_GAP__RESOURCE_BLOCKED`
- Quality tier: inherited conditional `TIER_B_Q2_VIABLE`; no new scientific tier decision
- Search/cutoff date: `2026-08-09`

## Reference set

| Role | Paper/source | Venue/status | Quartile/equivalent basis | Year/source | Read scope | Why selected |
|---|---|---|---|---|---|---|
| CONTRIBUTION_SHAPE_ANCHOR | Barbosa et al., *cvc5: A Versatile and Industrial-Strength SMT Solver* | TACAS | top formal-methods conference equivalent | 2022, paper original | architecture/proof-output contribution shape | Establishes the breadth and artifact expectations that a cvc5 contribution must meet |
| EVALUATION_ANCHOR | Fleury et al., *Carcara: An Efficient Proof Checker and Elaborator for SMT Proofs in the Alethe Format* | TACAS | top formal-methods conference equivalent | 2023, paper/upstream | checker artifact and evaluation role | Calibrates native checker fidelity and end-to-end cost evidence |
| DOMAIN_NEIGHBOR | Schurr et al., *Alethe: Towards a Generic SMT Proof Format* | PXTP | domain genealogy, not used as Q1 status evidence | 2021, paper/spec | format and named-term sharing | Subtracts named sharing and generic Alethe representation novelty |
| BOUNDARY_OR_NEGATIVE_ANCHOR | cvc5 1.3.4 `AletheProofPrinter + AletheLetBinding` | official release/source | strongest same-object deployment baseline | 2026 official upstream | source and fixed-proof native behavior | Permanently removes the missing-native-sharing claim and defines the complete threshold envelope |

## Comparator matrix

| Dimension | Candidate | Anchor evidence | Gap | Current disposition |
|---|---|---|---|---|
| Problem importance/readership | Smaller/checker-cheaper native proof output | cvc5/Carcara show ecosystem relevance | natural benefit absent | unresolved; resource blocked |
| Contribution type | global scope-forest weighted selection | TACAS anchors require substantive mechanism | implementation/guarantee not executed | conditional only |
| Nearest-prior delta | action space beyond uniform threshold family | current cvc5 already provides native sharing | exact candidate delta not checker-validated | fail closed |
| Algorithm/mechanism substance | bounded-frontier exact DP contract | system/tool anchors expect reusable algorithm | coupling and certificate unexecuted | fail closed |
| Baseline strength/fairness | complete per-proof native envelope | current release source | only fixed-proof native side ran | incomplete |
| Natural workload/platform | 60 public supported UNSAT instances | public SMT-LIB/SMT-COMP route | corpus not run | prohibited before preclaim pass |
| Full-cost coverage | solver, enumeration, construction, serialization, bytes/disk, Carcara/RSS/failure | Carcara/cvc5 artifact expectations | candidate/checker costs absent | incomplete |
| Main result/statistics | p50+p90 Pareto required | tool-paper evaluation norms | none | unavailable |
| Ablation/mechanism evidence | sharing disabled and decomposition test | current native family | candidate ablation absent | unavailable |
| Scale/generalization | across supported logics/proof shapes | cvc5 breadth anchor | none | Stage A not reached |
| Failure boundary | local decomposition, low action rate, full-cost absorption | preregistered killer | not observed | unresolved |
| Artifact/reproducibility | exact source/binary/input/native hashes | artifact-backed anchors | candidate build/Carcara missing | blocker |

## Reviewer-shape assessment

- Editor/venue-fit view: a conditional Tier-B shape remains possible only if the global algorithm and natural full-cost residual are later established; current artifacts cannot be submitted as a result.
- Methodology view: the native comparator replay is unusually well pinned, but the candidate side and checker are missing, so causal and Pareto claims are unavailable.
- Domain-contribution view: generic sharing and native cvc5 named output are prior; the only permissible delta is the global legal-selection problem/algorithm.
- Devil's-advocate view: the candidate may still collapse to independent local byte savings or ordinary emitter engineering. The unexecuted decomposition gate is decisive.

## Decision

- Quality tier: inherited conditional `TIER_B_Q2_VIABLE`; not reassessed under resource-only evidence
- Status: `PARITY_CONDITIONAL_WITH_EXECUTABLE_GAP`
- Closed gaps: exact current commit/source/binary/input identity; behaviorally complete fixed-proof native raw-output enumeration; dual replay.
- Executable next gaps: printer-side candidate build, Carcara acceptance, exact expansion audit, global coupling/certificate, then the frozen natural killer.
- Human/resource-dependent gaps: provide or authorize the portable C/C++ and Rust build/checker environment.
- Bounded near-Q1 gaps: not assessable at this evidence ceiling.
- Gap that would invalidate the paper: local/product decomposition, fidelity failure, or complete native/full-cost absorption.
- Why this is calibration rather than novelty or baseline evidence: the anchors specify evidence shape; they do not establish candidate novelty or performance.
- Why Tier B, if applicable, still closes hard gates: it would have to close same-object, current collision, complete native baseline, natural evidence, full cost and reproducibility after resume; none is waived by this blocker.

