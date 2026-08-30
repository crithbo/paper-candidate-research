# Source28 Divergence Seed Pool

- Assignment / lane: `DISCOVERY-S6-20260814-ADAPTIVE-SOURCE28-RQ-PRODUCTION-V1` / S6.
- Mode: `RQ_REFINEMENT_STAGED_EVIDENCE_V1` / `PRODUCTION`; canonical v8.7; V9 OFF.
- External evidence consulted before generation: `NO`.
- Network-security exclusion: `PASS`.

| Engine | Seed IDs |
|---|---|
| `BISOCIATION_STRUCTURAL_TRANSFER` | S01, S07 |
| `PROBLEM_REFRAMING` | S02 |
| `CONSTRAINT_MANIPULATION` | S03, S08 |
| `NEGATION_OR_INVERSION` | S04 |
| `ABSTRACTION_LADDER` | S05 |
| `ADJACENT_POSSIBLE_OR_BOUNDARY` | S06 |
| `JANUSIAN_TENSION` | S09 |
| `COMPOSE_DECOMPOSE_SIMPLIFY` | S10 |

### S01 — AMX tile-state construction

- Perspective / engine: compiler-backend engineer / structural transfer.
- Sketch: Fix an x86 AMX kernel and ABI. Treat tile configuration, tile liveness and spill/reload sites as one finite hardware-state construction rather than independent instruction selection.
- Conclusion-first test: only a target-specific exact/FPT tile-state frontier under fixed code-object semantics could matter; generic register allocation is excluded.
- Preliminary disposition: `KEEP_FOR_RQ`.

### S02 — GPU asynchronous-copy barrier state

- Perspective / engine: GPU programmer / problem reframing.
- Sketch: Fix a GPU kernel’s async-copy/barrier semantics and ask whether legal barrier-group construction, rather than schedule selection, has a finite target-specific representation with a safety/performance guarantee.
- Conclusion-first test: it must preserve the same asynchronous memory semantics and stock verifier, not introduce a controller.
- Preliminary disposition: `KEEP_FOR_RQ`.

### S03 — Arm SME tile live-range allocation

- Perspective / engine: architecture engineer / constraint manipulation.
- Sketch: Bound live ZA tiles in an intra-function computation and consider an exact allocation/conversion constructor with fixed ABI semantics.
- Conclusion-first test: direct overlap with prior SME/ZA call-boundary identity is a high risk; no locator unless distinct exact object and current source prove separation.
- Preliminary disposition: `EXCLUDED_BEFORE_LOCATOR__POTENTIAL_REPEAT`.

### S04 — RISC-V Zfa instruction-form construction

- Perspective / engine: ISA maintainer / negation.
- Sketch: Invert local peephole lowering: with a fixed floating-point expression graph, jointly choose legal Zfa instruction forms and rounding-preserving materialization under code-size bound.
- Conclusion-first test: action must exceed target-feature/peephole selection; otherwise generic instruction selection.
- Preliminary disposition: `KEEP_FOR_RQ`.

### S05 — NPU quantized layout/data-movement representation

- Perspective / engine: NPU compiler engineer / abstraction ladder.
- Sketch: Fix an MLIR/StableHLO kernel and quantization semantics, then ask whether legal tensor layout plus transfer representation admits a finite certified constructor distinct from generic layout scheduling.
- Conclusion-first test: requires a target-specific official checker and natural carrier; absent target makes it only a seed.
- Preliminary disposition: `BACKLOG__TARGET_UNSPECIFIED`.

### S06 — GPU cooperative-matrix conversion graph

- Perspective / engine: systems engineer / adjacent possible.
- Sketch: Revisit only the *conversion graph* of a fixed cooperative-matrix kernel, not Source26’s unclosed generic fragment layout; a target-specific conversion-state algorithm might be distinct if a new content-addressable source delta exists.
- Conclusion-first test: Source26 cooldown forbids reentry without that delta.
- Preliminary disposition: `EXCLUDED_BEFORE_LOCATOR__COOLDOWN`.

### S07 — LoongArch vector-ABI remainder construction

- Perspective / engine: numerical-kernel maintainer / structural transfer.
- Sketch: For fixed BLAS semantics, couple vector-width choice with remainder state across microkernel boundaries; distinct only if it is not Source27’s blocked OpenBLAS exact identity.
- Conclusion-first test: runtime dispatch or blocking parameter sweeps are excluded.
- Preliminary disposition: `EXCLUDED_BEFORE_LOCATOR__COOLDOWN`.

### S08 — LLVM GlobalISel constant-island / literal-use construction

- Perspective / engine: compiler-backend engineer / constraint manipulation.
- Sketch: Fix a target’s relocation/code-object semantics and jointly choose literal materialization and use sites under a bounded page/range state.
- Conclusion-first test: must avoid reviewed linker/layout family and local emitter patch.
- Preliminary disposition: `BACKLOG__LIKELY_LAYOUT_REPEAT`.

### S09 — target-specific matrix instruction precision/state Pareto

- Perspective / engine: measurement reviewer / Janusian tension.
- Sketch: Hold computation semantics fixed while making the precision/accumulator legality state explicit; seek a certified accuracy-resource frontier rather than a mixed-precision policy selector.
- Conclusion-first test: requires an official target semantics and oracle, otherwise generic mixed precision.
- Preliminary disposition: `KEEP_FOR_RQ`.

### S10 — cross-layer prefetch/address-space construction

- Perspective / engine: runtime maintainer / compose-decompose.
- Sketch: Couple compiler address-space placement with a hardware-visible prefetch representation while preserving the same program result.
- Conclusion-first test: without a fixed platform, source locus and oracle this is a generic shell.
- Preliminary disposition: `BACKLOG__GENERIC_SHELL_RISK`.

## Clustering and pre-evidence convergence

| Cluster | Seeds | Selected representative | Reason |
|---|---|---|---|
| target-specific compiler hardware state | S01, S04, S09 | S01, S04 | AMX and Zfa differ in object, action, carrier and falsifier |
| GPU/NPU state representation | S02, S05, S06 | S02 | only S02 has a provisional same-kernel state contract |
| repeat/layout guards | S03, S07, S08, S10 | none | repeat, cooldown or generic-shell risk before evidence |

Selected clusters: S01, S02, S04. This selection occurred before evidence outcomes and does not force any raw/C0/brief count.
