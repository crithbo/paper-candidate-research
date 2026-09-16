# LLVM-BITCODE-ABBREV-PLANNER Q1/Q2 calibration after Stage A

- Stage: `STAGEA`
- Candidate venue family: compiler construction / software systems journals
- Calibration status: `PARITY_NOT_PLAUSIBLE`
- Quality tier: `BELOW_Q2_STOP`
- Search/cutoff date: `2026-08-09` bounded literature; current source commit
  frozen at `a1194be1baefa99d20a09bd04b16056be0ab7225`.

## Reference set

| Role | Paper | Venue/status | Why selected |
|---|---|---|---|
| contribution-shape anchor | Lattner & Adve, LLVM | CGO 2004 | native representation contract and real compiler evaluation |
| algorithm-shape anchor | Castañeda Lozano et al., combinatorial register allocation/scheduling | TOPLAS 2019 | explicit joint decisions, oracle gaps, solver cost |
| LLVM size anchor | Fried et al., compressed-ISA register allocation | CC 2023 | native LLVM code-size mechanism and full-system evidence |
| boundary/subtractor | BCDB byte-aligned bitstream work | dissertation/direct subtractor | external-compression objective, not raw-native comparator |

## Comparator matrix

| Dimension | Stage A evidence | Gap | Disposition |
|---|---|---|---|
| problem importance | standard LLVM bitcode size | modest absolute headroom | insufficient alone |
| contribution type | real bounded N2 constructor | zero residual over B2 | fatal |
| algorithm substance | width-ladder/local DP + forest budget DP | greedy reaches same solution everywhere | absorbed |
| baseline strength | B0, B1, B2, B3 | none material | closed |
| natural workload | 100 public modules, four trace strata | mostly C | adequate for killer |
| same object | 400/400 strict passes | none | closed |
| full cost | bytes/CPU/wall/RSS/read/verify | OS cache not forcibly flushed | adequate for negative |
| main result | B2 == WL hashes on 100/100 | no primary increment | fatal |
| scale/generalization | all pre-registered modules complete | no second corpus needed after absorption | negative sufficient |
| artifact | exact archive, modules, traces, scripts, outputs | no upstream patch | reproducible Stage A |

## Reviewer-shape assessment

- Editor/venue-fit: no paper-shaped incremental result remains after the fair
  greedy comparator.
- Methodology: contract and negative experiment are strong, but methodology
  quality cannot substitute for an N2 residual.
- Domain contribution: the result is useful internal evidence that current-
  family cleanup plus greedy bounded grammars capture the observed headroom;
  it is not enough for the frozen Q2 paper.
- Devil's advocate: expanding the grammar family after observing zero residual
  would change the pre-registered candidate/action bounds and create a new
  research object, not rescue this assignment.

## Decision

- Quality tier: `BELOW_Q2_STOP`
- Status: `PARITY_NOT_PLAUSIBLE`
- Closed gaps: fidelity, fair baselines, natural corpus, full cost,
  reproducibility, negative boundary.
- Invalidating gap: candidate primary benefit is fully absorbed by B2, with 0%
  residual coverage and zero p50/p90 residual.
- Why this is calibration: the prior papers set expected paper shape; they are
  not used as direct novelty or performance evidence.
