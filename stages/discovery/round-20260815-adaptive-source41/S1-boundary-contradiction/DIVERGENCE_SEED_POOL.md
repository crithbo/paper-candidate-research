# Discovery Divergence Seed Pool

## Pool metadata

- Assignment / lane: `DISCOVERY-S1-20260815-ADAPTIVE-SOURCE41-TERRA-HIGH-RQ-BASELINE` / `S1_BOUNDARY_CONTRADICTION`
- Frozen profile: `SOURCE41_RQ_PRODUCTION_TERRA_HIGH_BASELINE`
- Seed ceiling: `<=12`; generated: `8`
- Network-security exclusion check: `PASS`
- Generation completed before evidence lookup: `YES`

## Divergence coverage

| Engine | Used | Seed IDs |
|---|---:|---|
| `BISOCIATION_STRUCTURAL_TRANSFER` | yes | S01, S06 |
| `PROBLEM_REFRAMING` | yes | S02 |
| `CONSTRAINT_MANIPULATION` | yes | S03 |
| `NEGATION_OR_INVERSION` | yes | S04 |
| `ADJACENT_POSSIBLE_OR_BOUNDARY` | yes | S05 |
| `JANUSIAN_TENSION` | yes | S07 |
| `COMPOSE_DECOMPOSE_SIMPLIFY` | yes | S08 |

## Seed records

### S01

- Engine / perspective: `BISOCIATION_STRUCTURAL_TRANSFER` / `COMPILER_OR_BACKEND_ENGINEER`
- Starting hunch: LLVM GC statepoint relocation and exceptional control-flow both commit liveness at different semantic boundaries.
- Two-sentence idea sketch: For a fixed managed-language call graph, statepoint placement and relocation handling might admit a target-specific interprocedural construction that keeps identical deoptimization/exception semantics while reducing relocation and frame cost. The nontriviality would be that exceptional edges invalidate an ordinary live-range-only formulation.
- Conclusion-first test: If successful, the cautious conclusion is only that a semantics-preserving construction can reduce statepoint/relocation full cost for a specified native/runtime contract.
- Risk / disposition: `FRESH_SKETCH`; `KEEP_FOR_CONVERGENCE`.

### S02

- Engine / perspective: `PROBLEM_REFRAMING` / `RUNTIME_ENGINEER`
- Starting hunch: Component-model canonical ABI lowers resource ownership in one phase but post-return cleanup commits lifetime in another.
- Two-sentence idea sketch: Fixed Component Model resource results may permit a whole-boundary lifetime construction that preserves observable calls and traps while changing when equivalent post-return obligations are discharged. It is only viable if it is not an adapter or a generic destructor scheduler.
- Conclusion-first test: At most, this would establish a component-ABI-specific ownership/lifetime algorithm under an unchanged call contract.
- Risk / disposition: possible overlap with prior Wasm async work; `KEEP_FOR_CONVERGENCE` pending exact-identity check.

### S03

- Engine / perspective: `CONSTRAINT_MANIPULATION` / `COMPILER_OR_BACKEND_ENGINEER`
- Starting hunch: LLVM patchpoint/stackmap metadata must remain valid across frame layout and unwind decisions.
- Two-sentence idea sketch: Hold deoptimization metadata and observable unwind locations fixed, then ask whether patchpoint placement plus frame-state encoding can be constructed jointly rather than by independent placement and late frame lowering. The relevant residual is metadata/state correctness plus code and runtime cost, not a generic code-size tweak.
- Conclusion-first test: A positive result would be a target/runtime-specific construction with a formal validity condition, not merely a new metadata emitter.
- Risk / disposition: likely existing runtime-specific literature; `KEEP_FOR_CONVERGENCE`.

### S04

- Engine / perspective: `NEGATION_OR_INVERSION` / `THEORIST`
- Starting hunch: A compiler assumes lazy dynamic initialization can be localized, while exception/reentrancy semantics make publication a call-graph property.
- Two-sentence idea sketch: Under fixed C++ initialization and exception behavior, a non-generic constructor could select guard/state-transition placement over a call graph. It is only a candidate if it survives the already cooled once-initialization families.
- Conclusion-first test: The contribution would be a C++-ABI-specific guarantee on initialization publication, not a new `call_once` policy.
- Risk / disposition: `ACTIVE_OR_STOP_IDENTITY` / exclude before locator because the controlled R16B relation audit already covered once-initialization publication families.

