# Source105 S1 — Public NDP/PIM Command-Timing 离线 Seed Pool

本池在公开检索、下载、构建和实验之前冻结。所有 PIM/NDP carrier 必须是公开、可版本化的 artifact；本轮不使用课题组仓库或 A3 审计。下列条目不是现有模拟器缺口、新颖性或论文质量结论。

## Pool metadata

- Assignment / lane: `DISCOVERY-S1-20260824-SOURCE105-PUBLIC-NDP-ROTATION-V1` / `DISCOVERY_S1`
- Frozen profile: `SOURCE105_PUBLIC_NDP_ACCELERATOR_ARTIFACT_ROTATION_V1`
- Seed ceiling: `<=12`；本池：`8`
- RQ candidate ceiling: `<=8`
- Network-security exclusion check: `PASS`
- Generation completed before evidence lookup: `YES`
- Rule-Audit input used: `NO`
- Group-repository input used: `NO__FORBIDDEN_THIS_CYCLE`

## Divergence coverage

| Engine | Used | Seed IDs |
|---|---:|---|
| `BISOCIATION_STRUCTURAL_TRANSFER` | yes | S1-105-03, S1-105-07 |
| `PROBLEM_REFRAMING` | yes | S1-105-01, S1-105-06 |
| `CONSTRAINT_MANIPULATION` | yes | S1-105-02, S1-105-05 |
| `NEGATION_OR_INVERSION` | yes | S1-105-04 |
| `ABSTRACTION_LADDER` | yes | S1-105-08 |
| `ADJACENT_POSSIBLE_OR_BOUNDARY` | no | — |
| `JANUSIAN_TENSION` | no | — |
| `COMPOSE_DECOMPOSE_SIMPLIFY` | yes | S1-105-02, S1-105-06 |

## Seed records

### `S1-105-01`

- Engine: `PROBLEM_REFRAMING`; perspective: `COMPILER_OR_BACKEND_ENGINEER`
- Exact public anchor candidate: current CMU-SAFARI Ramulator2 repository and one public PIM/DRAM command standard/plugin.
- Idea sketch: Treat an LLM linear-layer mapping as a typed command-trace contract, not as an aggregate bandwidth request. Ask whether a mapping action can preserve command/timing legality while choosing a different row/bank command decomposition with an explicit predicted traffic/latency consequence.
- Conclusion-first test: The narrow result would be a command-semantics-aware mapping action for a fixed public memory model, not a new simulator wrapper.
- Structural tension: operator-level tile mapping versus command-level timing/legality.
- Generic/current risk: Ramulator2's existing request translation/controller already owns the action.
- Evidence needed: exact public PIM command carrier, current translation source, and one trace witness that distinguishes mapping semantics from scheduling policy.
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`

### `S1-105-02`

- Engine: `COMPOSE_DECOMPOSE_SIMPLIFY`; perspective: `HARDWARE_ARCHITECT`
- Exact public anchor candidate: Ramulator2's current DRAM timing hierarchy plus one public PIM operation model.
- Idea sketch: Decompose a PIM operator mapping into operand placement, command issue, completion visibility, and dependent consumer release. The candidate action must decide a command boundary that changes a same-object legality/latency trade-off, not merely reorder ready requests.
- Conclusion-first test: A viable contribution would specify a finite command-visibility construction and its full row/bank/controller cost.
- Structural tension: memory command completion versus consumer-visible operator completion.
- Generic/current risk: existing timing constraints and FR-FCFS-style scheduler may fully cover it.
- Evidence needed: public PIM command semantics, current timing source, and a minimal legal/illegal witness.
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`

### `S1-105-03`

- Engine: `BISOCIATION_STRUCTURAL_TRANSFER`; perspective: `THEORIST`
- Exact public anchor candidate: a Ramulator2 memory-standard plugin with explicit command prerequisites and a public LLM linear operator trace artifact.
- Idea sketch: View command prerequisites as a partial-order proof system for an operator trace. The possible action is a compiler construction that emits a trace certificate showing that mapping-induced command coalescing preserves both DRAM legality and the operator's data-dependence endpoint.
- Conclusion-first test: At most, this could yield a target-specific proof-carrying mapping construction, not a generic trace checker.
- Structural tension: partial order of DRAM state transitions versus tensor dependency graph.
- Generic/current risk: generic dependency scheduling or a simulator trace validator absorbs it.
- Evidence needed: one exact plugin state machine, one same-object operator carrier, and non-generic certificate/action skeleton.
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`

### `S1-105-04`

- Engine: `NEGATION_OR_INVERSION`; perspective: `MAINTAINER`
- Exact public anchor candidate: a current public PIM command model whose performance abstraction assumes independent bank/rank progress.
- Idea sketch: Invert the common independence assumption and ask whether a fixed LLM tile mapping exposes a command-level interference boundary that changes observable completion or full-cost accounting. The candidate must propose a mapping/compiler action, not only report a simulator-model discrepancy.
- Conclusion-first test: The claim would be a bounded interference-aware mapping decision and a no-gain region.
- Structural tension: apparent parallel command issue versus shared timing/state resource.
- Generic/current risk: a known controller timing constraint or configuration option already captures it.
- Evidence needed: source-supported shared resource semantics, one public carrier, and a falsifier against default controller behavior.
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`

