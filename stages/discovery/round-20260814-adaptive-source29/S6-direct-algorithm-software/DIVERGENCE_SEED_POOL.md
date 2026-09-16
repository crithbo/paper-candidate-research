# Source29 Divergence Seed Pool

- Assignment / lane: `DISCOVERY-S6-20260814-ADAPTIVE-SOURCE29-RQ-PRODUCTION-V1` / `S6`
- Frozen profile: target-specific compiler backend, GPU/NPU native algorithm/data structure, and cross-layer joint algorithm.
- Seed ceiling: 12; generated before evidence lookup: `YES`.
- Network-security exclusion: `PASS`; no seed concerns an attack, vulnerability, protocol security, or malicious traffic.

## Coverage

| Engine | Used | Seed IDs |
|---|---:|---|
| `BISOCIATION_STRUCTURAL_TRANSFER` | yes | S29-01, S29-06 |
| `PROBLEM_REFRAMING` | yes | S29-02 |
| `CONSTRAINT_MANIPULATION` | yes | S29-03, S29-07 |
| `NEGATION_OR_INVERSION` | yes | S29-04 |
| `ABSTRACTION_LADDER` | yes | S29-05 |
| `ADJACENT_POSSIBLE_OR_BOUNDARY` | yes | S29-08 |
| `JANUSIAN_TENSION` | yes | S29-09 |
| `COMPOSE_DECOMPOSE_SIMPLIFY` | yes | S29-10 |

Perspectives: `COMPILER_OR_BACKEND_ENGINEER`, `HARDWARE_ARCHITECT`, `OPERATOR`, `END_USER`, `THEORIST`, and `MEASUREMENT_REVIEWER`.

### S29-01 — SME streaming/ZA boundary plan

- Engine / perspective: `BISOCIATION_STRUCTURAL_TRANSFER` / compiler backend engineer.
- Sketch: Treat an AArch64 SME function CFG as a finite call-boundary state system: streaming-mode entry/exit, ZA preservation, and tile use constrain one another. A whole-function constructor might jointly choose legal boundary regions and preservation representations instead of composing local lowering with generic register allocation.
- Conclusion-first test: if successful, the cautious result is a target-specific bounded-state algorithm that reduces preservation/code-size Pareto cost while preserving AArch64 SME ABI semantics.
- Generic/current-union risk: it may collapse to ordinary calling-convention lowering or be fully prescribed by ABI.
- Evidence needed: current LLVM SME lowering locus, ABI/ACLE contract, and a public MIR/IR carrier.
- Disposition: `KEEP_FOR_CONVERGENCE`.

### S29-02 — RVV VTYPE/VL transition plan

- Engine / perspective: `PROBLEM_REFRAMING` / hardware architect.
- Sketch: Reframe vector configuration insertion as a finite transition system over demanded VTYPE/VL states and CFG joins, coupled with vector register materialization. The possible contribution is a RISC-V-V-specific certified Pareto constructor rather than instruction scheduling or a pass selector.
- Conclusion-first test: if successful, a bounded-state joint plan changes the number and placement of semantically required `vset{i}vl{i}` transitions without changing RVV results.
- Generic/current-union risk: known VSETVLI dataflow and codegen passes may already express the full state dynamic program.
- Evidence needed: current LLVM RVV inserter sources and flags, ISA state semantics, and upstream regression carrier.
- Disposition: `KEEP_FOR_CONVERGENCE`.

### S29-03 — Ethos-U cascade/SRAM proof plan

- Engine / perspective: `CONSTRAINT_MANIPULATION` / NPU backend engineer.
- Sketch: Fixed TFLite semantics and a fixed Ethos-U target leave choices for cascade boundaries, tensor residency, and command-stream materialization. A finite target-specific constructor could make a certified SRAM/latency frontier if it is not merely generic placement.
- Conclusion-first test: a cautious result would be a target-specific exact/FPT frontier for native Vela lowering on a bounded operator-interface family.
- Generic/current-union risk: may be generic memory scheduling or a paper/tool-owned constructor.
- Evidence needed: current Vela source/CLI union and a stock interpreter or command-stream oracle.
- Disposition: `KEEP_FOR_CONVERGENCE`.

### S29-04 — GPU cooperative-matrix layout boundary

- Engine / perspective: `NEGATION_OR_INVERSION` / compiler backend engineer.
- Sketch: Instead of accepting each producer’s layout conversion independently, ask whether fixed cooperative-matrix semantics admit a joint layout/fragment conversion plan across a kernel region. The candidate must remain distinct from generic layout search and preserve target-native fragment legality.
- Conclusion-first test: if successful, it establishes a target-specific legality-preserving conversion guarantee rather than a tuning recipe.
- Generic/current-union risk: source identity/target contract could overlap active GPU backend work.
- Evidence needed: current upstream target-specific implementation, official instruction contract, and natural GPU IR carrier.
- Disposition: `KEEP_FOR_CONVERGENCE`.