### S05

- Engine / perspective: `ADJACENT_POSSIBLE_OR_BOUNDARY` / `HARDWARE_ARCHITECT`
- Starting hunch: CUDA Graph conditional-node semantics expose a launch/update commitment boundary separate from native graph construction.
- Two-sentence idea sketch: Fixed kernel results may leave a graph-native action over conditional-node state that preserves launch observables but avoids rebuild/update cost. It fails if the only decision is host-side configuration or a generic launch controller.
- Conclusion-first test: At most, a graph-semantics-specific construction changes an admitted native graph decision with complete launch/update cost.
- Risk / disposition: `KEEP_FOR_CONVERGENCE`; strong configuration/controller risk.

### S06

- Engine / perspective: `BISOCIATION_STRUCTURAL_TRANSFER` / `MAINTAINER`
- Starting hunch: OpenMP target data mapping has an ownership-transfer pattern analogous to compiler ABI lowering, but completion and destruction are separately committed.
- Two-sentence idea sketch: For a fixed target region and mapping semantics, map-entry coalescing, mapper execution and asynchronous completion may have a same-object lifetime construction. It cannot be admitted if it reduces to an online scheduler or runtime policy.
- Conclusion-first test: The narrow claim would concern a fixed mapping contract and an auditable completion/lifetime guarantee.
- Risk / disposition: `KEEP_FOR_CONVERGENCE`.

### S07

- Engine / perspective: `JANUSIAN_TENSION` / `COMPILER_OR_BACKEND_ENGINEER`
- Starting hunch: AArch64 MOPS gains bulk-memory forms but precise exception and unwind/accounting semantics still belong to the original program contract.
- Two-sentence idea sketch: Fixed memcpy/memmove behavior could require a region decision over MOPS form choice, surrounding fault boundaries and frame semantics. It is a research question only if the output is more than target cost tuning or a late peephole.
- Conclusion-first test: The strongest cautious result would be a target-specific legal-region algorithm with an explicit no-gain boundary.
- Risk / disposition: `KEEP_FOR_CONVERGENCE`.

### S08

- Engine / perspective: `COMPOSE_DECOMPOSE_SIMPLIFY` / `RUNTIME_ENGINEER`
- Starting hunch: LLVM ORC lazy materialization publishes a symbol before all resource ownership transitions are visibly complete.
- Two-sentence idea sketch: Fixed symbol-resolution and error semantics might permit a same-object materialization transaction construction. This is not admitted if it is merely a retry/controller policy or repeats previously reviewed LLVM ORC work.
- Conclusion-first test: A positive result would give a non-controller atomicity invariant/algorithm, not an operational wrapper.
- Risk / disposition: `ACTIVE_OR_STOP_IDENTITY`; excluded before locator because LLVM ORC was specifically reviewed in Source307 history.

## Clustering and convergence

| Cluster | Seed IDs | Representative | Pre-evidence decision |
|---|---|---|---|
| Runtime metadata / ABI ownership | S01, S02, S03 | S01, S03 | select both: different object and semantic endpoint |
| GPU/runtime commitment | S05, S06 | S05 | select as controller-risk control |
| ISA lowering semantics | S07 | S07 | select |
| Terminal/repeat controls | S04, S08 | — | excluded before locator |

| Selected seed | Portfolio reason | Intended boundary | RQ candidate |
|---|---|---|---|
| S01 | managed-runtime exceptional state transfer | GC statepoint / exceptional relocation | RQ01 |
| S03 | metadata/frame/unwind consistency | patchpoint stackmap / frame lowering | RQ02 |
| S05 | GPU graph semantic commitment | conditional graph update / launch | RQ03 |
| S07 | ISA/compiler precise behavior | MOPS bulk-memory / exception region | RQ04 |

## Advisory

- Engines used: 7; perspectives: compiler/backend, runtime, theorist, hardware architect, maintainer.
- `DIVERGENCE_COVERAGE_ADVISORY`: `PASS`.
- No external evidence was consulted while generating or selecting this pool.