### `S1-105-05`

- Engine: `CONSTRAINT_MANIPULATION`; perspective: `OPERATOR`
- Exact public anchor candidate: Ramulator2 address mapping/configuration source and a public PIM tensor-layout carrier.
- Idea sketch: Freeze the logical tensor layout and manipulate only which physical address bits are available to the mapper under the memory standard. The candidate action is admissible only if address-to-command decomposition has a target-specific semantic consequence beyond ordinary address-map tuning.
- Conclusion-first test: A successful result would be a constrained mapping algorithm with explicit data-movement and timing denominators.
- Structural tension: logical tensor contiguity versus bank/row command locality.
- Generic/current risk: address-map configuration or standard tiling heuristics absorb the idea.
- Evidence needed: exact address-map semantics, same-object PIM layout, and a minimal counterexample to a pure configuration change.
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`

### `S1-105-06`

- Engine: `COMPOSE_DECOMPOSE_SIMPLIFY`; perspective: `COMPILER_OR_BACKEND_ENGINEER`
- Exact public anchor candidate: Ramulator2 current request/controller pipeline and one public near-memory/PIM operator interface.
- Idea sketch: Split an operator into command-producing and completion-consuming phases, then ask whether a compiler can overlap only the semantically independent part while preserving a defined data-visibility contract. The action must be distinguishable from generic request scheduling and charge queue, synchronization, and metadata cost.
- Conclusion-first test: The cautious outcome would be a same-object command/visibility overlap construction with a finite witness.
- Structural tension: latency hiding versus exact visibility/order semantics.
- Generic/current risk: existing scheduler/open-page policy or speculative issue mechanisms cover it.
- Evidence needed: public command issue/retire semantics, target operator boundary, and a strong scheduler baseline.
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`

### `S1-105-07`

- Engine: `BISOCIATION_STRUCTURAL_TRANSFER`; perspective: `HARDWARE_ARCHITECT`
- Exact public anchor candidate: a public PIM/near-memory functional model paired with Ramulator2 timing carrier.
- Idea sketch: Treat functional PIM results and DRAM timing events as two views of one typed operation, requiring a finite correspondence between data result, command completion, and timing cost. The candidate is a mapping-interface action only if this correspondence affects a target-native command choice, not if it merely aligns two simulators.
- Conclusion-first test: A viable result would expose a semantic/timing contract whose violation changes mapping legality or full-cost outcome.
- Structural tension: functional correctness versus timing-model event abstraction.
- Generic/current risk: cross-simulator co-simulation wrapper or ordinary validation harness.
- Evidence needed: one publicly maintained PIM functional/timing pair with a named operation contract.
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`

### `S1-105-08`

- Engine: `ABSTRACTION_LADDER`; perspective: `THEORIST`
- Exact public anchor candidate: one versioned Ramulator2 public PIM/memory standard plugin.
- Idea sketch: Abstract a mapping as a finite state/action graph over bank/rank command states, then demand a specific LLM operator decision and trace witness before retaining it. The seed must collapse if it remains generic state-space search or a memory-model wrapper.
- Conclusion-first test: A valid result would be a target-constrained algorithm/formal guarantee with a canonical instance family.
- Structural tension: generic state search versus target command legality and tensor outcome.
- Generic/current risk: generic scheduling/model checking.
- Evidence needed: plugin state graph, operator carrier, non-generic construction, and oracle.
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`

## Coverage-constrained convergence

All eight seeds are frozen before source lookup. They differ in command trace, completion visibility, prerequisite proof, interference, address decomposition, overlap, functional/timing correspondence, and formal construction; no evidence result may add a replacement seed.

| Selected seed | Intended public carrier boundary | RQ candidate ID |
|---|---|---|
| S1-105-01 | Ramulator2 request translation ↔ PIM command trace | RQ-S1-105-01 |
| S1-105-02 | timing completion ↔ operator visibility | RQ-S1-105-02 |
| S1-105-03 | command prerequisites ↔ certified operator trace | RQ-S1-105-03 |
| S1-105-04 | shared timing state ↔ tile mapping | RQ-S1-105-04 |
| S1-105-05 | address map ↔ tensor layout command semantics | RQ-S1-105-05 |
| S1-105-06 | issue/retire overlap ↔ data visibility | RQ-S1-105-06 |
| S1-105-07 | functional result ↔ timing event correspondence | RQ-S1-105-07 |
| S1-105-08 | plugin state graph ↔ formal mapping construction | RQ-S1-105-08 |

## Advisory

- `DIVERGENCE_COVERAGE_ADVISORY`: `PASS`
- Plain-Chinese note: 本轮刻意不把“跑一个 memory model”“重放 trace”或“调 controller 参数”当作论文；每个 seed 必须在公开 PIM command carrier 和 LLM/线性映射之间留下一个可反证的同对象行动。