### S29-05 — SystemZ vector facility call-region lowering

- Engine / perspective: `ABSTRACTION_LADDER` / compiler backend engineer.
- Sketch: At the ABI layer, vector register save areas and calls appear local; at the region layer they form a coupled finite interface. A target-specific region constructor may have a bounded exact state only if the SystemZ ABI leaves meaningful legal alternatives.
- Conclusion-first test: if successful, it gives an ABI-respecting region algorithm, not a register-allocation wrapper.
- Generic/current-union risk: ABI may force a unique implementation.
- Evidence needed: current backend and ABI source contract.
- Disposition: `KEEP_FOR_CONVERGENCE`.

### S29-06 — OpenCL/SPIR-V subgroup lowering plan

- Engine / perspective: `BISOCIATION_STRUCTURAL_TRANSFER` / operator.
- Sketch: Fixed subgroup semantics can couple ballot/shuffle lowering, temporary materialization, and execution-mode metadata across a region. Seek a target-specific formal legality frontier, not a general GPU scheduler.
- Conclusion-first test: a limited result would identify a finite semantic interface where whole-region lowering improves an explicit cost vector.
- Generic/current-union risk: likely overlaps prior SPIR-V work or becomes generic instruction selection.
- Disposition: `KEEP_FOR_CONVERGENCE`.

### S29-07 — XLA collective lowering with host-visible semantics

- Engine / perspective: `CONSTRAINT_MANIPULATION` / operator.
- Sketch: Keep fixed HLO values and collective results, but vary only native decomposition and buffer-state construction. The question is whether a finite target-specific algorithm exists beyond collective scheduling.
- Conclusion-first test: at most a backend-specific correctness/cost frontier under a fixed target topology.
- Generic/current-union risk: controller/scheduler form and active-lane collision.
- Disposition: `KEEP_FOR_CONVERGENCE`.

### S29-08 — WebAssembly GC barrier representation

- Engine / perspective: `ADJACENT_POSSIBLE_OR_BOUNDARY` / runtime engineer.
- Sketch: New GC/reference types may couple barrier representation, spill state, and stack maps at native lowering boundaries. The candidate is only valid if current source exposes an executable semantic alternative with a stock runtime oracle.
- Conclusion-first test: a target-specific proof of state-preserving lowering cost, not a cache or selector.
- Generic/current-union risk: potential exact-identity collision with prior Wasm families.
- Disposition: `KEEP_FOR_CONVERGENCE`.

### S29-09 — Hexagon packet/resource state constructor

- Engine / perspective: `JANUSIAN_TENSION` / hardware architect.
- Sketch: Packet resource constraints encourage local bundling while hazards and predication induce global dependencies. A finite state construction could certify a frontier only if it is more than generic VLIW scheduling.
- Conclusion-first test: a target-specific exact/FPT construction on a bounded packet interface.
- Generic/current-union risk: excluded by prior Hexagon identity and generic scheduling boundary.
- Disposition: `ACTIVE_OR_STOP_IDENTITY`.

### S29-10 — LoongArch relaxation/CFI joint constructor

- Engine / perspective: `COMPOSE_DECOMPOSE_SIMPLIFY` / theorist.
- Sketch: Link-time relaxation and unwind/CFI encoding constrain each other under fixed object and ABI semantics. A joint constructor might optimize a formal code-size/metadata frontier if neither phase alone owns the action.
- Conclusion-first test: a target-specific combined relaxation/metadata algorithm with fixed loader and unwinder behavior.
- Generic/current-union risk: generic linker layout or reviewed ELF family.
- Disposition: `KEEP_FOR_CONVERGENCE`.

## Clustering and pre-evidence selection

| Cluster | Seed IDs | Shared boundary | Representative | Pre-evidence selection |
|---|---|---|---|---|
| Target ISA bounded-state lowering | S29-01, S29-02, S29-05 | ABI/ISA state at CFG or call boundaries | S29-01, S29-02 | selected: distinct SME and RVV objects |
| Accelerator native representation | S29-03, S29-04, S29-07 | memory/layout/native command construction | S29-03, S29-04 | selected: NPU and cooperative-matrix locators |
| Repeated/likely generic | S29-06, S29-08, S29-09, S29-10 | known repeated or generic kernels | S29-06 | backlog/excluded before locator |

Selected coverage retains one CPU ISA ABI object, one RVV state object, one NPU object, and one GPU semantic object. It is fixed before evidence lookup; no score or outcome will backfill it.

## Advisory

- Engines used: 8; perspective roles: 6.
- `DIVERGENCE_COVERAGE_ADVISORY`: `PASS`.
- Plain-Chinese note: 此池只是创意召回；其中任何“可能”均未声明当前缺口或新颖性。
