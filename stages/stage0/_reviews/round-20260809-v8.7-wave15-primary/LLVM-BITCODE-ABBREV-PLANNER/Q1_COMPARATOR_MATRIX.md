# Q1/Q2 Shape Comparator Matrix — LLVM-BITCODE-ABBREV-PLANNER

## Candidate shape

The candidate targets a global, native-format constructor over one LLVM module's unchanged semantic bitstream trace. Its paper claim must couple abbreviation grammar, definition scope, record assignment, definition cost, and abbreviation-ID width. The primary evidence is raw ordinary `.bc` size and complete planning/write/read cost under native fidelity.

| Comparator | Venue/status | Shape lesson | Same object? | What must be matched or exceeded | What it does not prove |
|---|---|---|---|---|---|
| Lattner and Adve, “LLVM: A Compilation Framework for Lifelong Program Analysis & Transformation,” CGO 2004 | Major compiler conference; official LLVM publication | A representation contribution needs a precise IR contract, implementation in the real compiler stack, natural-program evaluation, and system-level cost evidence | Domain anchor, not same encoding objective | Native integration, representation fidelity, corpus diversity, and end-to-end compiler evidence | It does not select bitcode abbreviations or optimize native `.bc` records |
| Castañeda Lozano et al., “Combinatorial Register Allocation and Instruction Scheduling,” ACM TOPLAS 2019 | Q1-level journal | A joint compiler optimizer earns algorithmic weight through explicit decision variables, guarantees/optimality gaps, strong sequential baselines, scalability limits, and native benchmarks | No; methodological algorithm comparator | Named global algorithm, exact small-instance oracle, fair sequential controls, full solver cost, and ablation of coupling | It does not cover serialization or LLVM bitcode |
| Fried et al., “Register Allocation for Compressed ISAs in LLVM,” CC 2023 | Major compiler conference | A code-size N2 should show why the native objective creates a nontrivial optimization, integrate with LLVM, compare against current practice, and check runtime/compile-time non-regression | No; LLVM code-size shape comparator | Mechanism-specific ablation, natural corpus, implementation fidelity, and size/time trade-off | It does not optimize bitstream abbreviation dictionaries |

## Tier calibration

### `TIER_B_Q2_VIABLE`

The minimum acceptable completed paper would provide:

- a frozen native bitstream semantic trace and current-reader equality contract;
- a nontrivial global algorithm or formal guarantee over dictionary/scope/assignment/ID-width coupling;
- complete B0–B2 comparison with exact small-instance ceilings;
- natural 100-module results with full planning/write/read/RSS accounting; and
- analysis of when definition and ID-width costs erase benefit.

### `TIER_A_Q1_POTENTIAL`

Q1 potential would require more than a working heuristic:

- a broadly reusable formulation or theorem, not only an LLVM emitter patch;
- stable gains across multiple frontend, optimization, debug-info, and module-size strata;
- strong approximation/optimality evidence and scalability characterization;
- reader-side and downstream compiler non-regression; and
- an upstream-quality implementation or a similarly convincing reusable artifact.

### `BELOW_Q2_STOP`

The shape falls below Q2 if success reduces to unused-template removal, threshold/flag tuning, a generic solver without a mechanism or guarantee, a post-processing wrapper, external compression, changed decoded IR, or gains fully reproduced by the complete native-grammar subset or greedy baselines.

## Candidate-versus-current comparator matrix

| Axis | B0 native writer | B1 current-family oracle | B2 greedy full-family planner | Candidate requirement |
|---|---|---|---|---|
| Information | Native module/record fields | Same frozen trace | Same frozen trace and candidate set | Exactly the same |
| Grammar | Current fixed plus inline/input-sensitive family | Subset of current family | Same bounded legal candidate family | Same bounded legal candidate family |
| Assignment | Native hard-coded/input-sensitive choices | Optimized over current family | Greedy positive net action | Global structured construction |
| Definition cost | Native emitted bits | Exact | Exact | Exact |
| ID-width cost | Native result | Exact | Exact | Exact and algorithmically coupled |
| Reader/format | Native | Native | Native | Native, unchanged |
| Compute budget | Deployment | Certified small/timeout bounded | Same deployment budget | Declared, measured, and fair |

## Primary-source anchors

- LLVM CGO 2004 publication: https://llvm.org/pubs/2004-01-30-CGO-LLVM.html
- Combinatorial register allocation/scheduling: https://doi.org/10.1145/3332373
- Compressed-ISA register allocation in LLVM: https://doi.org/10.1145/3578360.3580261

These papers calibrate paper shape. None is cited as direct evidence of bitcode-abbreviation novelty.
