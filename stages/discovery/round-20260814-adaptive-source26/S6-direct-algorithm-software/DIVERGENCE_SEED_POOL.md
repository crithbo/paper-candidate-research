# Source26 Divergence Seed Pool

## Pool metadata

- Assignment / lane: `DISCOVERY-S6-20260814-ADAPTIVE-SOURCE26-EVIDENCE-CLOSURE-TRIAD-V1` / `S6_DIRECT_ALGORITHM_SOFTWARE`
- Frozen profile: `SOURCE26_EVIDENCE_CLOSURE_TRIAD_V1`; canonical v8.7; V9 OFF.
- Seed ceiling / selected-locator ceiling: `12 / 4`.
- Network-security exclusion: `PASS`; no security, vulnerability, attack, exploit, protocol-security, or malicious-traffic topic was generated.
- Generation completed before external evidence lookup: `YES`.

## Divergence coverage

| Engine | Used | Seed IDs |
|---|---:|---|
| `BISOCIATION_STRUCTURAL_TRANSFER` | yes | S01, S07 |
| `PROBLEM_REFRAMING` | yes | S02 |
| `CONSTRAINT_MANIPULATION` | yes | S03, S08 |
| `NEGATION_OR_INVERSION` | yes | S04 |
| `ABSTRACTION_LADDER` | yes | S05 |
| `ADJACENT_POSSIBLE_OR_BOUNDARY` | yes | S06 |
| `JANUSIAN_TENSION` | yes | S09 |
| `COMPOSE_DECOMPOSE_SIMPLIFY` | yes | S10 |

## Seed records

### S01

- Engine / perspective: `BISOCIATION_STRUCTURAL_TRANSFER` / compiler-backend engineer.
- Idea sketch: AArch64 load/store pairing currently recognizes local address patterns. A bounded live-range-and-offset frontier could jointly choose pair formation and intervening register materialization while preserving the identical instruction-stream semantics.
- Conclusion-first test: At most, a target-specific bounded-window exact or Pareto construction could reduce instruction count/size under fixed AArch64 ISA semantics; it matters only if it is not merely a peephole ordering rule.
- Risk / evidence needed: may collapse to existing local optimizer; need current source, a native two-output witness, and an official backend carrier.
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`.

### S02

- Engine / perspective: `PROBLEM_REFRAMING` / hardware architect.
- Idea sketch: SME streaming-mode/ZA transitions are a finite state machine, but function attributes and ABI boundaries may make cross-function optimization illegal. Reframe the candidate as a same-function state-region constructor rather than a scope-elision trick.
- Conclusion-first test: A cautious claim would be a legal intra-function transition minimizer with fixed observable SME state; it matters only if current lowering exposes more than a fixed codegen scheme.
- Risk / evidence needed: ABI or attribute semantics may force the plan; need official SME semantics, current LLVM lowering union, and a contrary ABI route.
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`.

### S03

- Engine / perspective: `CONSTRAINT_MANIPULATION` / compiler-backend engineer.
- Idea sketch: RISC-V V configurations have finite VTYPE/VL state and expression reuse. Instead of rediscovering VSETVLI insertion, test whether a target-specific constrained region partition with a certified transition bound survives the known current pass union.
- Conclusion-first test: The most cautious contribution would be a finite-state construction guarantee for fixed RVV kernels.
- Risk / evidence needed: exact Source25 VSETVLI identity was structurally absorbed; likely excluded before locator.
- Preliminary disposition: `ACTIVE_OR_STOP_IDENTITY`.

### S04

- Engine / perspective: `NEGATION_OR_INVERSION` / measurement reviewer.
- Idea sketch: Reverse normal SVE vectorization: keep the loop semantics fixed and ask whether predicate/tail-state construction can be certified against a bounded code-size/throughput frontier rather than selected by a cost-model threshold.
- Conclusion-first test: At most, a target-specific finite-state tail construction would offer a formal frontier; it matters only if it is not generic vectorization tuning.
- Risk / evidence needed: likely configuration/heuristic only; need exact official pass and natural IR carrier.
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`.

### S05

- Engine / perspective: `ABSTRACTION_LADDER` / NPU systems engineer.
- Idea sketch: GPU cooperative-matrix lowering combines fragment-layout legality with memory-space and subgroup constraints. Lift the local layout choice to a same-kernel legal-state constructor with an explicit resource/latency guarantee.
- Conclusion-first test: A cautious claim would be a target-specific construction over a finite hardware legality automaton, not generic layout search.
- Risk / evidence needed: may be paper-owned or a generic schedule/layout shell; need a current first-party compiler and public kernel/oracle.
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`.

### S06

