# LLVM-PPC-PREFIX-PRESSURE-PARETODP — Q1/Q2 Paper Calibration

- Stage: `STAGE0`
- Candidate venue family: compiler construction / programming languages / systems-performance venues
- Calibration status: `PARITY_CONDITIONAL`
- Quality tier if revision closes: `TIER_B_Q2_VIABLE`
- Cutoff: 2026-08-11

## Reference set

| Role | Paper | Venue/status | Quartile/equivalent basis | Read scope | Why selected |
|---|---|---|---|---|---|
| CONTRIBUTION_SHAPE_ANCHOR | Lozano et al., *Combinatorial Register Allocation and Instruction Scheduling* | ACM TOPLAS 41(3), 2019, DOI `10.1145/3332373` | Established top programming-languages journal comparator | Abstract/metadata plus paper positioning from author preprint | Shows the bar for integrated target-specific code-generation optimization, not a direct PPC collision |
| EVALUATION_ANCHOR | LLVM: A Compilation Framework for Lifelong Program Analysis & Transformation | CGO 2004 | Flagship compiler venue/equivalent | Official paper metadata and canonical project context | Requires artifacts, natural compiler corpus, correctness and cost accounting |
| DOMAIN_NEIGHBOR | Lozano & Schulte, *Survey on Combinatorial Register Allocation and Instruction Scheduling* | ACM Computing Surveys, 2019, DOI `10.1145/3200920` | Top survey venue/equivalent | Metadata/abstract | Establishes generic CP/IP/enumeration as strong prior art and prevents calling solver wrapping N2 |
| BOUNDARY_OR_NEGATIVE_ANCHOR | Power ISA v3.1 and current LLVM PPC/lld source | Official ISA/current upstream | Primary implementation boundary | Targeted clauses/symbols | Existing prefixed PCREL and linker-relaxation actions are subtractors, not candidate novelty |

## Comparator matrix

| Dimension | Candidate after gate | Anchor evidence | Gap | Current disposition |
|---|---|---|---|---|
| Problem importance/readership | Code-quality/resource trade-offs for modern PowerPC compilation | Established codegen literature | Niche target; must demonstrate transferability of method | Q2 plausible |
| Contribution type | PPC-specific N2 quotient + certified Pareto DP | Integrated optimization literature | Must be non-generic | Revision gate |
| Nearest-prior delta | Typed PCREL/address-value/relocation/ABI future action state | Current LLVM handles local PCREL/linker actions | Need complete action divergence | Revision gate |
| Algorithm substance | exact/FPT/certified frontier | Unison/CP literature | Generic solver is insufficient | Revision gate |
| Baseline strength | current LLVM full composition + grid | Compiler evaluation norms | Cannot use default-only baseline | Design-ready |
| Natural workload/platform | LLVM PPC tests/Test-Suite | Compiler papers use real programs | Not yet manifested | Stage A task, not Stage0 failure |
| Full cost | compile/link/model/verification/object/runtime | Evaluation anchor | Not yet measured | Stage A task |
| Mechanism evidence | legal micro-witness plus action-table certificate | N2 paper shape | Witness underdefined now | Revision gate |
| Failure boundary | pcrel ineligibility, native domination, overhead | Algorithmic papers | Explicit | Pass |
| Artifact/reproducibility | source and manifest pinning | Open compiler research norms | Must be made concrete | Revision gate |

## Reviewer-shape assessment

- **Editor/venue fit:** Tier B is credible only for a sharply defined target-specific method plus a non-dominated full-cost frontier. A single target may cap Q1 breadth.
- **Methodology:** current native action grammar and equivalent full-cost baseline are mandatory.
- **Domain contribution:** Power10 PCREL34 and ELFv2/lld relaxation create a meaningful structural interaction, but not automatically a contribution.
- **Devil’s advocate:** the current brief’s generic state `L,A,q` and symmetric-bank quotient do not establish target-specificity; native GOT `PLDpc` relaxation invalidates the easy witness.

## Decision

- Quality tier: `TIER_B_Q2_VIABLE` **only conditionally**.
- Status: `PARITY_CONDITIONAL`.
- Required next gap: `PPCREL34_ELFV2__FUTURE_NATIVE_ACTION_PRESERVING_TRACE_PARETO_CERTIFICATE`.
- Invalidating gap: if the complete witness/action catalog reduces to current native PCREL/linker paths plus generic RA/CP/ILP, it is `BELOW_Q2_STOP`.
- This is calibration, not novelty or experimental-baseline evidence.
