# Source and Collision Audit

## Frozen Discovery provenance

| Input | Required SHA-256 | Verified |
|---|---|---|
| Topic brief | `7046C37E...D85181C` | yes |
| Source collision matrix | `50C75F20...C9D3D1` | yes |
| Discovery log | `7356743C...EC7FE26` | yes |
| Discovery handoff | `9B8E88BF...B98A97F` | yes |

## Current first-party source results

| Source | Finding | Decision impact |
|---|---|---|
| [RegBankSelect current documentation](https://llvm.org/docs/GlobalISel/RegBankSelect.html) | only Fast and Greedy are current modes; Global is explicitly future/intended; `RegisterBankInfo` offers default and alternative mappings | supports a nonlocal residual, conditional on target pin |
| [RegBankSelect.cpp current doxygen](https://llvm.org/doxygen/RegBankSelect_8cpp_source.html) | Greedy computes each MI's possible mappings and selects the least local `MappingCost`; source has legal repair insertion/materialization | direct strong baseline; candidate cannot relabel local repair policy |
| [RegBankSelect.h current doxygen](https://llvm.org/doxygen/RegBankSelect_8h_source.html) | supported enum is Fast/Greedy; non-fast receives block/edge frequency; RepairingPlacement is CFG-aware | fairness must include current nondefault Greedy and its placement action |
| [GlobalISel porting guide](https://llvm.org/docs/GlobalISel/Porting.html) | target RBI supplies coverage, copy costs, and operand mappings; pipeline has target-specific components | exact object is incomplete without a pinned target/RBI |
| [GlobalISel current overview](https://llvm.org/docs/GlobalISel/index.html) | GlobalISel operates on whole MachineFunction/GMIR | same-object boundary confirmed |

## Literature and current collision result

- Historical LLVM Global-mode documentation is a direct genealogy/subtractor but not current deployed action coverage.
- Combinatorial register allocation/scheduling, including [Unison](https://arxiv.org/abs/1804.02452), is methodological adjacent: different decision stage/action domain and no pinned LLVM RBI mapping/repair certificate.
- No primary/current source located a deployed same-object method satisfying all of: complete target RBI alternatives, region-wide joint mapping plus legal repair placement, exact/FPT/certified guarantee, same globalisel pipeline, and equivalent full-cost contract.
- Status: `SEARCH_BOUNDED_OPEN`. This audit makes no absence inference from limited retrieval.

## Contradiction record

Discovery's local-baseline claim is confirmed but narrowed. It understated current `RepairingPlacement` and non-fast MBFI/MBPI behavior; these are now mandatory parts of the strongest union. This narrows the candidate to a complete nonlocal region plan and motivates `REVISE_ONCE` rather than PASS.