- Engine / perspective: `ADJACENT_POSSIBLE_OR_BOUNDARY` / runtime maintainer.
- Idea sketch: LLVM AArch64 branch relaxation and basic-block placement have adjacent actions (alignment, islands, fall-through). Test whether an ISA-specific bounded interaction graph permits a guarantee beyond pass order.
- Conclusion-first test: Any claim must preserve binary/ABI semantics and jointly construct layout plus relaxation, not select flags.
- Risk / evidence needed: reviewed linker/layout families may contain it; need dedup before locator.
- Preliminary disposition: `SEED_BACKLOG__POTENTIAL_REPEAT`.

### S07

- Engine / perspective: `BISOCIATION_STRUCTURAL_TRANSFER` / theorist.
- Idea sketch: SystemZ vector load/store multiple instruction selection has displacement-range and register-run constraints. Borrow bounded-width interval-state reasoning from exact packing without importing a generic packing solver.
- Conclusion-first test: Only a SystemZ-specific exact/FPT construction with a finite state and current-union residual would matter.
- Risk / evidence needed: likely no natural carrier or could be generic instruction selection.
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`.

### S08

- Engine / perspective: `CONSTRAINT_MANIPULATION` / compiler engineer.
- Idea sketch: WebAssembly stackification jointly chooses expression trees, locals, and block structure. Constrain stack height and local types to seek an exact bounded-state constructor for the fixed module.
- Conclusion-first test: A potential claim would be an FPT stack/local construction under a static bound, not generic register allocation.
- Risk / evidence needed: repeatedly reviewed Wasm stackification family; exclude unless an identity difference is proven.
- Preliminary disposition: `ACTIVE_OR_STOP_IDENTITY`.

### S09

- Engine / perspective: `JANUSIAN_TENSION` / accelerator architect.
- Idea sketch: Tensor-core fragment layout that improves coalescing can raise register pressure. A finite target-specific Pareto frontier over legal fragments could expose a stable cross-layer tradeoff.
- Conclusion-first test: At most, a characterization plus constructor for fixed PTX-like semantics; it must avoid generic scheduling/layout.
- Risk / evidence needed: target and stock oracle presently unspecified.
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`.

### S10

- Engine / perspective: `COMPOSE_DECOMPOSE_SIMPLIFY` / toolchain maintainer.
- Idea sketch: AArch64 ADRP+ADD formation and literal-pool placement can be decomposed into local actions but may share page-range constraints globally. Test a same-object page-state construction under fixed relocation semantics.
- Conclusion-first test: A cautious claim would be target-specific page-range feasibility/size optimization, not post-link layout.
- Risk / evidence needed: may overlap GNU ld/lld reviewed layout relaxation; dedup first.
- Preliminary disposition: `SEED_BACKLOG__POTENTIAL_REPEAT`.

## Clustering and coverage-constrained convergence

| Cluster | Seed IDs | Shared surface | Representative | Decision |
|---|---|---|---|---|
| AArch64 finite-state backend | S01, S02, S04 | load/store, SME, SVE state | S01, S02, S04 | select three distinct state/semantic contracts |
| RISC-V / Wasm repeat guard | S03, S08 | known reviewed state constructors | — | excluded before locator |
| accelerator legal-layout | S05, S09 | GPU/NPU fragment state | S05 | select S05; keep S09 backlog |
| linker / layout adjacency | S06, S10 | reviewed binary layout | — | backlog for dedup, not selected |
| SystemZ bounded intervals | S07 | distinct backend | S07 | backlog: selected set already meets four-surface capacity |

| Selected seed | Portfolio reason | Precommitted intended locator | Question Card |
|---|---|---|---|
| S01 | AArch64 memory-instruction construction | LLVM AArch64 LoadStore optimizer | QC01 |
| S02 | AArch64 architectural state/ABI boundary | LLVM AArch64 SME lowering | QC02 |
| S04 | SVE predicate/tail state construction | LLVM AArch64 SVE vectorization | QC03 |
| S05 | GPU/NPU legal-fragment cross-layer construction | MLIR/SPIR-V cooperative matrix lowering | QC04 |

## Append-only backlog and advisory

S06, S07, S09, S10 remain non-evidentiary backlog. S03 and S08 were excluded before locator because their apparent identities are respectively the Source25 absorbed VSETVLI family and a repeatedly reviewed Wasm stackification family.

- Engines used: `8`; perspective roles: `7`; largest surface share: AArch64, `3/10`.
- `DIVERGENCE_COVERAGE_ADVISORY`: `PASS`.
- Plain-Chinese note: 先覆盖不同语义约束与构造形状，再检索；没有按潜在正结论补位。
