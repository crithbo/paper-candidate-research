# LLVM-PPC-PREFIX-PRESSURE-PARETODP Q1/Q2 Paper Calibration

- Stage: `STAGEA`
- Candidate venue family: compiler construction / programming languages / systems performance
- Calibration status: `PARITY_CONDITIONAL_WITH_EXECUTABLE_GAP`
- Quality tier: `TIER_B_Q2_VIABLE` carried from Stage0 without rescoring
- Cutoff: 2026-08-11

## Reference set

| Role | Paper/source | Venue/status | Read scope | StageA disposition |
|---|---|---|---|---|
| CONTRIBUTION_SHAPE_ANCHOR | Lozano et al., *Combinatorial Register Allocation and Instruction Scheduling* | ACM TOPLAS 41(3), 2019 | Frozen Stage0 targeted positioning | Generic integrated optimization remains a strong subtractor. |
| EVALUATION_ANCHOR | *LLVM: A Compilation Framework for Lifelong Program Analysis & Transformation* | CGO 2004 | Frozen Stage0 project/evaluation context | Natural compiler artifacts and correctness remain required. |
| DOMAIN_NEIGHBOR | Lozano & Schulte, combinatorial RA/scheduling survey | ACM CSUR, 2019 | Frozen Stage0 metadata/abstract | Generic solver wrapping cannot establish N2. |
| BOUNDARY_OR_NEGATIVE_ANCHOR | Power ISA v3.1 and pinned LLVM PPC/lld sources | Official/current primary sources | Frozen Stage0 targeted clauses/symbols | Existing prefix/PCREL/GOT/linker actions are mandatory subtractors. |

## Comparator matrix

| Dimension | Candidate | Required strongest comparator | Current StageA evidence |
|---|---|---|---|
| Same object | Power10 ppc64le ELFv2 medium-model non-GOT pre-form MachineIR | Exact pinned LLVM/lld on identical trace and information | Not executable. |
| Native action coverage | PPC-TPD direct-value/address, RA, spill/frame, MC/link actions | Full current form→RA→pre-emit→MC→lld union and legal grid | Not replayed. |
| Algorithmic substance | Exact bounded-interface target-specific Pareto DP | Labeled exhaustive native-trace oracle; generic solver only a subtractor | Not run. |
| Natural workload | 10–20 public LLVM PPC/Test-Suite functions | Same corpus, pin and tuning budget | Not acquired or run. |
| Full cost | Model through runtime CPU/RSS/bytes/spills/relocs/static uops | Identical denominator and failure/fallback charging | Frozen, not measured. |
| Correctness | assembler/object/typed relocation/lld/DWARF/unwind/semantics | Native pinned tools | Blocked. |

## Decision

- Closed gaps in this assignment: control/upstream integrity and executable
  toolchain absence only
- Executable next gap: all five pre-claim gates
- Human/resource-dependent gap: provide or authorize exact-commit LLVM build
- Invalidating scientific gap after resume: illegality, native-union absorption,
  PPC-TPD oracle mismatch, generic collapse or no p50/p90 full-cost residual
- This is calibration, not novelty or baseline evidence.

