# Discovery log — Source08 R18V2

- Assignment: DISCOVERY-S2-20260814-ADAPTIVE-SOURCE08-R18V2
- Method: V8_7_POTENTIAL_READINESS_SEPARATED; claim-pack/V9: OFF.
- Date: 2026-08-14.
- Rule: six raw cards frozen before depth selection. Base depth two; only two D1 cards existed, so no third-depth slot was used.

## Neutral residual-survival cards and precommitted D1 ranking

| Raw | Opportunity family | Exact object and bottleneck transfer | Atomic residual sketch | Pre-depth disposition | D1 rank |
|---|---|---|---|---|---|
| R01 | X86 stack-clash frame/probe/register construction | Fixed x86-64 SysV C/C++ function with stock behavior and stack-clash protection; probing/scratch/spill becomes dominant | jointly choose legal frame placement, saved-register realization and probe schedule | D1, same ABI and safety invariant nameable; stages separate | 1 |
| R02 | LLVM CFI byte-array/basic-block-section co-layout | Fixed LTO C++ executable and CFI accept/reject behavior | joint type-bitset/jump-table/section-cluster construction | D1, source exposes both actions; generic-layout risk | 2 |
| R03 | SanitizerCoverage stack-depth threshold | Fixed coverage executable | threshold/callback choice | NOT_ADMITTED: selector/flag | — |
| R04 | SafeStack partition/frame placement | Fixed SafeStack executable | repartition locals | DIRECT_SUBTRACT: native analysis owns action | — |
| R05 | GCC split-stack/clash probes | Fixed executable | segmented-stack transition plus probes | DROP: stack representation/cross-call semantics change | — |
| R06 | ThinLTO summary/import/backend | Fixed bitcode/native executable | joint summary/import plan | EXCLUDED_REPEATED historical family | — |

## Depth reviews

- D01/R01: retained as FINITE_FIDELITY_GAP; conditional Stage 0 is justified only to attack direct current-union absorption.
- D02/R02: DROP. Visible CFI lowering, section emission and linker actions leave generic layout/packing, not a target-specific guarantee.
- No outcome-aware backfill occurred.

## Source/collision record

- Official Clang command reference for stack-clash and stack-protector options.
- LLVM Code Generator documentation; current Doxygen for X86FrameLowering emitStackProbe, PrologEpilogInserter and RegAllocGreedy.
- LLVM Project stack-clash design blog; CFI design and BasicBlockSections source.
- Bounded primary/official collision search found no statement of D01's fixed-ABI FPT/Pareto constructor. This is SEARCH_BOUNDED_OPEN, not a novelty proof.

## Final

One conditional clean brief is proposed. It is a finite, auditable Stage-A closure plan, not an implementation or result.
