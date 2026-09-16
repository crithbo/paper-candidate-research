# Stage 0 PRIMARY report — S5-OCCUPANCY-CLIFF-JOINTCODEGEN

**Decision:** `REVISE_ONCE` — **AWAITING_CONFIRMATION**  
**Confidence:** 0.82 | **Route:** N2 | **Score:** academic 48/70 + AI 18/30 = **66/100**

## Frozen object and claim boundary

Freeze one LLVM commit, AMDGPU subtarget, optimization level, time budget and legal Machine-IR scheduling region. Inputs comprise dependencies, SGPR/VGPR/AGPR bank/alias information and occupancy metadata; outputs are legal schedule, allocation/split/spill choices and a tier-feasibility certificate. The candidate may not change ISA, profile information, semantics, or use a different compiler stack. It claims an anytime joint algorithm under the baseline compile budget, not a new “occupancy-aware LLVM scheduler.”

## Current-source collision and fair baseline set

LLVM’s current `GCNSchedStrategy` explicitly contains register-pressure and occupancy strategies. That removes any generic occupancy-aware scheduler claim. Unison removes generic integrated RA/scheduling; the GPU min-register paper is a preprint-only architecture-specific subtractor; MLGO/RL4ReAl remove learned-allocator framing. None alone gives a direct fatal collision because the claimed fixed-budget, multi-bank *tier-feasibility* algorithm and certificate is narrower, but the narrow object lacks a frozen current stack and natural witness.

Finite baselines: (1) same-commit `GCNSchedStrategy` plus default greedy allocator; (2) pressure-aware list scheduling with unchanged allocator; (3) min-register reconstruction, clearly marked preprint/theory baseline; (4) Unison-style CP/ILP at 100x budget, ceiling only. No union and no oracle is a deployable baseline.

## Facet / headroom matrix

| Facet | Candidate | Current strongest work | Stage 0 result |
|---|---|---|---|
| Object | AMDGPU MIR, multi-bank occupancy tier | LLVM scheduler/allocator | commit/subtarget absent |
| Mechanism | tier-frontier joint state | Unison / min-reg | plausible N2, not yet demonstrated |
| Cost | fixed JIT budget + certificate | LLVM staged compile path | must use actual pipeline |
| Natural headroom | tier-cliff regions | 2023 reported pressure facts | no same-object measurement |

The 17% / roughly-6% literature numbers do not quantify candidate natural headroom. GPU access is not required for the static compiler decision; it limits only kernel-time evidence.

## Competing mechanisms, killer, Q1 and AI

Mechanism A is a tier-frontier boundary DP; B is Lagrangian/budgeted repair. They must compete, rather than being combined. The 72-hour killer freezes the stack and extracts two public MIR sources, labels actual tier cliffs, and compares same-budget staged LLVM, a pressure-aware schedule, and a 100x ceiling. Stop if at least 90% of cliff regions are already at the ceiling tier or if a same-budget candidate has no non-dominated tier/spill/compile-time point.

| Calibrator | Shape | Calibration use |
|---|---|---|
| [Unison, TOPLAS 2019](https://arxiv.org/abs/1804.02452) | integrated schedule/allocation algorithm | strongest joint-algorithm standard |
| [Intel GPU RA, CGO 2018](https://doi.org/10.1145/3168806) | production GPU backend allocation | GPU backend shape |
| [RL4ReAl, CC 2023](https://doi.org/10.1145/3578360.3580273) | LLVM allocator study | current learning subtractor |

Q1 parity is conditional on a genuine natural cliff residual and full compile-time ledger. AI core fraction is **0.65**; GPU timing and backend interpretation remain human/independent-evidence work.

## Atomic revision gate

`NATURAL_CLIFF_CORPUS_AND_FIXED_STACK_DELTA`: lock compiler/target/budget, publish two public MIR sources and tier labels, then establish a same-object current-LLVM-to-ceiling gap. No Stage A/B is authorized.
