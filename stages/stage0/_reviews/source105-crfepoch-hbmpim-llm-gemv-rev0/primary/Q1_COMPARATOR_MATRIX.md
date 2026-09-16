# CRFEPOCH-HBMPIM-LLM-GEMV-REV0 — Q1/Q2 paper calibration

- Stage: `STAGE0`
- Candidate venue family: architecture/compiler systems (`HPCA / ISCA / TCAD`-class)
- Calibration status: `PARITY_NOT_PLAUSIBLE`
- Quality tier: `BELOW_Q2_STOP`
- Search/cutoff date: 2026-08-24

## Reference set

| Role | Paper | Venue/status | Read scope | Why selected |
|---|---|---|---|---|
| CONTRIBUTION_SHAPE_ANCHOR | Yang et al., “DCC: Data-Centric Compilation of Machine Learning Kernels for Processing-In-Memory Architectures” | ISCA 2026; public artifact and paper: <https://github.com/SPIN-Research-Group/DCC> | README and current HBM-PIM GEMV trace generator | Closest recent PIM compiler; co-optimizes data layout and compute code across kernels/backends. |
| EVALUATION_ANCHOR | Xie et al., “UniNDP: A Unified Compilation and Simulation Tool for Near DRAM Processing Architectures” | HPCA 2025, DOI `10.1109/HPCA61900.2025.00054`; <https://researchportal.hkust.edu.hk/en/publications/unindp-a-unified-compilation-and-simulation-tool-for-near-dram-pr/> | Published abstract, pinned artifact README and source | Compiler + cycle-accurate simulator, multiple NDP architectures/workloads, public Llama2 carrier. |
| DOMAIN_NEIGHBOR | Sun et al., “PIMCOMP: An End-to-End DNN Compiler for Processing-In-Memory Accelerators” | IEEE TCAD 44(5), 1745–1759 (2025), DOI `10.1109/TCAD.2024.3496847`; <https://arxiv.org/abs/2411.09159> | Abstract and bibliographic metadata | Q1/equivalent compiler-paper scale: end-to-end abstraction, multiple optimization layers and PIM architectures. |

## Comparator matrix

| Dimension | Candidate | Anchor evidence | Gap | Disposition |
|---|---|---|---|---|
| Problem importance/readership | One stock HBM2-PIM simulator protocol | DCC/UniNDP address broad PIM ML compilation | Narrow benchmark-only scope | Material |
| Contribution type | Cross-call CRF/mode prologue hoist | Compiler/search, mapping, code/data/layout co-optimization | No new algorithmic construction | Fatal for N2 |
| Nearest-prior delta | CRF/PC protocol is unique to stock PIMSimulator | Existing systems do not directly encode it | Uniqueness is implementation-local, not paper-level | Fatal for Q2 shape |
| Algorithm/mechanism substance | Equal-template run grouping | DCC and UniNDP optimize finite choices under broader constraints | Six-command CRF makes the advertised capacity constraint inactive | Fatal |
| Baseline strength/fairness | Stock, UniNDP, DCC named | All can be named fairly | Fair baseline plan alone cannot create a contribution | Insufficient |
| Natural workload/platform | Canonical Llama2 CSV carrier | UniNDP has multiple ML workloads/architectures; DCC broad kernels/backends | Carrier aggregation assumes no fusion and does not establish a dependency-aware scheduling instance | Material |
| Full-cost coverage | Proposed ledger charges command/mode/barrier/data movement | Anchors provide complete evaluation systems | Measuring a simple hoist does not make it nontrivial | Insufficient |
| Main result/statistics | None at Stage 0 | Anchors supply validated broad evaluations | Missing results alone is not fatal; missing paper kernel is | Structural failure |
| Ablation/mechanism evidence | Could isolate prologue count | Anchors isolate mapping/scheduling mechanisms | A prologue-count ablation is routine tuning evidence | Fatal |
| Scale/generalization | One simulator and equal-template runs | Multi-backend/multi-workload papers | No credible generality route without a new object | Material |
| Failure boundary | Clear no-gain cases | Strong boundary analysis expected | Boundary leaves only trivial run coalescing | Fatal |
| Artifact/reproducibility | Public sources and static witness route | Open artifacts and reproducible experiments | Reproducibility is adequate but cannot repair contribution weakness | Insufficient |

## Reviewer-shape assessment

- Editor/venue-fit: the exact PIMSimulator detail is too narrow for an architecture/compiler paper without a general scheduling theorem, nontrivial finite state space, or a reusable compiler abstraction.
- Methodology: the 32-entry condition is not active for stock GEMV, so it cannot justify an optimization problem or an ablation.
- Domain-contribution: DCC and UniNDP establish a high current compiler baseline; the remaining action is a local scope-hoisting optimization.
- Devil’s advocate: any attempt to rescue the work through arbitrary operator reordering, a multi-program cache, or changed PIM ISA adds a new action/information contract and is not the frozen topic.

## Decision

- Quality tier: `BELOW_Q2_STOP`
- Status: `PARITY_NOT_PLAUSIBLE`
- Closed gaps: exact stock protocol and public carrier are reproducibly identifiable.
- Gap that invalidates the paper: no nontrivial N1/N2/N3 remains after the fixed-size CRF program and static carrier aggregation are accounted for.
- Calibration, not novelty evidence: these papers calibrate what a credible PIM compiler contribution and evaluation look like; the direct-coverage judgment remains in `CURRENT_COLLISION_LEDGER.md`.
